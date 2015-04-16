.. _rate-dist:

======================
 時間平均活動率の分布
======================

集団 :math:`k` の時間平均活動率の分布は

.. math::
   \rho_k(m)
   := \lim_{N \to \infty} \frac{1}{N_k} \sum_{i=1}^{N_k} \delta(m - m_k^i)
   = \lim_{N \to \infty} \PAvg{\delta(m - m_k^i)}_i

で定義される.  :ref:`order-parameter-q` の表式を用いれば,
:math:`\PAvg{f(x_i)}_i \approx \int \D x \, f(x)`
だから,

.. math:: \rho_k(m) = \int Dx \, \delta(m - m_k(x))

で計算できる.

.. todo:: ↑の式は逆関数で書き直せるんだっけ?  確認して追記.
