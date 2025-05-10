环境：
conda env create -f environment.yaml



下载和解压数据：
bash datadownload.sh

数据会下载到路径：mnt/workspace/xintong/jlq/dataset/Tufan

微调Intervl无ocr版本：
bash finetune_internvl3.sh


微调qwen无ocr版本：
bash finetune_qwen2_5.sh

微调的结果存储在：
