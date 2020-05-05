#!/usr/bin/env bash
export MY_PID=$$
if test $(basename $0) = ps.pl0; then
    export MATCH_PROG_ONLY=true
fi

## start code-generator "^\\s *#\\s *"
# generate-getopt -P o:opts
## end code-generator
## start generated code
TEMP=$(POSIXLY_CORRECT=true getopt -o o:h \
                      --long opts:,help \
                      -n $(basename -- $0) -- "$@")
declare opts=
eval set -- "$TEMP"
while true; do
    case "$1" in

        -o|--opts)
            opts=$2
            shift 2

            ;;
        -h|--help)
            set +x
            echo -e
            echo
            echo Options and arguments:
            printf %6s '-o, '
            printf %-24s '--opts=OPTS'
            echo
            exit
            shift
            ;;
        --)
            shift
            break
            ;;
        *)
            die "internal error: $(. bt; echo; bt | indent-stdin)"
            ;;
    esac
done


## end generated code

export ARGS=$@
MORE_OPTS_VARS=
if test "$opts"; then
    opts=${opts%,},
    export MORE_OPTS_VARS=$(echo "${opts}" | perl -npe 's/(^|,(?!$))/$1\$VAR_/g; s,\%,,g')
fi

if test "$(uname)" = FreeBSD; then
    export COLUMNS=10000
    command_col=args
    ps_switches=-axeo
else
    ps_switches=-eo
    command_col=command
fi

ps ${ps_switches} pid,ppid,etime,${opts}${command_col} | perl -ne '
BEGIN{
    $found = 0;
    @args=split(" ", $ENV{"ARGS"});
    $my_pid = $ENV{"MY_PID"};
}
$to_match = $line = $_;
$match = 1;

if ($. == 1) {
    print STDERR $_;
    next;
}

($pid, $ppid, $elapsed,'"$MORE_OPTS_VARS"'$prog) = split(" ", $line);
if ($ENV{MATCH_PROG_ONLY} eq "true")  {
    $to_match = $prog;
}
next if ($pid == $my_pid or $ppid == $my_pid);
for (@args) {
    for (split(/\.|\\* /, $_)) {
        if ($_ =~ s/^!//) {
            if ($to_match =~ m/$_/i) {
                $match = 0;
                last;
            } else {
                next;
            }
        }
        unless ($to_match =~ m/$_/i) {
            $match = 0;
            last;
        }
    }

}

if ($match) {
    print $line;
    $found = 1;
}

END{
    if (not $found) {
        exit 1;
    } else {
        exit 0;
    }
}
'
