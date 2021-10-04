SHELL := /bin/bash

.PHONY: build make_amd64

VERSION=1.0
REVISION=1
PACKAGE_NAME=HelloDebianWorld
ARCHITECTURE=amd64

build:
	gcc ./source/main.c -o ${PACKAGE_NAME}

make_amd64: build
	mkdir -p ${PACKAGE_NAME}_${VERSION}-${REVISION}_${ARCHITECTURE}/usr/local/bin
	cp -f ${PACKAGE_NAME} ${PACKAGE_NAME}_${VERSION}-${REVISION}_${ARCHITECTURE}/usr/local/bin
	mkdir -p ${PACKAGE_NAME}_${VERSION}-${REVISION}_${ARCHITECTURE}/DEBIAN
	cp -f control ${PACKAGE_NAME}_${VERSION}-${REVISION}_${ARCHITECTURE}/DEBIAN
	dpkg-deb --build --root-owner-group ${PACKAGE_NAME}_${VERSION}-${REVISION}_${ARCHITECTURE}
