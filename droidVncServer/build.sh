#!/bin/bash


set -e
## start code-generator "^\\s *#\\s *"
# generate-getopt -P d:build-dir=~/src/android-google
## end code-generator
## start generated code
TEMP=$(POSIXLY_CORRECT=true getopt -o d:h \
                      --long build-dir:,help \
                      -n $(basename -- $0) -- "$@")
declare build_dir=~/src/android-google
eval set -- "$TEMP"
while true; do
    case "$1" in

        -d|--build-dir)
            build_dir=$2
            shift 2

            ;;
        -h|--help)
            set +x
            echo -e
            echo
            echo Options and arguments:
            printf %06s '-d, '
            printf %-24s '--build-dir=BUILD_DIR'
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

cd "$build_dir"

if test -L ./external/droidVncServer; then
    rm -f ./external/droidVncServer
fi

rsync -a ~/src/github/Wrench/droidVncServer ./external

(
    android-set-product aosp_arm64-userdebug
    cd external/droidVncServer

    mma -j20 "$@"
)
rsync -a ./external/droidVncServer ~/src/github/Wrench/
