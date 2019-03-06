FROM centos

RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && yum -y update && yum -y install java-1.8.0-openjdk  python2-pip openjdk-11-jdk openssh-server git \
    && pip install --upgrade ansible \
    && pip install --upgrade hvac junit-xml\
    && yum clean all
RUN mkdir /var/run/sshd
RUN mkdir /etc/ansible
COPY ansible.cfg /etc/ansible/ansible.cfg
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN echo '10.24.67.89 integra.mon.es' >> /etc/hosts
RUN mkdir /jenkins
RUN /usr/bin/ssh-keygen -A

ENV ANSIBLE_HOST_KEY_CHECKING=False

EXPOSE 2222
CMD ["/usr/sbin/sshd", "-D"]