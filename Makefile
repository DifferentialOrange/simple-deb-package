SHELL := /bin/bash

.PHONY: build

build:
	gcc ./source/main.c -o HelloDebianWorld
