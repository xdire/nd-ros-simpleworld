default_target: all

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/bin/cmake

build:
	mkdir build
	cd build && $(CMAKE_COMMAND) ..
	cd build && $(MAKE)
.PHONY: build

envs:
	# Populate environment with the library path
    export GAZEBO_PLUGIN_PATH:=${ROOT_DIR}/build
.PHONY: envs

start: envs
	echo "Gazebo will be using this directory for plugins: <${GAZEBO_PLUGIN_PATH}>"
	gazebo world/simpleworld
.PHONY: start

all: build
.PHONY: all
