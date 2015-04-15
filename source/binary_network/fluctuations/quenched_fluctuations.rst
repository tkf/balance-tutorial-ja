.. _quenched-fluctuations:

============================
 クエンチされたゆらぎの計算
============================

.. todo:: ロジックを埋める

ここでは, :index:`クエンチされたゆらぎ` (:index:`quenched fluctuations`)
[#]_ が

.. math::

   \left[ \left( \Devi \Avg{u_k^i(t)}_t \right)^2 \right]
   =
   \sum_{l=1,2} J_{kl}^2 q_l =: \beta_k

となることを示す.  ただし, :math:`\Avg{\bullet}_t` は長い時間にわたる
平均である.

.. [#] 無理やり日本語にすると「焼入れされたゆらぎ」と言うのだろうか.


偏差の分解
==========

まず, :math:`\Avg{u_k^i(t)}_t` の集団平均 :math:`[\Avg{u_k^i(t)}_t]`
からのズレ具合 (偏差) を次のように, 2つの成分に分解できることを示す.

.. math::

   \Devi \Avg{u_k^i(t)}_t = \text{(d1)} + \text{(d2)}

ただし, (d1) 「結合数のゆらぎ」, (d2) 「時間平均活動率のゆらぎ」
は, それぞれ

.. math::

   \text{(d1)} = \sum_l \sum_j \Devi J_{kl}^{ij} \, [m_l^j]_j

   \text{(d2)} = \sum_l \sum_j J_{kl}^{ij} \, \Devi m_l^j

と定義される.  結合数は時間によらないので, そのゆらぎが「クエンチ
されている」のは当然であるが, 活動率の時間平均 :math:`m_l^j` も
(平均操作のおかげで) 時間によらないので, そのゆらぎもクエンチされた
ゆらぎに含める必要がある.  つまり,
クエンチされたゆらぎのうち, 直接の影響である (d1) 「結合数のゆらぎ」
と, それが引き起こす間接的な影響である (d2) 「時間平均活動率のゆらぎ」
の2つを勘定すれば良い, という主張である.

これは, 地道に入力の時間平均 :math:`\Avg{u_k^i(t)}_t` の偏差を計算する
ことによって示せる:

.. math::

   \Devi \Avg{u_k^i(t)}_t
   & \overset{(1)} =
     \Devi \Avg{
       \sum_{l = E, I} \sum_{j=1}^{N_l} J_{kl}^{ij} \sigma_l^j(t)
     }_t
   \\
   & \overset{(2)} =
     \Devi \left(
       \sum_{l = E, I} \sum_{j=1}^{N_l} J_{kl}^{ij} m_l^j
     \right)
   \\
   & \overset{(3)} =
     \sum_{l = E, I} \sum_{j=1}^{N_l} J_{kl}^{ij} m_l^j
     -
     \left[
       \sum_{l = E, I} \sum_{j=1}^{N_l} J_{kl}^{i'j} m_l^j
     \right]_{i'}
   \\
   & \overset{(4)} =
     \sum_{l = E, I} \sum_{j=1}^{N_l} J_{kl}^{ij} m_l^j
     -
     \sum_{l = E, I} [J_{kl}^{i'j'}]_{i'} \sum_{j=1}^{N_l} m_l^j
     \qquad (\forall j')
   \\
   & \overset{(5)} =
     \sum_{l = E, I} \sum_{j=1}^{N_l} J_{kl}^{ij} m_l^j
     -
     \underbrace{
     \sum_{l = E, I} [J_{kl}^{i'j'}]_{i'} \sum_{j=1}^{N_l} [m_l^{j''}]_{j''}
     }_{\text{nothing depends on } j}
   \\
   & \overset{(6)} =
     \sum_{l = E, I} \sum_{j=1}^{N_l}
     \left\{
     J_{kl}^{ij} (m_l^j - [m_l^{j''}]_{j''})
     - (J_{kl}^{ij} - [J_{kl}^{i'j'}]_{i'}) [m_l^{j''}]_{j''}
     \right\}
   \\
   & =
     \text{(d1)} + \text{(d2)}

ここで,
(1) :math:`\Devi(x + \text{const.}) = \Devi x`,
(2) 定義 :math:`m_l^j = \Avg{\sigma_l^j(t)}_t`,
(3) 偏差 :math:`\Devi` の定義,
(4) [todo: :ref:`fluctuations-of-input` の該当部分にリンク],
(5) :math:`\sum_{j=1}^{N_l} m_l^j = N_l N_l^{-1} \sum_{j=1}^{N_l} m_l^j
= N_l [m_l^{j''}]_{j''}` であり, :math:`N_l = \sum_{j=1}^{N_l} 1`
なので, 結局 :math:`... = \sum_{j=1}^{N_l} [m_l^{j''}]_{j''}`,
(6) :math:`- J_{kl}^{ij} [m_l^{j''}]_{j''} + J_{kl}^{ij} [m_l^{j''}]_{j''} = 0`,
を用いた.

ふたつの偏差の「直交性」
========================

.. math::

   \left[
   \left(
     \Devi \Avg{u_k^i(t)}_t
   \right)^2
   \right]
   =
   \left[
     \text{(d1)}^2
   \right]
   +
   \left[
     \text{(d2)}^2
   \right]

.. math::

   &
     \left[
       \text{(d1)}
       \text{(d2)}
     \right]
   \\
   & =
     \left[
       \sum_{ll'jj'}
       \Devi J_{kl}^{ij} \, [m_l^{j''}]_{j''} \,
       J_{kl'}^{ij'} \, \Devi m_{l'}^{j'}
     \right]_i
   \\
   & =
     \sum_{ll'jj'}
     \left[
       \Devi J_{kl}^{ij} \, J_{kl'}^{ij'}
     \right]_i
     [m_l^{j''}]_{j''} \, \Devi m_{l'}^{j'}
   \\
   & =
     \sum_{lj}
     \left(
       \left[(J_{kl}^{i*})^2 \right]_i
       -
       \left[J_{kl}^{i*} \right]_i^2
     \right)
     [m_l^{j''}]_{j''} \, \Devi m_{l'}^{j}
   \\
   & =
     \sum_{l}
     \left(
       \left[(J_{kl}^{i*})^2 \right]_i
       -
       \left[J_{kl}^{i*} \right]_i^2
     \right)
     [m_l^{j''}]_{j''} \,
     \underbrace{\sum_j \Devi m_{l'}^{j}}_{=0}
   \\
   & = 0

:math:`\left[\Devi J_{kl}^{ij} \, J_{kl'}^{ij'} \right]_i`
は :math:`(l, j) \neq (l', j')` だと

.. math::

   \left[\Devi J_{kl}^{ij} \, J_{kl'}^{ij'} \right]_i
   =
   \left[ \Devi J_{kl}^{ij} \right]_i
   \left[ J_{kl'}^{ij'} \right]_i
   = 0

なので, 非ゼロになるのは :math:`(l, j) = (l', j')` の場合のみ
である.

.. math::

   \left[\Devi J_{kl}^{ij} \, J_{kl}^{ij} \right]_i
   =
   \left[ (J_{kl}^{ij})^2 \right]_i
   -
   \left[ J_{kl}^{ij} \right]_i^2


結合数のゆらぎ
==============

.. math::

   [\text{(d1)}^2]
   & =
     \left[ \left(
       \sum_l \sum_j \Devi J_{kl}^{ij} \, [m_l^{j''}]_{j''}
     \right)^2 \right]_i
   \\
   & =
     \sum_{ll'jj'}
     \left[
       \Devi J_{kl}^{ij} \, \Devi J_{kl'}^{ij'}
     \right]_i
     [m_l^{j''}]_{j''} \, [m_{l'}^{j'''}]_{j'''}
   \\
   & =
     \sum_j
     J_{kl}^2 \left(1 - \frac K N_l \right)
     \left( [m_l^{j''}]_{j''} \right)^2

:math:`(l, j) \neq (l', j')` だと

.. math::

   \left[
     \Devi J_{kl}^{ij} \, \Devi J_{kl'}^{ij'}
   \right]_i
   =
   \left[
     \Devi J_{kl}^{ij}
   \right]_i
   \left[
     \Devi J_{kl'}^{ij'}
   \right]_i
   = 0

:math:`(l, j) = (l', j')` だと

.. math::

   \left[\left(
     \Devi J_{kl}^{ij}
   \right)^2 \right]_i
   & \overset{(1)} =
     \left[\left(
       J_{kl}^{ij}
     \right)^2 \right]_i
     -
     \left( \left[
       J_{kl}^{ij}
     \right]_i \right)^2
   \\
   & \overset{(2)} \approx
     \left(
       \frac{J_{kl}}{\sqrt K}
     \right)^2
     \frac{K}{N_l}
     -
     \left(
       \frac{J_{kl}}{\sqrt K}
       \frac{K}{N_l}
     \right)^2
   \\
   & =
     \frac{J_{kl}^2}{N_l}
     \left(
       1 - \frac{K}{N_l}
     \right)


時間平均活動率のゆらぎ
======================

.. math::

   [\text{(d2)}^2]
   & =
     \left[ \left(
       \sum_l \sum_j J_{kl}^{ij} \, \Devi m_l^j
     \right)^2 \right]_i
   \\
   & =
     \sum_{ll'jj'}
     \left[
       J_{kl}^{ij} \, J_{kl'}^{ij'}
     \right]_i
     \Devi m_l^j \, \Devi m_{l'}^{j'}
   \\
   & \approx
     \sum_{\substack{ll' \\ l \neq l'}}
     \sum_{jj'}
     \bullet
     +
     \sum_l
     \sum_{\substack{jj' \\ j \neq j'}}
     \bullet
     +
     \sum_l
     \sum_j
     \bullet

.. math::

     \sum_{\substack{ll' \\ l \neq l'}}
     \sum_{jj'}
     \left[
       J_{kl}^{ij} \, J_{kl'}^{ij'}
     \right]_i
     \Devi m_l^j \, \Devi m_{l'}^{j'}
   & =
     \sum_{\substack{ll' \\ l \neq l'}}
     \left[J_{kl}^{i*} \, J_{kl'}^{i*} \right]_i
     \sum_j \Devi m_l^j
     \sum_{j'} \Devi m_{l'}^{j'}
     = 0

.. math::

     \sum_l
     \sum_{\substack{jj' \\ j \neq j'}}
     \left[
       J_{kl}^{ij} \, J_{kl'}^{ij'}
     \right]_i
     \Devi m_l^j \, \Devi m_{l'}^{j'}
   & =
     \sum_l
     \left[J_{kl}^{i*} \, J_{kl'}^{i*} \right]_i
     \sum_j \Devi m_l^j
     \sum_{\substack{j' \\ j \neq j'}} \Devi m_{l'}^{j'}
     = 0

.. math::

     \sum_l
     \sum_j
     \left[
       (J_{kl}^{ij})^2
     \right]_i
     (\Devi m_l^j)^2
   & =
     \sum_l
     \left[
       (J_{kl}^{i*})^2
     \right]_i
     N_l
     \left[
       (\Devi m_l^j)^2
     \right]_j
   \\
   & =
     \sum_l
     \left(
       \frac{J_{kl}}{\sqrt K}
     \right)^2
     \frac{K}{N_l}
     N_l
     \left[
       (\Devi m_l^j)^2
     \right]_j
   \\
   & =
     \sum_l
     J_{kl}^2
     \left[
       (\Devi m_l^j)^2
     \right]_j
   \\
   & =
     \sum_l
     J_{kl}^2
     \left(
       [(m_l^j)^2] - [m_l^j]^2
     \right)


合計
====

.. math::

   \left[
   \left(
     \Devi \Avg{u_k^i(t)}_t
   \right)^2
   \right]
   & \approx
     \left[
       \text{(d1)}^2
     \right]
     +
     \left[
       \text{(d2)}^2
     \right]
   \\
   & \approx
     \sum_j
     J_{kl}^2 \left(1 - \frac K N_l \right)
     \left( [m_l^{j''}]_{j''} \right)^2
     +
     \sum_l
     J_{kl}^2
     \left(
       [(m_l^j)^2] - [m_l^j]^2
     \right)
   \\
   & \approx
     \sum_l
     J_{kl}^2
     \,
     [(m_l^j)^2]
   =
     \sum_l
     J_{kl}^2
     \,
     q_l
