# start from a clean base image (replace <version> with the desired release)
FROM runpod/worker-comfyui:5.4.1-base

COPY flux1-kontext-dev.safetensors /comfyui/models/diffusion_models/
COPY ae.safetensors /comfyui/models/vae/
COPY clip_l.safetensors /comfyui/models/text_encoders/
COPY t5xxl_fp16.safetensors /comfyui/models/text_encoders/ 

# Ghi đè handler mặc định
COPY handler.py /handler.py
