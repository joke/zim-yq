(( ${+commands[yq]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[yq]:-"$(${commands[asdf]} which yq 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_yq
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command shell-completion zsh >| $compfile
    zimfw check-dumpfile
  fi
} ${0:h}
