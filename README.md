# Shell Scripts
## venv_rename.sh

Rename a python virtual environment created by virtualenv.

### Requirements:

The Silver Searcher. Try `apt install silversearcher-ag` on ubuntu or debian.

### Usage:

```bash
venv_rename.sh <src> <dest>

Example:
venv_rename.sh venv1 venv2 
# You must change directory to the parent directory of venv1 and the src and dest arguments should be a valid directory name without slash('/').
```

