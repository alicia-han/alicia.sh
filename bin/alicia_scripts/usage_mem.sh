#!/bin/bash

  cat <<-EOF

      Usage: alicia.sh mem [-h]

      PARAMETRES:
      ===========
$(/bin/ls -l "${1}alicia_mem/" | sed '1d' | awk '{print $NF}'| grep usage_mem_ | sed "s/usage_mem_//g" | sed "s/.txt$//g" | sed "s/^/            /g")

      OPTIONS:
      ========
          -h    Affiche ce message

      EXAMPLES:
      =========
          alicia.sh mem flushdns 

EOF
