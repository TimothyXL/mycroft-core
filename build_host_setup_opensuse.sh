#!/usr/bin/env bash

VERSION_STRING=$(perl -ne 'if ($_ =~ /^PRETTY_NAME=".+"/) { $_ =~ s/^PRETTY_NAME="(.+)"\s/$1/s; print $_ = s/\s/_/gr; }' /etc/os-release)
CLOUD_TOOLS_URL="http://download.opensuse.org/repositories/Cloud:/Tools/${VERSION_STRING}/Cloud:Tools.repo"

sudo zypper ar ${CLOUD_TOOLS_URL};

if [[ $VERSION_STRING == *"Leap"* ]]; then
    sudo zypper ar http://download.opensuse.org/repositories/multimedia:/libs/${VERSION_STRING}/multimedia:libs.repo
fi

sudo zypper ref;

sudo zypper install -y \
    git \
    python \
    python-devel \
    python-pip \
    python2-setuptools \
    python-virtualenv \
    python-gobject2-devel \
    python-virtualenvwrapper \
    libtool \
    libffi-devel \
    libopenssl-devel \
    autoconf \
    bison \
    swig \
    glib2-devel \
    s3cmd \
    portaudio-devel \
    mpg123 \
    screen \
    curl \
    python-pkgconfig \
    libicu-devel \
    automake

# upgrade virtualenv to latest from pypi
sudo pip install --upgrade virtualenv
