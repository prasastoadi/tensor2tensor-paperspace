pip install -qU tensorflow==1.8.0
pip install -qU tensor2tensor
pip install gcloud

mkdir /storage/usr_dir/
echo "import os" >> /storage/usr_dir/__init__.py

t2t-translate-all \
--t2t_usr_dir=/storage/usr_dir \
--problem=translate_enid_iwslt32k \
--model_dir=/storage/train/BS1024_Max256_LR.2_LRWS16000_test \
--source=/storage/tst2017plus/IWSLT17.TED.tst2017plus.en-id.tok.en \
--translations_dir=/storage/translated/BS1024_Max256_LR.2_LRWS16000_test \
--beam_size=4 \
--alpha=0.6 \
--model=transformer \
--data_dir=/storage/data \
--hparams_set=transformer_base \
--hparams=max_length=256,batch_size=1024,learning_rate=0.2,learning_rate_warmup_steps=16000

t2t-bleu \
--reference=/storage/tst2017plus/IWSLT17.TED.tst2017plus.en-id.tok.id \
--translations_dir=/storage/translated/BS1024_Max256_LR.2_LRWS16000_test/ \
--event_dir=/storage/translated/BS1024_Max256_LR.2_LRWS16000_test/event
