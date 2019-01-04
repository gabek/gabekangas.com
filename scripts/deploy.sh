#!/bin/bash

hugo

mv public/gopher/post.txt public/gopher/gophermap
scp public/* gabek@sdf.lonestar.org:/sdf/udd/g/gabek/gopher