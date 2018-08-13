# coding=utf-8
# Copyright 2018 The Tensor2Tensor Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Data generators for En-Id translation."""

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

# Dependency imports

from tensor2tensor.data_generators import problem
from tensor2tensor.data_generators import text_encoder
from tensor2tensor.data_generators import translate
from tensor2tensor.utils import registry
from tensor2tensor.models import transformer

from tensor2tensor.data_generators import librispeech
from tensor2tensor.layers import common_attention
from tensor2tensor.layers import common_hparams
from tensor2tensor.layers import common_layers
from tensor2tensor.utils import beam_search
from tensor2tensor.utils import expert_utils
from tensor2tensor.utils import registry
from tensor2tensor.utils import t2t_model

# End-of-sentence marker.
EOS = text_encoder.EOS_ID

_REPO = "https://github.com/prasastoadi/parallel-corpora-en-id/raw/master/"

# OpenSubtitles2018 :
# 9268181 sentences
_ENID_TRAIN_DATASETS = [
    [
        "http://opus.nlpl.eu/download/OpenSubtitles2018/en-id.txt.zip",
        ("OpenSubtitles2018.en-id.en", "OpenSubtitles2018.en-id.id")
    ],
]

# IWSLT17 :
# 683 sentences
# https://wit3.fbk.eu/mt.php?release=2017-01-more
_ENID_TEST_DATASETS = [
    [
        _REPO + "IWSLT17.TED.dev2010.en-id.tgz",
        ("IWSLT17.TED.dev2010.en-id.en",
         "IWSLT17.TED.dev2010.en-id.id")
    ]
]


@registry.register_problem
class TranslateEnidIwslt32kNotok(translate.TranslateProblem):
  """Problem spec for IWSLT'15 En-Vi translation."""

  @property
  def approx_vocab_size(self):
    return 2**15  # 32768

  @property
  def vocab_filename(self):
    return "vocab.enid.%d" % self.approx_vocab_size

  def source_data_files(self, dataset_split):
    train = dataset_split == problem.DatasetSplit.TRAIN
    return _ENID_TRAIN_DATASETS if train else _ENID_TEST_DATASETS

@registry.register_problem
class TranslateEnidIwslt32kOs(translate.TranslateProblem):
  """Problem spec for IWSLT'15 En-Vi translation."""

  @property
  def approx_vocab_size(self):
    return 2**15  # 32768

  @property
  def vocab_filename(self):
    return "vocab.enid.%d" % self.approx_vocab_size

  def source_data_files(self, dataset_split):
    train = dataset_split == problem.DatasetSplit.TRAIN
    return _ENID_TRAIN_DATASETS if train else _ENID_TEST_DATASETS