# start from a clean base image (replace <version> with the desired release)
FROM runpod/worker-comfyui:5.1.0-base

# install ffmpeg support via imageio
RUN pip install imageio-ffmpeg

# install custom nodes using comfy-cli
RUN comfy node registry-install comfyui-manager comfyui-kjnodes comfyui-videohelpersuite 

RUN git clone git clone https://github.com/Lightricks/ComfyUI-LTXVideo.git /workspace/ComfyUI/custom_nodes/ComfyUI-LTXVideo && pip install -r /workspace/ComfyUI/custom_nodes/ComfyUI-LTXVideo/requirements.txt

# download models using comfy-cli
# the "--filename" is what you use in your ComfyUI workflow
RUN comfy model download --url https://huggingface.co/Lightricks/LTX-Video/resolve/main/ltxv-13b-0.9.7-distilled.safetensors --relative-path models/checkpoints --filename ltxv-13b-0.9.7-distilled.safetensors

RUN comfy model download --url https://huggingface.co/mcmonkey/google_t5-v1_1-xxl_encoderonly/resolve/main/t5xxl_fp8_e4m3fn.safetensors --relative-path models/text_encoders --filename t5xxl_fp8_e4m3fn.safetensors

RUN comfy model download --url https://huggingface.co/Lightricks/LTX-Video/resolve/main/ltxv-spatial-upscaler-0.9.7.safetensors --relative-path models/upscale_models --filename ltxv-spatial-upscaler-0.9.7.safetensors
