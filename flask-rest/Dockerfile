# todo dockerfile best practices:
#   1. remove pip in final image, use multi-stage builds if necessary
#   2. is there an alternative to update pip?

# https://stackoverflow.com/questions/26504846/copy-directory-to-other-directory-at-docker-using-add-command
# removed  COPY . /flask-server


# https://stackoverflow.com/questions/61719674/check-the-file-contents-of-a-docker-image
# used above link to attach to intermediate layer of container image to debug 



# Specify parent image and
# Setup working directory 
FROM python:3.8.5-alpine
WORKDIR /flask-server

# Update pip and Install dependencies
COPY requirements.txt /flask-server
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy source code to working directory 
COPY static /flask-server/static
COPY templates /flask-server/templates
COPY  app.py test.db  /flask-server/

# Expose port
EXPOSE 5000

# start the flask server
ENTRYPOINT [ "python" ]
CMD ["/flask-server/app.py"]

