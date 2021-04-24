FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
    curl wget python3.6 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
COPY . /Mykola

WORKDIR /Mykola

RUN pip3 install Flask

ENV FLASK_APP=Mykola.py
ENV FLASK_ENV=development
EXPOSE 1337

ENTRYPOINT ["python3"]
CMD ["Mykola.py"]
