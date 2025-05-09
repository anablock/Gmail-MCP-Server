#!/bin/bash

# Helper script for Gmail MCP Server authentication
echo "========================================"
echo "Gmail MCP Server Authentication Helper"
echo "========================================"

CONFIG_DIR=~/.gmail-mcp
OAUTH_FILE="$CONFIG_DIR/gcp-oauth.keys.json"
CURRENT_DIR_OAUTH="./gcp-oauth.keys.json"

# Check if CONFIG_DIR exists, if not create it
if [ ! -d "$CONFIG_DIR" ]; then
  echo "Creating config directory at $CONFIG_DIR"
  mkdir -p "$CONFIG_DIR"
fi

# Check if OAuth file exists in current directory
if [ -f "$CURRENT_DIR_OAUTH" ]; then
  echo "Found OAuth keys in current directory."
  echo "Copying to $OAUTH_FILE"
  cp "$CURRENT_DIR_OAUTH" "$OAUTH_FILE"
  echo "Copied successfully."
elif [ ! -f "$OAUTH_FILE" ]; then
  echo "Error: OAuth keys not found."
  echo "Please download your Google Cloud OAuth credentials and save as:"
  echo "- $CURRENT_DIR_OAUTH (current directory) or"
  echo "- $OAUTH_FILE (global config)"
  echo ""
  echo "See oauth-setup-instructions.md for details on creating credentials."
  exit 1
fi

# Run authentication
echo "Starting authentication process..."
node dist/index.js auth

if [ $? -eq 0 ]; then
  echo ""
  echo "========================================"
  echo "Authentication completed successfully!"
  echo "Credentials saved to: $CONFIG_DIR/credentials.json"
  echo ""
  echo "Next steps:"
  echo "1. Configure Claude Desktop with the MCP configuration"
  echo "2. Restart Claude Desktop"
  echo "3. Start using Gmail features through Claude"
  echo "========================================"
else
  echo ""
  echo "Authentication failed. Please check the error messages above."
fi
