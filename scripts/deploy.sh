#!/bin/bash

hugo

mv public/gopher/post.txt public/gopher/gophermap
scp -r public/gopher/* gabek@sdf.lonestar.org:~/gopher