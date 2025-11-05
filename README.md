# Jupyter Notebook Docker Environment

This setup lets you run Jupyter notebooks in a clean Docker environment without installing Jupyter or dependencies locally.

## 🧱 Structure

```
project/
├── Dockerfile
├── requirements.txt
└── notebooks/
    └── my_notebook.ipynb
```

## 🚀 Build and Run

### 1. Build the Docker image
```bash
docker build -t my-jupyter .
```

### 2. Run the container
```bash
docker run -it --rm -p 8888:8888 -v "$(pwd)/notebooks:/home/jovyan/work" my-jupyter
```
Then open the link printed in your terminal (usually http://127.0.0.1:8888).

### 3. Add your notebooks
Place your `.ipynb` notebooks inside the `notebooks/` folder — they will appear in Jupyter automatically.

## ⚙️ Adding Dependencies
To add Python libraries, edit `requirements.txt` and rebuild:
```bash
docker build -t my-jupyter .
```

## 💾 Persistence
Your notebooks are stored in your local `notebooks/` folder via a Docker volume mapping, so they remain even after the container stops.

## 🧹 Cleanup
To remove all stopped containers and free space:
```bash
docker system prune
```
