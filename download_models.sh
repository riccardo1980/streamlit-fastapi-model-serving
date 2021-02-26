TORCH_HUB=backend/torch_cache/hub

mkdir -p $TORCH_HUB
pushd $TORCH_HUB
wget "https://github.com/pytorch/vision/archive/v0.6.0.zip"
popd 

mkdir -p $TORCH_HUB/checkpoints
pushd $TORCH_HUB/checkpoints
wget "https://download.pytorch.org/models/resnet101-5d3b4d8f.pth" 
wget "https://download.pytorch.org/models/deeplabv3_resnet101_coco-586e9e4e.pth"
popd