#!/bin/bash

pointercrate_repo="$1"

if [ -z "$pointercrate_repo" ]; then
    echo "Please specify path to pointercrate repository as first argument"
    exit 1
fi

if [ ! -d "$pointercrate_repo" ]; then
    echo "Pointercrate \'$pointercrate_repo\' does not exist"
    exit 1
fi

listed_errors=$(grep -Eo "[0-9]{5}" 000_index/900_errors.md | sort)

for f in $(find "$pointercrate_repo" -name error.rs -type f); do
    if ! grep "impl PointercrateError" "$f" >/dev/null; then
        continue
    fi

    actual_errors=$(sed -nr 's/^.+ => ([0-9]{5}),$/\1/p' "$f" | sort| uniq)

    echo "Missing error codes in documentation from $f":
    comm -23 <(echo "$actual_errors") <(echo "$listed_errors") | uniq
done
