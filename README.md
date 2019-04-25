# jipe
A unix utility to add JS code to a pipe. Requires node.

## Installation
1. Clone the repo: `git clone https://github.com/drewhodson/jipe.git`
2. Cd into the directory: `cd jipe`
3. Copy jipe to your bin directory: `cp jipe ~/bin/`

## Usage
```bash
echo 'hello world!' | jipe 'console.log(_.length)' # returns 12
```
