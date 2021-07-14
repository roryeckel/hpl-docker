# hpl-docker

High Performance Linpack Docker image with OpenMPI, libatlas, and OpenSSH

To build Docker image: `docker build . -t hpl`

Method for execution on Rory's PiNet cluster:
1. Create OpenMPI host file for other containers as a volume for primary container at /usr/local/src/hpl/hpl-2.3/bin/docker/
2. Run the primary container supplied with the current machine id_rsa.pub in AUTHORIZED_KEYS env
3. Copy id_rsa.pub displayed in primary container logs
4. Run the remaining containers with the primary container id_rsa in AUTHORIZED_KEYS env
5. From the current machine, ssh into primary container. cd to /usr/local/src/hpl/hpl-2.3/bin/docker/, run `mpiexec --allow-run-as-root --mca btl_tcp_if_include eth0 -np 8 -hostfile hosts ./xhpl`