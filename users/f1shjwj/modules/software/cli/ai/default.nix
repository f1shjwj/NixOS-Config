{
  username,
  pkgs,
  inputs,
  ...
}:
let
  llm-agents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    ./mcp
    ./hermes.nix
  ];

  users.users.${username}.packages = with llm-agents; [
    claude-code
    codex
    opencode
    # gemini-cli
  ];
}
