#!/bin/bash

# 微调 InternVL3-8B 模型（仿照 Qwen 官方配置）

echo "🚀 正在启动 InternVL3-8B LoRA 微调..."

CUDA_VISIBLE_DEVICES=1,2 \
swift sft \
  --model OpenGVLab/InternVL3-8B \
  --model_type internvl3 \
  --train_type lora \
  --dataset mnt/workspace/xintong/jlq/MTVOA-InternvL/mtvqa_train_qa_pair_new.jsonl \
  --torch_dtype bfloat16 \
  --num_train_epochs 3 \
  --per_device_train_batch_size 1 \
  --per_device_eval_batch_size 1 \
  --learning_rate 2e-5 \
  --lora_rank 16 \
  --lora_alpha 32 \
  --target_modules all-linear \
  --freeze_vit true \
  --gradient_accumulation_steps 8 \
  --eval_steps 50 \
  --save_steps 50 \
  --save_total_limit 2 \
  --logging_steps 5 \
  --max_length 8192 \
  --output_dir mnt/workspace/xintong/jlq/All_results/Tufan/internvl3_noocr \
  --warmup_ratio 0.05 \
  --dataloader_num_workers 4 \
  --gradient_checkpointing true \
  --report_to wandb \
  --lora_dropout 0.1 \
  --use_chat_template true \
  --system "You are a helpful assistant." \
  --model_author swift \
  --model_name internvl3-mtvqa-lora
