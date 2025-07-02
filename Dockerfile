FROM runpod/worker-comfyui:5.2.0-base

RUN comfy-node-install comfyui-kjnodes

RUN ls -l /comfyui/custom_nodes
