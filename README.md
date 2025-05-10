# MTVQA 微调项目说明

## 📦 环境设置

请先通过以下命令创建 Conda 环境：

```bash
conda env create -f environment.yaml
conda activate swift
📁 下载并解压数据
执行以下脚本自动下载并解压数据：

bash datadownload.sh
数据将被保存到：
mnt/workspace/xintong/jlq/dataset/Tufan
🚀 微调模型
✅ 微调 InternVL3（无 OCR 版本）
bash finetune_internvl3.sh
✅ 微调 Qwen2.5（无 OCR 版本）
bash finetune_qwen2_5.sh
💾 微调结果保存路径
所有微调输出将保存在：
mnt/workspace/xintong/jlq/All_results/Tufan
