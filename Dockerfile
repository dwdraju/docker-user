FROM ubuntu:16.04
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]