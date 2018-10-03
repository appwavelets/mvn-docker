# Maven Docker Image:

This image contains the following:
* JAVA: OpenJDK-8
* Maven: 3.5.4
* make
* GPG utils

The images has the following environment variables (will be substituted in `/root/.m2/settings.xml`):
* `REPOSITORY_ID`: mvn repository ID to deploy artifacts (default `ossrh`)
* `REPOSITORY_USERNAME`: mvn repository username to deploy artifacts
* `REPOSITORY_PASSWORD`: mvn repository password to deploy artifacts
* `GPG_KEY_PASS`: GPG key passphrase to sign artifacts before deploying artifacts

To use the image with GPG private key to sign packages:
```bash
docker run -it \
  -v $(pwd)/GPG_KEY.asc:/path/to/GPG_KEY.asc \
  -e GPG_KEY_PATH=/path/to/GPG_KEY.asc \
  -e GPG_KEY_PASS='...' \
  -e REPOSITORY_ID=ossrh1 \
  -e REPOSITORY_USERNAME=appwavelets \
  -e REPOSITORY_PASSWORD='...' \
  appwavelets/mvn:latest mvn deploy
```
