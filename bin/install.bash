#!/bin/bash
#
# Install eslint-pre-commit as a pre-commit hook

set -e

git rev-parse --is-inside-work-tree &> /dev/null
if [[ "$?" > 0 ]]; then
  echo "ESLint pre-commit hook install failed: Not a git repository"
  exit 1
fi

ROOT_DIR=$(git rev-parse --show-toplevel)

cd "$ROOT_DIR/.git/hooks"
rm -f pre-commit
curl -sS https://github.com/kodjoz/eslint-pre-commit/blob/master/bin/pre-commit > pre-commit
chmod +x pre-commit
echo "ESLint pre-commit hook installed successfully."
exit 0