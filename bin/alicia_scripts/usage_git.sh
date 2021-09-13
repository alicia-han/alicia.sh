#!/bin/bash

  cat <<-EOF

      Usage: alicia.sh git [-h]

      PARAMETRES:
      ===========
            status    Print Status of Current Situation
$(/bin/ls -l "${1}alicia_git/" | sed '1d' | awk '{print $NF}'| grep git_ | sed "s/git_//g" | sed "s/.yaml$//g" | sed "s/^/            /g")

      OPTIONS:
      ========
          -h    Affiche ce message

      EXAMPLES:
      =========
          alicia.sh git github-alicia 
          alicia.sh git status

EOF
