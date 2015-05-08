.. _temporal-fluctuations:

==================
 時間ゆらぎの計算
==================

ここでは
:index:`時間ゆらぎ` (:index:`temporal fluctuations`)
が

.. math::
   :label: temporal-fluctuations-in-m-and-q

   \Avg{
     \left[\left(
       u_k^i(t) - \Avg{u_k^i(t)}_t
     \right)^2 \right]_i
   }_{t}
   \xrightarrow{N \to \infty}
   \sum_l J_{kl}^2 (m_l - q_l)
   =
   \alpha_k - \beta_k

となることを示す.  [#]_

.. [#] 外側の時間平均 :math:`\Avg{\bullet}_t` は [vanVreeswijk1998]_
   には無いが,これがあるほうが定義としては自然だろう. 外側の時間平均
   :math:`\Avg{\bullet}_t` が無くても計算結果は変わらないことは,
   :ref:`time-average-is-unnecessary` で示す.

.. :index:`速いノイズ` (:index:`fast noise`)
   とも呼ばれることについて触れたほうが良い?

まずは :math:`\Avg{\bullet}_t` の中身を計算する.

.. math::

   \left[\left(
     u_k^i(t) - \Avg{u_k^i(t)}_t
   \right)^2 \right]_i
   & \overset{(1)} =
     \left[
       \sum_{ll'jj'}
       J_{kl}^{ij} J_{kl'}^{ij'}
       (\sigma_l^j(t) - m_l^j)
       (\sigma_{l'}^{j'}(t) - m_{l'}^{j'})
     \right]_i
   \\
   & \overset{(2)} =
     \sum_{ll'jj'}
     \left[
       J_{kl}^{ij} J_{kl'}^{ij'}
     \right]_i
     (\sigma_l^j(t) - m_l^j)
     (\sigma_{l'}^{j'}(t) - m_{l'}^{j'})
   \\
   & \overset{(3)} \approx
     \sum_{lj}
     \left[
       J_{kl}^{ij} J_{kl}^{ij}
     \right]_i
     (\sigma_l^j(t) - m_l^j)^2
   \\
   & \overset{(4)} =
     \sum_l
     J_{kl}^2
     \left(1 - \frac K N_l \right)
     \underbrace{
     \frac 1 N_l
     \sum_j
     (\sigma_l^j(t) - m_l^j)^2
     }_{(*)}

ここで,
(1) :ref:`tech-for-prod-of-sum`,
(2) :ref:`correlations-of-sigmaj-and-jij` の議論,
(3) :math:`\sigma_l^j(t)` と :math:`\sigma_{l'}^{j'}(t)` が無相関
なので, :ref:`fluctuation-of-time-averaged-local-rate` と同様に,
:math:`(j, l) = (j', l')` の項以外は :math:`O(1/N)` の大きさしか
もたないこと,
(4) :ref:`lln` と |def:J| による期待値の計算,
を用いた.

この式を時間平均 :math:`\Avg{\bullet}_t` したものを計算したい.  時間に依存する
のは (*) の部分のみなので, これの時間平均をとる.

.. math::

   \Avg{(*)}_t
   & =
     \Avg{
     \left[
       (\sigma_l^j(t) - m_l^j)^2
     \right]_j
     }_t
   \\
   & \overset{(1)} =
     \Avg{
     \left[
       \left( \sigma_l^j(t) \right)^2
     \right]_j
     }_t
     -
     \left[
       (m_l^j)^2
     \right]_j
   \\
   & \overset{(2)} =
     \Avg{\PAvg{
       \sigma_l^j(t)
     }}_t
     -
     \left[
       (m_l^j)^2
     \right]_j
   \\
   &  \overset{(3)} =
     m_l - q_l

ここで,
(1) :math:`[(\Devi x)^2] = [x^2] - [x]^2` と同種の計算,
(2) :math:`\sigma_l^j(t)` の取りうる値は 0 か 1 なので
:math:`\left( \sigma_l^j(t) \right)^2 = \sigma_l^j(t)`,
(3) :math:`m_k` と :math:`q_k` の定義,
を用いた.

以上の計算を統合すると,

.. math::

   \Avg{
   \left[\left(
     u_k^i(t) - \Avg{u_k^i(t)}_t
   \right)^2 \right]_i
   }_t
   & \approx
     \sum_l
     J_{kl}^2
     \left(1 - \frac K N_l \right)
     (m_l - q_l)

が導かれる.  これの左辺の極限 :math:`N \to \infty` をとると
式 :eq:`temporal-fluctuations-in-m-and-q` が導かれる.


.. _time-average-is-unnecessary:

時間平均なしでも時間ゆらぎは計算できる
======================================

時間に依存する部分 (*) を, 時間平均なしで計算すると

.. math::

   (*)
   & =
     \PAvg{
       (\sigma_l^j(t) - m_l^j)^2
     }_j
   \\
   & =
     \PAvg{
       \left( \sigma_l^j(t) \right)^2
     }_j
     -
     2
     \PAvg{
       \sigma_l^j(t) \,
       m_l^j
     }_j
     +
     \PAvg{
       (m_l^j)^2
     }_j
   \\
   & =
     \PAvg{
       \left( \sigma_l^j(t) \right)^2
     }_j
     -
     \PAvg{
       (m_l^j)^2
     }_j
     -
     2
     \PAvg{
       (\sigma_l^j(t) - m_l^j) \,
       m_l^j
     }_j
   \\
   & =
     m_k(t)
     -
     q_l
     +
     2
     \PAvg{
       \zeta_l^j(t) \,
       m_l^j
     }_j

となる.
ただし, :math:`\zeta_l^j(t) = \sigma_l^j(t) - m_l^j` とおいた.

この (*) が定常状態では :math:`\Avg{(*)}_t` と等しいことが示せる. まず,
第一項は :math:`m_k(t) = m_k` である.  よって, 第三項がゼロになること
が示せれば良い. そのために, 第三項に現れる確率変数は定常状態で
:math:`\AvgDyn{\zeta_l^j(t)} = m_l^j(t) - m_l^j = 0` となることを使う.
さらに, :ref:`poorf-async` の議論から, :math:`\sigma_l^j(t)` つまり
:math:`\zeta_l^j(t) = \sigma_l^j(t) - m_l^j` が違うニューロン同士では
無相関であることに注意すれば, :ref:`elln` より,

.. math::

   &
     \PAvg{
       \zeta_l^j(t) \,
       m_l^j
     }_j
   \approx
     \AvgJ{\AvgDyn{
       \zeta_l^j(t) \,
       m_l^j
     }}
     = 0

となる.
