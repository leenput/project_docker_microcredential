#!/bin/bash

#SBATCH --job-name=job_submission
#SBATCH --partition=donphan
#SBATCH --mem=8G
#SBATCH --time=00:30:00

echo "Let's build containers on the VSC"

apptainer build --fakeroot model-train.sif docker://leenaputzeys/model-train:v1.1-python3.11-slim
apptainer build --fakeroot model-infer.sif docker://leenaputzeys/model-infer:v1-python3.9-slim

echo "Move the containers to containers folder in scratch"
mv model-train.sif $VSC_SCRATCH/containers/.
mv model-infer.sif $VSC_SCRATCH/containers/.

echo "Finished!"

