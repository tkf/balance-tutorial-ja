.. _asymptotics:

================================
 漸近解析 (Asymptotic analysis)
================================


.. list-table::
   :header-rows: 1
   :widths: 10 10 30 30

   * - 記号
     -
     - 定義
     - 意味
   * - :math:`f = O(g)`
     - :math:`f \lesssim g`
     - :math:`\limsup_{x \to \infty} |f(x)/g(x)| < \infty`
     - :math:`f` の増加は :math:`g` より遅いか同じ
   * - :math:`f = o(g)`
     - :math:`f \ll g`
     - :math:`\lim_{x \to \infty} f(x)/g(x) = 0`
     - :math:`f` の増加は :math:`g` より遅い
   * - ---
     - :math:`f \sim g`
     - :math:`\lim_{x \to \infty} f(x)/g(x) = 1`
     - :math:`f` が :math:`g` に漸近する
   * - :math:`f = \Theta(g)`
     - :math:`f \asymp g`
     - :math:`f \lesssim g \lesssim f`
     - :math:`f` と :math:`g` は同速度で増加
   * - :math:`f = \Omega(g)`
     - ---
     - :math:`g = O(f)`
     - :math:`f` の増加は :math:`g` より速いか同じ
   * - :math:`f = \omega(g)`
     - ---
     - :math:`g = o(f)`
     - :math:`f` の増加は :math:`g` より速い

* :math:`f \ll g` を :math:`f = O(g)` と定義するか, :math:`f = o(g)` と定義するかは
  文献に依るようだ.  ここでは, :math:`f \ll g` は :math:`f = o(g)` で定義し,
  :math:`f = O(g)` と同値の二項関係は :math:`f \lesssim g` と書く.  しかし, この記法は
  慣例的なものではない.
* :math:`f \sim g` を :math:`f \lesssim g \lesssim f` で定義する流儀もある [#]_ ようだが, ここでの
  定義とは違う.
* 記号 :math:`\approx` や :math:`\lessapprox` は漸近関係では\ **無く**\
  荒い議論で発見的な説明するときなどに使う.

.. [#] `254A, Notes 0: A review of probability theory | What's new
   <https://terrytao.wordpress.com/2010/01/01/254a-notes-0-a-review-of-probability-theory/>`_



.. _method-of-dominant-balance:

支配項均衡の方法
================

:index:`支配項均衡の方法` (:index:`method of dominant balance`)
とは, 3項以上がからんだ方程式のある少数の項 (例えば2項だけ) が
他の項に比べて非常に大きい場合に, その少数の項だけの方程式と
みなして (漸近的な) 解を求める方法である.

二次方程式の解の公式を知らないふりをして

.. math:: x^2 + C x + 1 = 0

の :math:`C \to \infty` についての漸近的な解を求めよう.
各項に :math:`a = x^2`, :math:`b = C x`, :math:`c = 1`
と名前をつける.
まず項 :math:`b = C x` がどのオーダーを持つか仮定し,
それに基づいて計算した他の項のオーダーを使って一番
大きなオーダーが釣り合うか, つまり同じ大きさのオーダーが
ふたつあるか, を確かめる.  釣り合いが示せたならば,
釣り合った項を漸近関係 :math:`\sim` で結んだ式を解く.
例えば, 項 :math:`b` と :math:`c` が釣り合い,
項 :math:`a` がそれらに比べて小さい, つまり
:math:`a \ll b \asymp c` なら,
:math:`b \sim - c` という式を解けばいい.

1. 仮定: :math:`C x \asymp 1`

   仮定より :math:`x \asymp 1 / C` だから,
   :math:`x^2 \asymp (1 / C)^2` となる.
   項 :math:`b` と :math:`c` が釣り合い,
   項 :math:`a` はそれらに比べて小さいので無視できる.
   方程式は :math:`C x \sim -1` と書くことが出来る.
   解は :math:`x \sim - 1 / C` である.

2. 仮定: :math:`C x \asymp C`

   仮定より :math:`x \asymp 1` だから,
   :math:`x^2 \asymp 1` となる.
   項 :math:`a`, :math:`c` はともに 1 のオーダー
   であり, 項 :math:`b \asymp C` とは釣り合わない.

3. 仮定: :math:`C x \asymp C^2`

   仮定より :math:`x \asymp C` だから,
   :math:`x^2 \asymp C^2` となる.
   項 :math:`a`, :math:`b` はともに :math:`C^2` のオーダーで,
   項 :math:`c` はそれらに比べて小さいので無視できる.
   方程式は :math:`x^2 \sim - C x` と書くことが出来る.
   解は :math:`0` か :math:`-C` が考えられるが, :math:`x = 0` は
   :math:`x \asymp C` を満たさないので,
   :math:`x \sim -C` が解である.

以上の考察から, 解は :math:`x \sim -1/C, -C` であることが分かった.
二次方程式の解の公式にあてはめると, 厳密解は

.. math:: x_{\pm} = \frac{-C \pm \sqrt{C^2 - 4}}{2}

となる.  この厳密解が支配項均衡の方法で求めた漸近解に
漸近し :math:`x_- \sim -C`, :math:`x_+ \sim -1/C` となることは,

.. math::

   \lim_{C \to \infty} \frac{x_-}{-C} =
   \lim_{C \to \infty} \frac{-1 - \sqrt{1 - 4 / C^2}}{-2} = 1

.. math::

   \lim_{C \to \infty} \frac{x_+}{-1/C} =
   \lim_{C \to \infty} \frac{-1 + \sqrt{1 - 4 / C^2}}{-2 / C^2}
   \overset{(1)} =
   \lim_{\epsilon \to 0} \frac{1 - \sqrt{1 - 4 \epsilon}}{2 \epsilon}
   \overset{(2)} =
   \lim_{\epsilon \to 0} \frac{1}{\sqrt{1 - 4 \epsilon}} = 1

より確かめられる.
ただし, (1) :math:`\epsilon = 1/C^2` なる変数変換と,
(2) ロピタルの定理__ を使った.
後者の計算から分かるように, :math:`x_+` のふるまいは, 厳密解
がわかっていても自明では無い.  しかし, 支配項均衡の方法を
用いれば簡単に漸近解を導ける.

__ http://ja.wikipedia.org/wiki/ロピタルの定理

.. seealso::

   `Asymptotic analysis - Wikipedia
   <http://en.wikipedia.org/wiki/Asymptotic_analysis>`_
     このページの
     `Method of dominant balance
     <http://en.wikipedia.org/wiki/Asymptotic_analysis#Method_of_dominant_balance>`_
     という項目では, 常微分方程式を漸近解析を使って解く例が紹介されている.

   `Perturbation & Asymptotic Series - YouTube
   <https://www.youtube.com/playlist?list=PL43B1963F261E6E47>`_
     摂動法と漸近解析の講義ビデオ.  一部の応用例の紹介で量子力学などの物理学
     の知識が必要な部分があるが, メインの流れは学部1年生のレベルの数学さえ
     理解していれば追いかけられるだろう.  理論科学一般に興味のある人には
     大変おすすめである.
