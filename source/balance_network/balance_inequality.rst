================
 均衡条件不等式
================

ここでは, :ref:`strong-feedback-system` の解析を興奮・抑制ネットワーク
にあてはめ, このネットワークは「発火率がゼロあるいは飽和するような固定点
は持たない」という条件から, :index:`均衡条件不等式` を導く.
:ref:`strong-feedback-system` の解析と同様, 強フィードバック極限
:math:`C \to \infty` を考え, すべての漸近関係はすべてこの極限について
のものとするので "(as :math:`C \to \infty`)" は省略する.

興奮・抑制ネットワーク
======================

.. todo:: 興奮・抑制ネットワークの設定を完結に書き直す.
   この章で必要な性質を書き下す.

:ref:`linearity-of-balanced-fixed-point` より, 均衡固定点は

.. math::

   \bm x_0 = - \bm J^{-1} \bm h + O(1/C)

を満たすことが分かった.  興奮性の集団と抑制性のふたつの集団が
興奮性の外部入力を受ける系, つまり

.. math::

   \bm J &=
   \begin{pmatrix}
   J_{EE} & J_{EI} \\
   J_{IE} & J_{II}
   \end{pmatrix},
   \qquad
   (J_{EE}, J_{IE} > 0, \enskip J_{EI}, J_{II} < 0)
   \\
   \bm h &=
   \begin{pmatrix}
   h_{E} \\
   h_{I}
   \end{pmatrix},
   \qquad
   (h_{E}, h_{I} > 0)

なる場合の均衡固定点について解析する.  系の状態は発火率 (非負の実数)
:math:`\bm x_0 = (m_E, m_I)^\intercal` で記述されるとする.

:ref:`strong-feedback-system` と同様, 系への「全入力」を

.. math::
   \bm z =
   \begin{pmatrix}
   z_{E} \\
   z_{I}
   \end{pmatrix}
   = C \, \{\bm J \bm x + \bm h\}
   = C \,
   \begin{pmatrix}
   J_{EE} \, m_E + J_{EI} \, m_I + h_E \\
   J_{IE} \, m_E + J_{II} \, m_I + h_I
   \end{pmatrix}

で定義する.

..
   また, これを :math:`O(1)` にスケールした変数
   :math:`\bm w = \bm z / C` を

   .. math::
      \bm w =
      \begin{pmatrix}
      w_{E} \\
      w_{I}
      \end{pmatrix}
      := \bm J \bm x + \bm h
      =
      \begin{pmatrix}
      J_{EE} \, m_E + J_{EI} \, m_I + h_E \\
      J_{IE} \, m_E + J_{II} \, m_I + h_I
      \end{pmatrix}

   で定義する.

関数 :math:`\bm f` は, :math:`k = E, I` について,

.. math::
   :label: cond-f

   z_k = |\Omega(C)| \Leftrightarrow f_k(\bm z) \sim m_k^{\max}

   z_k = -|\Omega(C)| \Leftrightarrow f_k(\bm z) \ll 1

という性質を満たすとする.

.. todo:: :math:`m_k^{\max} = \infty` でも OK だと説明.

均衡固定点は形式的に

.. math::

   \begin{pmatrix}
   m_{E} \\
   m_{I}
   \end{pmatrix}
   =
   -
   \frac{1}{\det \bm J}
   \begin{pmatrix}
   J_{II} & -J_{EI} \\
   -J_{IE} & J_{EE}
   \end{pmatrix}
   \begin{pmatrix}
   h_{E} \\
   h_{I}
   \end{pmatrix}
   =
   \frac{1}{\det \bm J}
   \begin{pmatrix}
   - J_{II} h_{E} + J_{EI} h_{I} \\
   J_{IE} h_{E} - J_{EE} h_{I} \\
   \end{pmatrix}

と書ける.


条件: 均衡固定点の発火率は非負
==============================

この均衡固定点が存在するためには :math:`\bm J` の行列式

.. math:: \det \bm J = J_{EE} J_{II} - J_{EI} J_{IE}

が非ゼロであることが必要条件である.  さらに, 発火率が非負であるという
条件を考慮すると, :math:`\bm J` と :math:`\bm h` は

.. math::

   \det \bm J > 0, \quad
   - J_{II} h_{E} + J_{EI} h_{I} > 0, \quad
   J_{IE} h_{E} - J_{EE} h_{I} > 0

または, 上記の不等号をすべてひっくり返した

.. math::

   \det \bm J < 0, \quad
   - J_{II} h_{E} + J_{EI} h_{I} < 0, \quad
   J_{IE} h_{E} - J_{EE} h_{I} < 0

なる不等式系を満たす必要があることが分かる.  これを変形すると,

.. math::

   &
     \det \bm J = J_{EE} J_{II} - J_{EI} J_{IE} \lessgtr 0, \quad
     - J_{II} h_{E} + J_{EI} h_{I} \lessgtr 0, \quad
     J_{IE} h_{E} - J_{EE} h_{I} \lessgtr 0
   \\
   \Leftrightarrow &
     J_{EE} J_{II} \lessgtr J_{EI} J_{IE}, \quad
     J_{II} h_{E} \gtrless J_{EI} h_{I}, \quad
     J_{IE} h_{E} \lessgtr J_{EE} h_{I}
   \\
   \Leftrightarrow &
     \frac{J_{EE}}{J_{IE}} \gtrless \frac{J_{EI}}{J_{II}}, \quad
     \frac{h_{E}}{h_{I}} \lessgtr \frac{J_{EI}}{J_{II}}, \quad
     \frac{h_{E}}{h_{I}} \lessgtr \frac{J_{EE}}{J_{IE}}
   \\
   \Leftrightarrow &
     \frac{h_{E}}{h_{I}}
     \lessgtr
     \frac{J_{EI}}{J_{II}}
     \lessgtr
     \frac{J_{EE}}{J_{IE}}

を得る.

.. math::
   :label: balance-inequality

   \frac{h_{E}}{h_{I}} > \frac{J_{EI}}{J_{II}} > \frac{J_{EE}}{J_{IE}}

.. math::
   :label: unbalance-inequality

   \frac{h_{E}}{h_{I}} < \frac{J_{EI}}{J_{II}} < \frac{J_{EE}}{J_{IE}}



条件: 発火率ゼロの固定点は存在しない
====================================

.. todo:: 書く: 条件: 発火率ゼロの固定点は存在しない

片方の集団の発火率がゼロでもう一方の集団の発火率が非ゼロ
で有限な固定点が存在する条件を求める.  [#]_

.. [#] 両方の集団の発火率がゼロである固定点は, :math:`\bm h`
   の成分が正である限り存在できない.  これは,
   :math:`z_k|_{\bm x = \bm 0} = C h_k \neq - |\Omega(C)|`
   より, 自明である.

.. todo:: 必要条件?  必要十分?

:math:`k = E, l = I` または :math:`k = I, l = E` とする.
集団 :math:`k` の発火率がゼロ (:math:`m_k \ll 1`) だとすると,
この状態が固定点となる条件は, 条件 :eq:`cond-f` より,
:math:`z_k = -|\Omega(C)|` つまり,

.. math::

   J_{kl} m_l + h_k = - |\Omega(1/C)|

である.  :math:`l = E` ならば左辺の項はすべて正なので実現不可能
である.  ゆえに, :math:`k = E`, :math:`l = I` でなければならない.
さらに, 集団 :math:`l = I` が非ゼロで有限である, つまり
:math:`m_I = \Theta(1)` となる条件より, :math:`z_I = \Theta(1)`
つまり,

.. math::

   J_{II} \, m_I + h_I = \Theta(1/C)

である.

.. math::

   m_I = - h_I / J_{II} + \Theta(1/C)

.. math::

   &
     J_{EI} (- h_I / J_{II} + \Theta(1/C)) + h_E = - |\Omega(1/C)|
   \\
   & \Leftrightarrow
     - h_I J_{EI} / J_{II} + h_E = - |\Omega(1/C)|
   \\
   & \Leftrightarrow
     h_I \left(
       \frac{J_{EI}}{J_{II}} - \frac{h_E}{h_I}
     \right) = |\Omega(1/C)|
   \\
   & \Leftarrow
     \frac{J_{EI}}{J_{II}} > \frac{h_E}{h_I}

最後の式は, 式 :eq:`unbalance-inequality` の必要条件である.


条件: 発火率の飽和した固定点は存在しない
========================================

.. todo:: 書く: 条件: 発火率の飽和した固定点は存在しない

両方の集団の発火率が飽和した固定点
:math:`\bm x \sim \bm m^{\max} := (m^{\max}_E, m^{\max}_I)^\intercal`
を考える.

.. math::

   z_k = |\Omega(C)| \Leftrightarrow f_k(\bm z) \sim m_k^{\max}

.. math::

   J_{kE} \, m^{\max}_E + J_{kI} \, m^{\max}_I + h_k = |\Omega(1/C)|

:math:`m^{\max}_k \sim 1` (:math:`k = E, I`) の場合, 左辺の
オーダーは無条件に :math:`\Theta(1)` なので, これは条件

.. math::

   J_{kE} \, m^{\max}_E + J_{kI} \, m^{\max}_I + h_k > 0

と同値である.

さらに, :math:`m^{\max} = m^{\max}_E = m^{\max}_I` とすると, 固定点
:math:`\bm x \sim \bm m^{\max}` が存在するための必要十分条件は,

.. math::
   :nowrap:

   \begin{align*}
     &
       k = E, I:
       \quad
       (J_{kE} + J_{kI}) m^{\max} > - h_k
     \\
     \Leftrightarrow \enskip
     &
       k = E, I:
       \quad
       J_{kE} + J_{kI} \ge 0
       \enskip \text{or} \enskip
       m^{\max} < \frac{- h_k}{J_{kE} + J_{kI}}
     \\
     \Leftrightarrow \enskip
     &
       \left(
         J_{EE} + J_{EI} \ge 0
         \enskip \& \enskip
         J_{IE} + J_{II} \ge 0
       \right)
     \\
     & \quad \text{or} \quad
       m^{\max} < \min_{k=E,I} \frac{- h_k}{J_{kE} + J_{kI}}
   \end{align*}

となる.

式 :eq:`balance-inequality`
:math:`\Rightarrow J_{EI} J_{IE} / J_{II} > J_{EE}` だから,
:math:`J_{EE} + J_{EI} \ge 0` は式 :eq:`balance-inequality` の
条件下で,

.. math::

   J_{EE} \ge - J_{EI}
   \Rightarrow
   J_{EI} \frac{J_{IE}}{J_{II}} \ge - J_{EI}
   \Rightarrow
   J_{EI} \le - J_{II}

式 :eq:`balance-inequality`
:math:`\Rightarrow J_{IE} J_{EI} / J_{EE} < J_{II}` だから,
:math:`J_{IE} + J_{II} \ge 0` は

.. math::

   - J_{IE} \le J_{II}
   \Rightarrow

式 :eq:`balance-inequality` は

.. math::

   J_{EE} - \frac{J_{IE}}{J_{II}} J_{EI} < 0
   \enskip \& \enskip
   J_{IE} - \frac{J_{EE}}{J_{EI}} J_{II} > 0

を導く.  最初の不等式から, 式 :eq:`balance-inequality` の条件下で
:math:`1 < - {J_{IE}}/{J_{II}}` (つまり :math:`- J_{II} < J_{IE}`)
ならば :math:`J_{EE} + J_{EI} \ge 0` は満たされないことが分かる.

1. :math:`J_{EE} + J_{EI} \ge 0` かつ :math:`J_{IE} + J_{II} \ge 0`
2. :math:`J_{EE} + J_{EI} \ge 0` かつ :math:`J_{IE} + J_{II} < 0`
3. :math:`J_{EE} + J_{EI} < 0` かつ :math:`J_{IE} + J_{II} \ge 0`
4. :math:`J_{EE} + J_{EI} < 0` かつ :math:`J_{IE} + J_{II} < 0`

:math:`J_{EE} + J_{EI} \ge 0` かつ :math:`J_{IE} + J_{II} < 0` の場合,

.. math::

   &
     - J_{EI} \le J_{EE}
     \enskip \& \enskip
     J_{IE} < - J_{II}
   \\
   & \Rightarrow
     - J_{EI} J_{IE} < - J_{EE} J_{II}
   \\
   & \Leftrightarrow
     \frac{J_{EI}}{J_{II}} < \frac{J_{EE}}{J_{IE}}

同様に,
:math:`J_{EE} + J_{EI} < 0` かつ :math:`J_{IE} + J_{II} \ge 0` の場合,

.. math::

   &
     - J_{EI} > J_{EE}
     \enskip \& \enskip
     J_{IE} \ge - J_{II}
   \\
   & \Rightarrow
     - J_{EI} J_{IE} > - J_{EE} J_{II}
   \\
   & \Leftrightarrow
     \frac{J_{EI}}{J_{II}} > \frac{J_{EE}}{J_{IE}}

同様に,
:math:`J_{EE} + J_{EI} < 0` かつ :math:`J_{IE} + J_{II} < 0` の場合,

.. math::

   &
     - J_{EI} > J_{EE}
     \enskip \& \enskip
     J_{IE} < - J_{II}
   \\
   & \Rightarrow
     ...

発火率の限界が無い場合
----------------------

:math:`m^{\max}_E = m^{\max}_I = \infty` の場合,
:math:`k = E, I` について :math:`J_{kE} > - J_{kI}`
ならば, 両方の集団の発火率が発散した状態は無矛盾である.
これは両方の集団の発火率が飽和 (:math:`m_k \sim m_k^{\max}`,
:math:`k = E, I`) した固定点に対応する.

.. math::

   &
     J_{EE} > - J_{EI}
     \enskip \& \enskip
     J_{IE} > - J_{II}
   \\
   & \Rightarrow
     J_{EE} J_{IE} > J_{EI} J_{II}
   \\
   & \Leftrightarrow
     \frac{J_{EE}}{J_{II}} < \frac{J_{EI}}{J_{IE}}


飽和・有限固定点
----------------

.. todo:: 書く: 飽和・有限固定点

:math:`k = E, l = I` または :math:`k = I, l = E` とする.
:math:`m_k \sim m^{\max}_k` かつ
集団 :math:`l` が非ゼロで有限である, つまり
:math:`m_l = \Theta(1)` となる条件より, :math:`z_l = \Theta(1)`
である.

.. math::

   J_{kk} \, m^{\max}_k + J_{kl} \, m_l + h_k = |\Theta(1)|

   J_{lk} \, m^{\max}_k + J_{ll} \, m_l + h_l = \Theta(1/C)

.. math::

   m_l = \frac{\Theta(1/C) - J_{lk} \, m^{\max}_k - h_l}{J_{ll}}

.. math::

   &
     J_{kk} \, m^{\max}_k
     - J_{kl} \, \frac{J_{lk} \, m^{\max}_k + h_l}{J_{ll}}
     + h_k = |\Theta(1)|
   \\
   & \Leftrightarrow
     \left(
       \frac{J_{kk}}{J_{kl}} - \frac{J_{lk}}{J_{ll}}
     \right)
     J_{kl} \, m^{\max}_k
     - \frac{J_{kl}}{J_{ll}} h_l
     + h_k = |\Theta(1)|
   \\
   & \Leftrightarrow
     \left(
       \frac{J_{kk}}{J_{kl}} - \frac{J_{lk}}{J_{ll}}
     \right)
     J_{kl} \, m^{\max}_k
     > \frac{J_{kl}}{J_{ll}} h_l
     - h_k


:math:`k = E, l = I`
~~~~~~~~~~~~~~~~~~~~

この飽和・有限固定点が存在しない必要十分条件は,

.. math::

   &
     \left(
       \frac{J_{EE}}{J_{EI}} - \frac{J_{IE}}{J_{II}}
     \right)
     J_{EI} \, m^{\max}_E
     - \frac{J_{EI}}{J_{II}} h_I + h_E
     < 0
   \\
   & \Leftrightarrow
     \left(
       \frac{J_{EE}}{J_{IE}} - \frac{J_{EI}}{J_{II}}
     \right)
     J_{IE} \, m^{\max}_E
     +
     h_I
     \left(
       \frac{h_E}{h_I} - \frac{J_{EI}}{J_{II}}
     \right)
     < 0
   \\
   & \Leftrightarrow
     m^{\max}_E
     >
     \frac{h_I}{J_{IE}}
     \left(
       \frac{h_E}{h_I} - \frac{J_{EI}}{J_{II}}
     \right)
     /
     \left(
       \frac{J_{EI}}{J_{II}} - \frac{J_{EE}}{J_{IE}}
     \right)

右辺はすべて正.

..
        \left\{
        \right\}

..
 math::

   J_{EE} \, m^{\max} + J_{EI} \, m_I + h_E = |\Theta(1)|

   J_{IE} \, m^{\max} + J_{II} \, m_I + h_I = \Theta(1/C)

..
 math::

   J_{EE} \, m^{\max} + J_{EI} \, m_I + h_E
   >
   (J_{EE} + J_{EI}) m^{\max} + h_E


:math:`k = I, l = E`
~~~~~~~~~~~~~~~~~~~~

この飽和・有限固定点が存在しない必要十分条件は,

.. math::

   &
     \left(
       \frac{J_{II}}{J_{IE}} - \frac{J_{EI}}{J_{EE}}
     \right)
     J_{IE} \, m^{\max}_I
     - \frac{J_{IE}}{J_{EE}} h_E
     + h_I
     < 0
   \\
   & \Leftrightarrow
     \left(
       \frac{J_{EE}}{J_{IE}} - \frac{J_{EI}}{J_{II}}
     \right)
     \frac{J_{IE} J_{II}}{J_{EE}}
     m^{\max}_I
     + h_I \frac{J_{IE}}{J_{EE}}
     \left(
       \frac{J_{EE}}{J_{IE}} - \frac{h_E}{h_I}
     \right)
     < 0
   \\
   & \Leftrightarrow
     \left(
       \frac{J_{EI}}{J_{II}} - \frac{J_{EE}}{J_{IE}}
     \right)
     J_{II} \, m^{\max}_I
     + h_I
     \left(
       \frac{h_E}{h_I} - \frac{J_{EE}}{J_{IE}}
     \right)
     < 0
   \\
   & \Leftrightarrow
     m^{\max}_I
     >
     - \frac{h_I}{J_{II}}
     \left(
       \frac{h_E}{h_I} - \frac{J_{EE}}{J_{IE}}
     \right)
     /
     \left(
       \frac{J_{EI}}{J_{II}} - \frac{J_{EE}}{J_{IE}}
     \right)


右辺はすべて正.

..
   math::
   &
     \left(
       \frac{J_{II}}{J_{IE}} - \frac{J_{EI}}{J_{EE}}
     \right)
     J_{IE} > 0
   \\
   & \Leftrightarrow
     \frac{J_{EE}}{J_{IE}} < \frac{J_{EI}}{J_{II}}


:math:`m^{\max}_I = m^{\max}_E = m^{\max}` なら
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. math::

   m^{\max}
     >
     \frac{h_I}{\min \left\{J_{IE}, - J_{II} \right\}}
     \left(
       \frac{h_E}{h_I} - \frac{J_{EE}}{J_{IE}}
     \right)
     /
     \left(
       \frac{J_{EI}}{J_{II}} - \frac{J_{EE}}{J_{IE}}
     \right)

:math:`\max \left\{J_{IE}^{-1}, - J_{II}^{-1} \right\}
= 1 / \min \left\{J_{IE}, - J_{II} \right\}`
