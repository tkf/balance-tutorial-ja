.. _strong-feedback-system:

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

漸近関係記号 :math:`\sim`, :math:`O`, :math:`\Theta`, :math:`\Omega`
などについては, :ref:`asymptotics` を参照.  この節では, これらの記号
はすべて :math:`C \to \infty` (as :math:`C \to \infty`) についての
漸近関係を表すとする.

.. admonition:: 関数 :math:`\bm f` の性質

   .. _smoothness:

   平滑性
     :math:`\bm z^0 = O(1)` かつ :math:`\bm x^0 = O(1)` ならば,

     .. math::

        \bm f(O(1) + \bm z^0; O(1) + \bm x^0) - \bm f(\bm z^0; \bm x^0) = O(1)

     .. todo:: この条件は *すべての* :math:`\bm x^0 = O(1)` で... という意味だが,
        それだと, `二状態ニューロンから成るネットワーク`_ の場合は強平滑性があっても,
        :math:`\bm x^0 = 0` で上式が成り立たないので, 平滑性が無い, という不思議な
        ことになる.

        いや, その場合は :math:`\bm f` が bound されてるのでどうあがいても平滑性は
        保証されてしまうか.  :math:`\bm x^0 = 0` で :math:`\bm f` が発散する場合
        は危ないかも?

        「:math:`\bm z^0 = O(1)` かつ :math:`\bm x^0 = O(1)` 」 の
        :math:`O(1)` は :math:`\Theta(1)` に変えるべきじゃない気がする.

     .. _strong-smoothness:

     上の :math:`O(1)` を :math:`\Theta(1)` に変えたさらに強い条件も, 適宜
     仮定する

     強平滑性条件
       :math:`\bm z^0 = \Theta(1)` かつ :math:`\bm x^0 = \Theta(1)` ならば,

       .. math::

          \bm f(\Theta(1) + \bm z^0; \Theta(1) + \bm x^0)
          - \bm f(\bm z^0; \bm x^0)
          = \Theta(1)

   .. _saturating:

   飽和性
     :math:`\bm z^0 = \omega(1)` ならば,

     .. math::

        \bm f(O(1) + \bm z^0; O(1) + \bm x^0) - \bm f(\bm z^0; \bm x^0) = o(1)

   上記の :math:`\bm f` に関する漸近関係はすべて :math:`\bm z^0` と
   :math:`\bm x^0` に依存しているので, :math:`O_{\bm z^0,\bm x^0}(1)`
   などと書くべきである.  もし, この依存性がなければ, 強平滑性は飽和性
   と矛盾することに注意.

   .. todo:: 強平滑性以外は, :math:`\bm z^0` と :math:`\bm x^0` への依存性
      が無いとするほうが自然かも?

.. |cond:smoothness| replace:: :ref:`平滑性条件 <smoothness>`
.. |cond:saturating| replace:: :ref:`飽和性条件 <saturating>`
.. |cond:strong-smoothness| replace:: :ref:`強平滑性条件 <strong-smoothness>`

.. todo:: |cond:saturating| は仮定しなくても良いが, 非均衡固定点は発散してしまう
   ので興味が無い, ということについて説明.

正数 :math:`C` はこの系のフィードバックの強さを決めるパラメタである.  この節では,
極限 :math:`C \to \infty` におけるこの系の振る舞いについて述べる.
関数 :math:`\bm f` の第一引数 :math:`\bm z = C \, \{\bm J \bm x(t) + \bm h\}`
を系への「全入力」と呼ぶことにする.

支配項均衡の方法による解析
==========================

力学系 :eq:`def-ds` の固定点は

.. math::

   \bm x^0 = \bm f(C \, \{\bm J \bm x^0 + \bm h\}; \bm x^0)

は満たす系の状態であり, それに対応する全入力
を :math:`\bm z^0 = C \, \{\bm J \bm x^0 + \bm h\}` と置く.
全入力の各項がキャンセルしあって :math:`C \to \infty` で発散
しない場合, つまり :math:`\bm z^0 = O(1)`, あるいは同値の条件

.. math:: \bm J \bm x^0 + \bm h = O(1/C)

を満たす固定点を :index:`均衡固定点` (:index:`balanced fixed point`)
と呼ぶ.  これが成り立たない場合, つまり固定点での全入力が
発散して :math:`\bm z^0 = \Omega(C)` となる, あるいは同値の条件

.. math:: \bm J \bm x^0 + \bm h = \Omega(1)

を満たす固定点を :index:`非均衡固定点` (:index:`unbalanced fixed point`)
と呼ぶ.

.. todo:: :math:`1 \ll \bm z^0 \lesssim C` の場合は考えなくて良いのか?
   (同値な条件: :math:`\bm z^0 = \omega(1)` かつ :math:`\bm z^0 = o(C)`)
   例えば, :math:`\bm z^0 = \Theta(C^{1/2})` や :math:`\bm z^0 = \Theta(\log C)`
   など.

固定点まわりの座標系 :math:`\bm y = C \, (\bm x - \bm x^0)`
で微分方程式 :eq:`def-ds` を書き直す.  座標変換 :math:`\bm x = \bm y / C + \bm x^0`
を施すと,

.. math::

   C^{-1} \bm \tau \frac{\D \bm y(t)}{\D t}
   & =
     - (\bm y(t) / C + \bm x^0)
     + \bm f(C \, \{\bm J (\bm y(t) / C + \bm x^0) + \bm h\}; \bm x)
   \\
   & =
     - \bm y(t) / C
     + \underbrace{
           \bm f(\bm J \bm y(t) + \bm z^0; \bm x)
         - \bm f(\bm z^0; \bm x^0)
       }_{=: \bm F(\bm y)}

なので, これの両辺に :math:`C` をかけて

.. math::

   \bm \tau \frac{\D \bm y(t)}{\D t}
   & = - \bm y(t) + C \bm F(\bm y)

を得る.  [#]_

.. [#] :math:`\bm F(\bm y)` は, 正確には,
   :math:`\bm F(\bm y) :=
   \bm f(\bm J \bm y + \bm z^0; \bm y / C + \bm x^0)
   - \bm f(\bm z^0; \bm x^0)`
   で定義される.

:ref:`method-of-dominant-balance` を使ってこの系の
小さな摂動 :math:`\bm y = O(1)`
(元の座標系では :math:`\bm x - \bm x^0 = O(1/C)`) への応答を
調べよう.  単純に考えると, 他の2項 :math:`\D \bm y(t)/\D t` と
:math:`- \bm y(t)` が :math:`\Theta(C)` または :math:`O(1)`
を取るすべての, :math:`2^2` 個の場合を考える必要がありそうだが,
ひとつの項のみが :math:`\Theta(C)` になる場合は両辺が均衡し得ない
ので, 除くことが出来る.  また, それぞれの場合について, 固定点が
均衡固定点 (:math:`\bm z^0 = \Theta(1)`) である場合と,
非均衡固定点 (:math:`\bm z^0 = \Theta(C)`) である場合は
別に解析する必要がある.  以上の考察から,
表 :ref:`method-of-dominant-balance-in-strong-feedback-system`
に書き下された場合を調べれば良いことが分かる.  それぞれの場合が
無矛盾かどうかは, 節 `Case 1`_ と `Case 2`_
を参照せよ.

.. _method-of-dominant-balance-in-strong-feedback-system:

.. table:: 各項のオーダーに依る場合分け

   +-----------+-----------+-----------+-----------+-----------+-----------+
   |           | |order-columns|                               |           |
   +-----------+-----------+-----------+-----------+-----------+-----------+
   | |section| | |dy|      | |y|       | |CF|      | |z0|      | |check|   |
   +===========+===========+===========+===========+===========+===========+
   | `Case 1`_ | |Tc|      | |O1|      | |Tc|      | |O1|      | |yes|     |
   |           |           |           |           +-----------+-----------+
   |           |           |           |           | |w1|      | |no|      |
   +-----------+-----------+-----------+-----------+-----------+-----------+
   | `Case 2`_ | |O1|      | |O1|      | |O1|      | |O1|      | |?|       |
   |           |           |           |           +-----------+-----------+
   |           |           |           |           | |w1|      | |yes|     |
   +-----------+-----------+-----------+-----------+-----------+-----------+

.. |order-columns| replace:: 各項のオーダー |nb:order|_
.. |section| replace:: 該当節
.. |dy| replace:: :math:`\D \bm y / \D t`
.. |y|  replace:: :math:`\bm y`
.. |CF| replace:: :math:`C \bm F`
.. |z0| replace:: :math:`\bm z^0`
.. |Tc| replace:: :math:`\Theta(C)`
.. |w1| replace:: :math:`\omega(1)`
.. |Oc| replace:: :math:`O(C)`
.. |O1| replace:: :math:`O(1)`
.. |check| replace:: 無矛盾
.. |yes| replace:: o
.. |no| replace:: x
.. |?| replace:: ?

..
   NOTE: table 内 footnote は latex 出力が対応してないので,
   ↓ではマニュアル footenote のようなことをしている

- .. |nb:order| replace:: :sup:`注1`
  .. _`nb:order`: `fn:order`_
  .. _`fn:order`:

  |nb:order|
  例えば, `Case 1`_ のカラム |dy| は, :math:`\D \bm y / \D t = \Theta(C)` を意味する.

この表から, もし固定点 :math:`\bm x^0` が安定ならば,
均衡固定点 (:math:`\bm z^0 = \Theta(1)`) への収束は速く
(:math:`\D \bm x / \D t = C^{-1} \D \bm y / \D t = \Theta(1)`),
非均衡固定点 (:math:`\bm z^0 = \Theta(C)`) への収束は遅い
(:math:`\D \bm x / \D t = C^{-1} \D \bm y / \D t = \Theta(C^{-1})`)
ことが読み取れる.
これは, 抽象的な定義しか与えていない力学系から導くことの出来る,
均衡固定点が一般に持つ著しい性質である.

Case 1
------

仮定:
:math:`\bm y = O(1)`, :math:`\bm F = \Theta(1)`.

.. math::

   \bm F(\bm y)
   & =
       \bm f(\underbrace{\bm J \bm y(t)}_{O(1)} + \bm z^0;
             \bm x^0 + \underbrace{\bm y / C}_{O(1/C)})
     - \bm f(\bm z^0; \bm x^0)
   \\
   & =
     \left\{
     \begin{array}{lll}
      O(1) & [\text{if } \bm z^0 = O(1)] & \checkmark \\
      o(1) & [\text{if } \bm z^0 = \omega(1)] & \text{contradiction!}
     \end{array}
     \right.

最後の等式では, :math:`\bm z^0 = O(1)` の場合は |cond:smoothness| を,
:math:`\bm z^0 = \omega(C)` の場合は |cond:saturating| を用いた.


Case 2
------

仮定:
:math:`\bm y = O(1)`, :math:`\bm F = O(1/C)`.

.. math::

   \bm F(\bm y)
   & =
       \bm f(\underbrace{\bm J \bm y(t)}_{O(1)} + \bm z^0;
             \bm x^0 + \underbrace{\bm y / C}_{O(1/C)})
     - \bm f(\bm z^0; \bm x^0)
   \\
   & =
     \left\{
     \begin{array}{lll}
      O(1) & [\text{if } \bm z^0 = O(1)] & \text{undecidable} \\
      o(1) & [\text{if } \bm z^0 = \omega(1)] & \checkmark
     \end{array}
     \right.

最後の等式では, :math:`\bm z^0 = o(1)` の場合は |cond:smoothness| を,
:math:`\bm z^0 = \omega(1)` の場合は |cond:saturating| を用いた.
:math:`\bm z^0 = O(1)` の場合は, :math:`O(1/C) = o(1)` なので
矛盾を導くことが出来ないが, |cond:strong-smoothness| を仮定すれば,
:math:`\bm F(\bm y) = \Theta(1) \neq O(1/C)` より矛盾を導くことが
出来る.


.. _linearity-of-balanced-fixed-point:

均衡固定点の線形性
==================

.. todo:: 前節とのつながりを良くする.

力学系 :eq:`def-ds` の固定点 :math:`\bm x^0`

.. math::

   \bm x^0 = \bm f(C \, \{\bm J \bm x^0 + \bm h\}; \bm x^0)

のうち, 極限 :math:`C \to \infty` で固定点 :math:`\bm x^0`
とそれに対応する全入力 :math:`\bm z^0 = C \, \{\bm J \bm x^0 + \bm h\}`
が発散しない, つまり :math:`|\bm x^0| = O(1)`
かつ :math:`|\bm z^0| = O(1)` となるものを調べよう.
全入力が発散しないという条件からすぐに

.. math::

   |\bm J \bm x^0 + \bm h| = O(1/C)

が言える.  よって,

.. math::

   \bm x^0 = - \bm J^{-1} \bm h + O(1/C)

となることが分かる.  つまり, この固定点 :math:`\bm x^0` は
外部入力 :math:`\bm h` に対し, :math:`O(1/C)` の誤差を除けば
線形の関係を持つ.  もしこの固定点が安定ならば, この系は外部入力
に対し, 「線形な応答」をしていることになり, しかもそれが系の
詳細を決める関数 :math:`\bm f` に依らないという著しい性質を持つ.


.. _stability-of-balanced-fixed-point:

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
   \frac{\partial \bm f(\bm z; \bm x^0)}{\partial \bm z}
   \right|_{\bm z = \bm z^0}

である.  :math:`\bm f` の第二引数からの寄与が無いのは,
この方向への摂動が :math:`\bm y / C = O(1/C)` と小さいため
である.

.. todo:: ↑確認


強フィードバック系の例
======================

発火率モデル (rate model)
-------------------------

:math:`p` 個の集団からなる発火率モデルのネットワークで, すべての
集団の入出力関係 (input-output relationship あるいは transfer function)
がシグモイド関数 :math:`g` (例えば, ロジスティック関数
:math:`g(t) = 1/(1+\exp(-t))`) [#]_ で与えられているとすれば,
関数 :math:`\bm f` の :math:`i` 番目 (:math:`i = 1, \ldots, p`) の成分は

.. math:: f_i(\bm z; \bm x) = g(z_i)

と書ける.

.. [#] :math:`\arctan`, :math:`\tanh`, :ref:`q-function` (の :math:`x` 軸を
   反転したもの) などでも構わない.

シグモイド関数 :math:`g` は :math:`z^0 = \Theta(1)` からの非ゼロの変化に対して,
必ず非ゼロの変化をうむ, つまり

.. math:: g(\Theta(1) + z^0) + g(z^0) = \Theta(1)

なので, |cond:strong-smoothness| が成り立つ.

もし, 関数 :math:`g` が

.. math::

   g(z) =
   \begin{cases}
     1 & 1 < z \\
     z & 0 < z \le 1 \\
     0 & z \le 0
   \end{cases}

のような区分的線形関数の場合は, |cond:strong-smoothness| は成り立たないが,
|cond:smoothness| は成り立つ.


二状態ニューロンから成るネットワーク
------------------------------------

:ref:`二状態ニューロンから成るネットワーク <binary-network>`
の平均場方程式も強フィードバック系である (:ref:`mft` を参照).
この場合は, :math:`p = 2` 個の集団からなる力学系で, 状態
は集団平均発火率 :math:`\bm x = (m_1, m_2)^\intercal` で,
外部入力は :math:`\bm h = (J_{10} m_0, J_{20} m_0)^\intercal`
である.  関数 :math:`\bm f` は,

.. math::

   f_k(\bm z; \bm x) = H(-(z_k - \theta_k) / \sqrt{\alpha_k(\bm x)})

   \alpha_k(\bm x) = (J_{k1})^2 x_1 + (J_{k2})^2 x_2

で定義される.  また, フィードバックの強さは :math:`C = \sqrt K` で決まる.
上記のシグモイド関数の場合と同様に, |cond:strong-smoothness| が成り立つ.


強フィードバック系ではない例
----------------------------

均衡固定点の存在を保証するには |cond:smoothness| さえあれば良いから,
これが本質的な条件である.

.. todo:: |cond:smoothness| が成り立たない関数なんてあるの?
   定義域で発散する場合 :math:`f_i(z) = 1 / (z - 1)` とか?
   (正確には, 定義域が連結でない場合?)
