# hpl-docker

High Performance Linpack Docker image with OpenMPI, libatlas, and OpenSSH

To build Docker image on aarch-64-linux (found with `mpicc -dumpmachine`):
`docker build . -t hpl --build-arg DUMPMACHINE=aarch64-linux-gnu`