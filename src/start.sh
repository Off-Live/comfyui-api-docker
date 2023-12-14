echo "Starting ComfyUI"
python /root/ComfyUI/main.py --listen --cpu &

cd /root/comfyui-api-converter
echo "Starting API converter"
python app.py