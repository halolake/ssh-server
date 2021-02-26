FROM alpine:latest
RUN apk add openssh
RUN ssh-keygen -A
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN password=`cat /config/password` && echo "root:$password" | chpasswd
RUN mkdir -p /root/.ssh && cat /config/authorized_keys > /root/.ssh/authorized_keys && chmod 400 /root/.ssh/authorized_keys
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
