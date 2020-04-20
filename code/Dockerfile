FROM python:3

EXPOSE 5000/tcp

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

ENTRYPOINT [ "python", "api.py"]
