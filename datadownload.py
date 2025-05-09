from datasets import load_dataset
from PIL import Image
from pathlib import Path

# 设置输出图像目录（相对路径）
output_dir = Path("mtvqa_train_samples")
output_dir.mkdir(parents=True, exist_ok=True)

# 下载数据集（默认是 split='train'）
dataset = load_dataset("ZHCSJ/MTVQA-dataset", split="train")

# 遍历并保存图片
for sample in dataset:
    img: Image.Image = sample["image"]
    img_id = sample["id"]  # 如 "AR_0", "DE_1" 等
    out_path = output_dir / f"{img_id}.png"
    try:
        img.convert("RGB").save(out_path, format="PNG")
    except Exception as e:
        print(f"❌ Error saving {img_id}: {e}")

print(f"✅ 所有图片已保存到：{output_dir}")
