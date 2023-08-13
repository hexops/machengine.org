#!/usr/bin/env bash
set -exuo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

rm -rf ./static/assets/media/
mkdir -p ./static/assets/media/
cp -R ../media/* ./static/assets/media/
cd ./static/assets/media/
rm -rf **/*.psd **/*.png *.fig **/*.fig **/*.jpg **/*.jpeg font/
