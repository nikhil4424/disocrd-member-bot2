# Use the official Python image from the Docker Hub
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the entire application code into the container
COPY . .

RUN apt update
RUN apt install python3 -y
RUN apt install python3-pip -y

RUN apt install python3-venv -y

RUN python3 -m venv bot-env

RUN cp config/example.env config/.env && rm config/example.env
RUN set -a && . config/.env && set +a

# Install the dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install discord.py-self library
RUN pip install -U discord.py-self

# Expose the port the app runs on (if applicable)
EXPOSE 8000

# Define the command to run the application
CMD ["python3", "main.py"]
