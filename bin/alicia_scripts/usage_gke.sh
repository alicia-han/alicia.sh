#!/bin/bash

  cat <<-EOF

      Usage: alicia.sh gke [-h]

      PARAMETRES:
      ===========
$(  gcloud container clusters list | sed "s/^/            /g")
            -----------
            minikube    Switch to minikube context
            status      Print Status of Current Situation

      OPTIONS:
      ========
          -h    Affiche ce message

      EXAMPLES:
      =========
          alicia.sh gke <cluster name>
          alicia.sh gke status

EOF
