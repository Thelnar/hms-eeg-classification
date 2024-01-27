# HMS EEG Classification
## Setup
1) Clone this repo
1) pull in the kaggle-lab-container submodule
1) Create a `.env` file from the `.exampleenv`, modifying as appropriate
1) Ensure a copy of your `kaggle.json` is in `KAGGLE_CONFIG_DIR`
1) run `docker compose up` from the submodule
    - Ensure Docker is set up to use your GPU. On Windows, this means installing the appropriate CUDA and CUDNN and adding the `nvidia` runtime to your Docker daemon.
1) Access the container via bash: `docker exec -it kaggle-lab bash`
1) run `make` from the `project-vol` in bash to download the zipped competition data from kaggle and extract it into `data/in`