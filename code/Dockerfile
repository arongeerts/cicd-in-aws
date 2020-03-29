FROM python:3

EXPOSE 5000/tcp

WORKDIR /app
COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python", "api.py"]
