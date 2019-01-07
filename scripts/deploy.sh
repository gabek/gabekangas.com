#!/bin/bash

hugo

cd public
now
mv gopher/post.txt gopher/gophermap
scp -r gopher/* gabek@sdf.lonestar.org:~/gopher >> /dev/null