Push-Location -LiteralPath $PSScriptRoot
try {
    $mcpConfig = Get-Content -LiteralPath (Join-Path (Split-Path -Parent $PSScriptRoot) '.mcp.json') -Raw | ConvertFrom-Json
    $mcpUrl = $mcpConfig.mcpServers.'ACS-MCP-v0.1'.url
    if ([string]::IsNullOrWhiteSpace($mcpUrl)) {
        throw 'Missing ACS-MCP-v0.1 URL in .mcp.json'
    }

    $override = 'mcp_servers."ACS-MCP-v0.1".url="' + $mcpUrl + '"'
    codex -c $override @args
} finally {
    Pop-Location
}
