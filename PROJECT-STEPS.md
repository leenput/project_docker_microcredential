# Outline of steps used to carry out microcredential project 2

Project description: https://github.com/vib-tcp/project_docker_microcredential

## Deliverable 1: Clone this repository to your personal github account
**step 1**: fork project 
**step 2**: clone the project on local machine
`git clone git@github.com:leenput project_docker_microcredential.git`

## Deliverable 2 & 4: Containerize training the machine learning model and run it using Docker

**step 1:** complete file named Dockerfile.train

approach:
- inspect Dockerfile, train.py script and the requirements.txt
- select an appropriate base image from DockerHub, which judging from the files should be python-based: selected python image 3.11-slim
- set appropriate working directory in the container. Make sure that it matches the output directory specified in the python script 
- copy requirements.txt and install dependencies by using COPY rule in Dockerifle, followed by RUN pip install 
- copy train.py to the working directory using COPY rule in Dockerfile
- set the command to run train.py: CMD ["python","train.py"]

**step 2:** build the image based on the Dockerfile
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

**step 1:** correct the order of the instructions in the Dockerfile.infer
- inspect the Dockerfile.infer and adjust the order and content based on the Dockerfile.train file
- add comments for each step to make it more readable and understandable
- add commands to build the image and run it 

**step 2:** build the image based on modified Dockerfile
`sudo docker build -f Dockerfile.infer -t model-infer:v1-python3.9-slim .`

**step 3:** run container to serve the model
- get image id using `sudo docker images`
- run the image and set ports
`sudo docker run --detach -p 8080:8080 -v ./models/:/app/models 0ca32d91de36`
- access container via user port 8080: check URL to see if it worked (http://localhost:8080/)

## Deliverable 6: Store the Docker images on your personal account on Docker Hub
Personal DockerHub profile: leenaputzeys

**step 1:** login using terminal:
`sudo docker login`: redirected to webpage to authenticate

**step 2:** modify image tags to make compatible with DockerHub repository naming conventions
`sudo docker tag model-infer:v1-python3.9-slim leenaputzeys/model-infer:v1-python3.9-slim`

`sudo docker tag model-train:v1.1-python3.11-slim leenaputzeys/model-train:v1.1-python3.11-slim`

**step 3:** push images to DockerHub
`sudo docker push leenaputzeys/model-infer:v1-python3.9-slim`
`sudo docker push leenaputzeys/model-train:v1.1-python3.11-slim`

validate online: [DockerHub Leena](https://hub.docker.com/repositories/leenaputzeys)

## Deliverable 7:  Provide the resulting Dockerfiles in GitHub
`git add *`
`git commit -m "Add modified and corrected Dockerfiles, and the step-by-step workflow of this project.`


## Deliverable 8: Build an Apptainer image on a HPC of your choice
**step 1:** Make sure your images are publicly available (see deliverable 6)

**step 2:** Connect to VSC and start interactive session
- connect using https://login.hpc.ugent.be/
- initiate an interactive shell session on the donphan cluster for 4 hours (1 node, 4 cores)

**step 3:** pull docker images from DockerHub using apptainer 
`apptainer build model-infer.sif docker://leenaputzeys/model-infer:v1-python3.9-slim`

`apptainer build model-train.sif docker://leenaputzeys/model-train:v1.1-python3.11-slim`

Edit: realised that this is not necessary, i should directly build images from the job script. 

**step 4:** make a job script that builds the model-train apptainer image
--> see [script](https://github.com/leenput/project_docker_microcredential/blob/main/ML-job.sh)

**step 5:** run the job script on the VSC
`sbatch ML-job.sh`

## Deliverable 9: Provide the logs of the slurm job in GitHub

**step 1:** Download ML-job.sh and slurm log from VSC
`scp vsc49035@login.hpc.ugent.be:/user/gent/490/vsc49035/jobs/ML-job.sh .`

`scp vsc49035@login.hpc.ugent.be:/user/gent/490/vsc49035/jobs/slurm*.out`

**Step 2:** Add files to github repository 
```
git add *
git commit -m "Add job script and slurm output log used to build apptainer containers on VSC"`
git push`

```

To view the files:
[VSC script](https://github.com/leenput/project_docker_microcredential/blob/main/ML-job.sh)
[output log](https://github.com/leenput/project_docker_microcredential/blob/main/slurm-20163444.out)

## Deliverable 10: Document the steps in a text document in GitHub
Update PROJECT-STEPS.md file with final steps and make available on github. 
`git add *`
`git commit -m "Update PROJECT-STEPS.md with steps to complete the project and achieve deliverables."`
`git push`

