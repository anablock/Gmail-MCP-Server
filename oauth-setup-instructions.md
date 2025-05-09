# Setting up Google Cloud OAuth Credentials

Follow these steps to create the required OAuth credentials for the Gmail MCP Server:

1. **Create a Google Cloud Project:**
   - Go to [Google Cloud Console](https://console.cloud.google.com/)
   - Create a new project or select an existing one
   - Note your project ID

2. **Enable the Gmail API:**
   - In your project, go to "APIs & Services" > "Library"
   - Search for "Gmail API" and select it
   - Click "Enable"

3. **Create OAuth 2.0 Credentials:**
   - Go to "APIs & Services" > "Credentials"
   - Click "Create Credentials" > "OAuth client ID"
   - Choose "Desktop app" as the application type
   - Give it a name like "Gmail MCP Client"
   - Click "Create"
   - Download the JSON file
   - Rename the downloaded file to `gcp-oauth.keys.json`

4. **Place the credentials file:**
   - Move the `gcp-oauth.keys.json` file to `~/.gmail-mcp/` directory
   - Alternatively, you can place it in the current working directory when running the auth command
