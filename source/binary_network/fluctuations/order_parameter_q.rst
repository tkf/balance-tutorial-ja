================
 秩序変数の計算
================

.. todo:: 秩序変数の計算を説明する

.. math::

   \sigma_k^i(t) = \Theta \left(
     u_k + \sqrt{\beta_k} x_i + \sqrt{\alpha_k - \beta_k} y_i(t)
   \right)

.. math::

   m_k^i = m_k(x_i) = H \left(
     \frac{-u_k + \sqrt{\beta_k} x_i}{\sqrt{\alpha_k - \beta_k}}
   \right)

.. math::

   q_k = \int Dx \left[
     H \left(
       \frac{-u_k + \sqrt{\beta_k} x_i}{\sqrt{\alpha_k - \beta_k}}
     \right)
   \right]^2

.. math:: \rho_k(m) \int Dx \, \delta(m - m_k(x))
