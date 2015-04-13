========================
 空間ゆらぎと時間ゆらぎ
========================

.. 5 Spatial and Temporal Variability の部分について.

ここでは, 以下の2つの問への答えを「同時に」導く:

1. *空間ゆらぎ (クエンチされたゆらぎ)*:
   活動率はニューロンごとにどう違っているのか?
2. *時間ゆらぎ*:
   ニューロンの活動率は, 時間的に一定なのだろうか?
   それとも平均値のまわりを時間的にゆらいでいるのだろうか?

実は, :ref:`fluctuations-of-input` はこのふたつのゆらぎに分解する
ことが出来, さらにその計算のためにはすでに求めた平均活動率 :math:`m_k`
の他に,「秩序変数」 :math:`q_k` さえ分かれば良い.  そして, この計算の
結果からこれらのゆらぎの大きさだけでなく, :ref:`rate-dist` も計算する
ことが出来る.

.. toctree::
   :maxdepth: 2

   quenched_fluctuations
   temporal_fluctuations
   order_parameter_q
   rate_distribution
