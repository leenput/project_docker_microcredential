# Project Docker Microcredential
micro-credential VIB/UGent - Reproducible data analysis

In this project, you will train, run and serve a machine learning model using Docker. Furthermore, you will store the Docker images on your own account on Docker hub. Using the image of the training step, you will build an Apptainer image on the HPC of UGent.

## Deliverables

- [X] Clone this repository to your personal github account
- [X] Containerize training the machine learning model
- [X] Containerize serving of the machine learning model
- [X] Train and run the machine learning model using Docker
- [X] Run the Docker container serving the machine learning model
- [X] Store the Docker images on your personal account on    Docker Hub: [images](https://hub.docker.com/repositories/leenaputzeys)
- [X] Provide the resulting Dockerfiles in GitHub
        - [Dockerfile.train](https://github.com/leenput/project_docker_microcredential/blob/main/Dockerfile.train)
        - [Dockerfile.infer](https://github.com/leenput/project_docker_microcredential/blob/main/Dockerfile.infer)
- [X] Build an Apptainer image on a HPC of your choice
- [X] Provide the logs of the slurm job in GitHub: [log](https://github.com/leenput/project_docker_microcredential/blob/main/slurm-20163444.out)
- [X] Document the steps in a text document in GitHub: [workflow](https://github.com/leenput/project_docker_microcredential/blob/main/PROJECT-STEPS.md)

## Proposed steps - containerize and run training the machine learning model

Complete file named `Dockerfile.train`

- Copy requirements.txt and install dependencies
- Copy train.py to the working directory
- Set the command to run train.py
- Run the training of the model on your computer
- Document the command as comment in the Dockerfile
- Store the created Dockerfile in your cloned github repository

## Proposed steps - containerize and serve the machine learning model

- Correct the order of the instructions in the Dockerfile.infer
- Document the steps in the Dockerfile.infer as comments
- Document the succesful `docker run` command in the Dockerfile.infer as a comment

## Proposed steps - store images on Dockerhub and build an Apptainer image on the HPC

- Create an account on Dockerhub
- Store the built images on your account
- Create a shell script on the HPC of your preference
- Store the shell script in your cloned github repository



