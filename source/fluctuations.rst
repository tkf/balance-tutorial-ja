============
 色々な揺動
============

集団 :math:`k \in \{ E, I \}` 内のニューロンに関する
集団平均 (population average; 添字 :math:`i` に沿った) 平均
を

.. math::

   [ \bullet ]_i = \frac{1}{N_k} \sum_{i=1}^{N_k} \bullet

で定義する。
文脈からどの添字に関する平均かが明らかであれば、添字 :math:`i` は省略する。

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

この (*) は以下のように近似的できる。

.. math::

   (*)
   & \overset{(1)} \simeq
     \sum_{j=1}^{N_l}
     \left[
       J_{kl}^{ij}
     \right]_i
     \sigma_l^j(t)
   \\
   & \overset{(2)} \simeq
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

ここで、
(1) ???、
(2) :math:`\left[ J_{kl}^{ij} \right]_i = \Expect \{J_{kl}^{ij}\}` 、
(3) :math:`J_{kl} \sqrt K / N_l` の :math:`j` への非依存性、
(4) 集団平均の定義、
(5) :math:`m_l(t)` の定義
を用いた。

.. todo:: 上の (1) は何を前提としているかを説明する。

   手書きノートには :math:`\sigma_l^j(t)` が :math:`i` に依存しないから
   と書いてあるが、 :math:`\sigma_l^j(t)` は :math:`J_{kl}^{ij}` に依存
   しているからそれは正しくない。いや、 :math:`u_k(t)` を :math:`\sigma_l^j(t)`
   の関数、つまり :math:`u_k(\sigma_l^j(t))` と考えれば問題ない...わけないか。

.. math::

   u_k(t)
   & = ...
   \\
   & =
     \sum_{l = E, I} J_{kl} \sqrt K m_l(t)
     + u_k^0 - \theta_k
   \\
   & =
     \sqrt K \left(
       \sum_{l = E, I} J_{kl} m_l(t) + E_k m_0
     \right)
     - \theta_k


静的な揺動
==========

.. math::

   \alpha_k(t)
   & :=
     [(\delta u_k^i (t))^2]
   \\
   & \overset{(1)} =
     \left[ \left( \delta \left\{
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

ここで、
(1) :math:`\delta(x + \text{const.}) = \delta x`,
(2) :math:`[(\delta x)^2] = [x^2] - [x]^2`,
(3) 上記の :math:`u_k(t)` の計算
を用いた。


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

上式の (*) の和は、恒等式
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

のように分解できる。

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

ここで、
(1) ???,
(2) :math:`\Prob \{ J_{kl}^{ij} = J_{kl}/\sqrt K \} = K/N_l`,
(3) :math:`m_l(t) = [\sigma_l^j(t)]_j = \sum_{j=1}^{N_l} \sigma_l^j(t) / N_l`,
を用いた。


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
