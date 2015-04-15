.. _mft:

====================
 平均場方程式の導出
====================

ニューロン :math:`i` の初期値 :math:`\sigma_k^i(0)` とその更新のランダム性に
関する平均を :math:`\AvgDyn{\bullet}` と書き, ニューロン :math:`i`
の(局所)活動率を

.. math::

   m_k^i (t) = \AvgDyn{\sigma_k^i(t)}

と定義する.

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

   すべてのニューロンについて, それに結合しているすべての
   ニューロンの活動が無相関である.

.. [#]
   原著 [vanVreeswijk1998]_ にはにこう書いてある:

     The main assumption underlying the mean-field theory is that the
     activities of the different input cells to a given cell are
     uncorrelated.  Technically, this holds rigorously provided that
     :math:`K \ll \log N_k` (Derrida et al., 1987).

     --- p.1365 (p.45), Appendix A.1, van Vreeswijk, Sompolinsky (1998)

.. note:: 自然言語は難しい. これを数学的に書き下すと以下の命題となる.

   すべてのニューロン :math:`i = 1, \ldots, N_k` について, それに
   結合するいかなる集団 :math:`l = E, I` の
   いかなる2つのニューロン :math:`j, j' = 1, \ldots, N_l`
   についても, :math:`j \neq j', J_{kl}^{ij} \neq 0, J_{kl}^{ij'} \neq 0`
   ならば

   .. math::

      \AvgDyn{ \left(
        \sigma_l^j(t) \, \sigma_l^{j'}(t)
        -
        \AvgDyn{\sigma_l^j(t) \, \sigma_l^{j'}(t)}
      \right)^2}
      = 0

   が, すべての時間 :math:`t` について成り立つ.

   .. todo:: 「すべての時間 :math:`t` について」は正しいのか?

   .. todo:: 上記の correlation の定義は正しいのか?

:ref:`self-averaging` を :math:`[\Theta(u_k^i (t))]_i`
の計算に適用すれば, :math:`[\bullet]_i` と :math:`\AvgJ{\bullet}` を
交換することが出来て,

.. todo:: 自己平均性 (self-averaging property) は仮定するものなのか？
   先の独立の仮定から導けるものなのか？

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
   & := (J_{k0} m_0 + J_{kE} m_E + J_{kl} m_l) \sqrt K - \theta_k,
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
