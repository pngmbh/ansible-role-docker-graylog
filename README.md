Ansible Role for Graylog2 on Docker
===================================

This installs a [Graylog2 server](https://github.com/Graylog2/graylog2-server)
as a collection of Docker containers, using docker-compose.

Limitations
-----------

Currently, this only supports the `gelf` log input via UDP.

Requirements
------------

* pip packages `docker` and `docker-compose` (for ansible's `docker_service`)
* a running `docker` daemon, obviously

Role Variables
--------------

see [defaults/main.yml](defaults/main.yml)

Dependencies
------------

None

Example Playbook
----------------

The following will install the server, and expose the webinterface to
`0.0.0.0:9000` on the host (login with `admin`/`admin`).

```yaml
- hosts: servers
  roles:
    - role: docker-graylog
  vars:
    docker_graylog_enable_web_host_port: true
    docker_graylog_enable_gelf_udp_host_port: true
```

Logging to that graylog server from a docker container can then be done by
using the `gelf` log-driver, sending it to udp port 12201.
See https://docs.docker.com/config/containers/logging/gelf/ for details.

`docker run --log-driver gelf --log-opt gelf-address=udp://127.0.0.1:12201 alpine echo hello`

License
-------

BSD
