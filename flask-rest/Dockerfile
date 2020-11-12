# todo dockerfile best practices:
#   1. remove pip in final image, use multi-stage builds if necessary
#   2. remove COPY . if possible
#   3. is there an alternative to update pip?

FROM python:3.8.5-alpine
WORKDIR /flask-server
COPY requirements.txt /flask-server
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install -r requirements.txt
COPY .  /flask-server/
EXPOSE 5000
ENTRYPOINT [ "python" ]
CMD ["/flask-server/app.py"]

