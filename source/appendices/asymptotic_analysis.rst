.. _asymptotics:

================================
 漸近解析 (Asymptotic analysis)
================================


.. list-table::
   :widths: 10 10 50 30

   * - 記号
     -
     - 定義
     - 意味
   * - :math:`f = O(g)`
     - :math:`f \lesssim g`
     - 定数 :math:`c > 0` が存在し, 十分大きいすべての :math:`x` で
       :math:`|f(x)| \le c g(x)`
     - :math:`f` の増加は :math:`g` より遅いか同じ
   * - :math:`f = o(g)`
     - :math:`f \ll g`
     - :math:`\lim_{x \to \infty} f(x)/g(x) = 0`
     - :math:`f` の増加は :math:`g` より遅い
   * - ---
     - :math:`f \sim g`
     - :math:`\lim_{x \to \infty} f(x)/g(x) = 1`
     - :math:`f` が :math:`g` に漸近する
   * - :math:`f = \Theta(g)`
     - :math:`f \asymp g`
     - :math:`f \ll g \ll f`
     - :math:`f` と :math:`g` は同速度で増加
   * - :math:`f = \Omega(g)`
     - ---
     - :math:`g = O(f)`
     -
   * - :math:`f = \omega(g)`
     - ---
     - :math:`g = o(f)`
     -

* :math:`f \ll g` を :math:`f = O(g)` と定義するか, :math:`f = o(g)` と定義するかは
  文献に依るようだ.  ここでは, :math:`f = o(g)` で定義し, :math:`f = O(g)` と同値の
  二項関係は :math:`f \lesssim g` と書く.  しかし, この記法は慣例的なものではない.
* :math:`f \sim g` を :math:`f \ll g \ll f` で定義する流儀もある [#]_ ようだが, ここでの
  定義とは違う.

.. [#] `254A, Notes 0: A review of probability theory | What's new
   <https://terrytao.wordpress.com/2010/01/01/254a-notes-0-a-review-of-probability-theory/>`_



.. _method-of-dominant-balance:

支配項均衡の方法
================

:index:`支配項均衡の方法` (:index:`method of dominant balance`)

.. todo:: method of dominated balance について書く
