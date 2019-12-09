function is-repo() {
  local inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
  if [ $inside_git_repo ]; then
    return 0
  else
    return 1
  fi
}

function is-repo-base-dir() {
  local repo_base="$(is-repo && git rev-parse --show-toplevel 2>/dev/null)"
  if [[ $repo_base == $PWD ]]; then
    return 0
  else
    return 1
  fi
}

function program-installed() {
  local installed="$(command -v $1 2>/dev/null)"
  if [ $installed ]; then
    return 0
  else
    return 1
  fi
}

function secrets-installed-in-repo() {
  local repo_base="$(is-repo && git rev-parse --show-toplevel 2>/dev/null)"
  local hooks="$repo_base/.git/hooks"

  if [ ! -f "$hooks/commit-msg" ] && [ ! -f "$hooks/pre-commit" ] && [ ! -f "$hooks/prepare-commit-msg" ]; then
    return 1
  fi

  local commit_msg="$(grep "git secrets --commit_msg_hook" $hooks/commit-msg)"
  local pre_commit="$(grep "git secrets --pre_commit_hook" $hooks/pre-commit)"
  local prepare_commit_msg="$(grep "git secrets --prepare_commit_msg_hook" $hooks/prepare-commit-msg)"

  if [ $commit_msg ] && [ $pre_commit ] && [ $prepare_commit_msg ]; then
    return 0
  fi

  return 1
}

function cd() {
  if [ $# -eq 0 ]; then
    builtin cd ~
  else
    builtin cd "$1"
  fi

  if is-repo; then
    if $(program-installed git-secrets); then
      if secrets-installed-in-repo; then
        is-repo-base-dir && echo "git-secrets ready."
      else
        echo "Setting up git-secrets. This will only run once."
        git secrets --install
      fi
    else
      echo "You don't have git-secrets installed. See https://github.com/awslabs/git-secrets for details on installation and setup."
    fi
  fi
  return 0
}
