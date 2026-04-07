#!/usr/bin/env bash

git checkout stencil.c
git apply vanilla.patch
make stencil > /dev/null
mv stencil stencil_vanilla

git checkout stencil.c
git apply fjmpi_persistent.patch
make stencil > /dev/null
mv stencil stencil_fjmpi_persistent

git checkout stencil.c
git apply persistent.patch
make stencil > /dev/null
mv stencil stencil_persistent
