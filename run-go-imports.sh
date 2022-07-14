#!/usr/bin/env bash
#
# Capture and print stdout, since goimports doesn't use proper exit codes
#
set -e -o pipefail
go version
if ! command -v goimports &> /dev/null ; then
    echo "goimports not installed or available in the PATH" >&2
    echo "please check https://pkg.go.dev/golang.org/x/tools/cmd/goimports" >&2
    exit 1
fi
echo "$@"
exec 5>&1
output="$(goimports -l -w "$@")
echo $output
exit 1
[[ -z "$output" ]]
