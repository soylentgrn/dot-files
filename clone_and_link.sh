#!/bin/bash
pushd "$HOME"

  if [ -d ".my-dot-files" ]; then
    pushd ".my-dot-files"
      git smart-pull
    popd
  else
    git clone "git://github.com/soylentgrn/my-dot-files.git" ".my-dot-files"
  fi

  ls -1d .my-dot-files/files/* .my-dot-files/files/.* | while read f; do
    [ "$f" == '.my-dot-files/files/.' ] ||
    [ "$f" == '.my-dot-files/files/..' ] ||
    ln -vsf "$f" .
  done

popd
