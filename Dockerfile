FROM python
MAINTAINER hey@brandongulla.com


RUN mkdir -p /home/app
RUN groupadd -r app &&\
    useradd -r -g app -d /home/app -s /sbin/nologin -c "Docker image user" app

# Set the home directory to our app user's home.
ENV HOME=/home/app
ENV APP_HOME=/home/app/my-project

## SETTING UP THE APP ##
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY . $APP_HOME
VOLUME ["/data"]

RUN pip install -r $APP_HOME/requirements.txt
EXPOSE 2222

RUN chown -R app:app $APP_HOME

USER app
#WORKDIR ["/src"]
CMD ["python", "pshitt",  "-o", "/data/passwords.txt", "-p", "2222", "-vv"]
