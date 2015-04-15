========
 記号表
========

.. todo:: 記号表を埋める

.. list-table::
   :header-rows: 1
   :widths: 10 50 20 20

   * - 記号
     - 定義等
     - 節
     - 原著 [vanVreeswijk1998]_
   * - :math:`\PAvg{\bullet}_i`
     - :math:`:= N_l^{-1} \sum_i \bullet` /
       集団平均 /
       population average
     - :ref:`fluctuations-of-input`
     - Sec. 3, p.1327 (p.7)
   * - :math:`\PAvg{\bullet}`
     - :math:`= \PAvg{\bullet}_i`
       (添字が自明な場合)
     -
     -
   * - :math:`\Devi`
       [#diff-sym]_
     - :math:`\Devi X_i := X_i - [X_i]_i` /
       偏差 /
       deviation
     - :ref:`fluctuations-of-input`
     - Sec. 3, p.1329 (p.9)
   * - :math:`\AvgDyn{\bullet}`
       [#diff-sym]_
     - 更新時間のランダム性に関する平均
     - :ref:`mft`
     - A.1, p.1365 (p.45)
   * - :math:`m_k(t)`
     - :math:`:= \PAvg{\AvgDyn{\sigma_k^i(t)}}_i`
       [#AvgDyn]_ /
       time dependent local rate variable
     -
     - Eq. 3.2, p.1327 (p.7)
   * - :math:`m_k`
     - :math:`:= \Avg{m_k(t)}_t` [#]_
     -
     - Seq. 3, p.1328 (p.8)
       (See also Eq. 3.7)
   * - :math:`m_k^i`
     - :math:`:= \Avg{\AvgDyn{\sigma_k^i(t)}}_t`
       [#AvgDyn]_
     - :ref:`quenched-fluctuations`
     - Eq. 5.3, p.1334 (p.14)
   * - :math:`m_k^i (t)`
     - :math:`:= \AvgDyn{\sigma_k^i(t)}`
     - :ref:`mft`
     - Eq. A.1, p.1365 (p.45)
   * - :math:`q_k`
     - :math:`:= \PAvg{(m_k^i)^2}_i` /
       オーダーパラメター /
       order parameter
     - :ref:`quenched-fluctuations`
     - Eq. 5.3, p.1334 (p.14)

..
   * -
     -
     -
     -

.. [#AvgDyn] 原著 [vanVreeswijk1998]_ では, :math:`\AvgDyn{\bullet}`
   をとならないものとして定義されていた.

   .. todo:: :math:`\AvgDyn{\bullet}` をつけるほうが正しいのか検証

.. [#diff-sym] 原著 [vanVreeswijk1998]_ とは若干違う記法を用いている.

.. [#] 原著 [vanVreeswijk1998]_ では, :math:`m_k`
   は :math:`m_k(t)` のダイナミクスの固定点 (fixed point)
   として導入されているが, (もし固定点が存在すれば)
   時間平均 :math:`\Avg{m_k(t)}_t` はそれと同値である.
