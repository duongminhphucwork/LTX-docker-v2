# start from a clean base image (replace <version> with the desired release)
FROM runpod/worker-comfyui:5.3.0-base

# install custom nodes using comfy-cli
RUN comfy-node-install comfyui-kjnodes comfyui-videohelpersuite

RUN mkdir -p /comfyui/custom_nodes \
 && git clone https://github.com/Lightricks/ComfyUI-LTXVideo.git /comfyui/custom_nodes/ComfyUI-LTXVideo \
 && pip install --no-cache-dir -r /comfyui/custom_nodes/ComfyUI-LTXVideo/requirements.txt

COPY ltxv-spatial-upscaler-0.9.7.safetensors /comfyui/models/upscale_models/
COPY t5xxl_fp8_e4m3fn.safetensors /comfyui/models/text_encoders/
COPY ltxv-13b-0.9.8-distilled.safetensors /comfyui/models/checkpoints/ 

# Ghi đè handler mặc định
COPY handler.py /handler.py
