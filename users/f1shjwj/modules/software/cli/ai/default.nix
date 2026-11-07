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
    ./magpie.nix
    ./mcp
  ];

  users.users.${username}.packages = with llm-agents; [
    # claude-code
    # codex
    # opencode
    # gemini-cli
    pi
    omp
    herdr
    # dsh
  ];
}
