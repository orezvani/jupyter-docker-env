# Base image with Jupyter and Python
FROM jupyter/base-notebook:latest

USER root
RUN apt-get update && apt-get install -y     poppler-utils libreoffice pandoc     && rm -rf /var/lib/apt/lists/*

USER $NB_UID
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /home/jovyan/work
CMD ["start-notebook.sh"]
