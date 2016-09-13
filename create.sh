CMD=$1
NUM=$2

function create {  
    for ((i=1;i<$NUM;i++)) do
        docker network create test_$i
    done
}

function remove {  
    for ((i=1;i<$NUM;i++)) do
        docker network remove test_$i
    done
}

$CMD
