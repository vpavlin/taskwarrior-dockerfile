FROM fedora
MAINTAINER Vaclav Pavlin <vpavlin@redhat.com>

RUN dnf -y install task man

VOLUME /task_data

RUN yes | task || true
RUN sed -i 's#\(data.location=\).*#\1/task_data#' ~/.taskrc

ENTRYPOINT ["task"]
