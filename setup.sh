#!/bin/bash -x

# setup Python 3.9
wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tar.xz && tar -xf Python-3.9.0.tar.xz
cd Python-3.9.0
./configure
make altinstall
cd ..

# create virtual env and activate
python3.9 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip

# install dependencies
pip install extension-helpers

cd mkat-tango
python setup.py install
cd ../

cd katconf
python setup.py install
cd ../

cd katcore
python setup.py install
cd ../

pip install astropy ansicolors transitions==0.9.0

cd katlogger
python setup.py install
cd ../

cd katversion
python setup.py install
cd ../

cd katmisc
python setup.py install
cd ../




