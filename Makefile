.RECIPEPREFIX := >
SHELL := /bin/bash

.PHONY: setup lint format clean hooks

setup:
> python3 -m venv .venv || true
> source .venv/bin/activate && pip install --upgrade pip wheel setuptools
> source .venv/bin/activate && pip install -r requirements.txt -r requirements-dev.txt
> source .venv/bin/activate && pre-commit install

hooks:
> source .venv/bin/activate && pre-commit install

lint:
> source .venv/bin/activate && pre-commit run --all-files

format:
> source .venv/bin/activate && black . && isort .

clean:
> find . -type d -name "__pycache__" -exec rm -rf {} + || true
> find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} + || true
> rm -rf build dist *.egg-info || true
