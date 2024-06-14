# CHAP Docker

![Docker build and publish](https://img.shields.io/github/actions/workflow/status/LeoGillet/chap-docker/docker-image.yml?logo=github&label=Image%20Build%20%26%20Push) ![Docker pulls](https://img.shields.io/docker/pulls/leogillet/chap?logo=docker&logoColor=%23ffffff&label=Pulls) ![Docker Image Size](https://img.shields.io/docker/image-size/leogillet/chap?sort=date&arch=amd64&logo=docker&logoColor=%23ffffff&label=Image%20Size)

### This repo contains the Dockerfile used for the building of the [CHAP](https://hub.docker.com/r/leogillet/chap) docker image.
[**Visit the Dockerhub repository**](https://hub.docker.com/r/leogillet/chap)
### This docker image uses Debian buster/10 slim and contains GROMACS and CHAP installations.

**Please cite** the appropriate sources of any of the tools used bundled in this Docker image.

Citing CHAP: [Klesse, G., Rao, S., Sansom, M. S. P., & Tucker, S. J. (2019). CHAP: A Versatile Tool for the Structural and Functional Annotation of Ion Channel Pores. Journal of Molecular Biology, 431(17), 3353–3365. https://doi.org/10.1016/j.jmb.2019.06.003](https://doi.org/10.1016/j.jmb.2019.06.003)

Citing GROMACS : [Abraham, M., Alekseenko, A., Basov, V., Bergh, C., Briand, E., Brown, A., Doijade, M., Fiorin, G., Fleischmann, S., Gorelov, S., Gouaillardet, G., Grey, A., Irrgang, M. E., Jalalypour, F., Jordan, J., Kutzner, C., Lemkul, J. A., Lundborg, M., Merz, P., … Lindahl, E. (2024). GROMACS 2024.2 Manual. https://doi.org/10.5281/ZENODO.11148638](https://doi.org/10.5281/ZENODO.11148638)

Due to incompabilities with newer versions of GROMACS and of the GCC compiler, the following versions are used:
- GROMACS build 2018.8 ([Documentation](https://manual.gromacs.org/documentation/2018-current/install-guide/index.html))
- GCC 8.3.0-1 ([Changes](https://gcc.gnu.org/gcc-8/changes.html), [Documentation](https://gcc.gnu.org/onlinedocs/8.3.0/))

The FFTW3 library was also built from source, with the latest version to date (3.3.10). ([Release notes](https://www.fftw.org/release-notes.html))
