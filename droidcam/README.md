# Container with `droidcam` installed from source

## Quick start

Build this container:

```sh
buildah bud --tag droidcam --build-arg DROIDCAM_KERNEL_VERSION="$(uname -r)"
```

Copy the tagged image across to the root user:

```sh
podman save droidcam |
sudo podman load
```

Call `./droidcam.sh` to insert the kernel module and run `droidcam` inside the
container

Unload the module:

    sudo rmmod v4l2loopback_dc

## Development

- Use `--layers=true` to use caching to speed up development

## References

- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/sec-setting_module_parameters
- https://www.samsung.com/global/galaxy/galaxy-s8/specs/
- https://www.gsmarena.com/samsung_galaxy_s8-8161.php
