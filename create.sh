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

function create_srv {
    for ((i=1;i<=$NUM;i++)) do
	docker service create \
           --network=test_$i --name=nice_$i \
           python:3.5 sleep 2000
    done
}

function remove_srv {
    for ((i=1;i<=$NUM;i++)) do
	docker service rm nice_$i
    done
}

$CMD
