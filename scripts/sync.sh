#!/usr/bin/env bash
set -euo pipefail

REMOTE_URL="${ASSET_DB_REMOTE_URL:-https://github.com/FrenkieLeo/AssetDataBase.git}"

if [ ! -d .git ] || [ ! -f .git/HEAD ]; then
  echo "This directory is not a writable git checkout."
  echo "Clone the repository first:"
  echo "  git clone ${REMOTE_URL}"
  exit 1
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  git remote add origin "${REMOTE_URL}"
fi

git pull --rebase origin main
git add README.md data docs templates scripts

if git diff --cached --quiet; then
  echo "No local changes to sync."
else
  git commit -m "Update asset database"
fi

git push origin main
