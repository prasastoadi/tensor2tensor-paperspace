pip install --upgrade pip
pip install tensor2tensor==1.7.0

t2t-translate-all \
--t2t_usr_dir=usrdir \
--problem=translate_enid_iwslt32k_notok_plus_os_rev \
--model_dir=/storage/train/BS4096_Max256_LR.2_LRWS8000_single_notok_plus_os_rev \
--source=/storage/corpus/test/test.go.id.en \
--translations_dir=/storage/translated/test/BS4096_Max256_LR.2_LRWS8000_single_notok_plus_os_rev/test.go.id \
--beam_size=4 \
--alpha=0.6 \
--model=transformer \
--data_dir=/storage/data_notok_plus_os_rev \
--hparams_set=transformer_base \
--hparams=max_length=256,batch_size=4096,learning_rate=0.2,learning_rate_warmup_steps=8000 \
--min_steps=5000

t2t-bleu \
--reference=/storage/corpus/test/test.go.id.id \
--translations_dir=/storage/translated/test/BS4096_Max256_LR.2_LRWS8000_single_notok_plus_os_rev/test.go.id \
--event_dir=/storage/translated/test/BS4096_Max256_LR.2_LRWS8000_single_notok_plus_os_rev/test.go.id

t2t-translate-all \
--t2t_usr_dir=usrdir \
--problem=translate_enid_iwslt32k_notok_plus_os_rev \
--model_dir=/storage/train/BS4096_Max256_LR.2_LRWS8000_single_notok_plus_os_rev \
--source=/storage/corpus/test/IWSLT17.TED.tst2017plus.en-id.en \
--translations_dir=/storage/translated/test/BS4096_Max256_LR.2_LRWS8000_single_notok_plus_os_rev/tst2017plus \
--beam_size=4 \
--alpha=0.6 \
--model=transformer \
--data_dir=/storage/data_notok_plus_os_rev \
--hparams_set=transformer_base \
--hparams=max_length=256,batch_size=4096,learning_rate=0.2,learning_rate_warmup_steps=8000 \
--min_steps=5000

t2t-bleu \
--reference=/storage/corpus/test/IWSLT17.TED.tst2017plus.en-id.id \
--translations_dir=/storage/translated/test/BS4096_Max256_LR.2_LRWS8000_single_notok_plus_os_rev/tst2017plus \
--event_dir=/storage/translated/test/BS4096_Max256_LR.2_LRWS8000_single_notok_plus_os_rev/tst2017plus

t2t-translate-all \
--t2t_usr_dir=usrdir \
--problem=translate_enid_iwslt32k_notok_plus_os_rev \
--model_dir=/storage/train/BS4096_Max256_LR.2_LRWS8000_single_notok_plus_os_rev \
--source=/storage/corpus/test/IWSLT17.TED.tst2010.en-id.en \
--translations_dir=/storage/translated/test/BS4096_Max256_LR.2_LRWS8000_single_notok_plus_os_rev/tst2010 \
--beam_size=4 \
--alpha=0.6 \
--model=transformer \
--data_dir=/storage/data_notok_plus_os_rev \
--hparams_set=transformer_base \
--hparams=max_length=256,batch_size=4096,learning_rate=0.2,learning_rate_warmup_steps=8000 \
--min_steps=5000

t2t-bleu \
--reference=/storage/corpus/test/IWSLT17.TED.tst2010.en-id.id \
--translations_dir=/storage/translated/test/BS4096_Max256_LR.2_LRWS8000_single_notok_plus_os_rev/tst2010 \
--event_dir=/storage/translated/test/BS4096_Max256_LR.2_LRWS8000_single_notok_plus_os_rev/tst2010