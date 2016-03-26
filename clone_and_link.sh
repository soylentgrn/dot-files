#!/bin/bash
ls -1d .my-dot-files/files/* .my-dot-files/files/.* | while read f; do
  [ "$f" == '.my-dot-files/files/.' ] ||
  [ "$f" == '.my-dot-files/files/..' ] ||
  ln -vsf "$f" .
done
