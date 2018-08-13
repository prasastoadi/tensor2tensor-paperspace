#!/bin/bash
pip install -qU tensorflow==1.8.0
pip install -qU tensor2tensor==1.7.0

t2t-trainer \
--problem=translate_enid_iwslt32k_os \
--model=transformer \
--hparams_set=transformer_base \
--data_dir=/storage/data_os/ \
--output_dir=/storage/train/BS4096_Max256_LR.2_LRWS8000_single_os/ \
--eval_steps=100 \
--keep_checkpoint_max=100 \
--local_eval_frequency=5000 \
--eval_throttle_seconds=60000 \
--train_steps=100000 \
--hparams=max_length=256,batch_size=4096,learning_rate=0.2,learning_rate_warmup_steps=8000 \
--generate_data \
--t2t_usr_dir=usrdir

t2t-translate-all \
--t2t_usr_dir=usrdir \
--problem=translate_enid_iwslt32k_os \
--model_dir=/storage/train/BS4096_Max256_LR.2_LRWS8000_single_os \
--source=/storage/corpus/dev/IWSLT17.TED.dev2010.en-id/IWSLT17.TED.dev2010.en-id.en \
--translations_dir=/storage/translated/dev/BS4096_Max256_LR.2_LRWS8000_single_os/IWSLT17.TED.dev2010.en-id \
--beam_size=4 \
--alpha=0.6 \
--model=transformer \
--data_dir=/storage/data_os \
--hparams_set=transformer_base \
--hparams=max_length=256,batch_size=4096,learning_rate=0.2,learning_rate_warmup_steps=8000 \
--min_steps=5000

t2t-bleu \
--reference=/storage/corpus/dev/IWSLT17.TED.dev2010.en-id/IWSLT17.TED.dev2010.en-id.id \
--translations_dir=/storage/translated/dev/BS4096_Max256_LR.2_LRWS8000_single_os/IWSLT17.TED.dev2010.en-id \
--event_dir=/storage/translated/dev/BS4096_Max256_LR.2_LRWS8000_single_os/IWSLT17.TED.dev2010.en-id