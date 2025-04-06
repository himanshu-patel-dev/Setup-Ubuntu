#!/usr/bin/env bash

set -e

TMUX_CONF="$HOME/.tmux.conf"
TMUX_BACKUP="tmux.conf.backup"

install_tmux() {
  if command -v tmux &>/dev/null; then
    echo "✅ tmux is already installed."
  else
    echo "📦 Installing tmux..."
    sudo apt update && sudo apt install -y tmux
  fi
}

backup_config() {
  if [ -f "$TMUX_CONF" ]; then
    cp "$TMUX_CONF" "$TMUX_BACKUP"
    echo "📝 Backed up $TMUX_CONF to $TMUX_BACKUP"
  else
    echo "⚠️ No tmux config found at $TMUX_CONF to back up."
  fi
}

restore_config() {
  if [ -f "$TMUX_BACKUP" ]; then
    cp "$TMUX_BACKUP" "$TMUX_CONF"
    echo "🔄 Restored tmux config from $TMUX_BACKUP to $TMUX_CONF"
  else
    echo "⚠️ No backup found at $TMUX_BACKUP"
  fi
}

# Command interface
case "$1" in
  install)
    install_tmux
    ;;
  backup)
    backup_config
    ;;
  restore)
    restore_config
    ;;
  *)
    echo "Usage:"
    echo "  $0 install     # Install tmux (if not already installed)"
    echo "  $0 backup      # Backup ~/.tmux.conf to ~/tmux.conf.backup"
    echo "  $0 restore     # Restore backup to ~/.tmux.conf"
    ;;
esac

