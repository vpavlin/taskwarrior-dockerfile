function task() {
    data_dir=$HOME/.task/
    run="docker run -it --rm -v $data_dir:/task_data "
    call=$@
    image="vpavlin/task"

    if [ "$1" == "CMD" ]; then
        shift
        run="$run --entrypoint $1"
        shift
        call="$@"
    fi

    [ "$DEBUG" == "1" ] && echo $run $image $call
    $run $image $call
}
