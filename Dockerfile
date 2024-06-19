FROM python:3.10-slim

WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    gcc \
    wget \
    libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install pipenv 

COPY ["Pipfile", "Pipfile.lock", "./"]
RUN pipenv install --system --deploy
RUN pip install --upgrade pip \
    && pip install jupyterlab \
    && pip check

EXPOSE 8888

CMD ["bash"]