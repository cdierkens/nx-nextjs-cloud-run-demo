# NX + Nextjs + Cloud Run Demo

## Setup

### Install Software

- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [Docker](https://docs.docker.com/get-docker/)
- [Google Cloud SDK](https://cloud.google.com/sdk)

### Run

In a terminal run the following commands

```bash
yarn install
gcloud auth login
gcloud auth configure-docker
terraform init
```

### Google Cloud Project

```
gcloud projects create YOUR_PROJECT_ID
```

View the [Creating and managing projects](https://cloud.google.com/resource-manager/docs/creating-managing-projects) documentation for more information.

### Environment Variables

Copy the `.env.example` to `.env` and `terraform/terraform.tfvars.example` to `terraform/terraform.tfvars`

`.env`

```.env
IMAGE_NAME="gcr.io/your-image-name" <-- Replace
PORT="8080"
```

`terraform/terraform.tfvars`

```.env
project = "your-project-id" <-- Replace
image = "gcr.io/your-image-name" <-- Replace
```

## Commands

### Build

Builds the production application in the `dist/apps/web` folder.

```bash
yarn nx build
```

### Deploy

Builds a docker image, and uses terraform to deploys the image to Cloud Run. The url of your running application will display in the console.

```
yarn nx deploy
```
