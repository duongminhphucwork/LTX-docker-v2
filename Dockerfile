# start from a clean base image (replace <version> with the desired release)
FROM runpod/worker-comfyui:5.1.0-base

# install ffmpeg support via imageio
RUN pip install imageio-ffmpeg

# install custom nodes using comfy-cli
RUN comfy-node-install ComfyUI-Manager comfyui-kjnodes ComfyUI-VideoHelperSuite ComfyUI-LTXVideo

# download models using comfy-cli
# the "--filename" is what you use in your ComfyUI workflow
RUN comfy model download --url https://huggingface.co/Lightricks/LTX-Video/resolve/main/ltxv-13b-0.9.7-distilled.safetensors \
 --relative-path models/checkpoints --filename ltxv-13b-0.9.7-distilled.safetensors

RUN comfy model download --url https://huggingface.co/mcmonkey/google_t5-v1_1-xxl_encoderonly/resolve/main/t5xxl_fp8_e4m3fn.safetensors \
 --relative-path models/text_encoders --filename t5xxl_fp8_e4m3fn.safetensors

RUN comfy model download --url https://huggingface.co/Lightricks/LTX-Video/resolve/main/ltxv-spatial-upscaler-0.9.7.safetensors \
 --relative-path models/upscale_models --filename ltxv-spatial-upscaler-0.9.7.safetensors

# Copy local static input files into the ComfyUI input directory (delete if not needed)
# Assumes you have an 'input' folder next to your Dockerfile
COPY input/ /comfyui/input/
