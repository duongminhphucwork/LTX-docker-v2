FROM runpod/worker-comfyui:5.1.0-base

WORKDIR /workspace/ComfyUI/custom_nodes

RUN \
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git ComfyUI-Manager && \
    git clone https://github.com/kijai/ComfyUI-KJNodes.git ComfyUI-KJNodes && \
    git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git ComfyUI-VideoHelperSuite && \
    git clone https://github.com/Lightricks/ComfyUI-LTXVideo.git ComfyUI-LTXVideo && \
    pip install \
    -r ComfyUI-Manager/requirements.txt \
    -r ComfyUI-KJNodes/requirements.txt \
    -r ComfyUI-VideoHelperSuite/requirements.txt \
    -r ComfyUI-LTXVideo/requirements.txt && \
    rm -rf /root/.cache/pip

WORKDIR /workspace/ComfyUI

RUN \
    comfy model download --url https://huggingface.co/Lightricks/LTX-Video/resolve/main/ltxv-13b-0.9.7-distilled.safetensors --relative-path models/checkpoints --filename ltxv-13b-0.9.7-distilled.safetensors && \
    comfy model download --url https://huggingface.co/mcmonkey/google_t5-v1_1-xxl_encoderonly/resolve/main/t5xxl_fp8_e4m3fn.safetensors --relative-path models/text_encoders --filename t5xxl_fp8_e4m3fn.safetensors && \
    comfy model download --url https://huggingface.co/Lightricks/LTX-Video/resolve/main/ltxv-spatial-upscaler-0.9.7.safetensors --relative-path models/upscale_models --filename ltxv-spatial-upscaler-0.9.7.safetensors
