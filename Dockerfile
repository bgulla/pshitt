FROM python
MAINTAINER hey@brandongulla.com

COPY . /
VOLUME ["/data"]
RUN pip install -r requirements.txt
EXPOSE 22

CMD ["python", "pshitt",  "-o", "/data/passwords.txt", "-p", "22"]
