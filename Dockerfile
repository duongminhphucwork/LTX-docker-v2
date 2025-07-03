# start from a clean base image (replace <version> with the desired release)
FROM runpod/worker-comfyui:5.2.0-base

# install custom nodes using comfy-cli
RUN comfy-node-install comfyui-kjnodes comfyui-videohelpersuite

RUN git clone https://github.com/Lightricks/ComfyUI-LTXVideo.git

RUN pip install --no-cache-dir /comfyui/custom_nodes/ComfyUI-LTXVideo/requirements.txt

# download models using comfy-cli
# the "--filename" is what you use in your ComfyUI workflow
RUN comfy model download --url https://huggingface.co/Lightricks/LTX-Video/resolve/main/ltxv-spatial-upscaler-0.9.7.safetensors --relative-path models/upscale_models --filename ltxv-spatial-upscaler-0.9.7.safetensors
