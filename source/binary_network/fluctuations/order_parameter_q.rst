.. _order-parameter-q:

================
 秩序変数の計算
================

.. todo:: 秩序変数の計算を説明する

これまでの計算で, クエンチされたゆらぎ(空間ゆらぎ)と時間ゆらぎを
集団平均活動率 :math:`m_k` と秩序変数 :math:`q_k` で
表すことが出来ると分かったが, 秩序変数 :math:`q_k` の計算方法
がまだ分からないので, これでは答えを得たとは言えない.
ここでは, 秩序変数 :math:`q_k` が満たすべき関係式
(:index:`自己無頓着` (:index:`self-consistent`) 方程式)
を導く.

:ref:`mft` と同様に, ニューロンの状態
:math:`\sigma_k^i(t) = \Theta(u_k^i(t))`
を標準ガウス確率変数で書きなおそう.  今度は, 入力 :math:`u_k^i(t)`
のゆらぎをクエンチされたゆらぎ(空間ゆらぎ)と時間ゆらぎをに分け,
それぞれ独立な標準ガウス確率変数 :math:`x_i` と :math:`y_i(t)` で
表す.  [#]_
つまり, 確率変数 :math:`x_i` と :math:`y_i(t)` は
:math:`\PAvg{x_i}_i = \Avg{y_i(t)}_t = 0` と
:math:`\PAvg{(x_i)^2}_i = \Avg{(y_i(t))^2}_t = 1` を
満たすとする.  これらの確率変数を用いて入力を

.. math::

   u_k^i(t) = u_k + c x_i + d y_i(t)

と書いて実数 :math:`c, d` を求めよう.
:ref:`quenched-fluctuations` の結果と

.. math::

   \left[ \left( \Devi \Avg{u_k^i(t)}_t \right)^2 \right]
   =
   \left[ \left( \Devi (c x_i) \right)^2 \right]
   =
   \left[ \left( c x_i \right)^2 \right]
   =
   c^2

より, :math:`c = \sqrt{\beta_k}`,
:ref:`temporal-fluctuations` の結果と

.. math::

   \Avg{
     \left[\left(
       u_k^i(t) - \Avg{u_k^i(t)}_t
     \right)^2 \right]_i
   }_{t}
   =
   \Avg{
     \left[\left(
       d y_i(t)
     \right)^2 \right]_i
   }_{t}
   =
   d^2

より, :math:`d = \sqrt{\alpha_k - \beta_k}` が言える.

.. [#] 確率変数 :math:`x_i` とある時間 :math:`t` における
   時間ゆらぎ成分を表す確率変数 :math:`y_i(t)` は独立だが,
   違う時間 :math:`t' \neq t` と比べて, :math:`y_i(t)` と
   :math:`y_i(t')` が独立, という意味では **ない**.
   確率変数 :math:`y_i(t)` と :math:`y_i(t')` はもちろん相関
   を持ち, その相関構造は :math:`u_k^i(t)` の自己相関関数を
   計算することで理解できる.

.. todo:: なぜ **独立** な 標準 **ガウス** 確率変数 で書けるのか説明

よって, ニューロンの状態
:math:`\sigma_k^i(t) = \Theta(u_k^i(t))`
は

.. math::

   \sigma_k^i(t) = \Theta \left(
     u_k + \sqrt{\beta_k} x_i + \sqrt{\alpha_k - \beta_k} y_i(t)
   \right)

と書けることが分かった.
この表式では, 時間平均 :math:`\Avg{\bullet}_t` は
確率変数 :math:`y_i(t)` に関する平均と同値
(つまり, :math:`\Avg{f(y_i(t))}_t = \int \D y \, f(y)`)
なので,

.. math::

   m_k^i = m_k(x_i) = H \left(
     \frac{-u_k + \sqrt{\beta_k} x_i}{\sqrt{\alpha_k - \beta_k}}
   \right)

と書ける.  この表式を用いて :math:`q_k = \PAvg{(m_k^i)^2}` を計算
すると,

.. math::

   q_k = \int Dx \left[
     H \left(
       \frac{-u_k + \sqrt{\beta_k} x_i}{\sqrt{\alpha_k - \beta_k}}
     \right)
   \right]^2

となる.  クエンチされたゆらぎ :math:`\beta_k` が :math:`q_k` に依存
していることを思い出せば, この式は :math:`q_k` が満たすべき関係式
であり, :math:`q_k` を陰に定義していることが分かる.

.. todo:: 解の個数や安定性について書く.
