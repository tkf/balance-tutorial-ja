================
 マスター方程式
================

:math:`N` 個の二状態をとるニューロン (binary neuron) が相互に作用して
いる確率的な系を考える. ニューロン :math:`i` の状態は 0 または 1 をとる
状態変数 :math:`\sigma_i` で表され, 系全体の状態はベクトル
:math:`\bm \sigma = (\sigma_1, \ldots \sigma_N)^\intercal` で表される
(つまり, :math:`\bm \sigma \in \{0, 1\}^N`). ここではこれらの状態変数
の連続時間 :math:`t \in \mathbb R` に沿った変化を考えるが, 時間に関する
依存性を表記上は省略して :math:`\bm \sigma(t)` を :math:`\bm \sigma`
と書く.

表記の準備をする.
:math:`i` 番目のニューロンの状態を反転した状態ベクトルを
:math:`\hat{\bm{\sigma}}^{i}`, :math:`i` 番目の成分を除いた
状態ベクトルを :math:`\bm{\sigma}^{\setminus i}`
(つまり, :math:`\bm{\sigma}^{\setminus i} \in \{0, 1\}^{N-1}`)
と書くことにする. 形式的にかけば,

.. math::

   \hat{\bm{\sigma}}^{i} =
   (\sigma_1, \ldots, 1 - \sigma_i, \ldots, \sigma_N)^\intercal

   \bm{\sigma}^{\setminus i} =
   (\sigma_1, \ldots, \sigma_{i-1}, \sigma_{i+1}, \ldots, \sigma_N)^\intercal

である. ニューロン :math:`i` 以外の状態 :math:`\bm{\sigma}^{\setminus i}`
が与えられた時に, ニューロン :math:`i` が状態を :math:`\sigma_i'` から
:math:`\sigma_i` に遷移させる単位時間あたりの確率を
:math:`w(\sigma_i | \sigma_i', \bm{\sigma}^{\setminus i})` で表す.
つまり, :math:`\Delta t` 時間の間にこの遷移を起こす確率は,

.. math::

   P_{\Delta t}(\sigma_i | \sigma_i', \bm{\sigma}^{\setminus i}) =
   w(\sigma_i | \sigma_i', \bm{\sigma}^{\setminus i})
   \, \Delta t

である. ここでは, 系が時間 :math:`t` に 状態 :math:`\bm \sigma` をとる確率
:math:`P_t(\bm \sigma)` の時間発展が,
:dfn:`マスター方程式` (:dfn:`master equation`) とよばれる次の微分方程式 [#]_
で与えられることを示す.

.. math::

   \frac{\D P_t(\bm \sigma)}{\D t} =
   - \sum_{i=1}^N
     w(1 - \sigma_i | \sigma_i, \bm{\sigma}^{\setminus i})
     P_t(\bm \sigma)
   + \sum_{i=1}^N
     w(\sigma_i | 1 - \sigma_i, \bm{\sigma}^{\setminus i})
     P_t(\hat{\bm{\sigma}}^{i})

.. [#] 状態 :math:`\bm \sigma` が :math:`2^N` (:math:`= \# \{0, 1\}^N`)
   個あることを思い出せば, これは :math:`2^N` 次元常微分方程式と考えても良い.

確率的な系を考えているので, 推移確率 (transition probability)
:math:`P_{\Delta t}(\bm \sigma | \bm \sigma')` を求めれば,

.. math::

   &
     P_{\Delta t}(\bm \sigma | \bm \sigma')
   \\
   & = \prod_{i=1}^N P_{\Delta t}(\sigma_i | \bm{\sigma'})
     = \prod_{i=1}^N P_{\Delta t}(\sigma_i | \sigma_i', \bm{\sigma'}^{\setminus i})
   \\
   & \overset{(1)} =
     \prod_{i=1}^N \left(
       P_{\Delta t}(\sigma_i | \sigma_i, \bm{\sigma'}^{\setminus i})
       \, \delta_{\sigma_i, \sigma_i'}
       +
       P_{\Delta t}(\sigma_i | 1 - \sigma_i, \bm{\sigma'}^{\setminus i})
       \, \delta_{1 - \sigma_i, \sigma_i'}
     \right)
   \\
   & \overset{(2)} =
     \prod_{i=1}^N \left(
       (1
       - w(1 - \sigma_i | \sigma_i, \bm{\sigma}^{\setminus i})
         \, \Delta t)
       \, \delta_{\sigma_i, \sigma_i'}
       +
       w(\sigma_i | 1 - \sigma_i, \bm{\sigma}^{\setminus i})
       \, \Delta t
       \, \delta_{1 - \sigma_i, \sigma_i'}
     \right)
   \\
   & =
     \prod_{i=1}^N \left(
       \delta_{\sigma_i, \sigma_i'}
       + \left\{
         - w(1 - \sigma_i | \sigma_i, \bm{\sigma}^{\setminus i})
           \, \delta_{\sigma_i, \sigma_i'}
         + w(\sigma_i | 1 - \sigma_i, \bm{\sigma}^{\setminus i})
           \, \delta_{1 - \sigma_i, \sigma_i'}
       \right\}
       \, \Delta t
     \right)
   \\
   & \overset{(3)} =
     \underbrace{
       \prod_{i=1}^N \delta_{\sigma_i, \sigma_i'}
     }_{O(1)}
   \\
   & \qquad +
     \underbrace{
       \Delta t
       \sum_{i=1}^N
       \left\{
         - w(1 - \sigma_i | \sigma_i, \bm{\sigma}^{\setminus i})
           \, \delta_{\sigma_i, \sigma_i'}
         + w(\sigma_i | 1 - \sigma_i, \bm{\sigma}^{\setminus i})
           \, \delta_{1 - \sigma_i, \sigma_i'}
       \right\}
       \prod_{\substack{j=1 \\ j \neq i}}^N
       \delta_{\sigma_j, \sigma_j'}
     }_{O(\Delta t)}
   \\
   & \qquad +
     O(\Delta t^2)

この式を用いて, :math:`P_{t+\Delta t}(\bm \sigma)` を評価する:

.. math::

   P_{t+\Delta t}(\bm \sigma)
   & =
     \sum_{\bm \sigma'} P_{\Delta t}(\bm \sigma | \bm \sigma') P_t(\bm \sigma')
   \\
   & =
     \underbrace{
       \sum_{\bm \sigma'}
       P_t(\bm \sigma')
       \prod_{i=1}^N \delta_{\sigma_i, \sigma_i'}
     }_{P_t(\bm \sigma)}
   \\
   & \qquad
     - \Delta t
       \sum_{i=1}^N
       w(1 - \sigma_i | \sigma_i, \bm{\sigma}^{\setminus i})
       \underbrace{
         \sum_{\bm \sigma'}
         P_t(\bm \sigma') \,
         \delta_{\sigma_i, \sigma_i'}
         \prod_{\substack{j=1 \\ j \neq i}}^N
         \delta_{\sigma_j, \sigma_j'}
       }_{P_t(\bm \sigma)}
   \\
   & \qquad
     + \Delta t
       \sum_{i=1}^N
       w(\sigma_i | 1 - \sigma_i, \bm{\sigma}^{\setminus i})
       \underbrace{
         \sum_{\bm \sigma'}
         P_t(\bm \sigma') \,
         \delta_{1 - \sigma_i, \sigma_i'}
         \prod_{\substack{j=1 \\ j \neq i}}^N
         \delta_{\sigma_j, \sigma_j'}
       }_{P_t(\hat{\bm{\sigma}}^{i})}
   \\
   & \qquad
     + O(\Delta t^2)

これで :math:`{\D P_t(\bm \sigma)}/{\D t} = \lim_{\Delta t \to 0}
(P_{t+\Delta t}(\bm \sigma) - P_t(\bm \sigma))/\Delta t` を評価する
準備が出来た.

.. math::

   &
     \frac{P_{t+\Delta t}(\bm \sigma) - P_t(\bm \sigma)}{\Delta t}
   \\
   & \qquad
     =
     \underbrace{
       - \sum_{i=1}^N
         w(1 - \sigma_i | \sigma_i, \bm{\sigma}^{\setminus i})
         P_t(\bm \sigma)
       + \sum_{i=1}^N
         w(\sigma_i | 1 - \sigma_i, \bm{\sigma}^{\setminus i})
         P_t(\hat{\bm{\sigma}}^{i})
     }_{= \D P_t(\bm \sigma)/\D t}
     + O(\Delta t)
