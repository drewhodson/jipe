#!/usr/bin/env bats

MULTILINE_INPUT="line one\nline two\nline three\n"

@test "multiline input returns unchanged" {
  result="$(echo "$MULTILINE_INPUT" | jipe 'w(_)')"
  [ "$result" = "$MULTILINE_INPUT" ]
}
