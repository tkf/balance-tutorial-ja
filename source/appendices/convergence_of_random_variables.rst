================
 確率変数の収束
================

.. seealso::

   `確率変数の収束 - Wikipedia
   <http://ja.wikipedia.org/wiki/%E7%A2%BA%E7%8E%87%E5%A4%89%E6%95%B0%E3%81%AE%E5%8F%8E%E6%9D%9F>`_

   `Convergence of random variables - Wikipedia
   <http://en.wikipedia.org/wiki/Convergence_of_random_variables>`_


.. _lln:

大数の法則 (law of large numbers)
=================================

.. todo:: LNN について書く

:index:`大数の法則` (:index:`law of large numbers`)

.. math::

   \lim_{N \to \infty} \frac 1 N \sum_{i=1}^{N} X_i = \mu

.. seealso::

   `大数の法則 - Wikipedia
   <http://ja.wikipedia.org/wiki/%E5%A4%A7%E6%95%B0%E3%81%AE%E6%B3%95%E5%89%87>`_

   `Law of large numbers - Wikipedia
   <http://en.wikipedia.org/wiki/Law_of_large_numbers>`_


.. _clt:

中心極限定理 (central limit theorem)
====================================

.. todo:: CLT について書く

.. seealso::

   `中心極限定理 - Wikipedia
   <http://ja.wikipedia.org/wiki/%E4%B8%AD%E5%BF%83%E6%A5%B5%E9%99%90%E5%AE%9A%E7%90%86>`_

   `Central limit theorem - Wikipedia
   <http://en.wikipedia.org/wiki/Central_limit_theorem>`_


.. _lyapunov-clt:

Lyapunov central limit theorem
------------------------------

.. todo:: Lyapunov CLT について書く


.. _lindeberg-clt:

Lindeberg central limit theorem
-------------------------------

.. todo:: Lindeberg CLT について書く

.. seealso::

   `Lindeberg's condition - Wikipedia
   <http://en.wikipedia.org/wiki/Lindeberg's_condition>`_

   `254A, Notes 2: The central limit theorem | What's new
   <https://terrytao.wordpress.com/2010/01/05/254a-notes-2-the-central-limit-theorem/>`_


.. index:: 自己平均性, self-averaging

.. _self-averaging:

自己平均性 (self-averaging property)
====================================

確率変数 :math:`\bm X = (X_1, \ldots, X_N)^\intercal` がすべての
:math:`j = 1, \ldots, N` について
:math:`\lim_{N \to \infty} N^{-1} \sum_{i=1}^N X_i = \Avg{X_j}`
を満たす時, 確率変数 :math:`\bm X` は自己平均的である
(:math:`\bm X` is self-averaging) と呼ばれる.
ただし, :math:`\Avg{X_j}` は 確率変数 :math:`\bm X` についての
平均で, "average over realisations" や "average over samples"
と呼ばれる.

確率変数 :math:`\bm X` は例えばネットワークの状態
:math:`\bm \sigma = (\sigma_1, \ldots, \sigma_N)^\intercal`
(:ref:`binary-network-model` 参照) である.

.. todo:: Cinlar の III.6.13 は無相関の仮定+α で LLN を導いている
   ので, これを使えば自己平均性はすぐ出ることを説明する.
   :ref:`lindeberg-clt` を用いた以下の議論は削除.

もし, 各 :math:`X_i` が独立であり, 後述するゆるい条件を満たす
ならば, :ref:`lyapunov-clt` あるいは :ref:`lindeberg-clt` を用いて
自己平均性を満たすことが出来る.  ここで, 各 :math:`X_i` の
期待値を :math:`\mu_i = \Avg{X_i}`,
分散を :math:`\sigma_i^2 = \Var X_i` [#]_
と書き, :math:`s_N^2 := \sum_{i=1}^N \sigma_i^2` と定める.
確率変数 :math:`\bm X` に次の条件を課そう.

- 各 :math:`X_i` が独立である.
- :ref:`lindeberg-clt` (あるいは :ref:`lyapunov-clt`) の条件を満たす.
- すべての :math:`i` について :math:`\sigma_i` が上下から制限 (bound)
  されている.  つまり, :math:`N` に依らない実数 :math:`m, M` で
  :math:`0 < m < M < \infty` なるものがあり, すべての :math:`N` で
  :math:`m < \min_i \sigma_i` かつ :math:`\max_i \sigma_i < M` である.

.. todo:: 第3の条件から第2の条件が導けるのでは?

.. [#] ここでの :math:`\sigma_i` はニューロンの状態ではない!

最後の条件から直ちに :math:`s_N^2 \sim c N` (as :math:`N \to \infty`)
(:ref:`asymptotics` 参照) が言える.  ただし, :math:`c` は :math:`N`
に依らない実数である.  :ref:`lindeberg-clt` より

.. math::

   \frac{1}{s_N} \sum_{i=1} (X_i - \mu_i)
   \sim
   \frac{1}{\sqrt{c N}} \sum_{i=1} X_i (X_i - \mu_i)
   \quad
   (\text{as } N \to \infty)

の確率分布が平均0, 分散1のガウス分布に収束することが言えるので,

.. math::

   \frac 1 N \sum_{i=1} X_i
   =
   \frac 1 N \sum_{i=1} (X_i - \mu_i)
   +
   \frac 1 N \sum_{i=1} \mu_i
   \sim
   \sqrt{\frac{c}{N}}
   \frac{1}{\sqrt{c N}} \sum_{i=1} (X_i - \mu_i)
   +
   \frac 1 N \sum_{i=1} \mu_i
   \quad
   (\text{as } N \to \infty)

の確率分布は平均 :math:`N^{-1} \sum_{i=1} \mu_i`,
分散 :math:`\sqrt{c/N}` のガウス分布に漸近する.
極限 :math:`N \to \infty` で分散は0になるので, 結局

.. math::

   \lim_{N \to \infty}
   \frac 1 N \sum_{i=1} X_i
   =
   \lim_{N \to \infty}
   \frac 1 N \sum_{i=1} \Avg{X_i}

が成り立つ.

さらに, :math:`X_i` が二値変数 (binary variable) の場合は,
「各 :math:`X_i` が独立」の仮定が「各 :math:`X_i` が無相関」
より導かれる.

また,

.. math::

   \Avg{(X_i - \mu_i)^3}
   & =
     (1 - \mu_i)^3 \, \mu_i + (- \mu_i)^3 (1 - \mu_i)
   \\
   & =
     (1 - \mu_i) \, \mu_i \,
     ((1 - \mu_i)^2 - \mu_i^2)
   \\
   & =
     (1 - \mu_i) \, \mu_i \,
     (1 - \mu_i + \mu_i)
     (1 - \mu_i - \mu_i)
   \\
   & =
     (1 - \mu_i) \, \mu_i \,
     (1 - 2 \mu_i)

.. seealso::

   `Self-averaging - Wikipedia
   <http://en.wikipedia.org/wiki/Self-averaging>`_
