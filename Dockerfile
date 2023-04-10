FROM python:3.8

# Clone the git repository
RUN git clone https://github.com/yo1982/job.git

# Change the working directory to the repository directory
WORKDIR /job

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt
RUN pip install flask


# Copy the rest of the repository files to the working directory
COPY . .

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
