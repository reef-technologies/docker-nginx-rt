docker-nginx-rt
===============

Custom docker image for NGINX running on Alpine Linux,
used in [cookiecutter-rt-django](https://github.com/reef-technologies/cookiecutter-rt-django) template.

Building
--------

Dockerfile is created based on [an official NGINX dockerfile](https://github.com/nginxinc/docker-nginx/blob/master/modules/Dockerfile.alpine) for adding third-party modules, however it is pinned to the given NGINX version and doesn't use the mainline image.

```bash
$ docker build -t nginx-rt .
```

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
* Brotli compression
* Preinstalled [custom modules](#modules)

Modules
-------

Modules that are available by default:
* [ngx_brotli](https://github.com/google/ngx_brotli) - Brotli compression
* [ngx_http_headers_more_filter_module](https://github.com/openresty/headers-more-nginx-module) - Set, add, and clear arbitrary output headers in NGINX http servers
* [ngx_http_vhost_traffic_status_module](https://github.com/vozlt/nginx-module-vts) - Nginx virtual host traffic status

License
-------
This project is licensed under the terms of the [BSD-3 License](/LICENSE)
