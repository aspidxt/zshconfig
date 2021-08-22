SSH_DIR=~/.ssh
USER_NAME="Roman Lavrinov"



function gitclone-ssh ()
{
  local key_private key_public email clone_url ssh_command

  # Print 'usage' message if less than 2 args received
  if [ $# -lt 2 ]; then
      echo "Usage: \n  git-clone-ssh 'id_key' 'repo.ssh.url'"
      return
  fi

  clone_url=${2}
  key_private="${SSH_DIR}/${1}"
  key_public="${key_private}.pub"
  if [[ ! -r ${key_private} ]]; then
      echo "Private key \'${key_private}\' not found"
      return
  elif [[ ! -r ${key_public} ]]; then
      echo "Public key \'${key_public}\' not found"
      return
  fi

  email=${$(cat ${key_public}):2}
  ssh_command="ssh -i ${key_private} -F /dev/null"

  git clone \
    -c core.sshCommand="${ssh_command}" \
    -c user.email="${email}" \
    -c user.name="${USER_NAME}" \
    "${clone_url}" \
  # TODO: Return advice to add public key to github if error
  # "https://github.com/settings/keys"
}



function _list_sshkeys ()
{
  public_keys=$(cd ${SSH_DIR} && ls *.pub)
  private_keys=${${public_keys}//'.pub'}

  echo ${private_keys}
}



function _gitclone-ssh-bash ()
{
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]}
  if [[ "$prev" == gitclone-ssh ]]; then
    COMPREPLY=( $(compgen -W "$(_list_sshkeys)" -- $cur) )
  fi
}



function _gitclone-ssh-zsh ()
{
  local state
  _arguments \
    '1:SSH Key:->key_list' \
    '2:Git repo URL:->git_repo'
  case $state in
      key_list)
        compadd "$@" $(_list_sshkeys)
        ;;
      git_repo)
	_message -r "Git repo URL: 'git@github.com:orgs/repo.git'"
        ;;
  esac

}



function ssh-genkey ()
{
  # Print 'usage' message if invalid arguments received
  if [ $# -lt 2 ] || [[ $1 != *"@"* ]]; then
      echo "Usage: \n  ssh-genkey 'user@email.com' 'key_file_name'"
      return
  fi

  key_email=${1}
  key_file_name="${SSH_DIR}/id_${2}"

  ssh-keygen -t rsa -b 4096 -C ${key_email} -f ${key_file_name}

  echo "\n\nPublic key:\n"
  cat ${key_file_name}.pub
  echo "\nCommon places to add key:"
  echo " *  Github https://github.com/settings/ssh/new\n"
  echo " *  Gitlab https://"
}




shell_bin=`echo $SHELL | grep -Eo 'bash|zsh'`

if [[ $shell_bin == bash ]]; then
  complete -F _gitclone-ssh-bash gitclone-ssh
elif [[ $shell_bin == zsh ]]; then
  compdef _gitclone-ssh-zsh gitclone-ssh
fi
