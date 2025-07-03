# start from a clean base image (replace <version> with the desired release)
FROM runpod/worker-comfyui:5.2.0-base

# install custom nodes using comfy-cli
RUN comfy-node-install comfyui-kjnodes comfyui-videohelpersuite

RUN mkdir -p /comfyui/custom_nodes \
 && git clone https://github.com/Lightricks/ComfyUI-LTXVideo.git /comfyui/custom_nodes/ComfyUI-LTXVideo \
 && pip install --no-cache-dir -r /comfyui/custom_nodes/ComfyUI-LTXVideo/requirements.txt

# download models using comfy-cli
# the "--filename" is what you use in your ComfyUI workflow
RUN comfy model download --url https://huggingface.co/Lightricks/LTX-Video/resolve/main/ltxv-spatial-upscaler-0.9.7.safetensors --relative-path models/upscale_models --filename ltxv-spatial-upscaler-0.9.7.safetensors
RUN comfy model download --url https://huggingface.co/mcmonkey/google_t5-v1_1-xxl_encoderonly/resolve/main/t5xxl_fp8_e4m3fn.safetensors --relative-path models/text_encoders --filename t5xxl_fp8_e4m3fn.safetensors
RUN comfy model download --url https://huggingface.co/Lightricks/LTX-Video/resolve/main/ltxv-13b-0.9.7-distilled.safetensors --relative-path models/checkpoints --filename ltxv-13b-0.9.7-distilled.safetensors

# Ghi đè handler mặc định
COPY handler.py /handler.py
