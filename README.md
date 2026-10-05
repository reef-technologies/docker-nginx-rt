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
* [ngx_otel_module](https://nginx.org/en/docs/ngx_otel_module.html) - OpenTelemetry tracing (W3C trace context propagation, OTLP/gRPC exporter)
* [ngx_http_acme_module](https://github.com/nginx/nginx-acme) - built-in ACMEv2 client (automatic certificate issuance and renewal), shipped by the base image

The ACME module is not loaded by default (add `load_module "modules/ngx_http_acme_module.so";`).
Since `0.4.0` it supports **Let's Encrypt IP-address certificates**, which require a
short-lived profile and a CSR without the IP in the Common Name:

```nginx
acme_issuer letsencrypt {
    uri https://acme-v02.api.letsencrypt.org/directory;
    profile shortlived require;   # IP certificates must be short-lived
    common_name_in_csr off;       # keep the IP out of the CSR Common Name
    state_path /var/cache/nginx/acme-letsencrypt;
    accept_terms_of_service;
}
```

License
-------
This project is licensed under the terms of the [BSD-3 License](/LICENSE)
