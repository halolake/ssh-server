FROM alpine:latest
RUN apk add openssh
RUN ssh-keygen -A
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
COPY entrypoint.sh /
EXPOSE 22
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
