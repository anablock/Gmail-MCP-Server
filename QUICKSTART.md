# Gmail AutoAuth MCP Server Quick Start Guide

This guide will help you set up and start using the Gmail AutoAuth MCP Server with Claude Desktop.

## Prerequisites

- Node.js v14.0.0 or higher
- Claude Desktop installed
- A Google account

## Setup Steps

### 1. Prepare OAuth Credentials

Follow the instructions in `oauth-setup-instructions.md` to:
- Create a Google Cloud Project
- Enable the Gmail API
- Create OAuth credentials
- Download and rename the credentials file to `gcp-oauth.keys.json`
- Place it in the `~/.gmail-mcp/` directory

### 2. Authenticate with Google

Run the authentication command:

```bash
node dist/index.js auth
```

This will:
- Open your browser for Google authentication
- Request permission to access your Gmail account
- Store the authentication tokens in `~/.gmail-mcp/credentials.json`

### 3. Configure Claude Desktop

Edit the Claude Desktop configuration file at:
- macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
- Windows: `%APPDATA%\Claude\claude_desktop_config.json`
- Linux: `~/.config/Claude/claude_desktop_config.json`

Add the following configuration:

```json
{
  "mcpServers": {
    "gmail": {
      "command": "node",
      "args": [
        "/Users/vukdukic/Development/Gmail-MCP-Server/dist/index.js"
      ]
    }
  }
}
```

Make sure to update the path to match your actual installation path.

### 4. Restart Claude Desktop

Restart Claude Desktop to pick up the new configuration.

## Usage

After setup, you can use the Gmail MCP Server through Claude Desktop with natural language:

Examples:
- "Send an email to contact@example.com with subject 'Meeting Tomorrow' and body 'Hi, looking forward to our meeting.'"
- "Check my recent emails from Alex"
- "Create a new label called 'Important Projects'"
- "Move emails from team@example.com to the Projects label"

## Troubleshooting

1. **Authentication Issues:**
   - Check that `gcp-oauth.keys.json` is correctly formatted
   - Verify `credentials.json` exists in `~/.gmail-mcp/`
   - Try re-authenticating with `node dist/index.js auth`

2. **Claude Desktop Integration:**
   - Verify the config file has the correct path to index.js
   - Make sure the script is executable
   - Check Claude Desktop logs for any errors

3. **API Errors:**
   - Ensure Gmail API is enabled in your Google Cloud Project
   - Check that your Google account has not revoked access

## Next Steps

- For full details on all available operations, see the README.md
- To update the server, run `npm update @gongrzhe/server-gmail-autoauth-mcp`
