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
:math:`z_k = |\Omega(C)|` ならば :math:`f_k(\bm z) \sim m_k^{\max}`
で
:math:`z_k = -|\Omega(C)|` ならば :math:`f_k(\bm z) \ll 1` である,
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
     \frac{J_{EE}}{J_{IE}}
     \lessgtr
     \frac{J_{EE}}{J_{IE}}

を得る.


条件: 発火率ゼロの固定点は存在しない
====================================

.. todo:: 書く: 条件: 発火率ゼロの固定点は存在しない


条件: 発火率の飽和した固定点は存在しない
========================================

.. todo:: 書く: 条件: 発火率の飽和した固定点は存在しない
