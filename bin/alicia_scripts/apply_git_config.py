#!/usr/bin/env python3 

import sys
import os
import yaml
import subprocess

with open(sys.argv[1], 'r') as stream:
    try:
        git_config = yaml.safe_load(stream)

        for item in git_config["configurations"]:
            bash_cmd = ["/bin/bash","-c","git config "+item["options"]+" "+item["name"]+ " '" +item["value"] + "'"  ]
            print(bash_cmd)
            process = subprocess.Popen(bash_cmd, stdout=subprocess.PIPE)
            output, error = process.communicate()
            print("output: ", output, "   error:", error)
        with open(os.getenv("HOME")+"/"+git_config["ssh"]["file_name"],"w") as f:
            f.write(git_config["ssh"]["value"])

    except yaml.YAMLError as exc:
        print(exc)
