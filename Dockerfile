FROM python:3.11

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y ffmpeg wget unzip

WORKDIR /glados-tts

COPY . .

RUN rm -rf models && \
    wget https://i.duncte123.me/glados-tts-models/models.zip -O models.zip && \
    unzip models.zip && \
    rm models.zip

RUN rm -rf /glados-tts/audio

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "engine.py"]