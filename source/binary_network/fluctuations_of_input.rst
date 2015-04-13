.. _fluctuations-of-input:

==============
 入力のゆらぎ
==============

ここでは, 入力のゆらぎ :math:`[(\Devi u_k^i (t))^2]_i`
と集団平均活動率 :math:`m_l(t)` を結ぶ式

.. math::

   [(\Devi u_k^i (t))^2]_i
   =
   \sum_{l = E, I} ( J_{kl} )^2 \,
   m_l(t)
   =:
   \alpha_k(t)
i
を導出する.  ここで :math:`[ \bullet ]_i` は
集団 :math:`k \in \{ E, I \}` 内のニューロンに関する
:index:`集団平均` (:index:`population average`;
添字 :math:`i` に沿った平均) を表し,

.. math::

   [ \bullet ]_i = \frac{1}{N_k} \sum_{i=1}^{N_k} \bullet

で定義される.
文脈からどの添字に関する平均かが明らかであれば, 添字 :math:`i` は省略する.
また, :math:`\Devi` は集団平均からの偏差 :math:`\Devi X_i = X_i - [X_i]_i`
である.

入力の集団平均
==============

.. math::

   u_k(t)
   & =
     [u_k^i (t)]_i
   \\
   & =
     \left[
       \sum_{l = E, I} \sum_{j=1}^{N_l} J_{kl}^{ij} \sigma_l^j(t)
       + u_k^0 - \theta_k
     \right]_i
   \\
   & =
     \sum_{l = E, I}
     \underbrace{
     \left[
       \sum_{j=1}^{N_l} J_{kl}^{ij} \sigma_l^j(t)
     \right]_i
     }_{(*)}
     + u_k^0 - \theta_k

この (*) は以下のように近似的できる.

.. math::

   (*)
   & \overset{(1)} \approx
     \sum_{j=1}^{N_l}
     \left[
       J_{kl}^{ij}
     \right]_i
     \sigma_l^j(t)
   \\
   & \overset{(2)} \approx
     \sum_{j=1}^{N_l}
     J_{kl} \frac{\sqrt K}{N_l}
     \sigma_l^j(t)
   \\
   & \overset{(3)} =
     J_{kl} \frac{\sqrt K}{N_l}
     \sum_{j=1}^{N_l}
     \sigma_l^j(t)
   \\
   & \overset{(4)} =
     J_{kl} \sqrt K
     \left[
       \sigma_l^j(t)
     \right]_j
   \\
   & \overset{(5)} =
     J_{kl} \sqrt K m_l(t)

最初の式変形 (1) は, :math:`[ \bullet ]_i` の線形性 (よって
和 :math:`\sum_{j=1}^{N_l}` と集団平均 :math:`[ \bullet ]_i` は演算順序を入れ
替えて良い) と :math:`\sigma_l^j(t)` が :math:`i` に依らないことから正当化される.
後者は正しくは, :math:`J_{kl}^{ij}` と :math:`\sigma_l^j(t)` の相関が無いと
仮定することで, :math:`\sigma_l^j(t)` は :math:`i`, つまり :math:`J_{kl}^{ij}`
に依らずに決まるから集団平均 :math:`[ \bullet ]_i` の演算にとっては定数として
扱えることから言える. この :math:`J_{kl}^{ij}` と :math:`\sigma_l^j(t)` が無相関
であるという仮定は,

1. 事象 :math:`J_{kl}^{ij} \neq 0` と :math:`J_{lk}^{ji} \neq 0` が独立
   (:math:`J_{kl}^{ij}` の定義より)
2. :math:`\sigma_l^j(t)` と :math:`\sigma_l^{j'}(t)` (:math:`j' \neq j`)
   が無相関という仮定

から正当化される.
この無相関の仮定は有限の :math:`N, K` では正しくないので, この式変形は完全な等号では
結ばれず, :math:`\approx` と書いている.

.. todo:: 式変形 :math:`[J_{kl}^{ij} \, \sigma_l^j(t)]_i
   = [J_{kl}^{ij}]_i \, \sigma_l^j(t)` を正当化する議論をもっと形式化する.
   説明に自然言語つかいすぎ！

   先に確率平均に行く方法もあるかも?:
   :math:`J_{kl}^{ij}` と :math:`\sigma_l^j(t)` が独立だという
   近似のもと, :math:`[J_{kl}^{ij} \sigma_l^j(t)]_i
   \approx \AvgJ{J_{kl}^{ij} \sigma_l^j(t)}
   = \AvgJ{J_{kl}^{ij}} \AvgJ{\sigma_l^j(t)}`
   であることを用いる. この :math:`\AvgJ{\sigma_l^j(t)}` は式変形 (4) にあるように,
   さらに集団平均 :math:`[\bullet]_j` がかかるから,
   :math:`\left[ \AvgJ{\sigma_l^j(t)} \right]_j = \AvgJ{[\sigma_l^j(t)]_j}
   = \AvgJ{m_l(t)}` となる. この系は self-averaging なので (とどこかで説明する
   必要があるけど,) :math:`\AvgJ{m_l(t)} = m_l(t)` となる.

他の部分の変形については,
(2) :ref:`lln` より算術平均は期待値に収束する, つまり :math:`N \to \infty`
の極限で :math:`\left[ J_{kl}^{ij} \right]_i \to \AvgJ{J_{kl}^{ij}}` が成り立つ
ことと, :math:`\Prob \{ J_{kl}^{ij} = {J_{kl}}/{\sqrt K}\} = {K}/{N_l}`
と :math:`\Prob \{ J_{kl}^{ij} = 0\} = 1 - {K}/{N_l}` から
期待値は :math:`\AvgJ{J_{kl}^{ij}} = ({J_{kl}}/{\sqrt K}) ({K}/{N_l})
= J_{kl} {\sqrt K}/{N_l}` となること,
(3) :math:`J_{kl} \sqrt K / N_l` が :math:`j` に依らない定数であること,
(4) 集団平均の定義,
(5) :math:`m_l(t)` の定義
を用いた.

これらの計算を合わせ, :math:`u_k^0 = \sqrt K E_k m_0` を思い出せば, 入力の
集団平均 :math:`u_k(t)` は

.. math::

   u_k(t)
   & = ...
   \\
   & \approx
     \sum_{l = E, I} J_{kl} \sqrt K m_l(t)
     + u_k^0 - \theta_k
   \\
   & =
     \sqrt K \left(
       \sum_{l = E, I} J_{kl} m_l(t) + E_k m_0
     \right)
     - \theta_k

となる.


入力のゆらぎ
============

.. math::

   \alpha_k(t)
   & =
     [(\Devi u_k^i (t))^2]
   \\
   & \overset{(1)} =
     \left[ \left( \Devi \left\{
       \sum_{l = E, I} \sum_{j=1}^{N_l} J_{kl}^{ij} \sigma_l^j(t))
     \right\} \right)^2 \right]_i
   \\
   & \overset{(2)} =
     \left[ \left(
       \sum_{l = E, I} \sum_{j=1}^{N_l} J_{kl}^{ij} \sigma_l^j(t))
     \right)^2 \right]_i
     -
     \left[
       \sum_{l = E, I} \sum_{j=1}^{N_l} J_{kl}^{ij} \sigma_l^j(t))
     \right]_i^2
   \\
   & \overset{(3)} =
     \left[ \left(
       \sum_{l = E, I} \sum_{j=1}^{N_l} J_{kl}^{ij} \sigma_l^j(t))
     \right)^2 \right]_i
     -
     K \left(\sum_{l = E, I} J_{kl} m_l(t) \right)^2

ここで,
(1) :math:`\Devi(x + \text{const.}) = \Devi x`,
(2) :math:`[(\Devi x)^2] = [x^2] - [x]^2`,
(3) 上記の :math:`u_k(t)` の計算
を用いた.


.. math::

   &
     \left[ \left(
       \sum_{l = E, I} \sum_{j=1}^{N_l} J_{kl}^{ij} \sigma_l^j(t))
     \right)^2 \right]_i
   \\
   & =
     \left[
       \sum_{l, l' = E, I} \sum_{j=1}^{N_l} \sum_{j'=1}^{N_{l'}}
       J_{kl}^{ij} J_{kl'}^{ij'} \sigma_l^j(t)) \sigma_{l'}^{j'}(t))
     \right]_i
   \\
   & =
     \sum_{l, l' = E, I} \sum_{j=1}^{N_l} \sum_{j'=1}^{N_{l'}}
     \underbrace{
     \left[
       J_{kl}^{ij} J_{kl'}^{ij'}
     \right]_i
     \sigma_l^j(t) \sigma_{l'}^{j'}(t)
     }_{(*)}

上式の (*) の和は, 恒等式
:math:`1 = \delta_{ll'} (\delta_{jj'} + (1 - \delta_{jj'})) + (1 - \delta_{ll'})`
を用いて [#]_

.. math::

   \sum_{l, l' = E, I} \sum_{j=1}^{N_l} \sum_{j'=1}^{N_{l'}} \bullet_{l,l',j,j'}
   =
   \sum_{l = E, I} \sum_{j=1}^{N_l} \bullet_{l,l,j,j}
   +
   \sum_{l = E, I} \sum_{\substack{j,j'=1 \\ j \neq j'}}^{N_l}
   \bullet_{l,l,j,j}
   +
   \sum_{\substack{l, l' = E, I \\ l \neq l'}}
   \sum_{j=1}^{N_l} \sum_{j'=1}^{N_{l'}}
   \bullet_{l,l',j,j'}

のように分解できる.

.. [#] :math:`\sum_{j,j'=1} (1 - \delta_{j,j'}) \bullet
       = \sum_{\substack{j,j'=1 \\ j \neq j'}} \bullet`

第一項の計算 (:math:`l = l'`, :math:`j = j'`)
---------------------------------------------

.. math::

   &
     \sum_{l = E, I} \sum_{j=1}^{N_l}
     \left[
       (J_{kl}^{ij})^2
     \right]_i
     (\sigma_l^j(t))^2
   \\
   & \overset{(1)} \approx
     \sum_{l = E, I} \sum_{j=1}^{N_l}
     \Expect \{ (J_{kl}^{ij})^2 \}
     \, \sigma_l^j(t)
   \\
   & \overset{(2)} =
     \sum_{l = E, I} \sum_{j=1}^{N_l}
     \left( \frac{J_{kl}}{\sqrt K} \right)^2
     \frac{K}{N_l}
     \, \sigma_l^j(t)
   \\
   & =
     \sum_{l = E, I} ( J_{kl} )^2
     \frac{1}{N_l} \sum_{j=1}^{N_l} \sigma_l^j(t)
   \\
   & \overset{(3)} =
     \sum_{l = E, I} ( J_{kl} )^2 \,
     m_l(t)

ここで,
(1) ???,
(2) :math:`\Prob \{ J_{kl}^{ij} = J_{kl}/\sqrt K \} = K/N_l`,
(3) :math:`m_l(t) = [\sigma_l^j(t)]_j = \sum_{j=1}^{N_l} \sigma_l^j(t) / N_l`,
を用いた.


第二項の計算 (:math:`l = l'`, :math:`j \neq j'`)
------------------------------------------------

.. math::

   &
     \sum_{l = E, I} \sum_{\substack{j,j'=1 \\ j \neq j'}}^{N_l}
     \left[
       J_{kl}^{ij} J_{kl}^{ij'}
     \right]_i
     \, \sigma_l^j(t) \, \sigma_{l}^{j'}(t)
   \\
   & \overset{(1)} \approx
     \sum_{l = E, I} \sum_{\substack{j,j'=1 \\ j \neq j'}}^{N_l}
     \Expect \{ J_{kl}^{ij} J_{kl}^{ij'} \}
     \, \sigma_l^j(t) \, \sigma_{l}^{j'}(t)
   \\
   & \overset{(2)} =
     \sum_{l = E, I} \sum_{\substack{j,j'=1 \\ j \neq j'}}^{N_l}
     \left( \frac{J_{kl}}{\sqrt K} \right)^2
     \frac{K}{N_l} \frac{K}{N_l}
     \, \sigma_l^j(t) \, \sigma_{l}^{j'}(t)
   \\
   & =
     K
     \sum_{l = E, I} (J_{kl})^2
     \frac{1}{N_l}
     \sum_{j=1}^{N_l}
     \sigma_l^j(t)
     \left(
     \sum_{j'=1}^{N_l}
     \frac{1}{N_l}
     \sigma_{l}^{j'}(t)
     -
     \frac{1}{N_l}
     \sigma_{l}^{j}(t)
     \right)
   \\
   & =
     K
     \sum_{l = E, I} (J_{kl})^2
     \left(
       \left\{
         \frac{1}{N_l}
         \sum_{j=1}^{N_l}
         \sigma_l^j(t)
       \right\}^2
       -
       \frac{1}{{N_l}^2}
       \sum_{j=1}^{N_l}
       (\sigma_{l}^{j}(t))^2
     \right)
   \\
   & =
     K
     \sum_{l = E, I} (J_{kl})^2
     \left(
       (m_l(t))^2
       -
       \frac{1}{N_l}
       m_l(t)
     \right)


第三項の計算 (:math:`l \neq l'`)
--------------------------------

.. math::

   &
     \sum_{\substack{l, l' = E, I \\ l \neq l'}}
     \sum_{j=1}^{N_l} \sum_{j'=1}^{N_{l'}}
     \left[
       J_{kl}^{ij} J_{kl'}^{ij'}
     \right]_i
     \, \sigma_l^j(t) \, \sigma_{l'}^{j'}(t)
   \\
   & \overset{(1)} \approx
     \sum_{\substack{l, l' = E, I \\ l \neq l'}}
     \sum_{j=1}^{N_l} \sum_{j'=1}^{N_{l'}}
     \Expect \{ J_{kl}^{ij} J_{kl'}^{ij'} \}
     \, \sigma_l^j(t) \, \sigma_{l'}^{j'}(t)
   \\
   & \overset{(2)} =
     \sum_{\substack{l, l' = E, I \\ l \neq l'}}
     \sum_{j=1}^{N_l} \sum_{j'=1}^{N_{l'}}
     \frac{J_{kl}}{\sqrt K} \frac{J_{kl'}}{\sqrt K}
     \frac{K}{N_l} \frac{K}{N_{l'}}
     \, \sigma_l^j(t) \, \sigma_{l'}^{j'}(t)
   \\
   & =
     \sum_{\substack{l, l' = E, I \\ l \neq l'}}
     \sum_{j=1}^{N_l} \sum_{j'=1}^{N_{l'}}
     \frac{J_{kl}}{\sqrt K} \frac{J_{kl'}}{\sqrt K}
     \frac{K}{N_l} \frac{K}{N_{l'}}
     \, \sigma_l^j(t) \, \sigma_{l'}^{j'}(t)
   \\
   & =
     K
     \sum_{\substack{l, l' = E, I \\ l \neq l'}}
     J_{kl} J_{kl'}
     \frac{1}{N_l}    \sum_{j=1}^{N_l}     \sigma_l^j(t)
     \frac{1}{N_{l'}} \sum_{j'=1}^{N_{l'}} \sigma_{l'}^{j'}(t)
   \\
   & =
     K
     \sum_{\substack{l, l' = E, I \\ l \neq l'}}
     J_{kl} J_{kl'} \, m_l(t) \, m_{l'}(t)


合計
----

.. math::

   \alpha_k(t)
   & =
     \sum_{l = E, I} ( J_{kl} )^2 \,
     m_l(t)
   \\
   & +
     K
     \sum_{l = E, I} (J_{kl})^2
     \left(
       (m_l(t))^2
       -
       \frac{1}{N_l}
       m_l(t)
     \right)
   \\
   & +
     K
     \sum_{\substack{l, l' = E, I \\ l \neq l'}}
     J_{kl} J_{kl'} \, m_l(t) \, m_{l'}(t)
   \\
   & -
     K \left(\sum_{l = E, I} J_{kl} m_l(t) \right)^2
   \\
   & =
     \sum_{l = E, I} ( J_{kl} )^2 \,
     m_l(t)
     +
     \frac{K}{N_l}
     \sum_{l = E, I} (J_{kl})^2 m_l(t)
   \\
   & +
     K
     \underbrace{
       \left(
       \sum_{l, l' = E, I}
       J_{kl} J_{kl'} \, m_l(t) \, m_{l'}(t)
       -
       \left(\sum_{l = E, I} J_{kl} m_l(t) \right)^2
       \right)
     }_{= 0}
   \\
   & =
     \sum_{l = E, I} ( J_{kl} )^2 \,
     m_l(t)
     +
     O(1/N)
