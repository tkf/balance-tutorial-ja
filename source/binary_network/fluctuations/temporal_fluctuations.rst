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

となることを示す.  [#]_

.. [#] 一番外側の :math:`\Avg{\bullet}_t` は元論文に無い.

   .. todo:: :math:`\Avg{\bullet}_t` を含めるのが正しいのか確認

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
   & \overset{(3)} =
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
(3) [todo: :math:`\sigma_l^j(t)` と :math:`\sigma_{l'}^{j'}(t)` が無相関
であることを用いてこれを示す.]
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
       \left\{ \sigma_l^j(t) \right\}^2
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
:math:`\left\{ \sigma_l^j(t) \right\}^2 = \sigma_l^j(t)` [#]_,
(3) :math:`m_k` と :math:`q_k` の定義,
を用いた.

.. [#] 二値変数のからむ計算ではよく使われるテクニック.

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

この計算結果から, 左辺は必ず正なので :math:`q_l \ge m_l` であり,
等式 :math:`q_l = m_l` は時間ゆらぎの無い場合にのみ達成される
ことが分かる.  この解を, 原著 [vanVreeswijk1998]_ にならい
:index:`凍結解` (:index:`frozen solution`) と呼ぶ.
