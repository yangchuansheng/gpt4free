FROM python:3.11

RUN apt-get update \
 && apt-get install -y --no-install-recommends ffmpeg \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

COPY . /root/gpt4free

WORKDIR /root/gpt4free

RUN pip install --upgrade pip setuptools \
 && pip3 install poetry \
 && python3 -m poetry install \
 && rm ./pyproject.toml

CMD ["poetry", "run", "streamlit", "run", "./gui/streamlit_app.py"]

EXPOSE 8501
