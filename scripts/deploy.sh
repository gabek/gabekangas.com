#!/bin/bash
echo "Optimizing images..."
/Applications/ImageOptim.app/Contents/MacOS/ImageOptim ./static/icons/*.png ./themes/HugoMDL/static/images/*.png ./themes/HugoMDL/static/images/*.jpg ./content/blog/images/* >> /dev/null

echo "Building site..."
hugo >> /dev/null

cd public
cp ../now.json .

echo "Deploying site..."
now >> /dev/null

echo "Deploying gopher site..."
mv gopher/post.txt gopher/gophermap
scp -r gopher/* gabek@sdf.lonestar.org:~/gopher >> /dev/null

echo "Setting domain to the new web instance..."
now alias