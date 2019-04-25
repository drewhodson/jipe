# jipe
A unix utility to add JS code to a pipe. Requires node.

## Installation
1. Clone the repo: `git clone https://github.com/drewhodson/jipe.git`
2. Cd into the directory: `cd jipe`
3. Copy jipe to your bin directory: `cp jipe ~/bin/`

## Usage
Every instance of _ in your snippet is replaced with a reference to a variable containing the full text content of STDIN.

```bash
echo 'hello world!' | jipe 'console.log(_.length)' # returns "12"
```

```bash
echo '{ "json": { "data": "hello!" } }' | jipe 'console.log(JSON.parse(_).json.data)' # returns "hello!"
```

## TODO
 * Add a linewise mode
 * Add an implicit output mode

## FAQ
 * What if I don't want colors in my output?
   * Use `process.stdout.write` instead of `console.log`. Note that this also does not implicitly print a newline.
