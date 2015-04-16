====================
 強フィードバック系
====================

次の :math:`p` 次元力学系を考えよう.

.. math::
   :label: def-ds

   \bm \tau \frac{\D \bm x(t)}{\D t}
   =
   - \bm x(t) + \bm f(C \, \{\bm J \bm x(t) + \bm h\}; \bm x)

ここで,
:math:`\bm \tau = \diag(\tau_1, \ldots, \tau_p) \in \mathbb R^{p \times p}`
は時定数を決める行列,
:math:`\bm J \in \mathbb R^{p \times p}`
は系の状態 :math:`\bm x(t) \in \mathbb R^p` の各成分の相互作用を表す行列,
ベクトル :math:`\bm h \in \mathbb R^p` はこの系への外部入力を表す.

.. todo:: 関数 :math:`\bm f` の満たすべき条件を書き下す

正数 :math:`C` はこの系のフィードバックの強さを決めるパラメタである.  この節では,
極限 :math:`C \to \infty` におけるこの系の振る舞いについて述べる.
関数 :math:`\bm f` の第一引数 :math:`\bm y = C \, \{\bm J \bm x(t) + \bm h\}`
を系への「入力」と呼ぶことにする.

固定点
======

力学系 :eq:`def-ds` の固定点 :math:`\bm x_0`

.. math::

   \bm x_0 = \bm f(C \, \{\bm J \bm x_0 + \bm h\}; \bm x_0)

のうち, 極限 :math:`C \to \infty` で固定点 :math:`\bm x_0`
とそれに対応する入力 :math:`\bm y_0 = C \, \{\bm J \bm x_0 + \bm h\}`
が発散しない, つまり :math:`|\bm x_0| = O(1)` かつ :math:`|\bm y_0| = O(1)`
となるものを調べよう.  入力が発散しないという条件からすぐに

.. math::

   |\bm J \bm x_0 + \bm h| = O(1/C)

が言える.  よって,

.. math::

   \bm x_0 = - \bm J^{-1} \bm h + O(1/C)

となることが分かる.  つまり, この固定点 :math:`\bm x_0` は
外部入力 :math:`\bm h` に対し, :math:`O(1/C)` の誤差を除けば
線形の関係を持つ.  もしこの固定点が安定ならば, この系は外部入力
に対し, 「線形な応答」をしていることになり, しかもそれが系の
詳細を決める関数 :math:`\bm f` に依らないという著しい性質を持つ.
