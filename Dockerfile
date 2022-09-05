FROM alpine:3.16.2

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
 
RUN apk add --no-cache \
        build-base \
        cmake \
        py3-pip \
        python3-dev \
        gcc \
        musl-dev \
        libffi-dev


RUN pip3 install --no-cache-dir cython wheel pytest flake8
RUN pip3 install pytest pytest-black flake8 apache-airflow 
RUN  mkdir -p /airflow/dags/generic_tests /airflow/dags/tests
COPY dags/user_processing.py /airflow/dags/
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

