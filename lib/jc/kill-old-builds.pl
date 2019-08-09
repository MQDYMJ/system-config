#!/usr/bin/env perl

use v5.10;
use String::ShellQuote;
my $comment = <<~'EOFc8d96c1eb1b8';
# {%org-mode%}
这个脚本实现 3 个应用场景：

1. 在终端上交互式调用
2. 在 jc build 启动一个新的 build 的时候，提前调用
3. 在 jenkins build 已经启动之后，build 脚本自己调用检查

* 杀 build 的标准：

1. 如果两个 build 都没有 gerrit_topic，则以谁的 patchset number 更大为准，谁小的谁被 kill 掉

   - 一样大的话，谁的 build number 小，谁留下（已经编上了，代码也没有更新，没有必要重编，留着就可以了，build number 大的那个自己退出）

2. 如果其中一个 build 有 gerrit topic，另一个没有的话，干掉那个没有 topic 的。

3. 如果两个都有 topic 的话，谁的 build number 小，谁被干掉（因为后面的那个 topic build，可能代码已经有更新）。

   如果有 topic 的话，不再比较 topic 里的各个 patchset 的 number。只比较 build number。
# {%/org-mode%}
EOFc8d96c1eb1b8

use strict;

## start code-generator "^\\s *#\\s *"
# generate-getopt -s perl j:job-name \
# @scan-queues \
# @scan-builds \
# @dry-run=1 \
# @must-compare-patchset=1 \
# @:current-build-url '?"可以在上游 job-A 里 kill 下游 job-B，因为 job-A 马上要启动新的 job-B 的 build 了"' \
# vverbose
## end code-generator
## start generated code
use Getopt::Long;

Getopt::Long::Configure("default");



my $current_build_url = "";
my $dry_run = 1;
my $job_name = "";
my $must_compare_patchset = 1;
my $scan_builds = 0;
my $scan_queues = 0;
my $verbose = 0;

my $handler_help = sub {
    print ;
    print "\n\n选项和参数：\n";
    printf "%6s", '';
    printf "%-24s", '--current-build-url=CURRENT-BUILD-URL';
    if (length('--current-build-url=CURRENT-BUILD-URL') > 24 and length("可以在上游 job-A 里 kill 下游 job-B，因为 job-A 马上要启动新的 job-B 的 build 了") > 0) {
        print "\n";
        printf "%30s", "";
    }
    printf "%s", "可以在上游 job-A 里 kill 下游 job-B，因为 job-A 马上要启动新的 job-B 的 build 了";
    print "\n";
    printf "%6s", '';
    printf "%-24s", '--[no]dry-run';
    if (length('--[no]dry-run') > 24 and length() > 0) {
        print "\n";
        printf "%30s", "";
    }
    printf "%s", ;
    print "\n";
    printf "%6s", '-j, ';
    printf "%-24s", '--job-name=JOB-NAME';
    if (length('--job-name=JOB-NAME') > 24 and length() > 0) {
        print "\n";
        printf "%30s", "";
    }
    printf "%s", ;
    print "\n";
    printf "%6s", '';
    printf "%-24s", '--[no]must-compare-patchset';
    if (length('--[no]must-compare-patchset') > 24 and length() > 0) {
        print "\n";
        printf "%30s", "";
    }
    printf "%s", ;
    print "\n";
    printf "%6s", '';
    printf "%-24s", '--[no]scan-builds';
    if (length('--[no]scan-builds') > 24 and length() > 0) {
        print "\n";
        printf "%30s", "";
    }
    printf "%s", ;
    print "\n";
    printf "%6s", '';
    printf "%-24s", '--[no]scan-queues';
    if (length('--[no]scan-queues') > 24 and length() > 0) {
        print "\n";
        printf "%30s", "";
    }
    printf "%s", ;
    print "\n";
    printf "%6s", '-v, ';
    printf "%-24s", '--[no]verbose';
    if (length('--[no]verbose') > 24 and length() > 0) {
        print "\n";
        printf "%30s", "";
    }
    printf "%s", ;
    print "\n";

    exit(0);
};

GetOptions (
    'current-build-url=s' => \$current_build_url,
    'dry-run!' => \$dry_run,
    'job-name|j=s' => \$job_name,
    'must-compare-patchset!' => \$must_compare_patchset,
    'scan-builds!' => \$scan_builds,
    'scan-queues!' => \$scan_queues,
    'verbose|v!' => \$verbose,
    'help|h!' => \&$handler_help,
);


## end generated code

use JSON;

if (not $job_name) {
    die "Must specify job name";
}

my $builds_json = decode_json(qx(jc get-running-builds));

my %build_url_envmap;
my %queue_url_envmap;

my $stop_build_reason;

sub should_new_kill_old($$$$) {
    $stop_build_reason = "";

    my ($env_new, $env_old, $url_new, $url_old) = @_;
    return "do-nothing" if $url_new eq $url_old;
    printf STDERR "checking %s topic(%s) change/patchset(%d/%d) : %s topic(%s) change/patchset(%d/%d)\n",
        $url_new, $env_new->{GERRIT_TOPIC}, $env_new->{GERRIT_CHANGE_NUMBER}, $env_new->{GERRIT_PATCHSET_NUMBER},
        $url_old, $env_old->{GERRIT_TOPIC}, $env_old->{GERRIT_CHANGE_NUMBER}, $env_old->{GERRIT_PATCHSET_NUMBER};
    if ($env_new->{GERRIT_TOPIC} and $env_new->{GERRIT_TOPIC} eq $env_old->{GERRIT_TOPIC}) {
        $stop_build_reason = "Topic same stops old-build: $url_new : $url_old";
        return "kill-old";
    }

    if ($env_new->{GERRIT_TOPIC} and not $env_old->{GERRIT_TOPIC}) {
        $stop_build_reason = "Topic build stops non-topic: $url_new";
        return "kill-old";
    }

    if ($env_new->{GERRIT_TOPIC} or $env_old->{GERRIT_TOPIC}) {
        say STDERR "at least 1 topic set, do nothing";
        return "do-nothing";
    }

    if ($env_new->{GERRIT_CHANGE_NUMBER} == $env_old->{GERRIT_CHANGE_NUMBER}) {
        if ($env_new->{GERRIT_PATCHSET_NUMBER} > $env_old->{GERRIT_PATCHSET_NUMBER}) {
            $stop_build_reason = "Patchset larger stops smaller: $url_new > $url_old";
            return "kill-old";
        } elsif ($env_new->{GERRIT_PATCHSET_NUMBER} <= $env_old->{GERRIT_PATCHSET_NUMBER}) {
            $stop_build_reason = "Patchset <= should not rebuild: $url_new : $url_old";
            return "kill-new";
        }
    }
}

sub stop_a_build($) {
    my $this_url = $_[0];

    system("jc stop-build -u $this_url && jc build-description -b $this_url -d " . shell_quote($stop_build_reason));
}


sub kill_builds_for_queue($$) {
    my ($builds, $q_item) = @_;

    my $q_url = $q_item->{url};

    my $q_env = decode_json(qx(jc get-queue-envmap -q $q_url));

    for (@{$builds_json}) {
        my $building_job = $_->{job_name};
        next unless $building_job eq $job_name;
        my $build_url = $_->{build_url};

        $build_url_envmap{$build_url} = decode_json(qx(jc get-build-envmap -b $build_url)) unless $build_url_envmap{$build_url};
        my $b_env = $build_url_envmap{$build_url};

        my $how_to_kill = should_new_kill_old($q_env, $b_env, $q_url, $build_url);

        if (not $dry_run) {
            if ($how_to_kill eq "kill-old") {
                stop_a_build($build_url);
            } elsif ($how_to_kill eq "kill-new") {
                system("jc kill-queue -q $q_url");
            } elsif ($how_to_kill eq "do-nothing") {
                0;
            } else {
                die "don't know how to do kill: $how_to_kill";
            }
        }
    }
}

sub kill_queues_for_queue($$) {
    my ($queue_json, $q_this) = @_;

    my $this_url = $q_this->{url};
    my $this_env = decode_json(qx(jc get-queue-envmap -q $this_url));

    for my $q_that (@{$queue_json->{items}}) {

        my $queueing_job = $q_that->{task}{name};
        next unless $queueing_job eq $job_name;
        next unless $q_that->{id} < $q_this->{id};

        my $that_url = $q_that->{url};

        $queue_url_envmap{$that_url} = decode_json(qx(jc get-queue-envmap -q $that_url)) unless $queue_url_envmap{$that_url};
        my $that_env = $queue_url_envmap{$that_url};

        my $how_to_kill = should_new_kill_old($this_env, $that_env, $this_url, $that_url);

        if (not $dry_run) {
            if ($how_to_kill eq "kill-old") {
                system("jc kill-queue -q $that_url");
            } elsif ($how_to_kill eq "kill-new") {
                system("jc kill-queue -q $this_url");
            } elsif ($how_to_kill eq "do-nothing") {
                0;
            } else {
                die "don't know how to do kill: $how_to_kill";
            }
        }
    }
}

sub get_queue_env_from_url($) {
    my $queue_url = $_[0];
    $queue_url_envmap{$queue_url} = decode_json(qx(jc get-queue-envmap -q $queue_url)) unless $queue_url_envmap{$queue_url};
    return $queue_url_envmap{$queue_url};
}

sub get_build_env_from_url($) {
    my $build_url = $_[0];
    $build_url_envmap{$build_url} = decode_json(qx(jc get-build-envmap -b $build_url)) unless $build_url_envmap{$build_url};
    return $build_url_envmap{$build_url};
}

if ($scan_queues) {
    my $queue_json = decode_json(qx(jc curl queue/api/json));
    for my $q_item (@{$queue_json->{items}}) {
        say STDERR "checking queue id: ", $q_item->{id};

        my $task_name = $q_item->{task}{name};
        next unless $task_name eq $job_name;

        # 要不要检查一下，当前的这个 queue，如果已经 build 起来了的话，该怎么处理？那种情况下，就当成一个 build 来处理。

        my $q_url = $q_item->{url};
        my $q_info = decode_json(qx(jc curl ${q_url}api/json));
        my $q_build_url = $q_info->{executable}{url};
        if ($q_build_url) {
            my $q_id = $q_info->{id};
            say STDERR "queued item $q_id is already building \@$q_build_url";
            kill_builds_for_build($builds_json, $q_build_url);
        } else {
            kill_builds_for_queue($builds_json, $q_item);
            kill_queues_for_queue($queue_json, $q_item);
        }
    }
}

if ($scan_builds) {
    for (grep {$_->{job_name} eq $job_name} @{$builds_json}) {
        my $this_url = $_->{build_url};
        my $this_number = $_->{build_number};

        for (
            grep {
                $_->{job_name} eq $job_name and
                    $_->{build_number} < $this_number
                } @{$builds_json}
        ) {
            my $that_url = $_->{build_url};
            my $that_number = $_->{build_number};
            say STDERR "checking $this_url : $that_url";
            my $how_to_kill = should_new_kill_old(
                get_build_env_from_url($this_url),
                get_build_env_from_url($that_url),
                $this_url,
                $that_url);

            if (not $dry_run) {
                if ($how_to_kill eq "kill-old") {
                    stop_a_build($that_url);
                } elsif ($how_to_kill eq "kill-new") {
                    stop_a_build($this_url);
                } elsif ($how_to_kill eq "do-nothing") {
                    0;
                } else {
                    die "don't know how to do kill: $how_to_kill";
                }
            }
        }
    }
}

sub kill_queue_for_a_build($) {
    my $this_url = $_[0];
    my $queue_json = decode_json(qx(jc curl queue/api/json));
    for my $q_that (
        grep {
            $_->{task}{name} eq $job_name
        } @{$queue_json->{items}}
    ) {
        my $that_url = $q_that->{url};
        my $how_to_kill = should_new_kill_old(
            get_queue_env_from_url($this_url),
            get_queue_env_from_url($that_url),
            $this_url,
            $that_url);

        if ($stop_build_reason) {
            say STDERR "should stop something: $stop_build_reason";
        }

        if (not $dry_run) {
            if ($how_to_kill eq "kill-old") {
                system("jc kill-queue -q $that_url");
            } elsif ($how_to_kill eq "kill-new") {
                stop_a_build($this_url);
            } elsif ($how_to_kill eq "do-nothing") {
                0;
            } else {
                die "don't know how to do kill: $how_to_kill";
            }
        }
    }
}

sub kill_a_build_for_a_build($$) {
    my ($this_url, $that_url) = @_;

    say STDERR "checking $this_url : $that_url";
    my $how_to_kill = should_new_kill_old(
        get_build_env_from_url($this_url),
        get_build_env_from_url($that_url),
        $this_url,
        $that_url);

    if ($stop_build_reason) {
        say STDERR "should stop something: $stop_build_reason";
    }
    if (not $dry_run) {
        if ($how_to_kill eq "kill-old") {
            stop_a_build($that_url);
        } elsif ($how_to_kill eq "kill-new") {
            stop_a_build($this_url);
        } elsif ($how_to_kill eq "do-nothing") {
            0;
        } else {
            die "don't know how to do kill: $how_to_kill";
        }
    }
}

if ($current_build_url) {
    my $this_url = $current_build_url;
    kill_queue_for_a_build($this_url);

    for (grep {$_->{job_name} eq $job_name} @{$builds_json}) {
        kill_a_build_for_a_build($this_url, $_->{build_url});
    }
}
