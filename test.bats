#!/usr/bin/env bats

MULTILINE_INPUT="line one\nline two\nline three\n"

@test "multiline input returns unchanged" {
  result="$(printf "$MULTILINE_INPUT" | ./jipe 'w(_)')"
  [ "$result" = "$(printf "$MULTILINE_INPUT")" ]
}

@test "supports linewise mode" {
  result="$(printf "$MULTILINE_INPUT" | ./jipe -l 'w(_.length+"\n")')"
  [ "$result" = "$(printf "8\n8\n10\n")" ]
}

@test "line length should match awk" {
  result="$(printf "$MULTILINE_INPUT" | ./jipe -l 'w(_.length+"\n")')"
  result2="$(printf "$MULTILINE_INPUT" | awk '{ print length }')"
  [ "$result" = "$result2" ]
}

@test "print command prints newline and casts to string" {
  result="$(printf "$MULTILINE_INPUT" | ./jipe -l 'print(_.length)')"
  [ "$result" = "$(printf "8\n8\n10\n")" ]
}

@test "output command casts to string, does not print newline" {
  result="$(printf "$MULTILINE_INPUT" | ./jipe -l 'output(_.length);o(" ")')"
  [ "$result" = "$(printf "8 8 10 ")" ]
}
