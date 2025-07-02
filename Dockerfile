FROM runpod/worker-comfyui:5.2.0-base

RUN comfy-node-install COMFYUI-MANAGER ComfyUI-KJNodes ComfyUI-VideoHelperSuite

RUN ls -l /comfyui/custom_nodes
