FROM python:3

EXPOSE 5000/tcp

WORKDIR /code

COPY . /code

ENV PYTHONPATH /code

RUN pip install -r requirements.txt

CMD [ "python", "app/api.py"]
