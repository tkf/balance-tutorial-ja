============
 ガウス分布
============

.. _gaussian-avg-change-of-variable:

ガウス確率変数の変数変換
========================

確率変数 :math:`X` が平均 :math:`\mu`, 分散 :math:`\sigma^2` の
ガウス分布 に従い, 確率変数 :math:`Z` が平均 0, 分散 1 の
ガウス分布 に従うとする.  これらの確率変数に関する期待値を
:math:`\Avg{\bullet}` と書く. 統計量 :math:`\Avg{f(X)}`
(:math:`f` は適当な関数) は :math:`Z` を用いて,

.. math:: \Avg{f(X)} = \Avg{f(\mu + \sigma Z)}

と計算出来る.

形式的な変数変換で示そう.  平均 :math:`\mu`, 分散 :math:`\sigma^2` の
ガウス確率密度関数を

.. math::

   g_{\mu,\sigma}(x) =
   \frac{1}{\sqrt{2 \pi \sigma^2}}
   \exp \left( - \frac{(x - \mu)^2}{2 \sigma^2} \right)

と書く.  変数変換 :math:`x = \mu + \sigma z` をすれば,

.. math::

   \Avg{f(X)}
   & =
     \int_{-\infty}^\infty \D x \, g_{\mu,\sigma}(x) \, f(x)
   \\
   & =
     \int_{-\infty}^\infty \D z \, \sigma \, g_{\mu,\sigma}(\mu + \sigma z) \,
     f(\mu + \sigma z)
   \\
   & =
     \int_{-\infty}^\infty \D z \, \sigma \,
     \frac{1}{\sqrt{2 \pi \sigma^2}}
     \exp \left( - \frac{(\mu + z \sigma - \mu)^2}{2 \sigma^2} \right)
     f(\mu + \sigma z)
   \\
   & =
     \int_{-\infty}^\infty \D z \, g_{0,1}(z) \, f(\mu + \sigma z)
   \\
   & =
     \Avg{f(\mu + \sigma Z)}
