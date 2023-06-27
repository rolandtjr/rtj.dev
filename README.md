# rtj.dev

This repository contains the source code for the DevSecOps blog [rtj.dev](https://rtj.dev), which is built with [Hugo](https://gohugo.io/) and the [PaperMod theme](https://github.com/adityatelange/hugo-PaperMod). This repository features Gitea Actions to automatically build a Docker image and push it to the repository's packages.

## Table of Contents
1. [Repository Structure](#repository-structure)
2. [Building and Deployment](#building-and-deployment)
3. [Dockerfile](#dockerfile)
4. [Gitea Actions](#gitea-actions)
5. [Contributing](#contributing)

## Repository Structure

Here is the breakdown of the repository:

```sh
.
├── archetypes
│ └── default.md
├── assets
├── content
│ ├── archives.md
│ ├── posts
│ │ └── welcome.md
│ └── search.md
├── default.conf
├── Dockerfile
├── hugo.toml
├── layouts
│ └── partials
│ └── svg.html
├── public
├── resources
│ └── _gen
│ ├── assets
│ └── images
├── static
└── themes
└── PaperMod
```

The `themes` directory contains the PaperMod theme used by the Hugo site. The `content` directory contains the markdown files for the site's posts and pages.

## Building and Deployment

The repository uses Gitea Actions to automatically build a Docker image and push it to the repository's packages whenever code is pushed to the repository.

## Dockerfile

The Dockerfile specifies the build steps for creating the Docker image of the Hugo site. It uses the `klakegg/hugo:ext-alpine-onbuild` image to build the Hugo site and the `nginx` image to serve the site. The built site is copied to the `/usr/share/nginx/html` directory of the `nginx` image.

## Gitea Actions

The Gitea Actions workflow, defined in `build.yml`, specifies the steps for building and deploying the Docker image. It runs whenever code is pushed to the repository.