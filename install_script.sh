#!/bin/bash

# ---------- Make this script executable ----------
SCRIPT_PATH="${BASH_SOURCE[0]}"
if [ ! -x "$SCRIPT_PATH" ]; then
    echo -e "\033[0;36mMaking script executable...\033[0m"
    chmod +x "$SCRIPT_PATH"
    echo -e "\033[0;32mScript is now executable.\033[0m"
fi

# ---------- Colors ----------
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
RESET="\033[0m"

# ---------- Help Message ----------
show_help() {
    echo -e ""
    echo -e "${CYAN}install_script.sh${RESET}"
    echo -e ""
    echo -e "Install one or more .sh scripts into \$HOME/Scripts,"
    echo -e "make them executable, and add the folder to your PATH."
    echo -e ""
    echo -e "${CYAN}Usage:${RESET}"
    echo -e "  install_script.sh script1.sh script2.sh ..."
    echo -e ""
    echo -e "${CYAN}Options:${RESET}"
    echo -e "  -h, --help      Show this help message and exit"
    echo ""
    exit 0
}

# ---------- Check for Help Flag ----------
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    show_help
fi

# ---------- Check for Script Arguments ----------
if [ $# -eq 0 ]; then
    echo -e "${RED}Error:${RESET} No scripts specified."
    echo -e "${YELLOW}Hint:${RESET} Usage: install_script.sh script1.sh script2.sh ..."
    echo -e "${YELLOW}Tip :${RESET} Run: install_script.sh --help"
    exit 1
fi

SCRIPTS_DIR="$HOME/Scripts"
SCRIPT_INSTALLED=false

# ---------- Create Scripts Directory ----------
if [ ! -d "$SCRIPTS_DIR" ]; then
    echo -e "${CYAN}Creating:${RESET} $SCRIPTS_DIR"
    mkdir -p "$SCRIPTS_DIR"
fi

# ---------- Install Scripts ----------
for SCRIPT_TO_INSTALL in "$@"; do
    if [ ! -f "$SCRIPT_TO_INSTALL" ]; then
        echo -e "${RED}Skipping:${RESET} File '$SCRIPT_TO_INSTALL' does not exist."
        continue
    fi

    SCRIPT_NAME=$(basename "$SCRIPT_TO_INSTALL")
    DEST="$SCRIPTS_DIR/$SCRIPT_NAME"

    # Prevent copying file over itself
    if [ "$SCRIPT_TO_INSTALL" = "$DEST" ]; then
        echo -e "${YELLOW}Notice:${RESET} '$SCRIPT_NAME' is already in $SCRIPTS_DIR. Skipping copy."
        if [ ! -x "$DEST" ]; then
            chmod +x "$DEST"
            echo -e "${GREEN}Checked:${RESET} Marked as executable."
        else
            echo -e "${GREEN}Checked:${RESET} Already executable."
        fi
        SCRIPT_INSTALLED=true
        continue
    fi

    # Check if script name already exists in PATH elsewhere
    if command -v "$SCRIPT_NAME" >/dev/null 2>&1; then
        FOUND_PATH=$(command -v "$SCRIPT_NAME")
        if [ "$FOUND_PATH" != "$DEST" ]; then
            echo -e "${RED}Conflict:${RESET} A command named '$SCRIPT_NAME' already exists in your PATH at:"
            echo -e "→ $FOUND_PATH"
            echo -e "${YELLOW}Tip:${RESET} Please rename your script and rerun this installer."
            continue
        fi
    fi

    # Ask before overwriting if file already exists
    if [ -f "$DEST" ]; then
        echo -e "${YELLOW}Warning:${RESET} '$SCRIPT_NAME' already exists in $SCRIPTS_DIR."
        read -rp "⚠️  Overwrite it? (y/n): " CONFIRM
        if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
            echo -e "${CYAN}Skipped:${RESET} $SCRIPT_NAME was not overwritten."
            continue
        fi
    fi

    echo -e "${CYAN}Installing:${RESET} $SCRIPT_NAME → $SCRIPTS_DIR"
    cp "$SCRIPT_TO_INSTALL" "$DEST"
    
    # Make executable only if not already executable
    if [ ! -x "$DEST" ]; then
        chmod +x "$DEST"
        echo -e "${GREEN}Success:${RESET} $SCRIPT_NAME installed and made executable."
    else
        echo -e "${GREEN}Success:${RESET} $SCRIPT_NAME installed (already executable)."
    fi
    
    # Delete the original file after successful installation
    rm "$SCRIPT_TO_INSTALL"
    echo -e "${CYAN}Cleanup:${RESET} Original file deleted."

    SCRIPT_INSTALLED=true
done

# ---------- Stop if nothing was installed ----------
if [ "$SCRIPT_INSTALLED" = false ]; then
    echo -e "${YELLOW}Notice:${RESET} No scripts were installed. PATH was not modified."
    exit 0
fi

# ---------- Detect shell config file ----------
SHELL_RC=""
if [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
fi

if [ -z "$SHELL_RC" ]; then
    echo -e "${YELLOW}Warning:${RESET} No .bashrc or .zshrc found."
    echo -e "Please add the following manually to your shell config:"
    echo -e "  export PATH=\"\$HOME/Scripts:\$PATH\""
    exit 0
fi

# ---------- Update PATH in shell config ----------
if ! grep -q 'PATH=.*\$HOME/Scripts' "$SHELL_RC"; then
    echo -e "${CYAN}Modifying:${RESET} $SHELL_RC to include \$HOME/Scripts"
    {
        echo ''
        echo '# Add custom scripts path'
        echo 'if [[ ":$PATH:" != *":$HOME/Scripts:"* ]]; then'
        echo '    export PATH="$HOME/Scripts:$PATH"'
        echo 'fi'
    } >> "$SHELL_RC"
else
    echo -e "${GREEN}Info:${RESET} \$HOME/Scripts already handled in $SHELL_RC"
fi

# ---------- Final message to user ----------
echo -e "${YELLOW}Notice:${RESET} Changes made to ${CYAN}${SHELL_RC}${RESET}."
echo -e "Please run: ${CYAN}source $SHELL_RC${RESET} or restart your terminal to apply changes."
