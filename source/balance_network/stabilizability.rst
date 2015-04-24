.. _stabilizability:

==============
 安定化可能性
==============

.. todo:: 漸近安定性解析の導入部分を書く

:math:`\bm \xi = \bm m^0 - \bm m`

.. math::

   \frac{\D \bm \xi}{\D t} \sim C \bm S \bm J \bm \xi


.. math::

   \bm S = \diag (S_E, S_I) = \tau^{-1} D_1 \bm f

.. math::

   \lambda_{\pm}
   =
   \frac{(S_E J_{EE} + S_I J_{II})
     \pm \sqrt{
       (S_E J_{EE} + S_I J_{II})^2
       - 4 (S_E J_{EE} S_I J_{II} - J_{EI} J_{IE})
     }}{2}

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
ゆえに, 二集団ネットワークは, 抑制性集団が (例えば) 十分速い時定数を
もてば, 固定点を漸近安定に出来る.
