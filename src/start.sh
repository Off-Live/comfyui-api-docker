echo "Starting ComfyUI"
python /root/ComfyUI/main.py --cpu &

cd /root/comfyui-api-converter
echo "Starting API converter"
python app.py