两个jsonl文件：
Internvl-MTVQA/mtvqa_train_qa_pair.jsonl（不带有ocr内容）
Internvl-MTVQA/mtvqa_train_qa_with_ocr.jsonl（带有OCR内容）

数据库：
https://huggingface.co/datasets/ZHCSJ/MTVQA-dataset
****使用paddle ocr的时候，有180多张图片无法提取ocr，所以这些图片从数据库中删除了****

数据下载：
python datadownload.py


微调Internvl命令：
chmod +x finetune_internvl3.sh
bash finetune_internvl3.sh



微调Qwen命令：
chmod +x finetune_qwen2_5.sh
bash finetune_qwen2_5.sh
