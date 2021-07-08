# hpl-docker

High Performance Linpack Docker image with OpenMPI, libatlas, and OpenSSH

To build Docker image on aarch-64-linux (found with `mpicc -dumpmachine`):
`docker build . -t hpl`

Example docker-compose is provided for the PiNet cluster.
