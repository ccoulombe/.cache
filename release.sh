#!/bin/bash

set -e
VERSION=$1

if [ -z "$VERSION" ]; then
    echo "Specify the release version number"
    echo "Usage: release.sh VERSION"
    exit 1
fi

TMPDIR=$(mktemp -d)
FOLDER=$TMPDIR/cache-$VERSION

mkdir -p $FOLDER releases/

cp -v -r .cache $FOLDER

cd $FOLDER
zip -v cache-$VERSION.zip -r .

cd -
cp $FOLDER/cache-$VERSION.zip releases/

rm -r $TMPDIR
