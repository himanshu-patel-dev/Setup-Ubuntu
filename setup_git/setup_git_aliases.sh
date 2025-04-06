#!/usr/bin/env bash

GITCONFIG="$HOME/.gitconfig"
BACKUP="gitconfig.bak"

case "$1" in
  backup)
    cp "$GITCONFIG" "$BACKUP"
    echo "✅ Global Git config (including aliases) backed up to $BACKUP"
    ;;
  apply)
    cp "$BACKUP" "$GITCONFIG"
    echo "✅ Restored Git config from $BACKUP"
    ;;
  *)
    echo "Usage:"
    echo "  $0 backup   # Backup ~/.gitconfig to .gitconfig.bak"
    echo "  $0 apply    # Restore ~/.gitconfig from backup"
    ;;
esac

# Use this script as

# backup
# ./setup_git_aliases.sh backup

# apply
# ./setup_git_aliases.sh apply
#

# list all aliases
# git config --global --list

# set alias
# git config --global alias.s status

# unset alias
# git config --global --unset alias.s

