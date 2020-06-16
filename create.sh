#!/usr/bin/env bash

# PLEASE FILL ALL THESE PARAMETERS
githubusername=""
githubemail=""
githubname=""
# ++++++++++++++++++++++++++++++++++

createproj() {
  project=$1
  goworkspace=$GOPATH/src/github.com/$githubusername
  if [[ -z $githubusername ]] || [[ -z $githubemail ]] || [[ -z $githubname ]]; then
    echo "Please fill all the parameters; Exiting"; exit 2
  fi
  cp -r ./project_template $goworkspace/$project
  mv $goworkspace/$project/cmd/goignite $goworkspace/$project/cmd/$project
  sed -i -e "s/goignite/$project/g" $goworkspace/$project/Makefile
  sed -i -e "s/goignite/$project/g" $goworkspace/$project/go.mod
  sed -i -e "s/goignite/$project/g" $goworkspace/$project/README.md
  cd $goworkspace/$project
  rm *-e
  git init
  git config --local user.name "$githubname"
  git config --local user.email "$githubemail"
  echo
  echo "Your new project is in here: $goworkspace/$project "
}

if [[ -z "$1" ]]; then
  echo "Project name is empty"; exit 2
fi

createproj $1
