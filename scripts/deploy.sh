#!/bin/bash

hugo

cd public
cp ../now.json .
now
mv gopher/post.txt gopher/gophermap
scp -r gopher/* gabek@sdf.lonestar.org:~/gopher >> /dev/null
now alias