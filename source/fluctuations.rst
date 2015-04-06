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
