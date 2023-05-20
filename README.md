docker-nginx-rt
===============

Custom docker image for NGINX, used in [cookiecutter-rt-django](https://github.com/reef-technologies/cookiecutter-rt-django) template.

Usage
-----

* From `Dockerfile`:
  ```dockerfile
  FROM ghcr.io/reef-technologies/nginx-rt:master

  ...
  ```
* From `docker-compose.yml`:
  ```yaml
  services:
   nginx:
      image: 'ghcr.io/reef-technologies/nginx-rt:master'

  ...
  ```

Features
--------

Enabled features:
* Secure SSL configuration
* Cloudflare DNS resolver
* Preinstalled [custom modules](#modules)

Modules
-------

Modules that are available by default:
* [Nginx Virtual Host Traffic Status](https://github.com/vozlt/nginx-module-vts)

License
-------
This project is licensed under the terms of the [BSD-3 License](/LICENSE)
