# MTVQA 微调项目说明

 第一步：
  `conda env create -f environment.yaml `
 新环境的名字是 `jlq_swift `

第二步：`conda activate jlq_swift`


第三步：下载并且加压数据
`python data.py`

第四步：微调internvl_noocr
  `bash finetune_internvl3_noocr.sh `


第五步：微调internvl_withocr
  `bash finetune_internvl3_withocr.sh `



 得到的所有结果存储在 `jlq/ALL_results/MTVQA `中

