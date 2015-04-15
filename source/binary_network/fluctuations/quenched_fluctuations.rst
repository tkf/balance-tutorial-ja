.. _quenched-fluctuations:

============================
 クエンチされたゆらぎの計算
============================

ここでは, :index:`クエンチされたゆらぎ` (:index:`quenched fluctuations`)
[#]_ が

.. math::
   :label: beta-is-quenched-fluctuations

   \left[ \left( \Devi \Avg{u_k^i(t)}_t \right)^2 \right]
   \xrightarrow{N \to \infty}
   \sum_{l=1,2} J_{kl}^2 q_l =: \beta_k

となることを示す.  ただし, :math:`\Avg{\bullet}_t` は長い時間にわたる
平均である.
ここで,  :math:`q_k` は :index:`オーダーパラメター` (:index:`order parameter`)
と呼ばれ, ニューロン :math:`i` の活動率の時間平均 :math:`m_k^i` を用いて,

.. math::

   m_k^i &:= \Avg{\AvgDyn{\sigma_k^i(t)}}_t \\
   q_k &:= \PAvg{(m_k^i)^2}_i

と定義される.

.. [#] 無理やり日本語にすると「焼入れされたゆらぎ」と言うのだろうか.


偏差の分解
==========

まず, :math:`\Avg{u_k^i(t)}_t` の集団平均 :math:`[\Avg{u_k^i(t)}_t]`
からのズレ具合 (偏差) を次のように, 2つの成分に分解できることを示す.

.. math::

   \Devi \Avg{u_k^i(t)}_t
   =
   \underbrace{
     \sum_l \sum_j \Devi J_{kl}^{ij} \, m_l
   }_{\text{(d1)}}
   +
   \underbrace{
     \sum_l \sum_j J_{kl}^{ij} \, \Devi m_l^j
   }_{\text{(d2)}}

ここで (d1) は 「結合数のゆらぎ」, (d2) [#]_ は 「時間平均活動率のゆらぎ」
である.  結合数は時間によらないので, そのゆらぎが「クエンチ
されている」のは当然であるが, 活動率の時間平均 :math:`m_l^j` も
(平均操作のおかげで) 時間によらないので, そのゆらぎもクエンチされた
ゆらぎに含める必要がある.  つまり,
クエンチされたゆらぎのうち, 直接の影響である (d1) 「結合数のゆらぎ」
と, それが引き起こす間接的な影響である (d2) 「時間平均活動率のゆらぎ」
の2つを勘定すれば良い, という主張である.

.. [#] ここでの (d2) は, 原著 [vanVreeswijk1998]_ の式(5.5)

   .. math::

      \delta_2 \langle u_k^i \rangle
      = \sum_{l=1}^2 \sum_{j=1}^{N_l} \delta J_{kl}^{ij} [m_l^j]

   と同値であることは, :math:`[m_l^j] = m_l` より分かる.
   しかし, この表記では, :math:`[m_l^j]` が何を意味する不鮮明である.
   親切に書くのならば, :math:`[m_l^{j'}]_{j'}` として,
   添字 :math:`j` への依存性が無いことを示すべきであるが,
   それならそもそも :math:`m_l` と書く方が良い.

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
   & \overset{(5)} \approx
     \sum_{l = E, I} \sum_{j=1}^{N_l} J_{kl}^{ij} m_l^j
     -
     \underbrace{
     \sum_{l = E, I} [J_{kl}^{i'j'}]_{i'} \sum_{j=1}^{N_l} m_l
     }_{\text{nothing depends on } j}
   \\
   & \overset{(6)} =
     \sum_{l = E, I} \sum_{j=1}^{N_l}
     \left\{
     J_{kl}^{ij} (m_l^j - m_l)
     - (J_{kl}^{ij} - [J_{kl}^{i'j'}]_{i'}) m_l
     \right\}
   \\
   & =
     \text{(d1)} + \text{(d2)}

ここで,
(1) :math:`\Devi(x + \text{const.}) = \Devi x`,
(2) 定義 :math:`m_l^j = \Avg{\sigma_l^j(t)}_t`,
(3) 偏差 :math:`\Devi` の定義,
(4) :ref:`correlations-of-sigmaj-and-jij` の議論,
(5) :math:`\sum_{j=1}^{N_l} m_l^j = N_l N_l^{-1} \sum_{j=1}^{N_l} m_l^j
= N_l [m_l^{j''}]_{j''} = N_l m_l` であり, :math:`N_l = \sum_{j=1}^{N_l} 1`
なので, 結局 :math:`... = \sum_{j=1}^{N_l} m_l`,
(6) :math:`- J_{kl}^{ij} m_l + J_{kl}^{ij} m_l = 0`,
を用いた.
式変形 (4) の右辺とそれ以降の式中に現れる :math:`j'` は, :math:`1` から :math:`N_l`
のどの値をとっても良い.  これは :ref:`lln` より :math:`[J_{kl}^{i'j'}]_{i'}` が
同じ値に収束するからである.

ふたつの偏差の相関
==================

上記の計算より導かれた2つの偏差の二乗平均をとって, ゆらぎを

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

のように求めたいが, そのためにはそれらの偏差が
無相関 :math:`\PAvg{\text{(d1)}\text{(d2)}} = 0`
でなければならない.  これは簡単に示せる:

.. math::

   &
     \left[
       \text{(d1)}
       \text{(d2)}
     \right]
   \\
   & \overset{(1)} =
     \left[
       \sum_{ll'jj'}
       \Devi J_{kl}^{ij} \, m_l \,
       J_{kl'}^{ij'} \, \Devi m_{l'}^{j'}
     \right]_i
   \\
   & \overset{(2)} =
     \sum_{ll'jj'}
     \left[
       \Devi J_{kl}^{ij} \, J_{kl'}^{ij'}
     \right]_i
     m_l \, \Devi m_{l'}^{j'}
   \\
   & \overset{(3)} =
     \sum_{lj}
     \left(
       \left[(J_{kl}^{i*})^2 \right]_i
       -
       \left[J_{kl}^{i*} \right]_i^2
     \right)
     m_l \, \Devi m_{l'}^{j}
   \\
   & =
     \sum_{l}
     \left(
       \left[(J_{kl}^{i*})^2 \right]_i
       -
       \left[J_{kl}^{i*} \right]_i^2
     \right)
     m_l \,
     \underbrace{\sum_j \Devi m_{l'}^{j}}_{=0}
   \\
   & = 0

式変形 (1) では :ref:`correlations-of-sigmaj-and-jij` の議論
を用いた.
式変形 (2) では,
:math:`\left[\Devi J_{kl}^{ij} \, J_{kl'}^{ij'} \right]_i`
は :math:`(l, j) \neq (l', j')` だと

.. math::

   \left[\Devi J_{kl}^{ij} \, J_{kl'}^{ij'} \right]_i
   =
   \left[ \Devi J_{kl}^{ij} \right]_i
   \left[ J_{kl'}^{ij'} \right]_i
   = 0

なので, 非ゼロになるのは :math:`(l, j) = (l', j')` の場合のみ
であることを用いた.
式変形 (3) は, 偏差 :math:`\Devi` の定義に沿って

.. math::

   \left[\Devi J_{kl}^{ij} \, J_{kl}^{ij} \right]_i
   =
   \left[ (J_{kl}^{ij})^2 \right]_i
   -
   \left[ J_{kl}^{ij} \right]_i^2

という計算をすれば良い.  式変形 (3) の右辺以降に現れる
添字の :math:`*` は, この部分の添字が何でも良い
ことを表す.

結合数のゆらぎ
==============

.. math::

   [\text{(d1)}^2]
   & =
     \left[ \left(
       \sum_l \sum_j \Devi J_{kl}^{ij} \, m_l
     \right)^2 \right]_i
   \\
   & \overset{(1)} =
     \left[
       \sum_{ll'jj'}
       \Devi J_{kl}^{ij} \, \Devi J_{kl'}^{ij'}
       \, m_l \, m_{l'}
     \right]_i
   \\
   & \overset{(2)} =
     \sum_{ll'jj'}
     \left[
       \Devi J_{kl}^{ij} \, \Devi J_{kl'}^{ij'}
     \right]_i
     m_l \, m_{l'}
   \\
   & \overset{(3)} =
     \sum_j
     J_{kl}^2 \left(1 - \frac K N_l \right)
     \left( m_l \right)^2

ここで,
(1) :ref:`tech-for-prod-of-sum` と
(2) :ref:`correlations-of-sigmaj-and-jij` の議論
を用いた.
最後の式変形 (3) では,
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

となり,
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

となることを用いた.
この計算では,
(1) 偏差 :math:`\Devi` の定義を使い,
(2) :ref:`lln` と |def:J| による期待値の計算
をした.


時間平均活動率のゆらぎ
======================

.. math::

   [\text{(d2)}^2]
   & =
     \left[ \left(
       \sum_l \sum_j J_{kl}^{ij} \, \Devi m_l^j
     \right)^2 \right]_i
   \\
   & \overset{(1)} =
     \left[
       \sum_{ll'jj'}
       J_{kl}^{ij} \, J_{kl'}^{ij'}
       \Devi m_l^j \, \Devi m_{l'}^{j'}
     \right]_i
   \\
   & \overset{(2)} \approx
     \sum_{ll'jj'}
     \left[
       J_{kl}^{ij} \, J_{kl'}^{ij'}
     \right]_i
     \Devi m_l^j \, \Devi m_{l'}^{j'}
   \\
   & =
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

ここで,
(1) :ref:`tech-for-prod-of-sum` と
(2) :ref:`correlations-of-sigmaj-and-jij` の議論
を用いた.
上記の3つの項は以下のように計算できる.

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
   & \overset{(1)} =
     \sum_l
     \left[
       (J_{kl}^{i*})^2
     \right]_i
     N_l
     \left[
       (\Devi m_l^j)^2
     \right]_j
   \\
   & \overset{(2)} =
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
   & \overset{(3)} =
     \sum_l
     J_{kl}^2
     \left(
       [(m_l^j)^2] - [m_l^j]^2
     \right)
   \\
   & \overset{(4)} =
     \sum_l
     J_{kl}^2
     \left(
       q_l - m_l^2
     \right)

ここで,
(1) :math:`\left[(J_{kl}^{ij})^2 \right]_i` が :math:`j` に依存しないこと,
(2) :ref:`lln` と |def:J| による期待値の計算,
(3) :math:`[(\Devi x)^2] = [x^2] - [x]^2`,
(4) :math:`q_k` と :math:`m_k` の定義
を用いた.


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
     \left( m_l \right)^2
     +
     \sum_l
     J_{kl}^2
     \left(
       q_l - m_l^2
     \right)
   \\
   & =
     \sum_l J_{kl}^2 \, q_l
     + O(N_l^{-1})
   \\
   & \xrightarrow{N \to \infty}
     \sum_l J_{kl}^2 \, q_l

これで, クエンチされたゆらぎが式 :eq:`beta-is-quenched-fluctuations`
で表されることが示された.
