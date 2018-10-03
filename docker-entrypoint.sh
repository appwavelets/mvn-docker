#!/bin/bash
set -eo pipefail

if [ ! -z "$GPG_KEY_PATH" ]; then
	gpg --batch --import ${GPG_KEY_PATH}
fi

if [ -z "$REPOSITORY_ID" ]; then
	REPOSITORY_ID=ossrh
fi

sed -i -e "s/{{ GPG_KEY_PASS }}/$GPG_KEY_PASS/g" /root/.m2/settings.xml
sed -i -e "s/{{ REPOSITORY_ID }}/$REPOSITORY_ID/g" /root/.m2/settings.xml
sed -i -e "s/{{ REPOSITORY_USERNAME }}/$REPOSITORY_USERNAME/g" /root/.m2/settings.xml
sed -i -e "s/{{ REPOSITORY_PASSWORD }}/$REPOSITORY_PASSWORD/g" /root/.m2/settings.xml

exec "$@"
