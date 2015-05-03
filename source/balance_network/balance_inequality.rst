.. _balance-inequality:

================
 均衡条件不等式
================

ここでは, :ref:`strong-feedback-system` の解析を興奮・抑制ネットワーク
が外部からの興奮性入力を受ける系
にあてはめ, このネットワークは「発火率がゼロあるいは飽和するような固定点
は持たない」という条件から, :index:`均衡条件不等式` を導く.
:ref:`strong-feedback-system` の解析と同様, 強フィードバック極限
:math:`C \to \infty` を考え, すべての漸近関係はすべてこの極限について
のものとするので "(as :math:`C \to \infty`)" は省略する.

興奮・抑制ネットワーク
======================

:ref:`strong-feedback-system` で扱った力学系が二次元 :math:`p=2` で,
系の状態 :math:`\bm x = (x_1, x_2)^\intercal = (m_1, m_2)^\intercal`
の第1, 第2成分はそれぞ興奮性と抑制性の集団の発火率を表すとする.
つまり, つねに :math:`m_1, m_2 \ge 0` である.
また, ベクトルや行列の添字は 1, 2 の代わりに :math:`E, I` を適宜使い,
例えば :math:`J_{12}` と :math:`J_{EI}` は同義である.
関数 :math:`\bm f` は, いわゆる入出力関係 (input-output relationship;
transfer function) を表すので, :math:`k = E, I` について
どんな入力 :math:`\bm z` についても :math:`f_k(\bm z) \ge 0` であり,
さらに

.. math::
   :label: cond-f

   z_k = |\Omega(C)| \Leftrightarrow f_k(\bm z) \sim m^{\max}

   z_k = -|\Omega(C)| \Leftrightarrow f_k(\bm z) \ll 1

が成り立つという条件を追加する. ここで, :math:`m^{\max}` はフィードバック
強度 :math:`C` に依存しない正の定数で, 両集団の発火率の上限を与える.
定数 :math:`m^{\max}` は集団ごとに違う値を考えても良いが, :math:`m_k`
と :math:`J_{kl}` をスケールすれば同じ値にすることができるので,
この仮定は一般性を損なわない.  さらに, 発火率の上限が存在しない場合
(:math:`m^{\max} = \infty`) でも, 以下の議論は成り立つ.  [#]_

.. [#] 片方の集団の発火率の上限が存在し, もう片方の発火率の上限が存在
   しない場合は扱っていないが, そんな変なモデルを考える必要は無いだろう.

興奮性の集団と抑制性のふたつの集団が興奮性の外部入力を受ける系について
解析するので, パラメタには

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

なる制限がかかる.

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

興奮・抑制ネットワークの均衡固定点
==================================

:ref:`linearity-of-balanced-fixed-point` より, 均衡固定点は

.. math::

   \bm x^0 = - \bm J^{-1} \bm h + O(1/C)

を満たすことが分かった.  これは単なる二次の線型方程式なので,
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

と書ける.  これ以降の数式では固定点を表す上付き添字 0 は省略する.

この均衡固定点以外に, 非均衡固定点が存在する可能性がある.  定性的に
場合分けをすると, 次の5つの場合が想定できる.

.. list-table::
   :widths: 1 3
   :header-rows: 1
   :stub-columns: 1

   * - 固定点
     - 定義
   * - _`無活動-固定点`
     - 両方の集団の発火率がゼロ
   * - _`無活動・均衡-固定点`
     - 片方の集団の発火率がゼロで,
       もう片方の集団の発火率がゼロでもなく飽和もしていない
   * - _`飽和-固定点`
     - 両方の集団の発火率が飽和している
   * - _`飽和・均衡-固定点`
     - 片方の集団の発火率が飽和していて,
       もう片方の集団の発火率がゼロでもなく飽和もしていない
   * - _`飽和・無活動-固定点`
     - 片方の集団の発火率が飽和していて,
       もう片方の集団の発火率がゼロ

ただし, 発火率の上限が無い (:math:`m^{\max} = \infty`) 場合, ここでの
「飽和」は発火率の発散を意味する.

`無活動-固定点`_ は, :math:`\bm h` の成分が正である限り存在できない.
これは, :math:`z_k|_{\bm x = \bm 0} = C h_k \neq - |\Omega(C)|`
より, 自明である.


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



無活動・均衡-固定点の非存在条件
===============================

片方の集団の発火率がゼロで, もう片方の集団の発火率がゼロでもなく飽和もしていない,
`無活動・均衡-固定点`_ 存在しない(十分)条件を求める.

:math:`k = E, l = I` または :math:`k = I, l = E` とする.
集団 :math:`k` の発火率がゼロ (:math:`m_k \ll 1`) だとすると,
この状態が固定点となる必要十分条件は, 式 :eq:`cond-f` より,
:math:`z_k = -|\Omega(C)|` つまり,

.. math::

   J_{kl} m_l + h_k = - |\Omega(1/C)|

である.  :math:`l = E` ならば左辺の項はすべて正なので実現不可能
である.  ゆえに, :math:`k = E`, :math:`l = I` でなければならない.
さらに, 集団 :math:`l = I` の発火率が非ゼロで有限
(:math:`m_I = \Theta(1)`) である必要十分条件は式 :eq:`cond-f` より,
:math:`z_I = \Theta(1)`, つまり,

.. math::

   J_{II} \, m_I + h_I = \Theta(1/C)

である.  これを :math:`m_I` について解けば

.. math::

   m_I = - h_I / J_{II} + \Theta(1/C)

となる.  これを :math:`z_E = -|\Omega(C)|` となる条件にあわせると,

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
   & \Leftrightarrow
     \frac{J_{EI}}{J_{II}} > \frac{h_E}{h_I}

最後の式は, 式 :eq:`unbalance-inequality` の必要条件であり, また,
式 :eq:`balance-inequality` の下では偽である.  ゆえに,
式 :eq:`balance-inequality` はこの固定点が存在しない十分条件である.
以下では, すべて式 :eq:`balance-inequality` が成り立つと仮定して
議論を行う.


飽和-固定点の非存在条件
=======================

両方の集団の発火率が飽和した固定点 (`飽和-固定点`_)
:math:`m_E = m_I = m^{\max}`
を考える.
条件 :eq:`cond-f`
(:math:`z_k = |\Omega(C)| \Leftrightarrow f_k(\bm z) \sim m^{\max}`)
より, :math:`k = E, I` について,

.. math::

   J_{kE} \, m^{\max}_E + J_{kI} \, m^{\max}_I + h_k = |\Omega(1/C)|

が成り立つことが, 飽和-固定点が存在する必要十分条件である.
:math:`m^{\max} = \Omega(1)` より, 左辺の
オーダーは無条件に :math:`\Omega(1)` なので, これは条件

.. math::

   J_{kE} \, m^{\max} + J_{kI} \, m^{\max} + h_k > 0

と同値である.  これをさらに同値変形することにより,

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
       \tag{c1}
     \\
     & \quad \text{or} \quad
       \left(
         J_{EE} + J_{EI} \ge 0
         \enskip \& \enskip
         m^{\max} < \frac{- h_I}{J_{IE} + J_{II}}
       \right)
       \tag{c2}
     \\
     & \quad \text{or} \quad
       \left(
         m^{\max} < \frac{- h_E}{J_{EE} + J_{EI}}
         \enskip \& \enskip
         J_{IE} + J_{II} \ge 0
       \right)
       \tag{c3}
     \\
     & \quad \text{or} \quad
       m^{\max} < \min_{k=E,I} \frac{- h_k}{J_{kE} + J_{kI}}
       \tag{c4}
   \end{align*}

となる.
前節までで導いた均衡条件不等式 :eq:`balance-inequality` は

.. math::

   J_{EE} - \frac{J_{IE}}{J_{II}} J_{EI} < 0

を導く.  よって, 式 :eq:`balance-inequality` の条件下で
:math:`1 \le - {J_{IE}}/{J_{II}}` (つまり :math:`J_{IE} + J_{II} \ge 0`)
ならば :math:`J_{EE} + J_{EI} \ge 0` は満たされないことが分かる.
ゆえに, 式 :eq:`balance-inequality` の条件下で
:math:`J_{EE} + J_{EI} \ge 0` と :math:`J_{IE} + J_{II} \ge 0` は
同時に成立しない.   ゆえに 式 :eq:`balance-inequality` の条件下で
外部入力に依存しない飽和-固定点の存在する条件 (c1) は成立し得ない.
以上の議論をあわせると, 式 :eq:`balance-inequality` の条件下で
`飽和-固定点`_ が存在し\ **ない**\ 必要十分条件は 条件 (c2)--(c3)
である.  条件 (c3) の否定をさらに強化した条件

.. math::

   m^{\max} \ge \max_{k=E,I} \frac{- h_k}{J_{kE} + J_{kI}}

は, 条件 (c2)--(c3) の否定を導くので, `飽和-固定点`_ が存在し\
**ない**, **十分**\ 条件である (単なる条件 (c3) の否定は, 上式に
おいて max ではなく min を使うことに注意).  これから,
:math:`h_E` と :math:`h_I` が十分小さければ, `飽和-固定点`_ は存在
しないことが分かる.


発火率の上限が無い場合
----------------------

発火率の上限が無い (:math:`m^{\max} = \infty`) 場合, 条件 (c2)-(c3) は
成立しようが無いから, (c1) が存在しなければ `飽和-固定点`_ は存在しな
い.  さらに, 式 :eq:`balance-inequality` の条件下で
:math:`J_{IE} + J_{II} < 0` は

.. math::

   J_{EI}
   < J_{II} \frac{J_{EE}}{J_{IE}}
   < - J_{IE} \frac{J_{EE}}{J_{IE}}
   = - J_{EE}

つまり :math:`J_{EE} + J_{EI} < 0` を導く
(:math:`J_{IE} + J_{II} < 0` のほうが :math:`J_{EE} + J_{EI} < 0`
より厳しい条件).  よって, `飽和-固定点`_ が存在し\ **ない**,
**必要十分**\ 条件は :math:`J_{EE} + J_{EI} < 0` である. [#]_

.. [#] [vanVreeswijk1998]_ の式 (4.10) の条件 :math:`J_E > 1` は
   :math:`J_{EE} = J_{IE} = 1`, :math:`J_{kI} = - J_k`
   なる正規化(変数変換)の元で :math:`J_{EE} + J_{EI} < 0` と
   同値である.  発火率の上限が無い場合はこの条件のみで
   `飽和-固定点`_ が存在しないことが保証されるが, 発火率の上限が
   有限の場合は, 条件 (c4) はまだ成立し得るので, 式 (4.10) だけ
   では飽和-固定点の存在を否定していない.


飽和・均衡-固定点の非存在条件
=============================

`飽和・均衡-固定点`_ が存在しない十分条件を求める.
:math:`k = E, l = I` または :math:`k = I, l = E` とする.
:math:`m_k \sim m^{\max}` かつ
集団 :math:`l` の発火率が非ゼロで飽和していない
(:math:`m_l = \Theta(1)`) という必要十分条件は,
:math:`z_k = |\Theta(C)|` かつ :math:`z_l = \Theta(1)`, つまり,

.. math::

   J_{kk} \, m^{\max}_k + J_{kl} \, m_l + h_k = |\Theta(1)|

   J_{lk} \, m^{\max}_k + J_{ll} \, m_l + h_l = \Theta(1/C)

と同値である.  前者の式に後者の式を :math:`m_l` について解いた結果

.. math::

   m_l = \frac{\Theta(1/C) - J_{lk} \, m^{\max}_k - h_l}{J_{ll}}

を代入して同値変形すると,

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
     - \frac{J_{kl}}{J_{ll}} h_l
     + h_k > 0

を得る.  これを2つの場合に分けてさらに同値変形する.


Case 1: :math:`k = E, l = I`
----------------------------

この `飽和・均衡-固定点`_ の存在する必要十分条件は,

.. math::

   &
     \left(
       \frac{J_{EE}}{J_{EI}} - \frac{J_{IE}}{J_{II}}
     \right)
     J_{EI} \, m^{\max}_E
     - \frac{J_{EI}}{J_{II}} h_I + h_E
     > 0
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
     > 0
   \\
   & \Leftrightarrow
     m^{\max}_E
     <
     \frac{h_I}{J_{IE}}
     \left(
       \frac{h_E}{h_I} - \frac{J_{EI}}{J_{II}}
     \right)
     /
     \left(
       \frac{J_{EI}}{J_{II}} - \frac{J_{EE}}{J_{IE}}
     \right)


Case 2: :math:`k = I, l = E`
----------------------------

この `飽和・均衡-固定点`_ の存在する必要十分条件は,

.. math::

   &
     \left(
       \frac{J_{II}}{J_{IE}} - \frac{J_{EI}}{J_{EE}}
     \right)
     J_{IE} \, m^{\max}_I
     - \frac{J_{IE}}{J_{EE}} h_E
     + h_I
     > 0
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
     > 0
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
     > 0
   \\
   & \Leftrightarrow
     m^{\max}_I
     <
     - \frac{h_I}{J_{II}}
     \left(
       \frac{h_E}{h_I} - \frac{J_{EE}}{J_{IE}}
     \right)
     /
     \left(
       \frac{J_{EI}}{J_{II}} - \frac{J_{EE}}{J_{IE}}
     \right)


2つの場合を統合
---------------

以上の結果を合わせると, `飽和・均衡-固定点`_ の2つの場合の
うち少なくともいずれか1つが存在する必要十分条件は,

.. math::

   m^{\max}
     <
     \frac{h_I}{\min \left\{J_{IE}, - J_{II} \right\}}
     \left(
       \frac{h_E}{h_I} - \frac{J_{EE}}{J_{IE}}
     \right)
     /
     \left(
       \frac{J_{EI}}{J_{II}} - \frac{J_{EE}}{J_{IE}}
     \right)

である.  ここで,
:math:`\max \left\{J_{IE}^{-1}, - J_{II}^{-1} \right\}
= 1 / \min \left\{J_{IE}, - J_{II} \right\}`
なる関係を用いた.
よって, いかなる `飽和・均衡-固定点`_ も存在し\ **ない**,
**十分**\ 条件は,

.. math::

   m^{\max}
     \ge
     \frac{h_I}{\min \left\{J_{IE}, - J_{II} \right\}}
     \left(
       \frac{h_E}{h_I} - \frac{J_{EE}}{J_{IE}}
     \right)
     /
     \left(
       \frac{J_{EI}}{J_{II}} - \frac{J_{EE}}{J_{IE}}
     \right)

となる.

飽和・無活動-固定点の非存在条件
===============================

`飽和・無活動-固定点`_ は,
:math:`m_E = m^{\max}`, :math:`m_I = 0` の場合は
:math:`z_I = C (J_{IE} \, m^{\max} + h_I) \neq - |\Omega(C)|`
より存在できない.
一方, :math:`m_E = 0`, :math:`m_I = m^{\max}` は
:math:`z_E = C (J_{EI} \, m^{\max} + h_E) = - |\Omega(C)|` かつ
:math:`z_I = C (J_{II} \, m^{\max} + h_I) = |\Omega(C)|`,
つまり
:math:`J_{EI} \, m^{\max} + h_E < 0` かつ
:math:`J_{II} \, m^{\max} + h_I > 0`
ならば存在する.  これは,

.. math:: - \frac{h_E}{J_{EI}} < m^{\max} < - \frac{h_I}{J_{II}}

とも書ける.  これが成立する必要条件は

.. math:: \frac{h_E}{h_I} < \frac{J_{EI}}{J_{II}}

だが, これは式 :eq:`balance-inequality` の下では成立しない.
ゆえに, いかなる `飽和・無活動-固定点`_ も式 :eq:`balance-inequality` の下では
無条件で存在しない.
