#!/bin/bash
pip install tensor2tensor

t2t-trainer \
--problem=translate_enid_iwslt32k \
--model=transformer \
--hparams_set=transformer_base \
--data_dir=/storage/data/ \
--output_dir=/storage/train/BS4096_Max256_LR.2_LRWS16000_single/ \
--eval_steps=100 \
--keep_checkpoint_max=100 \
--local_eval_frequency=2500 \
--train_steps=50000 \
--hparams=max_length=256,batch_size=4096,learning_rate=0.2,learning_rate_warmup_steps=16000 \
--generate_data
