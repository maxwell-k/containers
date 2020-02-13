# maxwell-k/containers

This repository uses GitHub actions to build containers and publish them to [Quay.io](https://quay.io/user/keith_maxwell).

The first set of containers are focussed on building [LumoSQL](https://github.com/LumoSQL/LumoSQL).

## Why Quay.io for hosting container images?

Three reasons:

1. Underlying software is open source
2. Supports anonymous downloads
3. Available as a free service

I used these criteria to rule out other alternatives including Docker Hub and GitHub packages.

_Be careful if evaluating GitHub packages because at present container images cannot be deleted:_

> Version deletion is currently unsupported for docker. For more on our deletion policy, see https://help.github.com/articles/about-github-package-registry/#deleting-a-package

### Underlying software is open source

Since [November 2019] the [underlying software] running Quay.io has been has been available under the Apache 2.0 licence.

Docker Hub and GitHub packages fail this criteria.

[underlying software]: https://github.com/quay/quay
[november 2019]: https://www.redhat.com/en/blog/red-hat-introduces-open-source-project-quay-container-registry

### Supports anonymous downloads

GitHub packages, which can host public container images, but [does not allow] unauthenticated downloads, fails this criteria.

[does not allow]: https://github.community/t5/GitHub-API-Development-and/Download-from-Github-Package-Registry-without-authentication/m-p/35501/highlight/true#M3312

### Available as a free service

All of the solutions that I looked at met this criteria. From <https://quay.io/plans/>:

> Can I use Quay for free?
>
> Yes! We offer unlimited storage and serving of public repositories. We strongly believe in the open source community and will do what we can to help!

## Secrets

To push container images to Quay.io the GitHub actions workflow in this repository uses two secrets:

- `CONTAINER_REPO_USERNAME`
- `CONTAINER_REPO_TOKEN`

---

[![REUSE status](https://api.reuse.software/badge/github.com/maxwell-k/containers)](https://api.reuse.software/info/github.com/maxwell-k/containers) [![Bors enabled](https://bors.tech/images/badge_small.svg)](https://app.bors.tech/repositories/23193)

<!-- vim: set filetype=markdown.gfm : -->
