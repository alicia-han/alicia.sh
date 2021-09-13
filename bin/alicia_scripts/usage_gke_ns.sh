#!/bin/bash

  cat <<-EOF

      Usage: alicia.sh gke-ns <namespace name> [-h]

      PARAMETRES:
      ===========
$(  kubectl get namespace| sed "s/^/            /g")
            -----------------
            status        Print Status of Current Situation
            clean         Reset to default

      OPTIONS:
      ========
          -h    Affiche ce message

      EXAMPLES:
      =========
          alicia.sh gke-ns <cluster name>
          alicia.sh gke-ns status

EOF
