# Amphenol product question routing

These instructions apply to agents working in this repository, including Codex, Devin, and Claude.

When the user asks about an Amphenol product, part number, specification, family, category, document, application, comparison, compatibility, or related follow-up:

1. Read and follow the root skill at `amphenol-search/SKILL.md`. Before searching, read all three references it requires in `amphenol-search/references/`.
2. Use the Amphenol catalog MCP configured as `ACS-MCP-v0.1` in the root `.mcp.json`, `.codex/config.toml`, and `.devin/mcp_config.json`. Discover the available server, tools, indexes, and live schemas before calling them.
3. Search the relevant catalog indexes, verify every requested attribute against retrieved records and applicable documents, and answer with source links. Keep verified, conditional, and unsupported claims distinct. State retrieval limits or MCP failures clearly; do not answer product facts from memory as though they were verified.

Treat a follow-up as part of the Amphenol question even if it omits the brand. For an unspecified manufacturer outside an established Amphenol context, ask which manufacturer the user means. Do not invoke this workflow for unrelated questions.

The skill and its references govern the detailed search, matching, pagination, and response procedure. If the skill, a required reference, or the configured MCP is unavailable, disclose the limitation rather than claiming the procedure was completed.
