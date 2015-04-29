.. _strong-feedback-system:

====================
 強フィードバック系
====================

次の :math:`p` 次元力学系を考えよう.

.. math::
   :label: def-ds

   \bm \tau \frac{\D \bm x(t)}{\D t}
   =
   - \bm x(t) + \bm f(C \, \{\bm J \bm x(t) + \bm h\}; \bm x(t))

ここで,
:math:`\bm \tau = \diag(\tau_1, \ldots, \tau_p) \in \mathbb R^{p \times p}`
は時定数を決める行列,
:math:`\bm J \in \mathbb R^{p \times p}`
は系の状態 :math:`\bm x(t) \in \mathbb R^p` の各成分の相互作用を表す行列,
ベクトル :math:`\bm h \in \mathbb R^p` はこの系への外部入力を表す.
正数 :math:`C` はこの系のフィードバックの強さを決めるパラメタである.
関数 :math:`\bm f` の第一引数 :math:`\bm z = C \, \{\bm J \bm x(t) + \bm h\}`
を系への「全入力」と呼ぶことにする.  上述の記号, 特にパラメタ
:math:`\bm \tau, \bm J, \bm h` は :math:`C` に依存しない.
フィードバック強度 :math:`C` への依存性は全入力 :math:`\bm z`
を経由する影響のみである.
本稿では, 極限 :math:`C \to \infty` におけるこの系の振る舞いについて
興味がある場合に, 式 :eq:`def-ds` のような系を :index:`強フィードバック系`
(:index:`strong feedback system`) と呼ぶ.

表記を簡潔にするために, 状態 :math:`\bm x^0` からの 「摂動」
:math:`\bm y = C \, (\bm x - \bm x^0)` に対して :math:`\bm f`
がどう変化するかを,

.. math::
   :label: def-F

   \bm F(\bm y) = \bm F(\bm y; \bm x^0) :=
   \bm f(\bm J \bm y + \bm z^0; \bm y / C + \bm x^0)
   - \bm f(\bm z^0; \bm x^0)

で定義する.  文脈から明らかな場合は, 第二引数は省略する.

漸近関係記号 :math:`\sim`, :math:`O`, :math:`\Theta`, :math:`\Omega`
などについては, :ref:`asymptotics` を参照.  この節では, これらの記号
はすべて :math:`C \to \infty` (as :math:`C \to \infty`) についての
漸近関係を表すとする.

.. admonition:: 力学系の各点での性質

   :math:`\bm x^0` を力学系 :eq:`def-ds` の任意の状態とし,
   :math:`\bm z^0 = C \, \{\bm J \bm x^0 + \bm h\}` と定義する.
   (この節では :math:`\bm x^0` が固定点の場合しか考えないが, ここでの
   定義は固定点でなくても良い.)
   力学系 (あるいは関数 :math:`\bm f`) の状態 :math:`\bm x^0` での
   *伝播性* と *飽和性* を以下で定義する.

   .. _transmissibility:

   伝播性
     .. math::
        \bm F(\Omega(1); \bm x^0) = \Omega(1)

   .. _saturating:

   飽和性
     .. math::
        \bm F(O(1); \bm x^0) = o(1)

   関数 :math:`\bm F` は陰に :math:`C` への依存性をもち,
   状態 :math:`\bm x^0` も :math:`C` に依存しても良いことに注意.

   .. todo:: :math:`O_{\bm x^0}(1)` とか書くべき?
      正確には, 「big O notations が写像 :math:`C \mapsto \bm x^0`
      に依存」すると書くべき?

.. admonition:: 関数 :math:`\bm f` への条件

   :math:`\bm f` は以下の性質を持つ

   - :math:`\bm z^0 = O(1)` ならば, :math:`\bm f` が :math:`\bm z^0` で伝播性をもつ
   - :math:`\bm z^0 = \omega(1)` ならば, :math:`\bm f` が :math:`\bm z^0` で飽和性をもつ

この関数の :math:`\bm f` への条件は, 後述する均衡固定点の性質を導くための
必要条件ではなく, さらに広いクラスでこれらの性質は成り立つ.  しかし, この
条件が応用上必要な力学系では成り立たないことは稀だろう.  [#]_

.. [#] これが成り立たない場合の取り扱いについては,
   `発火率モデル (rate model)`_ の区分的線形関数についてのコメント参照.

.. |cond:saturating| replace:: :ref:`飽和性条件 <saturating>`
.. |cond:transmissibility| replace:: :ref:`伝達率条件 <transmissibility>`

.. todo:: |cond:saturating| は仮定しなくても良いが, 非均衡固定点は発散してしまう
   ので興味が無い, ということについて説明.


.. _method-of-dominant-balance-in-strong-feedback-system:

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
と呼ぶ.  [#]_

.. [#] ここでの均衡固定点や非均衡固定点に属さないクラスの固定点,
   つまり :math:`1 \ll \bm z^0 \lesssim C` (同値だが別の表記では,
   :math:`\bm z^0 = \omega(1)` かつ :math:`\bm z^0 = o(C)`) となる
   場合も考えられる.  例えば, :math:`\bm z^0 = \Theta(C^{1/2})` や
   :math:`\bm z^0 = \Theta(\log C)` など.  この場合,
   :math:`\bm J \bm x^0 + \bm h = o(1)` なので, 「広義の均衡固定点」
   と呼んでも良いかもしれない.  しかし, 以下で導く小さい摂動に対する
   応答速度のオーダーに関する性質は, (狭義の) 均衡固定点のみに成り立つ.

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
       }_{= \bm F(\bm y)}

なので, これの両辺に :math:`C` をかけて

.. math::
   :label: ode-y

   \bm \tau \frac{\D \bm y(t)}{\D t}
   & = - \bm y(t) + C \bm F(\bm y)

を得る (関数 :math:`\bm F` の定義については式 :eq:`def-F` を参照).

:ref:`method-of-dominant-balance` を使ってこの系の
小さな摂動 :math:`\bm y = \Theta(1)`
(元の座標系では :math:`\bm x - \bm x^0 = O(1/C)`) への応答を
調べよう.
もし, :math:`C \bm F(\bm y)` のオーダーが :math:`O(1)` より大きい
(つまり :math:`C \bm F(\bm y) = \omega(1)`) ならば,
:math:`C \bm F(\bm y)` と :math:`\D \bm y/\D t` のオーダーが
等しい (つまり, :math:`\D \bm y/\D t \asymp C \bm F(\bm y)`
となる) ことが, 式 :eq:`ode-y` の成り立つ必要条件である.
これは, 元の座標系では :math:`\D \bm x/\D t \asymp \bm F(\bm y)`
を意味する.

仮定 :math:`\bm y = O(1)` から, :math:`\bm F(\bm y)` のオーダーは

.. math::

   \bm F(\bm y)
   & =
     \left\{
     \begin{array}{lll}
      \Omega(1) & (\text{if } \bm z^0 = O(1)) \\
      o(1)      & (\text{if } \bm z^0 = \omega(1))
     \end{array}
     \right.

と見積もることが出来る.
最後の等式では, :math:`\bm z^0 = O(1)` の場合は |cond:transmissibility| を,
:math:`\bm z^0 = \omega(C)` の場合は |cond:saturating| を用いた.

ゆえに, 小さな摂動 :math:`\bm y = C \, (\bm x - \bm x^0) = \Theta(1)`
に関して,
均衡固定点 (:math:`\bm z^0 = O(1)`) 周辺での応答速度の
オーダーは :math:`\D \bm y/\D t = \Omega(C)`
(:math:`\D \bm x/\D t = \Omega(1)`) となり,
非均衡固定点など, それを満たさない固定点 (:math:`\bm z^0 = \omega(1)`)
周辺での応答速度のオーダーは :math:`\D \bm y/\D t = o(C)`
(:math:`\D \bm x/\D t = o(1)`) となる.
もし固定点 :math:`\bm x^0` が安定ならば,
均衡固定点 (:math:`\bm z^0 = O(1)`) への収束は速く
(:math:`\D \bm x / \D t = \Omega(1)` なので, :math:`C \to \infty`
の極限で消えない),
非均衡固定点 (:math:`\bm z^0 = \Omega(C)`) への収束は遅い
(:math:`\D \bm x / \D t = o(1)` なので, :math:`C \to \infty`
の極限で限りなく小さくなる)
ことが読み取れる.
以上の議論は抽象的な定義にのみ基づいているから, これは幅広いクラスの
力学系の均衡固定点について成り立つ非常に強力な性質であるといえよう.


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

:ref:`method-of-dominant-balance-in-strong-feedback-system`
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

シグモイド関数 :math:`g` は :math:`z^0 = O(1)` からの非ゼロの変化に対して,
必ず非ゼロの変化をうむ, つまり

.. math:: g(\Theta(1) + z^0) - g(z^0) = \Theta(1)

が成り立つ.  これは |cond:transmissibility| の十分条件である.
また, ロジスティック関数の場合は
極限 :math:`z \to \infty` で :math:`g(z) \to 1`,
極限 :math:`z \to -\infty` で :math:`g(z) \to 0` だから,
|cond:saturating| も成り立つ.
一般に, シグモイド関数のように入出力関係が極限 :math:`z \to \pm \infty`
で有限の値に収束すれば |cond:saturating| は成り立つ.
有限の値に収束しなくても |cond:saturating| が成り立つ (かなり人工的な)
例として, :math:`g = \log` がある.

もし, 関数 :math:`g` が

.. math::

   g(z) =
   \begin{cases}
     1 & (1 < z) \\
     z & (0 < z \le 1) \\
     0 & (z \le 0)
   \end{cases}

のような区分的線形関数の場合は, |cond:transmissibility| が成り立たない.
例えば, :math:`\Delta z := 1`, :math:`z^0 := 3`
とおくと :math:`\Delta z = O(1)`, :math:`z^0 = O(1)` だが,

.. math:: g(\Delta z + z^0) - g(z^0) = 0 \neq \Omega(1)

である.  この場合, :math:`\bm x^0` が均衡固定点であるためには,
各 :math:`z^0_i` について, :math:`0 < z^0_i < 1` なる条件が
必要である.


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
上記のシグモイド関数の場合と同様に, |cond:transmissibility| と
|cond:saturating| が成り立つ.
