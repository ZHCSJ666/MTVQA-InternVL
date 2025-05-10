#!/bin/bash

# 微调 InternVL2.5-8B 模型

echo "🚀 正在启动 InternVL2.5-8B 的微调..."

CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 \
swift sft \
  --model Qwen/Qwen2.5-VL-7B-Instruct \
  --train_type lora \
  --dataset mnt/workspace/xintong/jlq/MTVOA-InternvL/mtvqa_train_qa_pair_new.jsonl
  --output_dir mnt/workspace/xintong/jlq/All_results/Tufan/qwen25_noocr \
  --num_train_epochs 3 \
  --per_device_train_batch_size 1 \
  --per_device_eval_batch_size 1 \
  --gradient_accumulation_steps 8 \
  --learning_rate 2e-5 \
  --save_total_limit 2 \
  --lora_rank 16 \
  --lora_alpha 32 \
  --lora_dropout 0.1 \
  --warmup_ratio 0.05 \
  --target_modules all-linear \
  --freeze_vit true \
  --max_length 8192 \
  --logging_steps 5 \
  --save_steps 50 \
  --eval_steps 50 \
  --system "You are a helpful assistant." \
  --torch_dtype bfloat16 \
  --dataloader_num_workers 4 \
  --gradient_checkpointing true \
  --report_to wandb \
  --model_author swift \
  --use_chat_template true
