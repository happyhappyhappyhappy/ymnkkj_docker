# Replace latest with a pinned version tag from https://hub.docker.com/_/alpine
#
# We suggest using the major.minor tag, not major.minor.patch.
FROM scratch

# Non-root user for security purposes.
#
# UIDs below 10,000 are a security risk, as a container breakout could result
# in the container being ran as a more privileged user on the host kernel with
# the same UID.
#
# Static GID/UID is also useful for chown'ing files outside the container where
# such a user does not exist.
COPY ./bash /usr/bin/bash
COPY ./libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY ./libtinfo.so.6 /lib/x86_64-linux-gnu/libtinfo.so.6
COPY ./ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
COPY ./libdl.so.2 /lib/x86_64-linux-gnu/libdl.so.2
CMD ["/usr/bin/bash"]