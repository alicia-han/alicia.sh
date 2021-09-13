#!/bin/bash

  cat <<-EOF

      Usage: alicia.sh switch [-h]

      PARAMETRES:
      ===========

            fr-prod       switch to gcp ornidir-fr-prod and gke prod-main, ns: apps
            es-prod       switch to gcp ornidir-es-prod and gke prod-main, ns: apps
            fr-staging    switch to gcp ornidir-fr-staging and gke staging-main, ns: apps
            es-staging    switch to gcp ornidir-fr-staging and gke staging-main, ns: apps

      OPTIONS:
      ========
          -h    Affiche ce message

      EXAMPLES:
      =========
          alicia.sh  fr-prod

EOF
