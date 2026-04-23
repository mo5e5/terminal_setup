. "$HOME/.local/bin/env" 2>/dev/null || true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ============================================================
# CUSTOM TERMINAL SETUP
# github.com/mo5e5/terminal_setup
# ============================================================

# --- NAVIGATION ---
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias home='cd ~'
alias desk='cd ~/Desktop'
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias ll='ls -lah'
alias la='ls -A'
alias lt='ls -lath'

# --- FILES & FOLDERS ---
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias rmf='rm -rf'
alias mkf='touch'
alias cpdir='cp -r'
alias showsize='du -sh *'
alias catn='cat -n'
alias tailf='tail -f'
alias tail20='tail -20'
alias tree='find . -maxdepth 3 | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'

mktxt()   { touch "$1.txt" && open -e "$1.txt"; }
mkcd()    { mkdir -p "$1" && cd "$1"; }
writef()  { echo "$2" > "$1";  echo "Created: $1"; }
appendf() { echo "$2" >> "$1"; echo "Appended to: $1"; }

# --- SEARCH ---
alias ff='find . -name'
alias grep='grep --color=auto'
alias ftext='grep -r'
alias fsize='find . -size'

# --- SYSTEM ---
alias cls='clear'
alias q='exit'
alias reload='source ~/.zshrc 2>/dev/null || source ~/.bash_profile'
alias path='echo $PATH | tr ":" "\n"'
alias myip='curl -s ifconfig.me && echo'
alias localip="ipconfig getifaddr en0"
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo "DNS flushed"'
alias ports='lsof -i -P -n | grep LISTEN'
alias diskspace='df -h'
alias foldersize='du -sh'
alias top='top -o cpu'
alias please='sudo'
alias now='date +"%d.%m.%Y %H:%M:%S"'
alias week='date +%V'
alias pubkey='cat ~/.ssh/id_rsa.pub'

# --- GIT ---
alias gs='git status'
alias ga='git add .'
alias gaa='git add -A'
alias gc='git commit -m'
alias gca='git commit --amend --no-edit'
alias gcm='git commit --amend -m'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpt='git push --tags'
alias gl='git pull'
alias glr='git pull --rebase'
alias gf='git fetch'
alias gfa='git fetch --all'
alias glog='git log --oneline --graph --decorate --all'
alias glogs='git log --oneline -10'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout main 2>/dev/null || git checkout master'
alias gm='git merge'
alias gms='git merge --squash'
alias grb='git rebase'
alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gd='git diff'
alias gds='git diff --staged'
alias grs='git restore'
alias grst='git restore --staged'
alias gtag='git tag'
alias gclean='git clean -fd'

ginit() {
  git init && git add -A && git commit -m "Initial commit"
  echo "Repo initialized!"
}
gpush() {
  git push --set-upstream origin "$(git branch --show-current)"
}

# --- FUN ---
alias wetter='curl -s "wttr.in/?lang=de&format=3"'           # change city as needed
alias wetterdetail='curl -s "wttr.in/?lang=de"'
alias muenze='(( RANDOM % 2 )) && echo "  --> Heads!" || echo "  --> Tails!"'
alias wuerfel='echo "  --> $((RANDOM % 6 + 1))"'
alias genpassword='openssl rand -base64 20 | tr -d "=/+" | cut -c1-20'
alias finder='open .'
alias bigfiles='du -sh * | sort -rh | head -10'

timer() {
  local secs=$1
  while [ "$secs" -gt 0 ]; do
    printf "\r  %3d seconds left..." "$secs"
    sleep 1; secs=$((secs - 1))
  done
  printf "\r  Time is up!                \n"
}

notiz() {
  echo "$(date '+%d.%m.%Y %H:%M') - $*" >> ~/Desktop/notizen.txt
  echo "  Note saved (~/Desktop/notizen.txt)"
}
alias notizen='cat ~/Desktop/notizen.txt 2>/dev/null || echo "No notes yet."'

# ============================================================
# PROMPT  →  mo ~/path %
# Change "mo" to your own initials
# ============================================================
autoload -Uz colors && colors 2>/dev/null
PROMPT='%F{yellow}mo%f %F{cyan}%~%f %F{white}%%%f '

# ============================================================
# HELP TABLE
# ============================================================
show_help() {
  local C='\033[0;36m'
  local B='\033[1;37m'
  local Y='\033[1;33m'
  local N='\033[0;37m'
  local G='\033[0;32m'
  local R='\033[0m'
  local SEP="${C}+------------------+----------------------------+------------------------------+${R}"

  _row() { printf "${C}|${R} ${B}%-16s${R} ${C}|${R} ${N}%-26s${R} ${C}|${R} ${G}%-28s${R} ${C}|${R}\n" "$1" "$2" "$3"; }
  _cat() { printf "${C}|${R} ${Y}%-76s${R} ${C}|${R}\n" "  $1"; }
  _sep() { printf "%b\n" "$SEP"; }

  printf "\n"
  _sep
  printf "${C}|${R} ${B}%-16s${R} ${C}|${R} ${B}%-26s${R} ${C}|${R} ${B}%-28s${R} ${C}|${R}\n" "SHORTCUT" "DESCRIPTION" "EXAMPLE"
  _sep
  _cat "NAVIGATION";          _sep
  _row ".."         "Go up one folder"           ""
  _row "..."        "Go up two folders"          ""
  _row "home"       "Home directory"             ""
  _row "desk"       "Desktop"                    ""
  _row "docs"       "Documents"                  ""
  _row "dl"         "Downloads"                  ""
  _row "ll"         "Detailed file list"         "ll"
  _row "lt"         "List sorted by time"        "lt"
  _row "tree"       "Show folder structure"      "tree"
  _sep
  _cat "FILES & FOLDERS";     _sep
  _row "mkf"        "Create empty file"          "mkf note.txt"
  _row "mktxt"      "Create + open text file"    "mktxt README"
  _row "mkcd"       "Create folder + enter"      "mkcd projects/new"
  _row "writef"     "Create file with content"   "writef a.txt \"Hello\""
  _row "appendf"    "Append line to file"        "appendf a.txt \"Line2\""
  _row "catn"       "Show file with line nums"   "catn file.txt"
  _row "tailf"      "Follow live log"            "tailf server.log"
  _row "cpdir"      "Copy folder"                "cpdir src/ backup/"
  _row "showsize"   "Size of all items here"     "showsize"
  _row "ff"         "Find file by name"          "ff \"*.sh\""
  _row "ftext"      "Search text in files"       "ftext \"TODO\" ."
  _row "fsize"      "Find by file size"          "fsize +10M"
  _row "bigfiles"   "Largest files here"         "bigfiles"
  _row "rm"         "Delete (with confirm)"      "rm old-file.txt"
  _sep
  _cat "GIT – BASICS";        _sep
  _row "gs"         "Show status"                "gs"
  _row "ga"         "Stage all"                  "ga"
  _row "gaa"        "Stage all + deleted"        "gaa"
  _row "gc"         "Create commit"              "gc \"Fix login bug\""
  _row "gca"        "Extend last commit"         "gca"
  _row "gcm"        "Rename last commit"         "gcm \"Better name\""
  _row "gd"         "Show changes"               "gd"
  _row "gds"        "Show staged changes only"   "gds"
  _row "grs"        "Undo file change"           "grs file.txt"
  _row "grst"       "Unstage file"               "grst file.txt"
  _sep
  _cat "GIT – BRANCHES & PUSH"; _sep
  _row "gb"         "List branches"              "gb"
  _row "gba"        "All branches (+ remote)"    "gba"
  _row "gcob"       "Create new branch"          "gcob feature-login"
  _row "gcom"       "Switch to main/master"      "gcom"
  _row "gco"        "Switch branch"              "gco develop"
  _row "gbd"        "Delete branch"              "gbd old-branch"
  _row "gp"         "Push"                       "gp"
  _row "gpush"      "Push + set upstream"        "gpush"
  _row "gpf"        "Force push (safe)"          "gpf"
  _row "gl"         "Pull"                       "gl"
  _row "glr"        "Pull with rebase"           "glr"
  _row "gfa"        "Fetch all remotes"          "gfa"
  _sep
  _cat "GIT – HISTORY & STASH"; _sep
  _row "glog"       "Visual commit history"      "glog"
  _row "glogs"      "Last 10 commits"            "glogs"
  _row "gm"         "Merge branch"               "gm feature-login"
  _row "gst"        "Save stash"                 "gst"
  _row "gstp"       "Restore stash"              "gstp"
  _row "gstl"       "List all stashes"           "gstl"
  _row "gtag"       "Create tag"                 "gtag v1.0.0"
  _row "gpt"        "Push tags"                  "gpt"
  _row "ginit"      "New repo + first commit"    "ginit"
  _row "gclean"     "Delete untracked files"     "gclean"
  _sep
  _cat "SYSTEM";               _sep
  _row "myip"       "Public IP address"          "myip"
  _row "localip"    "Local IP address"           "localip"
  _row "ports"      "Open ports"                 "ports"
  _row "diskspace"  "Disk usage"                 "diskspace"
  _row "foldersize" "Folder size"                "foldersize ./src"
  _row "flushdns"   "Flush DNS cache"            "flushdns"
  _row "now"        "Date & time"                "now"
  _row "week"       "Calendar week"              "week"
  _row "please"     "= sudo"                     "please brew install x"
  _row "cls"        "Clear terminal"             "cls"
  _row "reload"     "Reload config"              "reload"
  _sep
  _cat "FUN & TOOLS";          _sep
  _row "wetter"     "Weather (short)"            "wetter"
  _row "wetterdetail" "Weather (detailed)"       "wetterdetail"
  _row "timer"      "Countdown timer"            "timer 60"
  _row "muenze"     "Flip a coin"                "muenze"
  _row "wuerfel"    "Roll a dice (1-6)"          "wuerfel"
  _row "genpassword" "Generate password"         "genpassword"
  _row "finder"     "Open folder in Finder"      "finder"
  _row "notiz"      "Save a desktop note"        "notiz \"idea xyz\""
  _row "notizen"    "Show all notes"             "notizen"
  _row "help"       "This overview"              "help"
  _sep
  printf "\n"
}

alias help='show_help'

# ============================================================
# RANDOM GREETING
# ============================================================
_greet() {
  local B='\033[1;33m'
  local D='\033[2;37m'
  local R='\033[0m'

  local MSGS=(
    "Hey you rascal, looking good today."
    "Morning! Let's break things... I mean build things."
    "Back again? The terminal missed you."
    "Chef is online. All processes standing by."
    "Today's a good day. The terminal believes in you."
    "Good day. The machines obey."
    "Had your coffee? Good. Nothing can go wrong then."
    "You look like someone who's about to build something cool."
    "Welcome back! Git has been waiting."
    "Oh look who showed up – the best dev around!"
    "Ready? Your keyboard is too. Let's go!"
    "Last login forgotten. But you were definitely productive."
    "Another day, another commit."
    "The terminal is yours. Make it count."
  )

  local IDX=$(( RANDOM % ${#MSGS[@]} ))
  printf "\n  ${B}${MSGS[$IDX]}${R}\n"
  printf "  ${D}Type 'help' for all shortcuts.${R}\n\n"
}

_greet
