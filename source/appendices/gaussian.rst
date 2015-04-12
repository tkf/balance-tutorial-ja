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


.. _q-function:

Q関数
=====

標準ガウス分布の裾 (tail) は :index:`Q関数` (:index:`Q-function`) と呼ばれ,
ガウス分布を取り扱う計算では頻出である.

.. math:: Q(z) := \int_z^\infty \frac{\D x}{\sqrt{2 \pi}} \exp(- x^2 / 2)

興奮・抑制平衡のオリジナルの論文 [vanVreeswijk1998]_ ではこのQ関数は
:math:`H(z)` と表記され, :index:`相補誤差関数`
(:index:`complementary error function`, :index:`erfc`)
と呼ばれているが, 広く使われている定義

.. math::

   \text{erfc}(x)
   :=
   \frac{2}{\sqrt \pi} \int_x^\infty \D t \, \exp(-t^2)

からは, 少し違う.  erfc と Q関数 の間には,

.. math:: Q(z) = \frac{1}{2} \text{erfc}(z/\sqrt 2)

の関係がある.

.. seealso::

   `Q-function - Wikipedia
   <http://en.wikipedia.org/wiki/Q-function>`_

   `Error function - Wikipedia
   <http://en.wikipedia.org/wiki/Error_function>`_

   `誤差関数 - Wikipedia
   <http://ja.wikipedia.org/wiki/%E8%AA%A4%E5%B7%AE%E9%96%A2%E6%95%B0>`_


.. _gauss-integrals-of-heaviside-function-and-q-function:

ヘヴィサイド関数の多重ガウス積分とQ関数
=======================================

ヘヴィサイド関数 :math:`\Theta(x) = 0` (:math:`x < 0`),
:math:`\Theta(x) = 1` (:math:`x > 0`), の多重ガウス積分とQ関数
には次の関係が成り立つ.

.. math::

   \int \left( \prod_i Dx_i \right) \,
   \Theta \left( \sum_i c_i x_i + u \right)
   =
   Q \left( - \frac{u}{\sqrt{\sum_i c_i^2}} \right)

ただし, 積と和は :math:`i=1` から :math:`i=M` までについておこない,
積分区間は :math:`\mathbb R^M` 全体とする.

まずは :math:`M = 2` の場合について示す.
:math:`a = c_1`, :math:`b = c_2`, :math:`\alpha = a^2 + b^2`
とする.

二次元ベクトル :math:`(a, b)^\intercal` に沿った単位ベクトル
を :math:`\bm r = (a, b)^\intercal / \sqrt \alpha` と定義
する. [#]_ これに直交した2つある単位ベクトル
:math:`\bm s = (s_1, s_2)^\intercal` のうち, 行列式
が :math:`\det (\bm r, \bm s) = 1` となるものを選ぶ.

.. [#] :math:`x_1` と :math:`x_2` に関するガウス積分を
   :math:`(a, b)^\intercal` の軸に沿ったガウス積分とそれに
   直交する軸に沿ったガウス積分に分ける, というアイディアである.

.. todo:: なぜ行列式が1になるものを選ぶのか, 説明する.  積分の方向が
   「ひっくり返らない」ようにするためだが, ちゃんと形式的に説明する.

これらの仮定, つまり,

.. math::

   \bm r \cdot \bm s \propto a s_1 + b s_2 = 0

   \det (\bm r, \bm s) = (a s_2 - b s_1) / \sqrt \alpha = 1

より, [#]_ :math:`\bm s = (-b, a)^\intercal / \sqrt \alpha`

.. [#] 第一式より :math:`a s_1 = - b s_2`, 第二式の両辺に :math:`a`
   をかけて :math:`(a^2 s_2 - b (a s_1)) / \sqrt \alpha = a` なので,
   :math:`s_2 = a / \sqrt \alpha`.  第一式より,
   :math:`s_1 = - b / \sqrt \alpha` である.

変数変換

.. math::

   r = \bm r \cdot (x_1, x_2)^\intercal = (a x_1 + b x_2) / \sqrt \alpha

   s = \bm s \cdot (x_1, x_2)^\intercal = (-b x_1 + a x_2) / \sqrt \alpha

を施す.  ヤコビアンは,

.. math::

   \det \frac{\partial (x, y)}{\partial (r, s)}
   = \left(
     \det \frac{\partial (r, s)}{\partial (x, y)}
   \right)^{-1}
   = \frac{1}{\det (\bm r, \bm s)}
   = 1

なので, :math:`\D x \D y = \D r \D s` である.  さらに,
:math:`r^2 + s^2 = x_1^2 + x_2^2` なので, 結局,
:math:`Dx_1 Dx_2 = Dr Ds` である.

.. math::

   &
     \int Dx_1 Dx_2 \, \Theta (a x_1 + b y_2 + u)
   \\
   & =
     \int Dr \underbrace{\int Ds}_{=1} \, \Theta (\sqrt \alpha r + u)
   \\
   & =
     \int Dr \, \Theta (r + u / \sqrt \alpha)
     =
     \int_{-u / \sqrt \alpha}^\infty Dr
   \\
   & =
     Q \left( - \frac{u}{\sqrt \alpha} \right)


一般の :math:`M` に関して成り立つことは, 帰納法で確かめられる.
