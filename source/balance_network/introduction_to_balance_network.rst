.. _introduction-to-balance-network:

===================================
 はじめての興奮・抑制均衡 (未完成)
===================================

:ref:`intro` の簡単な議論から, :math:`k = E, I` について

.. math::

   J_{kE} m_E - J_{kI} m_I + J_{k0} m_0 \approx 0

が成り立てば, 興奮性と抑制性の入力が均衡した, 均衡固定点を持つ
ことが示唆された.  ただし, 集団を表す添字を上付添字から下付添字
に変更した.  [#]_ [#]_

.. [#] これ以降の議論では, 集団を表す添字は下付きで, ニューロンを表す
   添字を上付にする (例: :math:`J_{EI}^{ij}`).

.. [#] 記号 :math:`\approx` の意味がきちんと定義されていないので条
   件の意味を把握するのは難しい.  実は, この節に現れる :math:`X \approx Y`
   の形の式 (:math:`Y = 0` でも良い) を, すべて :math:`X = Y + O(1/\sqrt K)`
   に書き換えれば厳密な議論となる.
   ただし, :math:`O(1/\sqrt K)` は ランダウの記号 あるいは O-記法
   (Big O notation) と呼ばれる漸近関係を表す記号のひとつである
   (:ref:`asymptotics` を参照).


外部入力の項を :math:`h_k = J_{k0} m_0` と書き,

.. math::

   \bm J =
   \begin{pmatrix}
     J_{EE} & J_{EI} \\
     J_{IE} & J_{II} \\
   \end{pmatrix},

   \bm m =
   \begin{pmatrix}
     m_{E} \\
     m_{I} \\
   \end{pmatrix},

   \bm h =
   \begin{pmatrix}
     h_{E} \\
     h_{I} \\
   \end{pmatrix}


なる行列・ベクトル表現を使えばこの式は

.. math:: \bm J \bm m \approx - \bm h

と書ける.  行列 :math:`\bm J` が可逆であれば,
:math:`\bm m \approx \bm J^{-1} \bm h` である.  つまり,
ネットワークのパラメタ :math:`\bm J` と外部からの
入力 :math:`\bm h` が決まれば, 均衡固定点はただひとつに決まる.
これから, 外部入力がなければ興奮・抑制均衡ネットワーク
は非ゼロの均衡固定点を持てないことが分かる.
