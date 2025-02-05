#!/usr/bin/env bash
set -xeuo pipefail

sudo apt update

sudo apt install -y ansible python3-venv curl git

if [ ! -d "lpi-code.metatrader" ]; then
    git clone https://github.com/lpi-code/lpi-code.metatrader.git
fi

cd lpi-code.metatrader

python3 -m venv .venv

pip install -r dev-requirements.txt
ansible-galaxy install -r requirements.yml
ansible-galaxy role install lpi-code.metatrader
