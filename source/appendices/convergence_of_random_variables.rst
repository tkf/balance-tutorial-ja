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

.. _elln:

無相関変数に対する大数の法則
----------------------------

大数の法則が成り立つためには確率変数が同一の分布の従う条件や, 独立であ
るという条件は実は必要ではない.  確率変数の分散に「有界性」があり,
(独立ではなく) 無相関であれば十分である.  本稿では, 以下の定理
([Cinlar2011]_ の Proposition `III.6.13`__ (p.121) より)
を繰り返し用いる.

__ http://link.springer.com/content/pdf/10.1007%2F978-0-387-87859-1_3.pdf#page=29

.. admonition:: 無相関変数に対する大数の法則

   確率変数 :math:`X_n` (:math:`n = 1, 2, \ldots`) が無相関で,
   ある非ゼロで正の増加列 :math:`b_1, b_2, \ldots` を用いて
   :math:`\sum_{n=1}^\infty \Var (X_n / b_n) < \infty` とできる
   ならば, :math:`(\sum_{m=1}^n X_n - \Expect \sum_{m=1}^n X_n) / b_n \to 0`
   が :math:`L^2` 収束と確率収束の意味で成り立つ.

本稿では確率変数の収束の細かい違いについて神経質に使い分けないが,
前者は
:math:`\Expect |(\sum_{m=1}^n X_n - \Expect \sum_{m=1}^n X_n) / b_n|^2 \to 0`,
後者は
:math:`\Prob \{ (\sum_{m=1}^n X_n - \Expect \sum_{m=1}^n X_n) / b_n \to 0 \} = 1`
を意味する.

.. _clt:

中心極限定理 (central limit theorem)
====================================

.. todo:: CLT について書く

.. seealso::

   `中心極限定理 - Wikipedia
   <http://ja.wikipedia.org/wiki/%E4%B8%AD%E5%BF%83%E6%A5%B5%E9%99%90%E5%AE%9A%E7%90%86>`_

   `Central limit theorem - Wikipedia
   <http://en.wikipedia.org/wiki/Central_limit_theorem>`_


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
(:ref:`binary-network-model` 参照) である.  この場合,
各 :math:`X_n` は有界なので, :math:`b_n = n` で :ref:`elln`
の「有界性」の条件
:math:`\sum_{n=1}^\infty \Var (X_n / b_n) < \infty`
を満たす.  さらに, すべての確率変数の平均
が同一 :math:`\Avg{X_j} = \mu` (:math:`j = 1, 2, \ldots`)
ならば, この定理より,
:math:`\lim_{N \to \infty} N^{-1} \sum_{i=1}^N X_i = \mu`
が言える.

.. seealso::

   `Self-averaging - Wikipedia
   <http://en.wikipedia.org/wiki/Self-averaging>`_
