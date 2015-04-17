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

.. admonition:: 関数 :math:`\bm f` の性質

   :math:`\bm z_0 = O(1)` ならば,

   .. math::

      \bm f(O(1) + \bm z_0; O(1) + \bm x_0) - \bm f(\bm z_0; \bm x_0) = O(1)

   飽和性:
   :math:`\bm z_0 = O(C)` ならば,

   .. math::

      \bm f(O(C) + \bm z_0; O(1) + \bm x_0) - \bm f(\bm z_0; \bm x_0) = O(1/C)

.. todo:: 関数 :math:`\bm f` の満たすべき条件を書き下す

正数 :math:`C` はこの系のフィードバックの強さを決めるパラメタである.  この節では,
極限 :math:`C \to \infty` におけるこの系の振る舞いについて述べる.
関数 :math:`\bm f` の第一引数 :math:`\bm z = C \, \{\bm J \bm x(t) + \bm h\}`
を系への「全入力」と呼ぶことにする.

固定点
======

力学系 :eq:`def-ds` の固定点 :math:`\bm x_0`

.. math::

   \bm x_0 = \bm f(C \, \{\bm J \bm x_0 + \bm h\}; \bm x_0)

のうち, 極限 :math:`C \to \infty` で固定点 :math:`\bm x_0`
とそれに対応する全入力 :math:`\bm z = C \, \{\bm J \bm x_0 + \bm h\}`
が発散しない, つまり :math:`|\bm x_0| = O(1)`
かつ :math:`|\bm z_0| = O(1)` となるものを調べよう.
全入力が発散しないという条件からすぐに

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


支配項均衡の方法による解析
==========================

:math:`\bm y = C \, (\bm x - \bm x_0)`

.. math::

   C^{-1} \bm \tau \frac{\D \bm y(t)}{\D t}
   & =
     - (\bm y(t) / C + \bm x_0)
     + \bm f(C \, \{\bm J (\bm y(t) / C + \bm x_0) + \bm h\}; \bm x)
   \\
   & =
     - \bm y(t) / C
     + \underbrace{
           \bm f(\bm J \bm y(t) + \bm z_0; \bm x)
         - \bm f(\bm z_0; \bm x_0)
       }_{=: \bm F(\bm y)}


.. math::

   \bm \tau \frac{\D \bm y(t)}{\D t}
   & = - \bm y(t) + C \bm F(\bm y)


.. list-table:: 各項のオーダー (:math:`\Theta(\bullet)` による比較) に依る場合分け
   :header-rows: 1

   * -
     - :math:`\D \bm y / \D t`
     - :math:`\bm y`
     - :math:`C \bm F`
     - :math:`\bm z_0`
     - 無矛盾
   * - `Case 1`_
     - ---
     - :math:`C`
     - :math:`C`
     - 1
     - o
   * -
     - ---
     - :math:`C`
     - :math:`C`
     - :math:`C`
     - x
   * - `Case 2`_
     - :math:`C`
     - 1
     - :math:`C`
     - 1
     - o
   * -
     - :math:`C`
     - 1
     - :math:`C`
     - :math:`C`
     - x
   * - `Case 3`_
     - :math:`C`
     - :math:`C`
     - 1
     - 1
     - x
   * -
     - :math:`C`
     - :math:`C`
     - 1
     - :math:`C`
     - o
   * - `Case 4`_
     - 1
     - 1
     - 1
     - 1
     - x
   * -
     - 1
     - 1
     - 1
     - :math:`C`
     - o

- もし固定点 :math:`\bm x_0` が安定ならば,
  均衡固定点 (:math:`\bm z_0 = \Theta(1)`) への収束は速く
  (:math:`\D \bm x / \D t = C^{-1} \D \bm y / \D t = \Theta(1)`),
  非均衡固定点 (:math:`\bm z_0 = \Theta(C)`) への収束は遅い
  (:math:`\D \bm x / \D t = C^{-1} \D \bm y / \D t = \Theta(C^{-1})`).


Case 1
------

仮定:
:math:`\bm y = O(C)`, :math:`\bm F = O(1)`.

.. math::

   \bm F(\bm y)
   = D \bm F \bm J \bm y
     + \underbrace{
       O(|\bm y|^2)
     }_{O(C^2)}

.. math::

   \bm F(\bm y)
   & =
       \bm f(\underbrace{\bm J \bm y(t)}_{O(C)} + \bm z_0;
             \bm x_0 + \underbrace{\bm y / C}_{O(1)})
     - \bm f(\bm z_0; \bm x_0)
   \\
   & =
     \left\{
     \begin{array}{lll}
      O(1)   & [\text{if } \bm z_0 = O(1)] & \checkmark \\
      O(1/C) & [\text{if } \bm z_0 = O(C)] & \text{contradiction!}
     \end{array}
     \right.

Case 2
------

仮定:
:math:`\bm y = O(1)`, :math:`\bm F = O(1)`.

.. math::

   \bm F(\bm y)
   & =
       \bm f(\underbrace{\bm J \bm y(t)}_{O(1)} + \bm z_0;
             \bm x_0 + \underbrace{\bm y / C}_{O(1/C)})
     - \bm f(\bm z_0; \bm x_0)
   \\
   & =
     \left\{
     \begin{array}{lll}
      O(1)   & [\text{if } \bm z_0 = O(1)] & \checkmark \\
      O(1/C) & [\text{if } \bm z_0 = O(C)] & \text{contradiction!}
     \end{array}
     \right.


Case 3
------

仮定:
:math:`\bm y = O(C)`, :math:`\bm F = O(1/C)`.

.. math::

   \bm F(\bm y)
   & =
       \bm f(\underbrace{\bm J \bm y(t)}_{O(C)} + \bm z_0;
             \bm x_0 + \underbrace{\bm y / C}_{O(1)})
     - \bm f(\bm z_0; \bm x_0)
   \\
   & =
     \left\{
     \begin{array}{lll}
      O(1)   & [\text{if } \bm z_0 = O(1)] & \text{contradiction!} \\
      O(1/C) & [\text{if } \bm z_0 = O(C)] & \checkmark
     \end{array}
     \right.


Case 4
------

仮定:
:math:`\bm y = O(1)`, :math:`\bm F = O(1/C)`.

.. math::

   \bm F(\bm y)
   & =
       \bm f(\underbrace{\bm J \bm y(t)}_{O(1)} + \bm z_0;
             \bm x_0 + \underbrace{\bm y / C}_{O(1/C)})
     - \bm f(\bm z_0; \bm x_0)
   \\
   & =
     \left\{
     \begin{array}{lll}
      O(1)   & [\text{if } \bm z_0 = O(1)] & \text{contradiction!} \\
      O(1/C) & [\text{if } \bm z_0 = O(C)] & \checkmark
     \end{array}
     \right.
