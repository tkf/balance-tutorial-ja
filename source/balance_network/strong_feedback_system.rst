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

   .. _smoothness:

   平滑性
     :math:`\bm z_0 = O(1)` かつ :math:`\bm x_0 = O(1)` ならば,

     .. math::

        \bm f(O(1) + \bm z_0; O(1) + \bm x_0) - \bm f(\bm z_0; \bm x_0) = O(1)

   .. _saturating:

   飽和性
     :math:`\bm z_0 = O(C)` ならば,

     .. math::

        \bm f(O(C) + \bm z_0; O(1) + \bm x_0) - \bm f(\bm z_0; \bm x_0) = O(1/C)


     .. todo:: :math:`\bm f(O(1) \bm z_0; O(1) + \bm x_0) ...` で定義するべき?

   .. _boundedness:

   有界性
     関数 :math:`\bm f` の(像が)有界である.  つまり, 定数 :math:`A` が存在して,
     どんな :math:`\bm z`, :math:`\bm x` についても
     :math:`|\bm f(\bm z; \bm x)| < A` となる.  他の2つの条件と同じ書き方を
     すれば,

     .. math:: \bm f(\bm z; \bm x) = O(1)

.. |cond:smoothness| replace:: :ref:`平滑性条件 <smoothness>`
.. |cond:saturating| replace:: :ref:`飽和性条件 <saturating>`
.. |cond:boundedness| replace:: :ref:`有界性条件 <boundedness>`

正数 :math:`C` はこの系のフィードバックの強さを決めるパラメタである.  この節では,
極限 :math:`C \to \infty` におけるこの系の振る舞いについて述べる.
関数 :math:`\bm f` の第一引数 :math:`\bm z = C \, \{\bm J \bm x(t) + \bm h\}`
を系への「全入力」と呼ぶことにする.

支配項均衡の方法による解析
==========================

力学系 :eq:`def-ds` の固定点は

.. math::

   \bm x_0 = \bm f(C \, \{\bm J \bm x_0 + \bm h\}; \bm x_0)

は満たす系の状態であり, それに対応する全入力
を :math:`\bm z_0 = C \, \{\bm J \bm x_0 + \bm h\}` と置く.
全入力の各項がキャンセルしあって :math:`C \to \infty` で発散
しない場合, つまり :math:`\bm z_0 = O(1)`, あるいは同値の条件

.. math:: \bm J \bm x_0 + \bm h = O(1/C)

を満たす固定点を :index:`均衡固定点` (:index:`balanced fixed point`)
と呼ぶ.  これが成り立たない場合, つまり固定点での全入力が
発散して :math:`\bm z_0 \gg C` あるいは同値の条件

.. math:: \bm J \bm x_0 + \bm h \gg 1

を満たす固定点を :index:`非均衡固定点` (:index:`unbalanced fixed point`)
と呼ぶ.

固定点まわりの座標系 :math:`\bm y = C \, (\bm x - \bm x_0)`
で微分方程式 :eq:`def-ds` を書き直す.  座標変換 :math:`\bm x = \bm y / C + \bm x_0`
を施すと,

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

なので, これの両辺に :math:`C` をかけて

.. math::

   \bm \tau \frac{\D \bm y(t)}{\D t}
   & = - \bm y(t) + C \bm F(\bm y)

を得る.  [#]_

.. [#] :math:`\bm F(\bm y)` は, 正確には,
   :math:`\bm F(\bm y) :=
   \bm f(\bm J \bm y + \bm z_0; \bm y / C + \bm x_0)
   - \bm f(\bm z_0; \bm x_0)`
   で定義される.

:ref:`method-of-dominant-balance` を使ってこの系の各項が
:math:`\Theta(C)` または :math:`\Theta(1)` になる場合をすべて
調べよう.  単純に考えると, :math:`2^3` 個の場合をがあり得るが,
ひとつの項のみが :math:`\Theta(C)` になる場合は両辺が均衡し得ない
ので, 除くことが出来る.  また, それぞれの場合について, 固定点が
均衡固定点 (:math:`\bm z_0 = \Theta(1)`) である場合と,
非均衡固定点 (:math:`\bm z_0 = \Theta(C)`) である場合は
別に解析する必要がある.  以上の考察から,
表 :ref:`method-of-dominant-balance-in-strong-feedback-system`
に書き下された場合を調べれば良いことが分かる.  それぞれの場合が
無矛盾かどうかは, 節 `Case 1`_, `Case 2`_, `Case 3`_, `Case 4`_
を参照せよ.

.. _method-of-dominant-balance-in-strong-feedback-system:

.. table:: 各項のオーダーに依る場合分け

   +-----------+-----------+-----------+-----------+-----------+-----------+
   |           | |order-columns|                               |           |
   +-----------+-----------+-----------+-----------+-----------+-----------+
   | |section| | |dy|      | |y|       | |CF|      | |z0|      | |check|   |
   +===========+===========+===========+===========+===========+===========+
   | `Case 1`_ | ---       | |c|       | |c|       | |1|       | |yes|     |
   |           | |nb:dy|_  |           |           +-----------+-----------+
   |           |           |           |           | |c|       | |no|      |
   +-----------+-----------+-----------+-----------+-----------+-----------+
   | `Case 2`_ | |c|       | |1|       | |c|       | |1|       | |yes|     |
   |           |           |           |           +-----------+-----------+
   |           |           |           |           | |c|       | |no|      |
   +-----------+-----------+-----------+-----------+-----------+-----------+
   | `Case 3`_ | |c|       | |c|       | |1|       | |1|       | |no|      |
   |           |           |           |           +-----------+-----------+
   |           |           |           |           | |c|       | |yes|     |
   +-----------+-----------+-----------+-----------+-----------+-----------+
   | `Case 4`_ | |1|       | |1|       | |1|       | |1|       | |no|      |
   |           |           |           |           +-----------+-----------+
   |           |           |           |           | |c|       | |yes|     |
   +-----------+-----------+-----------+-----------+-----------+-----------+

.. |order-columns| replace:: 各項のオーダー (:math:`\Theta(\bullet)` による比較)
                             |nb:order|_
.. |section| replace:: 該当節
.. |dy| replace:: :math:`\D \bm y / \D t`
.. |y|  replace:: :math:`\bm y`
.. |CF| replace:: :math:`C \bm F`
.. |z0| replace:: :math:`\bm z_0`
.. |c|  replace:: :math:`C`
.. |1|  replace:: 1
.. |check| replace:: 無矛盾
.. |yes| replace:: o
.. |no| replace:: x

..
   NOTE: table 内 footnote は latex 出力が対応してないので,
   ↓ではマニュアル footenote のようなことをしている

- .. |nb:order| replace:: :sup:`注1`
  .. _`nb:order`: `fn:order`_
  .. _`fn:order`:

  |nb:order|
  例えば, `Case 1`_ のカラム |y| は, :math:`\bm y = \Theta(C)` を意味する.

- .. |nb:dy| replace:: :sup:`注2`
  .. _`nb:dy`: `fn:dy`_
  .. _`fn:dy`:

  |nb:dy|
  `Case 1`_ は :math:`\D \bm y / \D t = \Theta(C)` と :math:`= \Theta(1)`
  の両方に対応する.

この表から, もし固定点 :math:`\bm x_0` が安定ならば,
均衡固定点 (:math:`\bm z_0 = \Theta(1)`) への収束は速く
(:math:`\D \bm x / \D t = C^{-1} \D \bm y / \D t = \Theta(1)`),
非均衡固定点 (:math:`\bm z_0 = \Theta(C)`) への収束は遅い
(:math:`\D \bm x / \D t = C^{-1} \D \bm y / \D t = \Theta(C^{-1})`)
ことが読み取れる.
これは, 抽象的な定義しか与えていない力学系から導くことの出来る,
均衡固定点が一般に持つ著しい性質である.

Case 1
------

仮定:
:math:`\bm y = \Theta(C)`, :math:`\bm F = \Theta(1)`.

.. math::

   \bm F(\bm y)
   & =
       \bm f(\underbrace{\bm J \bm y(t)}_{\Theta(C)} + \bm z_0;
             \bm x_0 + \underbrace{\bm y / C}_{\Theta(1)})
     - \bm f(\bm z_0; \bm x_0)
   \\
   & =
     \left\{
     \begin{array}{lll}
      O(1)   & [\text{if } \bm z_0 = \Theta(1)] & \checkmark \\
      O(1/C) & [\text{if } \bm z_0 = \Theta(C)] & \text{contradiction!}
     \end{array}
     \right.

最後の等式では, :math:`\bm z_0 = \Theta(1)` の場合は |cond:boundedness| を,
:math:`\bm z_0 = \Theta(C)` の場合は |cond:saturating| を用いた.


Case 2
------

仮定:
:math:`\bm y = \Theta(1)`, :math:`\bm F = \Theta(1)`.

.. math::

   \bm F(\bm y)
   & =
       \bm f(\underbrace{\bm J \bm y(t)}_{\Theta(1)} + \bm z_0;
             \bm x_0 + \underbrace{\bm y / C}_{\Theta(1/C)})
     - \bm f(\bm z_0; \bm x_0)
   \\
   & =
     \left\{
     \begin{array}{lll}
      O(1)   & [\text{if } \bm z_0 = \Theta(1)] & \checkmark \\
      O(1/C) & [\text{if } \bm z_0 = \Theta(C)] & \text{contradiction!}
     \end{array}
     \right.

最後の等式では, :math:`\bm z_0 = \Theta(1)` の場合は |cond:smoothness| を,
:math:`\bm z_0 = \Theta(C)` の場合は |cond:saturating| を用いた.


Case 3
------

仮定:
:math:`\bm y = \Theta(C)`, :math:`\bm F = \Theta(1/C)`.

.. math::

   \bm F(\bm y)
   & =
       \bm f(\underbrace{\bm J \bm y(t)}_{\Theta(C)} + \bm z_0;
             \bm x_0 + \underbrace{\bm y / C}_{\Theta(1)})
     - \bm f(\bm z_0; \bm x_0)
   \\
   & =
     \left\{
     \begin{array}{lll}
      O(1)   & [\text{if } \bm z_0 = \Theta(1)] & \text{contradiction!} \\
      O(1/C) & [\text{if } \bm z_0 = \Theta(C)] & \checkmark
     \end{array}
     \right.

最後の等式では, :math:`\bm z_0 = \Theta(1)` の場合は |cond:boundedness| を,
:math:`\bm z_0 = \Theta(C)` の場合は |cond:saturating| を用いた.


Case 4
------

仮定:
:math:`\bm y = \Theta(1)`, :math:`\bm F = \Theta(1/C)`.

.. math::

   \bm F(\bm y)
   & =
       \bm f(\underbrace{\bm J \bm y(t)}_{\Theta(1)} + \bm z_0;
             \bm x_0 + \underbrace{\bm y / C}_{\Theta(1/C)})
     - \bm f(\bm z_0; \bm x_0)
   \\
   & =
     \left\{
     \begin{array}{lll}
      O(1)   & [\text{if } \bm z_0 = \Theta(1)] & \text{contradiction!} \\
      O(1/C) & [\text{if } \bm z_0 = \Theta(C)] & \checkmark
     \end{array}
     \right.

最後の等式では, :math:`\bm z_0 = \Theta(1)` の場合は |cond:smoothness| を,
:math:`\bm z_0 = \Theta(C)` の場合は |cond:saturating| を用いた.


均衡固定点の線形性
==================

.. todo:: 前節とのつながりを良くする.

力学系 :eq:`def-ds` の固定点 :math:`\bm x_0`

.. math::

   \bm x_0 = \bm f(C \, \{\bm J \bm x_0 + \bm h\}; \bm x_0)

のうち, 極限 :math:`C \to \infty` で固定点 :math:`\bm x_0`
とそれに対応する全入力 :math:`\bm z_0 = C \, \{\bm J \bm x_0 + \bm h\}`
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


均衡固定点の安定性
==================

表 :ref:`method-of-dominant-balance-in-strong-feedback-system`
から, 均衡固定点まわりのダイナミクスは,

.. math::

   \bm \tau \frac{\D \bm y(t)}{\D t}
   & = - \bm y(t) + C \bm F(\bm y)
   \sim C \bm F(\bm y)

つまり,

.. math::

   \frac{\D \bm y(t)}{\D t} \sim C \bm \tau^{-1} \bm F(\bm y)

で記述されると分かる.  よって, この系の安定性の解析は,
行列 :math:`\bm \tau^{-1} D_1 \bm f \bm J`
の固有値で決まる (:math:`- \bm y(t)` の寄与が消えていることに注意).
ただし,

.. math::

   D_1 \bm f =
   \left.
   \frac{\partial \bm f(\bm z; \bm x_0)}{\partial \bm z}
   \right|_{\bm z = \bm z_0}

である.  :math:`\bm f` の第二引数からの寄与が無いのは,
この方向への摂動が :math:`\bm y / C = O(1/C)` と小さいため
である.

.. todo:: ↑確認
