### ComfyUI API converter docker image

docker image for converting comfyui workflow json into comfyui api json.

### Build image
```
docker build --platform linux/amd64 -t comfyui-api-converter .
```

### Run image
```
docker run -p 3003:3003 comfyui-api-converter 
```