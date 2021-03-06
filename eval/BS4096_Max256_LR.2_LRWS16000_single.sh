pip install -qU tensorflow==1.8.0
pip install -qU tensor2tensor==1.7.0

t2t-translate-all \
--t2t_usr_dir=/storage/usrdir \
--problem=translate_enid_iwslt32k \
--model_dir=/storage/train/BS4096_Max256_LR.2_LRWS16000_single \
--source=/storage/corpus/dev/IWSLT17.TED.dev2010.en-id/IWSLT17.TED.dev2010.en-id.en \
--translations_dir=/storage/translated/dev/BS4096_Max256_LR.2_LRWS16000_single/IWSLT17.TED.dev2010.en-id \
--beam_size=4 \
--alpha=0.6 \
--model=transformer \
--data_dir=/storage/data \
--hparams_set=transformer_base \
--hparams=max_length=256,batch_size=4096,learning_rate=0.2,learning_rate_warmup_steps=16000

t2t-bleu \
--reference=/storage/corpus/dev/IWSLT17.TED.dev2010.en-id/IWSLT17.TED.dev2010.en-id.id \
--translations_dir=/storage/translated/dev/BS4096_Max256_LR.2_LRWS16000_single/IWSLT17.TED.dev2010.en-id \
--event_dir=/storage/translated/dev/BS4096_Max256_LR.2_LRWS16000_single/IWSLT17.TED.dev2010.en-id