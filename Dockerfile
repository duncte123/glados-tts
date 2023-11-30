FROM python:3.11

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y ffmpeg

WORKDIR /glados-tts

COPY . .

RUN rm -rf /glados-tts/audio

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "engine.py"]