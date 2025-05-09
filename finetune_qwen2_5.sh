#!/bin/bash

# 微调 InternVL2.5-8B 模型

echo "🚀 正在启动 InternVL2.5-8B 的微调..."

CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 \
swift sft \
  --model /ltstorage/home/3jiang/humanwithlove/models/InternVL2_5-8B \
  --train_type lora \
  --dataset /ltstorage/home/3jiang/humanwithlove/MTVQA/mtvqa_train_qa_with_ocr_top50.swift.jsonl \
  --output_dir /ltstorage/home/3jiang/humanwithlove/Weitiao/internvl2_5-1b-mtvqa-lora \
  --num_train_epochs 3 \
  --per_device_train_batch_size 1 \
  --per_device_eval_batch_size 1 \
  --gradient_accumulation_steps 8 \
  --learning_rate 2e-5 \
  --lora_rank 16 \
  --lora_alpha 32 \
  --lora_dropout 0.1 \
  --target_modules all-linear \
  --freeze_vit true \
  --max_length 8096 \
  --save_steps 100 \
  --logging_steps 10 \
  --lr_scheduler_type cosine \
  --torch_dtype bfloat16 \
  --dataloader_num_workers 4 \
  --gradient_checkpointing true \
  --report_to wandb \
  --use_chat_template true
