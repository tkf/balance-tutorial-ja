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

.. seealso::

   `Self-averaging - Wikipedia
   <http://en.wikipedia.org/wiki/Self-averaging>`_
