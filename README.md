# jipe
A bash utility to add JavaScript code to a pipe. Requires node.

## Installation
1. Clone the repo: `git clone https://github.com/drewhodson/jipe.git`
2. Cd into the directory: `cd jipe`
3. Copy jipe to your bin directory: `cp jipe ~/bin/`

## Usage
The stringified content of stdin is stored in a variable called `_`. Pass any JavaScript code as an argument to jipe.

```bash
echo 'hello world!' | jipe 'console.log(_.length)' # returns "13"
```

```bash
echo '{ "json": { "data": "hello!" } }' | jipe 'console.log(JSON.parse(_).json.data)' # returns "hello!"
```

## Helper Functions and Scripts
To increase the terseness of scripts, the following aliases exist:
 * `console.log` aliases: `log`, `l`
 * `process.stdout.write` aliases: `write`, `w`
 * Cast to string and print with newline: `print`, `p`
 * Cast to string and print without newline: `output`, `o`
 * Full contents of stdin: `__`
 * Full contents of stdin without trailing newline: `_n` 

## Linewise Mode
For those of you familiar with AWK, or those who want a quick way to iterate over the lines of a file, use the flag `-l` or `--linewise` when invoking jipe to have the `_` variable instead refer to each line of the file.

```bash
printf "hello\nworld\n.\n" | jipe -l 'p(_.length)' # returns 5\n5\n1\n
```

## Testing
Unit tests written with [bats](https://github.com/bats-core/bats-core).

Run tests with
```bash
bats test.bats
```

## TODO
 * Add man page

## FAQ
 * What if I don't want colors in my output?
   * Only `console.log` provides syntax highlighting, which is useful if you're printing JSON. However, use `print` or `output` to avoid color codes being printed.
