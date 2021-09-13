#!/bin/bash

  cat <<-EOF

      Usage: alicia.sh gcp [-h]

      PARAMETRES:
      ===========
$( gcloud projects list | sed "s/^/            /g")
            status    Print Status of Current Situation

      OPTIONS:
      ========
          -h    Affiche ce message

      EXAMPLES:
      =========
          alicia.sh gcp <project id>
          alicia.sh gcp status

EOF
