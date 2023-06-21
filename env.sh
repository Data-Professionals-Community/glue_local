export JUPYTERLAB_PORT=8888
export PARENT_FOLDER=$(cd $(dirname $0) && pwd )
export GLUE_CONTAINER_NAME=local_glue-$(basename $PWD)

for i in $(seq 8000 9000)
do
    nc -z localhost $i 1>/dev/null 2>&1
    ret=$?

    if [[ $ret -eq 1 ]]
    then
        export JUPYTERLAB_PORT=${i}
        break
    fi
done

export GLUE_CONTAINER_NAME=${GLUE_CONTAINER_NAME}_${JUPYTERLAB_PORT}