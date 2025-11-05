# Base image with Jupyter and Python
FROM jupyter/base-notebook:latest

# Switch to root to install system packages
#USER root

# Install any packages that are needed for this image
#RUN apt-get update && apt-get install -y pandoc  && rm -rf /var/lib/apt/lists/*

# Switch back to the Jupyter user
USER $NB_UID

# Copy your requirements file if you have one
COPY requirements.txt /tmp/requirements.txt

# Make pip more tolerant of slow mirrors and big wheels
ENV PIP_DEFAULT_TIMEOUT=300
ENV PIP_RETRIES=10

# Install Python libraries
RUN pip install --no-cache-dir --prefer-binary -r /tmp/requirements.txt

# Set working directory (where notebooks will be stored)
WORKDIR /home/jovyan/work

# Default command: start Jupyter
CMD ["start-notebook.sh"]

