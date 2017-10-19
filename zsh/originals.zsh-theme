### Originals theme ###

# Colors
R=%B%F{202}
M=%B%F{36}
Y=%B%F{221}
B=%B%F{27}
C=%B%F{45}
RESET=$reset_color

# Color pallete
YELLOW=%B%F{178}
GREEN=%B%F{64}
VIOLET=%B%F{61}
RED=%B%F{160}
BASE2=%B%F{254}
ERROR=%B%F{250}

if [ "$USER" = "root" ]; then
    PROMPTCOLOR="%{$RED%}" PROMPTPREFIX="  ";
else
    PROMPTCOLOR="%{$YELLOW%}" PROMPTPREFIX="  ";
fi

local return_code="%(?..%{$R%}%? ↵%{$RESET%})"

# Get the status of the working tree (copied and modified from git.zsh)
custom_git_prompt_status() {
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""
  # Non-staged
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^.M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  # Staged
  if $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^M' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_ADDED$STATUS"
  fi

  if $(echo -n "$STATUS" | grep '.*' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_STATUS_PREFIX$STATUS"
  fi

  echo $STATUS
}

# get the name of the branch we are on (copied and modified from git.zsh)
function custom_git_prompt() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$(git_prompt_ahead)$(custom_git_prompt_status)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# %B sets bold text
PROMPT='$PROMPTCOLOR$PROMPTPREFIX %2~ $(custom_git_prompt)%{$GREEN%}%B%{$ERROR%}%b%{$RESET%} '
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$GREEN%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GREEN%}›%{$RESET%} "

ZSH_THEME_GIT_PROMPT_DIRTY="%{$R%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD="%{$B%}➔"


ZSH_THEME_GIT_STATUS_PREFIX=" "

# Staged
ZSH_THEME_GIT_PROMPT_STAGED_ADDED="%{$GREEN%}A"
ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED="%{$GREEN%}M"
ZSH_THEME_GIT_PROMPT_STAGED_RENAMED="%{$GREEN%}R"
ZSH_THEME_GIT_PROMPT_STAGED_DELETED="%{$GREEN%}D"

# Not-staged
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$R%}?"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$R%}M"
ZSH_THEME_GIT_PROMPT_DELETED="%{$R%}D"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$R%}UU"
