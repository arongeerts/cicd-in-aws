FROM python:3.7

WORKDIR /tmp

RUN apt update -y && apt -y install zip unzip
RUN pip install awscli

ENV BUCKET_NAME=flask-app-cicd-bucket-arongeerts
ENV VPC_ID=vpc-2b5c7a4d
ENV REGION=eu-west-1

COPY . /tmp

ENTRYPOINT ["sh", "/tmp/bin/run.sh"]
