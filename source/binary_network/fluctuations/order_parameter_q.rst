.. _order-parameter-q:

================
 秩序変数の計算
================

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

よって, ニューロンの状態
:math:`\sigma_k^i(t) = \Theta(u_k^i(t))`
は

.. math::

   \sigma_k^i(t) = \Theta \left(
     u_k + \sqrt{\beta_k} \, x_i + \sqrt{\alpha_k - \beta_k} \, y_i(t)
   \right)

と書けることが分かった.
この表式では, 時間平均 :math:`\Avg{\bullet}_t` は
確率変数 :math:`y_i(t)` に関する平均と同値
(つまり, :math:`\Avg{f(y_i(t))}_t = \int \D y \, f(y)`)
なので, :math:`m_k^i = \Avg{\AvgDyn{\sigma_k^i(t)}}_t` は

.. math::
   :label: mki-in-xi

   m_k^i = m_k(x_i) = H \left(
     \frac{-u_k - \sqrt{\beta_k} x_i}{\sqrt{\alpha_k - \beta_k}}
   \right)

と書ける.  この表式を用いて :math:`q_k = \PAvg{(m_k^i)^2}` を計算
すると,

.. math::
   :label: qk-self-consistent

   q_k
   = \int Dx \left( m_k(x) \right)^2
   = \int Dx \left\{
     H \left(
       \frac{-u_k - \sqrt{\beta_k} x_i}{\sqrt{\alpha_k - \beta_k}}
     \right)
   \right\}^2

となる.  クエンチされたゆらぎ :math:`\beta_k` が :math:`q_k` に依存
していることを思い出せば, この式は秩序変数 :math:`q_k` が満たすべき関係式
であり, :math:`q_k` を陰に定義していることが分かる.

* 時間ゆらぎが無い場合 :math:`\alpha_k - \beta_k = 0`:

  :math:`\sigma_k^i(t) = \Theta \left(u_k + \sqrt{\beta_k} \, x_i \right)`
  は :math:`y_i(t)` に依存しないので,
  :math:`m_k^i = \Avg{\AvgDyn{\sigma_k^i(t)}}_t
  = \Theta \left(u_k + \sqrt{\beta_k} \, x_i \right)`
  [#]_ となるから, :math:`(m_k^i)^2 = m_k^i` より,

  .. math::

     q_k
     = \int Dx \, \left( m_k(x) \right)^2
     = \int Dx \, m_k(x)
     = m_k

  である.  :ref:`temporal-fluctuations` で導いた関係式
  より,
  :math:`\alpha_k - \beta_k = \sum_{l=E,I} J_{kl}^2 (m_l - q_l) = 0`
  となり, 時間ゆらぎが無いという仮定と整合性があるので,
  :math:`q_k = m_k` は式 :eq:`qk-self-consistent` の解のひとつ
  である.  この解を, 原著 [vanVreeswijk1998]_ にならい
  :index:`凍結解` (:index:`frozen solution`) と呼ぶ.
  時間ゆらぎは二乗の平均なので正, つまり
  :math:`\sum_{l=E,I} J_{kl}^2 (m_l - q_l)` は正である.

  また, :math:`0 \le m_k(x_i) \le 1` より, 各点 :math:`x_i` で
  :math:`m_k(x_i)^2 \le m_k(x_i)` だから,
  :math:`\PAvg{m_k(x_i)^2} \le \PAvg{m_k(x_i)} = m_k`,
  つまり凍結解 :math:`q_k = m_k` は秩序変数 :math:`q_k`
  の上限を与えることが分かる.

  .. [#] この場合の時間平均活動率
     :math:`m_k^i = \Theta \left(u_k + \sqrt{\beta_k} \, x_i \right)`
     は, :math:`\alpha_k - \beta_k > 0` の場合の :ref:`q-function` を用いた
     表式 :eq:`mki-in-xi` の極限 :math:`\alpha_k - \beta_k \to 0^+` でもある.

* クエンチされたゆらぎがない場合 :math:`\beta_k = 0`:

  式 :eq:`qk-self-consistent` に :math:`\beta_k = 0` を代入すると,
  :math:`m_k(x_i) = H({-u_k}/{\sqrt{\alpha_k}})` は :math:`x_i` に
  依存しなくなり,

  .. math::

     q_k
     = \int Dx \left\{
       H \left(
         \frac{-u_k}{\sqrt{\alpha_k}}
       \right)
     \right\}^2
     = \underbrace{
       \left\{
         H \left(
           \frac{-u_k}{\sqrt{\alpha_k}}
         \right)
       \right\}^2
     }_{= (m_k)^2}
     \underbrace{
       \int Dx
     }_{= 1}
     = (m_k)^2

  となる.  しかし, :ref:`quenched-fluctuations` で求めた関係式
  :math:`\beta_k = \sum_{l=E,I} J_{kl}^2 q_l` にこれをあてはめると,
  :math:`m_k = 0` または :math:`J_{kl} = 0` というトリビアルな状況を
  除けば, :math:`\beta_k > 0` となり, 仮定 :math:`\beta_k = 0` とは
  整合性がとれない.  よって, :math:`q_k = (m_k)^2` は解ではない.
  一方で, イェンゼンの不等式 (Jensen's inequality) [#]_ を用いれば,
  :math:`\PAvg{(m_k^i)^2} \ge (\PAvg{m_k^i})^2 = (m_k)^2`, つまり
  クエンチされたゆらぎがない場合 :math:`\beta_k = 0` が
  秩序変数 :math:`q_k` の下限を与えることが分かる.

  .. [#] (下に)凸関数 :math:`f(x)` と :math:`x` に関する平均 :math:`\Avg{\bullet}`
     について, :math:`f(\Avg{x}) \le \Avg{f(x)}` が成り立つ.  これを,
     :index:`イェンゼンの不等式` (:index:`Jensen's inequality`) という.
     参考: `イェンゼンの不等式 - Wikipedia
     <http://ja.wikipedia.org/wiki/%E3%82%A4%E3%82%A7%E3%83%B3%E3%82%BC%E3%83%B3%E3%81%AE%E4%B8%8D%E7%AD%89%E5%BC%8F>`_
     /
     `Jensen's inequality - Wikipedia
     <http://en.wikipedia.org/wiki/Jensen%27s_inequality>`_
