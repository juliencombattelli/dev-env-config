#!/bin/bash

function print_help {
    echo "Usage: $0 <clang-version> <clang-priority>"
}

function check_if_exists {
    [[ -f $1 ]] || { echo "$1 not found, please install it"; return 1; }
}

if [[ ! $(command -v update-alternatives) ]]; then
    echo "This script needs update-alternatives"
    exit 1
fi

if [[ $# -lt 2 ]]; then
    print_help
    exit 1
fi

for arg in $@; do
    case $arg in
    -h | --help)
        print_help
        exit 0
        ;;
    esac
done

version=$1
priority=$2

check_if_exists /usr/bin/clang-$version                     || any_not_found=1
check_if_exists /usr/bin/clang++-$version                   || any_not_found=1
check_if_exists /usr/bin/clang-apply-replacements-$version  || any_not_found=1
check_if_exists /usr/bin/clang-check-$version               || any_not_found=1
check_if_exists /usr/bin/clang-format-$version              || any_not_found=1
check_if_exists /usr/bin/clang-format-diff-$version         || any_not_found=1
check_if_exists /usr/bin/clang-query-$version               || any_not_found=1
check_if_exists /usr/bin/clang-tidy-$version                || any_not_found=1
check_if_exists /usr/bin/clang-tidy-diff-$version.py        || any_not_found=1

if [[ $any_not_found ]]; then 
    exit 1
fi

update-alternatives \
    --install /usr/bin/clang                    clang                       /usr/bin/clang-$version $priority \
    --slave /usr/bin/clang++                    clang++                     /usr/bin/clang++-$version \
    --slave /usr/bin/clang-apply-replacements   clang-apply-replacements    /usr/bin/clang-apply-replacements-$version \
    --slave /usr/bin/clang-check                clang-check                 /usr/bin/clang-check-$version \
    --slave /usr/bin/clang-format               clang-format                /usr/bin/clang-format-$version \
    --slave /usr/bin/clang-format-diff          clang-format-diff           /usr/bin/clang-format-diff-$version \
    --slave /usr/bin/clang-query                clang-query                 /usr/bin/clang-query-$version \
    --slave /usr/bin/clang-tidy                 clang-tidy                  /usr/bin/clang-tidy-$version \
    --slave /usr/bin/clang-tidy-diff            clang-tidy-diff             /usr/bin/clang-tidy-diff-$version.py