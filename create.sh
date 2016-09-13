CMD=$1
NUM=$2

function create_subnet {  
    for ((i=1;i<=$NUM;i++)) do
        docker network create --subnet=10.10.$i.0/24 test_$i
    done
}

function create {  
    for ((i=1;i<=$NUM;i++)) do
        docker network create test_$i
    done
}

function create_overlay {  
    for ((i=1;i<=$NUM;i++)) do
        docker network create --driver=overlay test_$i
    done
}

function remove {  
    for ((i=1;i<=$NUM;i++)) do
        docker network remove test_$i
    done
}

$CMD
