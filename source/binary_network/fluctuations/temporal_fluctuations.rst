.. _temporal-fluctuations:

==================
 時間ゆらぎの計算
==================

:index:`時間ゆらぎ` (:index:`temporal fluctuations`)
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
     m_l - q_l

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
     (m_l - q_l)

一番外側の :math:`\Avg{\bullet}_t` は元論文に無い.

この計算結果から, 左辺は必ず正なので :math:`q_l \ge m_l` であり,
等式 :math:`q_l = m_l` は時間ゆらぎの無い場合にのみ達成される
ことが分かる.  この解を, 原著 [vanVreeswijk1998]_ にならい
:index:`凍結解` (:index:`frozen solution`) と呼ぶ.
