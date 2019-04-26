# jipe
A unix utility to add JavaScript code to a pipe. Requires node.

## Installation
1. Clone the repo: `git clone https://github.com/drewhodson/jipe.git`
2. Cd into the directory: `cd jipe`
3. Copy jipe to your bin directory: `cp jipe ~/bin/`

## Usage
The content of stdin is stored in a variable called `_`. Pass any JavaScript code as an argument to jipe.

```bash
echo 'hello world!' | jipe 'console.log(_.length)' # returns "13"
```

```bash
echo '{ "json": { "data": "hello!" } }' | jipe 'console.log(JSON.parse(_).json.data)' # returns "hello!"
```

To increase the terseness of scripts, the following aliases exist:
 * `console.log` aliases: `log`, `l`
 * `process.stdout.write` aliases: `write`, `w`

## Testing
Unit tests written with [bats](https://github.com/bats-core/bats-core).

Run tests with
```bash
bats test.bats
```

## TODO
 * Add a linewise mode
 * Add an implicit output mode

## FAQ
 * What if I don't want colors in my output?
   * Use `process.stdout.write` instead of `console.log`. Note that this also does not implicitly print a newline.
