#!/bin/bash
pip install tensor2tensor

t2t-trainer \
--problem=translate_enid_iwslt32k_notok \
--model=transformer \
--hparams_set=transformer_base \
--data_dir=/storage/data_notok/ \
--output_dir=/storage/train/BS8192_Max256_LR.2_LRWS8000_single_notok_nothrott/ \
--eval_steps=100 \
--keep_checkpoint_max=100 \
--local_eval_frequency=5000 \
--eval_throttle_seconds=60000 \
--train_steps=100000 \
--hparams=max_length=256,batch_size=8192,learning_rate=0.2,learning_rate_warmup_steps=8000 \
--generate_data \
--t2t_usr_dir=usrdir