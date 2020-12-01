<h1 align="center">
  <img alt="MLOPS" src=".github/code-school.svg" width="150px" /> <br/>
  MLOps-Flask
</h1>

<p align="center">
  <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/vcwild/mlops-flask">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/vcwild/mlops-flask">

  <a href="https://github.com/vcwild/mlops-flask/blob/master/LICENSE.md">
    <img alt="License" src="https://img.shields.io/badge/license-MIT-blue">
  <a>
</p>

<!-- TOC -->
- [APIs](#apis)  
- [How it Works](#how-it-works)  
- [Local Deployment](#local-deployment)  
- [Automations](#automations) 
- [Project Organization](#project-organization)
<!-- /TOC -->

## APIs
### Sentiment Analysis
Machine Learning sentiment analysis API is available at: [https://ml-api.run.app/sentiment/](https://ml-api-qinvsjdm4a-rj.a.run.app/sentiment/)

### House Prices
Regression model API available at: [https://ml-api.run.app/prices/](https://ml-api-qinvsjdm4a-rj.a.run.app/prices/)
- Requires: POST method, Basic Auth
- Header Content-Type: application/json

## How it Works

### Endpoints

#### [GET]

- sentiment/\<sentiment>

#### [POST]

- prices
  - Request
  ```{javascript}
  {
    "size":int,
    "year":int,
    "garage":int
  }
  ```
  - Response
  ```{javascript}
  {
    "price": float
  }
  ```

  **Example implementation**

  - Request
  ```{javascript}
  {
    "size":140,
    "year":2005,
    "garage":1
  }
  ```
  - Response
  ```{javascript}
  {
    "price": 185317.82054
  }
  ```

## Local Deployment

### LINUX Ubuntu/Debian

Install Docker (skip this if you already have Docker installed)

```sh
# get Docker
curl -fsSL https://get.docker.com -o get-docker.sh
# create Docker group
sudo groupadd docker
# add user to the Docker group
sudo usermod -aG docker $USER
```
#### Method 1

Get the default container

```sh
docker run -d -p 5000:5000 vcwild/mlops-run
```
#### Method 2

By using the Miniconda environment

```sh
docker run -d -p 5000:5000 vcwild/conda-run
```

### Windows

- [Install Docker Desktop](https://docs.docker.com/docker-for-windows/install/)
- [Get container](https://hub.docker.com/r/vcwild/mlops-run)

## Automations

Machine learning model deployment on GCP automated with GitHub Actions.

## Project Organization

------------

    ├── LICENSE
    ├── Makefile           <- Makefile with commands like `make data` or `make train`
    ├── README.md          <- The top-level README for developers using this project.
    ├── data
    │   ├── external       <- Data from third party sources.
    │   ├── interim        <- Intermediate data that has been transformed.
    │   ├── processed      <- The final, canonical data sets for modeling.
    │   └── raw            <- The original, immutable data dump.
    │
    ├── docs               <- A default Sphinx project; see sphinx-doc.org for details
    │
    ├── models             <- Trained and serialized models, model predictions, or model summaries
    │
    ├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
    │                         the creator's initials, and a short `-` delimited description, e.g.
    │                         `1.0-jqp-initial-data-exploration`.
    │
    ├── references         <- Data dictionaries, manuals, and all other explanatory materials.
    │
    ├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
    │   └── figures        <- Generated graphics and figures to be used in reporting
    │
    ├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
    │                         generated with `pip freeze > requirements.txt`
    │
    ├── setup.py           <- makes project pip installable (pip install -e .) so src can be imported
    ├── src                <- Source code for use in this project.
    │   ├── __init__.py    <- Makes src a Python module
    │   │
    │   ├── data           <- Scripts to download or generate data
    │   │   └── make_dataset.py
    │   │
    │   ├── features       <- Scripts to turn raw data into features for modeling
    │   │   └── build_features.py
    │   │
    │   ├── models         <- Scripts to train models and then use trained models to make
    │   │   │                 predictions
    │   │   ├── predict_model.py
    │   │   └── train_model.py
    │   │
    │   └── visualization  <- Scripts to create exploratory and results oriented visualizations
    │       └── visualize.py
    │
    └── tox.ini            <- tox file with settings for running tox; see tox.readthedocs.io


--------

<p><small>Project based on the <a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data science project template</a>. #cookiecutterdatascience</small></p>
