FROM sickp/alpine-sshd:7.5

RUN passwd -d root

ADD steelcar-service-account.pub /root/.ssh/authorized_keys
