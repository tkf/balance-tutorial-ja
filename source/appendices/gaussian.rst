.. index:: ガウス分布, Gaussian distribution

.. _gaussian-distribution:

====================================
 ガウス分布 (Gaussian distribution)
====================================

.. seealso::

   `正規分布 - Wikipedia
   <http://ja.wikipedia.org/wiki/%E6%AD%A3%E8%A6%8F%E5%88%86%E5%B8%83>`_

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


.. _gaussian-measure:

ガウス測度 (Gaussian measure)
=============================

物理の計算では, いくつものガウス積分が出てくることが多々あり, その度に
:math:`\D z \, g_{0,1}(z)` などと書くのは煩雑なので, :index:`ガウス測度`
(:index:`Gaussian measure`) と呼ばれる以下の記法を導入する.

.. math:: Dx := \D x \exp(-x^2) / \sqrt{2 \pi}

これを用いれば, :ref:`gaussian-avg-change-of-variable` の公式は

.. math:: \Avg{f(X)} = \int_{-\infty}^\infty Dz \, f(\mu + \sigma z)

とかける.

.. note:: ただの省略のための記法なので, 数学の測度論 (measure theory) とは
   深い関わりなど無いし, そもそも測度論の測度は集合をとる関数なので別物である
   (測度論で似た記法を *別の* 場面で使う流儀はあるが...).  物理の分野では
   :math:`\exp(-x^2) / \sqrt{2 \pi}` と繰り返し書くのが面倒なので使われて
   いるだけである.
