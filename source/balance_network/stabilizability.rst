.. _stabilizability:

==============
 安定化可能性
==============

:ref:`balance-inequality` で求めた興奮・抑制ネットワークの均衡固定点の
安定性を解析する.  :ref:`stability-of-balanced-fixed-point` で
示したように, 均衡固定点からのずれ :math:`\bm \xi = \bm m - \bm m^0`
のダイナミクスは

.. math::

   \frac{\D \bm \xi}{\D t} \sim C \bm S \bm J \bm \xi

に従う.  ただし,

.. math::

   \bm S = \diag (S_E, S_I) = \bm \tau^{-1} D_1 \bm f

である.  均衡固定点の安定性を調べるためには行列 :math:`\bm S \bm J` の
固有値の実部を調べれば良い.  行列 :math:`\bm S \bm J` は
:math:`2 \times 2` 行列なので, その固有値は

.. math::

   \lambda_{\pm}
   =
   \frac{(S_E J_{EE} + S_I J_{II})
     \pm \sqrt{
       (S_E J_{EE} + S_I J_{II})^2
       - 4 (S_E J_{EE} S_I J_{II} - J_{EI} J_{IE})
     }}{2}

となる.
:math:`\max \Re \lambda_{\pm}` の負の成分は
:math:`S_I J_{II}` であるので, :math:`S_I` の
大きい極限 :math:`S_E \ll S_I` で :math:`\max \Re \lambda_{\pm}`
が負に出来なければ, この系が安定となる可能性は無い.
これは, 例えば :math:`\tau_E \gg \tau_I` なる場合を考えることと
同様である.  この極限をとるためには :math:`S_E = 0` とすれば良い.

.. math::

   \lambda_{\pm}
   =
   \frac{S_I J_{II}
     \pm \sqrt{
       (S_I J_{II})^2 + 4 J_{EI} J_{IE}
     }}{2}

:math:`(S_I J_{II})^2 + 4 J_{EI} J_{IE} \le 0` なら,
:math:`\max \Re \lambda_{\pm} = S_I J_{II} / 2 < 0` である.
:math:`(S_I J_{II})^2 + 4 J_{EI} J_{IE} > 0` なら,
:math:`4 J_{EI} J_{IE} < 0` より,
:math:`S_I J_{II} + \sqrt{(S_I J_{II})^2 + 4 J_{EI} J_{IE}} < 0`
なので :math:`\max \Re \lambda_{\pm} = \lambda_+ < 0` である.
ゆえに, 興奮・抑制ネットワークではどんな入出力関係 :math:`\bm f` や
結合パラメタ :math:`\bm J` や外部入力 :math:`\bm h` に対しても,
抑制性集団が興奮性集団に比べて十分速い時定数をもてば, 均衡固定点を
漸近安定に出来る.
