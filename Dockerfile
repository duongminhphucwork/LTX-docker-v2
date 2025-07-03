# start from a clean base image (replace <version> with the desired release)
FROM runpod/worker-comfyui:5.2.0-base

# Ghi đè handler mặc định
COPY handler.py /handler.py
