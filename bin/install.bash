#!/bin/bash
#
# Install eslint-pre-commit as a pre-commit hook

set -e

git rev-parse --is-inside-work-tree &> /dev/null
if [[ "$?" > 0 ]]; then
  echo "Hook install failed: Not a git repository"
  exit 1
fi

ROOT_DIR=$(git rev-parse --show-toplevel)

cd "$ROOT_DIR/.git/hooks"
rm -f pre-commit
curl -sS https://raw.githubusercontent.com/hackreactor-labs/pomander/master/bin/pomander > pre-commit
chmod +x pre-commit
echo "Hook installed successfully."
exit 0