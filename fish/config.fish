if status is-interactive
    # System info
    fastfetch

    # Abbreviations (better than aliases)
    abbr -a update "sudo dnf update && flatpak update"
    abbr -a upgrade "sudo dnf upgrade"
    abbr -a update-ai "~/Docker/update-ai-stack.sh"
    abbr -a update-all "sudo dnf update && flatpak update && ~/Docker/update-ai-stack.sh"

    # Starship prompt
    starship init fish | source
end
set -gx PATH ~/.npm-global/bin $PATH
