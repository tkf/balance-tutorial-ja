====================
 平均場方程式の導出
====================


.. math::

   m_k^i (t) = \AvgDyn{\sigma_k^i(t)}

単位時間あたりにニューロン :math:`i` が状態を 1 に遷移する確率は
:math:`\Prob \{ \Theta(u_k^i (t)) = 1 \} / \tau_k` で与えられている
ので, :ref:`time_evolution_of_expectation` の関係式を用いれば,

.. math::

   \tau_k \frac{\D}{\D t} m_k^i (t)
   = - m_k^i (t) + \Prob \{ \Theta(u_k^i (t)) = 1 \}

.. todo:: なぜ :math:`\Prob \{ \Theta(u_k^i (t)) = 1 \} / \tau_k`
   なのか, 詳しく説明する.

と書くことができる.
ここで、 :math:`\Prob \{ \texttt{event} \}` は
:math:`\texttt{event}` が起こる確率、つまり
:math:`\Prob \{ \Theta(u_k^i (t)) = 1 \}` は
:math:`\Theta(u_k^i (t))` が 1 になる確率を表す。

ニューロン :math:`i` が
:math:`n_E(t)` 個の興奮性ニューロンと
:math:`n_I(t)` 個の抑制性ニューロンから
入力を受けているとすれば、その全入力は

.. math::

   u_k^i (t) = \sqrt K J_{k0} m_0
               + \frac{J_{kE}}{\sqrt K} n_E (t)
               + \frac{J_{kI}}{\sqrt K} n_I (t)
               - \theta_k

となる。つまり、この入力が正である確率は

.. math::

   \Prob \{ \Theta(u_k^i) = 1 \}
   &=
   \sum_{n_1, n_2 = 0}^\infty
   p_1(n_1 | m_1) \, p_2(n_2 | m_2) \,
   \Theta \left(
     \sqrt K J_{k0} m_0
     + \sum_{l=1,2} \frac{J_{kl}}{\sqrt K} n_l
     - \theta_k
   \right) \\
   &=:
   F_k(m_E, m_I)

となる。ただし、 :math:`p_l (n_l | m_l)` は集団
:math:`l \in \{E, I\}` の活動率が :math:`m_l` の時に
ニューロン :math:`i` が集団 :math:`l` から :math:`n_l` 個の入力を受け
る確率であり、

.. math::

   p_l (n_l | m_l)
   & \xrightarrow{N \to \infty}
     \sum_{s=n}^\infty \frac{K^s}{s!} \E^{-K}
     \begin{pmatrix}
       s \\ n
     \end{pmatrix}
     (m_l)^n (1 - m_l)^{s-n}
   \\
   & =
     \frac{(m_l K)^n}{n!} \E^{-m_l K}

で定められる。

.. todo:: 最初の等式を示す

最後の等式は、 :math:`\exp` の定義に基づけば、以下の計算で確認できる。

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

この確率分布の元で、 :math:`n_l` の平均と分散は

.. math::

   \Expect \{ n_l \}
   = \Var \{ n_l \}
   = m_l K

で定められる。極限 :math:`K \to \infty` で

.. math::

   p_l (n_l | m_l)
   =
   \frac{1}{\sqrt{2 \pi m_l K}}
   \exp \left( - \frac{(n_l - m_l K)^2}{2 m_l K} \right)

であるから、確率 :math:`F_k(m_E, m_I)` は

.. todo:: 途中式を入れる

.. math::

   F_k(m_E, m_I)
   \xrightarrow{K \to \infty}
   \int Dx \, \Theta (u_k + \sqrt{\alpha_k} x)
   = H \left( \frac{- u_k}{\sqrt{\alpha_k}} \right)

と計算できる。ここで :math:`Dx = \D x \exp(-x^2) / \sqrt{2 \pi}` である。


.. math::

   u_k
   = (J_{k0} m_0 + J_{kE} m_E + J_{kl} m_l) \sqrt K - \theta_k


.. math::

   \alpha_k
   = (J_{kE})^2 m_E + (J_{kI})^2 m_I
