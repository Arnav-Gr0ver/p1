#!/usr/bin/bash

#SBATCH --cpus-per-task=8
#SBATCH --mem=20G
#SBATCH --account=csso-e
#SBATCH --gres=gpu:1
#SBATCH --time=4:00:00

module load cuda/12.1.1 cudnn/cuda-12.1_8.9 anaconda
conda activate /scratch/gilbreth/jsetpal/conda/workshop

cd ~/arnav-temp/p1

MLFLOW_TRACKING_USERNAME=$MLFLOW_USERNAME \
MLFLOW_TRACKING_PASSWORD=$MLFLOW_TOKEN \
OMP_NUM_THREADS=80 \
torchrun --standalone --nnodes=1 --nproc_per_node=gpu -m train.finetune
