pip install --upgrade pip
pip install tensor2tensor==1.7.0

t2t-bleu \
--reference=/storage/corpus/dev/IWSLT17.TED.dev2010.en-id/IWSLT17.TED.dev2010.en-id.id \
--translations_dir=/storage/translated/dev/BS4096_Max256_LR.2_LRWS8000_single_bppt/IWSLT17.TED.dev2010.en-id \
--event_dir=/storage/translated/dev/BS4096_Max256_LR.2_LRWS8000_single_bppt/IWSLT17.TED.dev2010.en-id