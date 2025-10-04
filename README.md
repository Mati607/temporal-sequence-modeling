# 🌐 Temporal Graph Forecasting

<div align="center">

![Temporal Graphs](https://img.shields.io/badge/Temporal-Graphs-593CFB?style=for-the-badge&logo=chronometer)
![PyTorch](https://img.shields.io/badge/PyTorch-2.x-EE4C2C?style=for-the-badge&logo=pytorch)
![PyG Temporal](https://img.shields.io/badge/PyG-Temporal-3776AB?style=for-the-badge&logo=graphql)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebooks-F37626?style=for-the-badge&logo=jupyter)

**Forecast temporal trends on graphs with TGN, TGCN, DCRNN and LSTM baselines**

[![Python](https://img.shields.io/badge/Python-3.11+-blue?style=flat&logo=python)](https://www.python.org)
[![Torch Geometric](https://img.shields.io/badge/Torch%20Geometric-Temporal-purple?style=flat)](https://pyg.org)
[![Black](https://img.shields.io/badge/Code%20Style-Black-000000.svg?style=flat)](https://github.com/psf/black)
[![Pre-commit](https://img.shields.io/badge/Pre--commit-enabled-brightgreen?style=flat)](https://pre-commit.com/)

</div>

---

Forecast temporal trends on graphs using PyTorch Geometric Temporal (TGN, TGCN, DCRNN) and sequence baselines (LSTM). This project showcases end-to-end pipelines for building temporal graph datasets, training models, and evaluating RMSE on edge trends.

## 🌟 Highlights
- **Temporal GNNs**: TGN memory-based predictor, TGCN, DCRNN
- **Baselines**: LSTM for sequence modeling

## 📁 Repository structure
```
notebooks/
  tutorials/
    01-PyGTemporal-Chickenpox-DCRNN-TGCN-TGN.ipynb
  baselines/
    01-LSTM-EdgeTrend-Baseline.ipynb
    02-RMSE-LSTM-Baseline-Eval.ipynb
  tgn/
    01-TGN-Trend-Predictor-EndToEnd.ipynb
    02-RMSE-TGN-Edge-Score-Predictor.ipynb
    04-TGN-Trend-Long-Forecast.ipynb
    05-TGN-Trend-Predictor-Variable-Window.ipynb
    06-Generate-TGN-Embeddings-Corvic-Feature-Views.ipynb
    07-Generate-TGN-Embeddings-Corvic-Feature-Views-Refactored.ipynb
    08-Write-TGN-Embeddings-to-GCloud.ipynb
  experiments/
    02-Decoupled-MLP-LSTM-with-TGN-Embeddings.ipynb
    03-Decoupled-MLP-LSTM-LongForecast-TGN-Embeddings.ipynb
    04-Decoupled-LSTM-GCloud-TGN-Embeddings.ipynb
    05-Decoupled-LSTM-LongForecast-GCloud-TGN-Embeddings.ipynb
    06-MLP-LSTM-Variable-Length.ipynb
    07-RMSE-Decoupled-MLP-LSTM-TGN-Embeddings.ipynb
```

## 🚀 Quickstart

### 1) Environment
```bash
make setup
```

### 2) Install PyG wheels (if needed)
PyTorch Geometric extensions depend on your Torch and CUDA/CPU version. If `pip install` from `requirements.txt` fails, install PyG wheels using the official index, then re-run `make setup`:
```python
import torch
v = torch.__version__.split('+')[0]
cu = 'cpu' if torch.version.cuda is None else 'cu' + torch.version.cuda.replace('.', '')
print(f"Use: https://data.pyg.org/whl/torch-{v}+{cu}.html")
```
Then install the matching wheels (example):
```bash
pip install torch-scatter -f https://data.pyg.org/whl/torch-2.6.0+cpu.html
pip install torch-sparse -f https://data.pyg.org/whl/torch-2.6.0+cpu.html
pip install torch-cluster -f https://data.pyg.org/whl/torch-2.6.0+cpu.html
pip install torch-spline-conv -f https://data.pyg.org/whl/torch-2.6.0+cpu.html
pip install torch-geometric torch-geometric-temporal
```

### 3) Run notebooks
Open any notebook in `notebooks/`. Each has a short description and can be executed end-to-end.

## 🗂️ Data
Some notebooks reference GCS paths (`gs://...`) for scientific trend datasets. Replace with your accessible path, or mount GCS using `gcsfuse`/`gsutil`, or copy locally to `data/`.

## 📓 Notebooks guide
- **Tutorials**: Chickenpox dataset walk-through of DCRNN/TGCN/TGN
- **TGN**: End-to-end trend predictor, RMSE evaluators, long-horizon/variable-window studies, and embedding generation
- **Baselines**: LSTM edge-trend baselines + RMSE evaluation
- **Experiments**: Decoupled MLP+LSTM variants leveraging TGN embeddings

## 🧑‍💻 Development
- Install hooks: `make hooks`
- Lint all files: `make lint`
- Auto-format: `make format`
