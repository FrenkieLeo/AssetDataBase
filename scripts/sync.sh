#!/usr/bin/env bash
set -euo pipefail

REMOTE_URL="${ASSET_DB_REMOTE_URL:-https://github.com/FrenkieLeo/AssetDataBase.git}"
GIT_ARGS=()

if [ -f .git/HEAD ]; then
  GIT_ARGS=()
elif [ -d .assetdb.git ]; then
  GIT_ARGS=(--git-dir=.assetdb.git --work-tree=.)
else
  echo "This directory is not a writable git checkout."
  echo "Clone the repository first, or initialize the Work Mode helper git dir:"
  echo "  git clone ${REMOTE_URL}"
  echo "  git init --bare .assetdb.git"
  exit 1
fi

if ! git "${GIT_ARGS[@]}" remote get-url origin >/dev/null 2>&1; then
  git "${GIT_ARGS[@]}" remote add origin "${REMOTE_URL}"
fi

git "${GIT_ARGS[@]}" pull --rebase origin main
git "${GIT_ARGS[@]}" add README.md data docs templates scripts .gitignore

if git "${GIT_ARGS[@]}" diff --cached --quiet; then
  echo "No local changes to sync."
else
  git "${GIT_ARGS[@]}" commit -m "Update asset database"
  git "${GIT_ARGS[@]}" push origin main
fi
