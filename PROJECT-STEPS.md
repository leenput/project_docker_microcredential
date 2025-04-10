# Outline of steps used to carry out microcredential project 2

Project description: https://github.com/vib-tcp/project_docker_microcredential

## Deliverable 1: Clone this repository to your personal github account
**step 1**: fork project 
**step 2**: clone the project on local machine
`git clone git@github.com:leenput/project_docker_microcredential.git`

## Deliverable 2: Containerize training the machine learning model
## Deliverable 4: Train and run the machine learning model using Docker

**step 1:** complete file named Dockerfile.train

approach:
- inspect Dockerfile, train.py script and the requirements.txt
- select an appropriate base image from DockerHub, which judging from the files should be python-based: selected python image 3.11-slim
- set appropriate working directory in the container. Make sure that it matches the output directory specified in the python script 
- copy requirements.txt and install dependencies by using COPY rule in Dockerifle, followed by RUN pip install 
- copy train.py to the working directory using COPY rule in Dockerfile
- set the command to run train.py: CMD ["python","train.py"]

**step 2:** build the image based on the dockerfile
- build image using docker build
- make sure to add an informative tag
- point to appropriate Dockerfile using -f flag

`sudo docker build -t model-train:v1.1-python3.11-slim -f Dockerfile.train .`

**step 3:** run the training of the model on your computer
- run container from image using docker run
- make sure to mount the correct volume to get the model generated in the container
- retrieve the image id using docker images:
`sudo docker images`
- run the container
`sudo docker run -v ./models:/apps/models c2e5fad55e4d`

**step 4:** document the command as comment in the Dockerfile
- added the commands as comments (#) in the Dockerfile 

**step 5:** store the created Dockerfile in your cloned github repository
`git add *`
`git commit -m "Modified Dockerfile.train with correct workdir and volume mounting. Added model training container output in /model folder."

## Deliverable 3: Containerize serving of the machine learning model
## Deliverable 5: Run the Docker container serving the machine learning model

