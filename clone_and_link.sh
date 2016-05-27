#!/bin/bash
pushd "$HOME"

  if [ -d ".dot-files" ]; then
    pushd ".dot-files"
      git smart-pull
      git submodule update
    popd
  else
    git clone --recursive "git://github.com/soylentgrn/dot-files.git" ".dot-files"
  fi

  ls -1d .dot-files/files/* .dot-files/files/.* | while read f; do
    [ "$f" == '.dot-files/files/.' ] ||
    [ "$f" == '.dot-files/files/..' ] ||
    ln -vsf "$f" .
  done

popd
