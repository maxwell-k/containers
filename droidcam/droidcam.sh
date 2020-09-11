#!/bin/sh
if ! lsmod | grep -q '^v4l2loopback_dc' ; then
	sudo podman run --privileged --rm droidcam \
		modprobe v4l2loopback-dc width=1440 height=1080
fi

if [ -n "$DISPLAY" ] ; then
	podman run --rm \
		--volume /dev/video0:/dev/video0 \
		--privileged \
		--ipc=host --net=host --env DISPLAY \
		droidcam \
		/opt/droidcam/linux/droidcam
else
	echo "DISPLAY is not set"
fi
