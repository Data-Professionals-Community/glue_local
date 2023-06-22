#! /usr/bin/env bash

version=$1

source $(dirname "$(readlink -f "$0")")/env.sh

if [[ -z "$AWS_PROFILE" ]]
then
  echo esqueceu o AWS PROFILE
  echo que tal rodar:
  echo export AWS_PROFILE=<your desired profile>
  exit 1
fi

if [[ "$(uname)" -eq "Darwin" ]]
then
    open http://localhost:${JUPYTERLAB_PORT}/lab
else
    echo open http://localhost:${JUPYTERLAB_PORT}/lab
fi

docker  run \
        -it \
       --rm \
        -p ${JUPYTERLAB_PORT}:8888 \
        -e DISABLE_SSL=true \
        -e AWS_PROFILE \
        -e AWS_REGION \
        -v $HOME/.aws:/home/glue_user/.aws:ro \
        -v $PWD/jupyter_workspaces:/home/glue_user/.jupyter/lab/workspaces \
        -v $PWD/jupyter_notebooks:/home/glue_user/workspace/jupyter_workspace \
        -v $PWD:/home/glue_user/local_folder \
        --name ${GLUE_CONTAINER_NAME} \
        amazon/aws-glue-libs:glue_libs_${version:-4}.0.0_image_01 \
        /home/glue_user/jupyter/jupyter_start.sh