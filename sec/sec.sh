pip install --upgrade pip
pip install tensor2tensor==1.7.0

t2t-trainer \
--problem=translate_enid_iwslt32k_notok_plus_os \
--model=transformer \
--hparams_set=transformer_base \
--data_dir=/storage/data_notok_plus_os/ \
--output_dir=/storage/train/BS4096_Max128_LR.2_LRWS8000_base_notok_plus_os/ \
--eval_steps=100 \
--keep_checkpoint_max=100 \
--local_eval_frequency=5000 \
--eval_throttle_seconds=600000 \
--train_steps=5000 \
--hparams=max_length=256,batch_size=4096,learning_rate=0.2,learning_rate_warmup_steps=8000 \
--generate_data \
--t2t_usr_dir=usrdir