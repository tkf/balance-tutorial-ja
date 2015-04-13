.. _temporal-fluctuations:

==============
 時間的な揺動
==============

:index:`時間的な揺動` (:index:`temporal fluctuations`)
:index:`速いノイズ` (:index:`fast noise`)

.. math::

   \left[\left(
     u_k^i(t) - \Avg{u_k^i(t)}_t
   \right)^2 \right]_i
   & =
     \sum_{ll'jj'}
     \left[
       J_{kl}^{ij} J_{kl'}^{ij'}
     \right]_i
     (\sigma_l^j(t) - m_l^j)
     (\sigma_{l'}^{j'}(t) - m_{l'}^{j'})
   \\
   & =
     \sum_l
     J_{kl}^2
     \left(1 - \frac K N_l \right)
     \underbrace{
     \frac 1 N_l
     \sum_j
     (\sigma_l^j(t) - m_l^j)^2
     }_{(*)}

.. math::

   \Avg{(*)}_t
   & =
     \Avg{
     \left[
       (\sigma_l^j(t) - m_l^j)^2
     \right]_j
     }_t
   \\
   & =
     \Avg{
     \left[
       \left\{ \sigma_l^j(t) \right\}^2
     \right]_j
     }_t
     -
     \left[
       (m_l^j)^2
     \right]_j
   \\
   & =
     m_l^j - q_l

(note: :math:`\left\{ \sigma_l^j(t) \right\}^2 = \sigma_l^j(t)`)

.. math::

   \Avg{
   \left[\left(
     u_k^i(t) - \Avg{u_k^i(t)}_t
   \right)^2 \right]_i
   }_t
   & =
     \sum_l
     J_{kl}^2
     \left(1 - \frac K N_l \right)
     (m_l^j - q_l)

一番外側の :math:`\Avg{\bullet}_t` は元論文に無い.
