.. _time_evolution_of_expectation:

==================
 期待値の時間発展
==================

.. seealso::

   [Ginzburg1994]_
     この章の議論は, Ginzburg & Sompolinsky (1994) の Appendix A
     に基づいている.

.. admonition:: 期待値の時間発展

   :ref:`master-equation` と同じ設定の下, ニューロン :math:`i` の状態の
   期待値 :math:`\Avg{\sigma_i(t)} = \sum_{\bm\sigma} \sigma_i P_t(\bm\sigma)`
   は次の方程式に従う.

   .. math::

      \tau \frac{\D}{\D t} \Avg{\sigma_i(t)}
      = - \Avg{\sigma_i(t)} + \Avg{g_i(\bm\sigma(t))}

   ただし, :math:`g_i` は状態 :math:`\bm\sigma` に基づき遷移確率を与える関数で,

   .. math::

      g_i(\bm\sigma(t))
      = w(1 | \sigma_i', \bm{\sigma}^{\setminus i}) \, \tau
      \qquad
      (\sigma_i' = 0, 1)

   と定義される. つまり, :math:`w(1 | \sigma_i', \bm{\sigma}^{\setminus i})`
   が :math:`\sigma_i'` に依らない場合にのみ上式は成り立つ.

一般の場合の期待値の時間発展
============================

期待値
:math:`\Avg{\sigma_i(t)} = \sum_{\bm\sigma} \sigma_i P_t(\bm\sigma)`
の時間微分をとると,

.. math::

   \frac{\D}{\D t} \Avg{\sigma_i(t)}
   & =
     \sum_{\bm\sigma} \sigma_i \frac{\D}{\D t} P_t(\bm\sigma)
   \\
   & =
     \sum_{\bm\sigma} \sigma_i
     \left\{
       - \sum_{j=1}^N
         w(1 - \sigma_j | \sigma_j, \bm{\sigma}^{\setminus j})
         P_t(\bm \sigma)
       + \sum_{j=1}^N
         w(\sigma_j | 1 - \sigma_j, \bm{\sigma}^{\setminus j})
         P_t(\hat{\bm{\sigma}}^{j})
     \right\}
   \\
   & =
     -
     \underbrace{
         \sum_{\bm\sigma} \sum_{j=1}^N
         \sigma_i
         w(1 - \sigma_j | \sigma_j, \bm{\sigma}^{\setminus j})
         P_t(\bm \sigma)
     }_{\text{(A)}}
     +
     \underbrace{
         \sum_{\bm\sigma} \sum_{j=1}^N
         \sigma_i
         w(\sigma_j | 1 - \sigma_j, \bm{\sigma}^{\setminus j})
         P_t(\hat{\bm{\sigma}}^{j})
     }_{\text{(B)}}

.. math::

   \text{(B)}
   & =
       \sum_{\bm\sigma} \sum_{j=1}^N
       \overbrace{
         (\delta_{ij} + 1 - \delta_{ij})
       }^{= 1}
       \sigma_i
       w(\sigma_j | 1 - \sigma_j, \bm{\sigma}^{\setminus j})
       P_t(\hat{\bm{\sigma}}^{j})
   \\
   & =
     \underbrace{
       \sum_{\bm\sigma} \sum_{j=1}^N
       \delta_{ij}
       \sigma_i
       w(\sigma_j | 1 - \sigma_j, \bm{\sigma}^{\setminus j})
       P_t(\hat{\bm{\sigma}}^{j})
     }_{\text{(B1)}}
   \\
   & \qquad
     +
     \underbrace{
       \sum_{\bm\sigma} \sum_{j=1}^N
       (1 - \delta_{ij})
       \sigma_i
       w(\sigma_j | 1 - \sigma_j, \bm{\sigma}^{\setminus j})
       P_t(\hat{\bm{\sigma}}^{j})
     }_{\text{(B2)}}

.. math::

   \text{(B1)}
   & \overset{(1)} =
       \sum_{\bm\sigma} \sum_{j=1}^N
       \delta_{ij}
       \sigma_j
       w(\sigma_j | 1 - \sigma_j, \bm{\sigma}^{\setminus j})
       P_t(\hat{\bm{\sigma}}^{j})
   \\
   & \overset{(2)} =
       \sum_{\bm\sigma} \sum_{j=1}^N
       \delta_{ij}
       (1 - \sigma_j)
       w(1 - \sigma_j | \sigma_j, \bm{\sigma}^{\setminus j})
       P_t(\bm{\sigma})
   \\
   & \overset{(3)} =
       \sum_{\bm\sigma}
       (1 - \sigma_i)
       w(1 - \sigma_i | \sigma_i, \bm{\sigma}^{\setminus i})
       P_t(\bm{\sigma})

.. math::

   \text{(B2)}
   & =
       \sum_{\bm\sigma} \sum_{j=1}^N
       (1 - \delta_{ij})
       \sigma_i
       w(1 - \sigma_j | \sigma_j, \bm{\sigma}^{\setminus j})
       P_t(\bm{\sigma})

.. math::

   \text{(A)} + \text{(B2)}
   & =
       \sum_{\bm\sigma} \sum_{j=1}^N
       \sigma_i
       w(1 - \sigma_j | \sigma_j, \bm{\sigma}^{\setminus j})
       P_t(\bm \sigma)
   \\
   & \qquad
     +
       \sum_{\bm\sigma} \sum_{j=1}^N
       (1 - \delta_{ij})
       \sigma_i
       w(1 - \sigma_j | \sigma_j, \bm{\sigma}^{\setminus j})
       P_t(\bm{\sigma})
   \\
   & =
       -
       \sum_{\bm\sigma} \sum_{j=1}^N
       \delta_{ij}
       \sigma_i
       w(1 - \sigma_j | \sigma_j, \bm{\sigma}^{\setminus j})
       P_t(\bm{\sigma})
   \\
   & =
       -
       \sum_{\bm\sigma}
       \sigma_i
       w(1 - \sigma_i | \sigma_i, \bm{\sigma}^{\setminus i})
       P_t(\bm{\sigma})

.. math::

   \frac{\D}{\D t} \Avg{\sigma_i(t)}
   & =
     \text{(A)} + \text{(B1)} + \text{(B2)}
   \\
   & =
       \sum_{\bm\sigma}
       (1 - 2 \sigma_i)
       w(1 - \sigma_i | \sigma_i, \bm{\sigma}^{\setminus i})
       P_t(\bm{\sigma})
   \\
   & =
     \Avg{
       (1 - 2 \sigma_i)
       w(1 - \sigma_i | \sigma_i, \bm{\sigma}^{\setminus i})
     }(t)


遷移確率に制限のある場合の期待値の時間発展
==========================================

関数 :math:`g_i` の定義
:math:`w(1 | \sigma_i, \bm{\sigma}^{\setminus i}) = g(\bm{\sigma}) / \tau`
(:math:`\sigma_i = 0, 1`) は

.. math::

   w(\sigma_i | 1 - \sigma_i, \bm{\sigma}^{\setminus i})
   =
   \frac{1}{2 \tau} \left\{
     1 - (2 \sigma_i - 1) [2 g_i(\bm{\sigma}) - 1]
   \right\}

と書くことが出来る. これは上式に :math:`\sigma_i = 0` と :math:`\sigma_i = 1`
を代入することで確かめられる.

この式を用いて, :math:`\frac{\D}{\D t} \Avg{\sigma_i(t)}` を計算すると,

.. math::

   \frac{\D}{\D t} \Avg{\sigma_i(t)}
   & =
     \Avg{
       (1 - 2 \sigma_i)
       \frac{1}{2 \tau} \left\{
         1 - (2 \sigma_i - 1) [2 g_i(\bm{\sigma}) - 1]
       \right\}
     }(t)
   \\
   & \overset{(1)} =
     \Avg{
       \frac{1}{2 \tau} \left\{
         (1 - 2 \sigma_i) + (1 - 2 \sigma_i)^2 [2 g_i(\bm{\sigma}) - 1]
       \right\}
     }(t)
   \\
   & \overset{(2)} =
     \Avg{
       \frac{1}{2 \tau} \left\{
         (1 - 2 \sigma_i) + 2 g_i(\bm{\sigma}) + 1
       \right\}
     }(t)
   \\
   & =
     \Avg{
       \frac{1}{\tau} \left\{
         - \sigma_i + g_i(\bm{\sigma})
       \right\}
     }(t)
   \\
   & =
     \frac{1}{\tau} \left\{
       - \Avg{\sigma_i}(t)
       + \Avg{g_i(\bm{\sigma})}(t)
     \right\}

相関関数
========

.. todo:: 相関関数の従う方程式 ("two-time" second moment の時間発展) を導出する.

.. math::

   \Avg{f(\bm \sigma(t), \bm \sigma(t+s))}
   :=
   \sum_{\bm \sigma} P_t(\bm \sigma)
   \sum_{\bm \varsigma} P_{t+s, t}(\bm \varsigma | \bm \sigma)
   f(\bm \sigma, \bm \varsigma)

.. math::

   \CAvg{f(\bm \sigma(t+s))}{\bm \sigma(t)}
   :=
   \sum_{\bm \varsigma} P_{t+s, t}(\bm \varsigma | \bm \sigma(t))
   f(\bm \varsigma)

.. math::

   &
     \Avg{\sigma_i(t) \, \sigma_j(t+s)}
   \\
   & =
     \sum_{\bm \sigma} P_t(\bm \sigma)
     \sum_{\bm \varsigma} P_{t+s, t}(\bm \varsigma | \bm \sigma)
     \, \sigma_i \, \varsigma_j
   \\
   & =
     \sum_{\bm \sigma} P_t(\bm \sigma)
     \, \sigma_i
     \underbrace{
     \sum_{\bm \varsigma} P_{t+s, t}(\bm \varsigma | \bm \sigma)
     \, \varsigma_j
     }_{= \CAvg{\sigma_j(t+s)}{\bm \sigma(t)}}
   \\
   & =
     \Avg{\sigma_i(t) \CAvg{\sigma_j(t+s)}{\bm \sigma(t)}}


.. math::

   \tau \frac{\D}{\D s}
   \CAvg{\sigma_j(t+s)}{\bm \sigma(t)}
   =
   - \CAvg{\sigma_j(t+s)}{\bm \sigma(t)}
   + \CAvg{g_j(\bm \sigma(t+s))}{\bm \sigma(t)}


.. math::

   \Avg{\sigma_i(t) \cdot \text{(l.h.s)}}
   & =
     \Avg{\sigma_i(t)
     \, \tau \frac{\D}{\D s} \CAvg{\sigma_j(t+s)}{\bm \sigma(t)}}
   \\
   & =
     \tau \frac{\D}{\D s}
     \Avg{\sigma_i(t) \CAvg{\sigma_j(t+s)}{\bm \sigma(t)}}
   \\
   & =
     \tau \frac{\D}{\D s}
     \Avg{\sigma_i(t) \, \sigma_j(t+s)}

.. math::

   \Avg{\sigma_i(t) \cdot \text{(r.h.s)}}
   & =
     \Avg{\sigma_i(t) \left\{
       - \CAvg{\sigma_j(t+s)}{\bm \sigma(t)}
       + \CAvg{g_j(\bm \sigma(t+s))}{\bm \sigma(t)}
     \right\}}
   \\
   & =
     - \Avg{\sigma_i(t) \, \sigma_j(t+s)}
     + \Avg{\sigma_i(t) \, g_j(\bm \sigma(t+s))}

.. math::

     \tau \frac{\D}{\D s}
     \Avg{\sigma_i(t) \, \sigma_j(t+s)}
   & =
     - \Avg{\sigma_i(t) \, \sigma_j(t+s)}
     + \Avg{\sigma_i(t) \, g_j(\bm \sigma(t+s))}
