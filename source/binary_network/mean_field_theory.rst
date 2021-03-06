.. _mft:

====================
 平均場方程式の導出
====================

ニューロン :math:`i` の初期値 :math:`\sigma_k^i(0)` とその更新のランダム性と
初期値 :math:`\bm \sigma` に 関する平均を :math:`\AvgDyn{\bullet}` [#]_ と書き,
ニューロン :math:`i` の(局所)活動率を

.. math::

   m_k^i (t) = \AvgDyn{\sigma_k^i(t)}

と定義する.

.. [#] 初期値 :math:`\bm \sigma` に関する平均とは, 時刻 0 での集団活動率
   :math:`m_k(0)` が :math:`\sigma_k^i(0)` が 1 の確率で,
   それぞれの :math:`i` について :math:`\sigma_k^i(0)` が独立, という
   確率分布に関する平均である.
..
   平均 :math:`\AvgDyn{\bullet}` は「試行平均」ともみなせる.

.. todo:: 他の場所では, :math:`\AvgDyn{\bullet}` は使われていない.  使うべき?
   例えば, 他の場所では :math:`m_k = \PAvg{\sigma_k^i}` だけど, ここでは
   :math:`m_k = \PAvg{\AvgDyn{\sigma_k^i}}` である.

ニューロン :math:`i` への入力が閾値を超える確率 [#]_ は, 更新時間のランダム性
に関する平均 :math:`\AvgDyn{\Theta(u_k^i (t))}` で表すことが出来る.
[#]_  さらに, 更新のタイミングはポアソン過程で表され, 入力が閾値を超えていた
場合に状態 1 へ遷移する単位時間当たりの条件付き確率は, :math:`1 / \tau_k`
である. こられらを合わせると, 単位時間あたりにニューロン :math:`i` が状態を
1 に遷移する確率は :math:`\AvgDyn{\Theta(u_k^i (t))} / \tau_k` で与えら
れていることが分かる. :ref:`time_evolution_of_expectation` の関係式を用いれば,

.. math::

   \tau_k \frac{\D}{\D t} m_k^i (t)
   = - m_k^i (t) + \AvgDyn{\Theta(u_k^i (t))}

と書くことができる.

.. [#] 正確には, 系の状態 :math:`\bm \sigma` が与えられた時の条件付き確率, である.

.. [#] 確率変数 :math:`X` について事象 :math:`X \in A` が起こる確率は
   指示関数 (indicator function) :math:`1_A(X)` を用いて
   :math:`\Prob \{ X \in A \} = \Expect \{1_A(X)\}` と書けることを
   思い出そう.

この式の集団平均をとる (つまり両辺に :math:`\PAvg{\bullet}_i` を施す) と,
集団活動率 :math:`m_k` のダイナミクスを表す式

.. math::

   \tau_k \frac{\D}{\D t} m_k (t)
   = - m_k (t) + \PAvg{\AvgDyn{\Theta(u_k^i (t))}}_i

を得る. この節では, 右辺第二項

.. math::

   F_k(m_E, m_I) := \PAvg{\AvgDyn{\Theta(u_k^i (t))}}_i

を計算する. 素朴に考えれば右辺は系の微視的な状態 :math:`\bm \sigma`
に依存しているはずだが, 左辺は巨視的な状態, つまり集団活動率 :math:`m_k`
のみに依存することを主張している. この微視的な状態への非依存性
は :math:`F_k(m_E, m_I)` の計算の過程で自動的に出てくる結果である.

確率 :math:`F_k(m_E, m_I)` は以下の仮定 [#]_ のもとで計算することが出来る.

.. admonition:: 仮定

   すべてのニューロンの活動が無相関である.

   形式的に書けば,
   いかなるふたつのニューロン :math:`(i, k)` と :math:`(j, l)`
   (:math:`k, l \in \{E, I\}`, :math:`i = 1, \ldots, N_k`,
   :math:`j = 1, \ldots, N_l`) についても,
   それぞれの活動
   :math:`X = \AvgDyn{\Theta(u_k^i (t))}`,
   :math:`Y = \AvgDyn{\Theta(u_l^j (t))}`
   はすべての時間 :math:`t` について無相関, つまり,

   .. math::

      \lim_{N \to \infty}
      \AvgJ{ \left(
        X - \AvgJ{X}
      \right) \left(
        Y - \AvgJ{Y}
      \right) }
      = 0

   が, 成り立つ.

.. [#]
   原著 [vanVreeswijk1998]_ での仮定は
   「すべてのニューロンについて, それに結合しているすべてのニューロン
   の活動が無相関である」
   であり, 本稿で使っている仮定より若干弱い.  しかし, :ref:`poorf-async`
   より本稿で使っている仮定は [vanVreeswijk1998]_ の仮定と同じ条件
   :math:`K \ll \log N` で成り立つことが分かる.  さらに,
   すべてのニューロンが無相関でなければ, :ref:`elln` が使えない
   (:ref:`self-averaging` を参照).

これは, :math:`K \ll \log N` が成り立てば成り立つ.
詳しい議論については, :ref:`poorf-async` を参照.

:ref:`self-averaging` を :math:`[\Theta(u_k^i (t))]_i`
の計算に適用すれば, :math:`[\bullet]_i` と :math:`\AvgJ{\bullet}` を
交換することが出来て,

.. math::

   F_k(m_E, m_I) \approx \AvgJ{\AvgDyn{\Theta(u_k^i (t))}}

を計算すれば良いことが分かる.

ニューロン :math:`i` が
:math:`n_E(t)` 個の興奮性ニューロンと
:math:`n_I(t)` 個の抑制性ニューロンから
入力を受けているとすれば, その全入力は

.. math::

   u_k^i (t) = \sqrt K J_{k0} m_0
               + \frac{J_{kE}}{\sqrt K} n_E (t)
               + \frac{J_{kI}}{\sqrt K} n_I (t)
               - \theta_k

となる. 確率 :math:`F_k(m_E, m_I)` はこの入力が正である確率であり,

.. math::

   F_k(m_E, m_I)
   &\approx
   \sum_{n_1, n_2 = 0}^\infty
   p_1(n_1 | m_1) \, p_2(n_2 | m_2) \,
   \Theta \left(
     \sqrt K J_{k0} m_0
     + \sum_{l=1,2} \frac{J_{kl}}{\sqrt K} n_l
     - \theta_k
   \right) \\

となる.  ただし,  :math:`p_l (n_l | m_l)` は集団
:math:`l \in \{E, I\}` の活動率が :math:`m_l` の時に
ニューロン :math:`i` が集団 :math:`l` から :math:`n_l` 個の入力を受け
る確率であり,

.. math::

   p_l (n | m_l)
   & \approx
     \sum_{s=n}^\infty
     \underbrace{
       \frac{K^s}{s!} \E^{-K}
     }_{\text{(P1)}}
     \underbrace{
       \begin{pmatrix}
         s \\ n
       \end{pmatrix}
       (m_l)^n (1 - m_l)^{s-n}
     }_{\text{(P2)}}
   \\
   & =
     \frac{(m_l K)^n}{n!} \E^{-m_l K}

となる. ここで, (P1) は集団 :math:`k` のニューロン (どのニューロンでも成立する)
が集団 :math:`l` の :math:`s` 個のニューロンからの結合を持つ確率であり,
(P2) はその :math:`s` 個のニューロンのうち :math:`n` 個のニューロンが活動している
(:math:`\sigma_l^j = 1` である) 確率である.
最後の等式は,  :math:`\exp` の定義に基づけば、以下の計算で確認できる.

.. math::

   &
     \sum_{s=n}^\infty \frac{K^s}{s!} \E^{-K}
     \begin{pmatrix}
       s \\ n
     \end{pmatrix}
     (m_l)^n (1 - m_l)^{s-n}
   \\
   & =
     \sum_{s=n}^\infty \frac{K^s}{s!} \E^{-K}
     \frac{s!}{n! (s-n)!}
     (m_l)^n (1 - m_l)^{s-n}
   \\
   & =
     \frac{\E^{-K} (K m_l)^n}{n!}
     \sum_{s=n}^\infty \frac{K^{s-n}}{(s-n)!}
     (1 - m_l)^{s-n}
   \\
   & =
     \frac{\E^{-K} (K m_l)^n}{n!}
     \E^{K \, (1-m_l)}
   \\
   & =
     \frac{(K m_l)^n}{n!}
     \E^{-K m_l}

この確率分布は平均と分散が :math:`m_l K` の :ref:`poisson-distribution` なの
で, 極限 :math:`K \to \infty`, つまりこの平均と分散が大きな極限では
:ref:`gaussian-distribution`

.. math::

   \frac{1}{\sqrt{2 \pi m_l K}}
   \exp \left( - \frac{(n_l - m_l K)^2}{2 m_l K} \right)

で近似できる.  この極限 :math:`K \to \infty` で,

.. math::

   F_k(m_E, m_I)
   & =
     \sum_{n_1, n_2 = 0}^\infty
     p_1(n_1 | m_1) \, p_2(n_2 | m_2) \,
     \Theta \left(
       \sqrt K J_{k0} m_0
       + \sum_{l=1,2} \frac{J_{kl}}{\sqrt K} n_l
       - \theta_k
     \right)
   \\
   & \overset{(1)} \approx
     \int Dx_1 \, Dx_2 \,
     \Theta \left(
       \sqrt K J_{k0} m_0
       + \sum_{l=1,2} \frac{J_{kl}}{\sqrt K}
         (m_l K + x_l \sqrt{m_l K})
       - \theta_k
     \right)
   \\
   & \overset{(2)} =
     \int Dx_1 \, Dx_2 \,
     \Theta \left(
       u_k + \sum_{l=1,2} x_l J_{kl} \sqrt{m_l}
     \right)
   \\
   & \overset{(3)} =
   \int Dx \, \Theta (u_k + \sqrt{\alpha_k} x)
   \\
   & \overset{(4)} =
     H \left( \frac{- u_k}{\sqrt{\alpha_k}} \right)

と計算できる. ここで,

.. math::

   Dx & := \D x \exp(-x^2) / \sqrt{2 \pi}
   \\
   u_k
   & := (J_{k0} m_0 + J_{kE} m_E + J_{kI} m_I) \sqrt K - \theta_k,
   \\
   \alpha_k
   & := (J_{kE})^2 m_E + (J_{kI})^2 m_I
   \\
   H(z)
   & := \int_z^\infty \frac{\D x}{\sqrt{2 \pi}} \exp(- x^2 / 2)

である.  上記の :math:`u_k` と :math:`\alpha_k` はただ変数に名前をつけた
だけだが, これらの物理的意味については :ref:`fluctuations-of-input` を参照せよ.
:math:`Dx` は :ref:`gaussian-measure` と呼ばれるただの省略記号である.
関数 :math:`H(z)` は :ref:`q-function` と呼ばれる関数である.
上の計算では,
(1) :math:`n_l \approx m_l K + x_l \sqrt{m_l K}` なる近似と
:ref:`gaussian-avg-change-of-variable`,
(2) :math:`u_k` の定義,
(3) :ref:`gauss-integrals-of-heaviside-function-and-q-function` の関係,
(4) :math:`H(z)` の定義
をそれぞれ用いた.


.. _poorf-async:

無相関性の「証明」
==================

以下の議論は [Derrida1987]_ に依る.

今, 初期状態から :math:`n` 回の更新が起こったとする.  いかなるニューロンも,
:math:`n` 回の更新の前まで遡れば最大でも :math:`K^n` 個 [#]_ のニューロンの
初期状態に依存している.
2つのニューロンから伸びる「木」はそれぞれ平均で :math:`K^n` の「枝」をもつ.
この中で最低でも1つの枝が同じニューロンに繋がっている確率は,
(1) 2つの木からそれぞれの1つの枝を選ぶ方法の総数と,
(2) 1つのニューロンの選び方の総数と,
(3) ある1つのニューロンを2回選ぶ確率
の積なので,

.. math::
   p =
   \underbrace{(K^n)^2 \vphantom{\frac 1 2}}_{(1)}
   \underbrace{N \vphantom{\frac 1 2}}_{(2)}
   \underbrace{\frac 1 {N^2}}_{(3)}
   =
   O(K^{2n} / N)

となる.
これが 0 に漸近する, つまり :math:`p \ll 1` (as :math:`N \to \infty`) という
条件から, :math:`K^n \ll \sqrt N` が導かれる.
いかなる自然数 :math:`n` でもこれが成り立つには
:math:`K \ll \log N` であれば十分である.

.. [#] ただし, 各ニューロンの結合の数が平均 :math:`K` 個のまわりでゆらいで
   いる効果は無視している.
