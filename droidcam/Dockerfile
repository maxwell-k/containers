FROM fedora:30

ARG DROIDCAM_KERNEL_VERSION

RUN dnf install --assumeyes \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-30.noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-30.noarch.rpm && \
  dnf upgrade --assumeyes && \
  dnf install --assumeyes \
    alsa-lib-devel \
    android-tools \
    cmake \
    ffmpeg-devel \
    git \
    gcc-c++ \
    gtk3-devel \
    kmod \
    libjpeg-turbo \
    libusbmuxd-devel \
    make \
    mokutil \
    speex-devel \
    unzip \
    kernel-headers \
    "kernel-core-$DROIDCAM_KERNEL_VERSION" \
    "kernel-devel-$DROIDCAM_KERNEL_VERSION" \
    "kernel-modules-$DROIDCAM_KERNEL_VERSION"

RUN git \
  -C /opt \
  clone \
  --branch v1.4 \
  --depth 1 \
  https://github.com/aramg/droidcam/

RUN git \
  -C /opt \
  clone \
  --branch 2.0.5 \
  --depth 1 \
  https://github.com/libjpeg-turbo/libjpeg-turbo

RUN cd /opt/libjpeg-turbo && \
  cmake -G"Unix Makefiles" . && \
  make && \
  make install

RUN cd /opt/droidcam/linux && \
  make

RUN cd /opt/droidcam/linux/v4l2loopback/ && \
  make && \
  make install

FROM fedora:30

COPY --from=0 /usr/lib/modules /usr/lib/modules
COPY --from=0 /opt/droidcam /opt/droidcam

RUN dnf install --assumeyes \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-30.noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-30.noarch.rpm && \
  dnf upgrade --assumeyes && \
  dnf install --assumeyes --setopt=install_weak_deps=False \
    alsa-lib \
    android-tools \
    ffmpeg-libs \
    gtk3 \
    kmod \
    libusbmuxd \
    && dnf clean all \
    && rm -rf /var/cache/yum

WORKDIR /opt/droidcam/linux
