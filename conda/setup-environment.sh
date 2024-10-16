#!/bin/sh

# create the conda environment as a subdirectory
mamba env create -p .conda/saribbon -f conda/conda-env.yaml

# add the environment subdirectory to the conda configuration
conda config --add envs_dirs $CONDA_PREFIX/envs
conda config --add envs_dirs $(pwd)/.conda
conda config --set env_prompt "({name})"

# install the dependencies into the environment
mamba run --live-stream -n saribbon mamba-devenv --no-prune -f conda/environment.devenv.yml
