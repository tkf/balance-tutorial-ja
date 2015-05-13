.. _introduction-to-balance-network:

==========================
 はじめての興奮・抑制均衡
==========================

:ref:`intro` の簡単な議論から, :math:`k = E, I` について
興奮性と抑制性の入力が均衡した状態

.. math::

   J_{kE} m_E - J_{kI} m_I + J_{k0} m_0 \approx 0

が成り立てば, ニューロンの活動の不規則性が説明出来る
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

.. math::
   :label: rough-balanced-fixed-point

   \bm m \approx \bm J^{-1} \bm h

である.  つまり,
ネットワークのパラメタ :math:`\bm J` と外部からの
入力 :math:`\bm h` が決まれば, このネットワークの
「グローバルな状態」 :math:`\bm m` はただひとつに決まる.
興奮性と抑制性の入力が常に均衡していればこの状態は
時間変化しないはずであるから, これは :math:`\bm m` のダイナミクスの
固定点である.  よって式 :eq:`rough-balanced-fixed-point` を
:index:`均衡固定点` (:index:`balanced fixed point`) と呼ぶ.
この式から :math:`\bm h = 0` なら :math:`\bm m \approx 0`
なので, 外部入力がなければ興奮・抑制均衡ネットワーク
は活動出来ない (非ゼロの均衡固定点が存在しない) ことが分かる.


一般論へ
========

上記の議論を正確におこなうには, :math:`\bm m` のダイナミクスが
定義されていなくてはならない.  しかも, それがひとつひとつは
不規則なニューロンのダイナミクスから導出出来る必要がある.
この導出は :ref:`binary-network` の :ref:`mft` でおこなう.
しかし今は, :math:`\bm m` のダイナミクスが

.. math::

   \bm \tau \frac{\D \bm m(t)}{\D t}
   =
   - \bm m(t) + \bm f(C \, \{\bm J \bm m(t) + \bm h\})

(ただし,
:math:`C = \sqrt K`,
:math:`\bm m = (m_{E}, m_{I})`,
:math:`\bm \tau = (\tau_{E}, \tau_{I})^\intercal`,
:math:`\bm f(\bm m) = (f_{E}(m_{E}), f_{I}(m_{I}))^\intercal`
である)
と書けることを仮定して議論を進めよう.
関数 :math:`f_E` や :math:`f_I` は集団レベルでの,
入力と出力の関係を定義している.  例えばロジスティクス関数
:math:`f_E(x) = f_I(x) = 1 / (1 + \exp(-x))`
を使うことを想像しても良い.
実は関数 :math:`\bm f` はあるゆるい条件を満たせば
何でも良いことがわかる.

「フィードバック強度」 :math:`C` は, :ref:`intro` の議論
では :math:`J_{kl}^{ij}` のスケーリングをどう定義するかに依って
いたが, この :math:`C` の起原は興奮・抑制均衡ネットワークの
特性を議論するためにほとんど効いてこない.  そこで,
:ref:`strong-feedback-system` ではこの均衡固定点を
別の視点から「導出」する.
