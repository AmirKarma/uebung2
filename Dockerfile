FROM debian:forky-20251020

WORKDIR /application
RUN useradd -m application
COPY requirements.txt .
RUN apt-get update && apt-get install -y python3 python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
    
COPY requirements.txt .
RUN pip install --break-system-packages -r requirements.txt

COPY server.py .

EXPOSE 5000


USER application

CMD ["python3", "server.py"]
