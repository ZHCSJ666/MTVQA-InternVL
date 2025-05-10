#!/bin/bash

# 微调 InternVL2.5-8B 模型

echo "🚀 正在启动 InternVL2.5-8B 的微调..."

CUDA_VISIBLE_DEVICES=1,2 \
swift sft \
  --model /ltstorage/home/2pan/models/Qwen2.5-VL-7B-Instruct \
  --train_type lora \
  --dataset Internvl-MTVQA/mtvqa_train_qa_pair.jsonl \
  --output_dir Internvl-MTVQA/LoRA \
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