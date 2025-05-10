#!/bin/bash

# 创建目标目录
mkdir -p MTVQA-InternVL/Data

# 下载 zip 文件（指定文件名）
gdown --id 1u09EVNVj17ws_AHEB7Y0eZiSPseTJUTx -O mnt/workspace/xintong/jlq/dataset/Tufan/MTVQA.zip

# 解压 zip 到同一目录
unzip -o mnt/workspace/xintong/jlq/dataset/Tufan/MTVQA.zip -d mnt/workspace/xintong/jlq/dataset/Tufan

