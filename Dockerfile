FROM runpod/worker-comfyui:5.1.0-base

RUN comfy-node-install COMFYUI-MANAGER ComfyUI-KJNodes ComfyUI-VideoHelperSuite && \
    ls -l /comfyui/custom_nodes
