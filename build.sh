#!/bin/bash
IMAGE_NAME=op5com/op5-monitor-centos7

# build base image
build_image () {
	echo "Building image $IMAGE_NAME..."
	image=$(docker build --rm --no-cache -t $IMAGE_NAME .)
}

# run container
run_container () {
	echo "Running temporary container for OP5 Monitor installation..."
	container_id=$(docker run -tid --cap-add SYS_ADMIN $IMAGE_NAME)
	run_entrypoint $container_id
}

# run entrypoint within container
run_entrypoint () {
	echo "Installing OP5 Monitor in container..."
	docker exec $1 /root/entrypoint.sh
	commit_image $1
}

commit_image () {
	echo "Finalizing build and merging image: $IMAGE_NAME (this might take a few minutes...)"
	commit=$(docker commit $1 $IMAGE_NAME)
	# kill our temporary container we commited from
	docker kill $1
}

build_image
run_container
