.. latex出力の目次に「まえがき」を含めないためのhack

.. only:: not latex

   まえがき
   --------

.. raw:: latex

   \section*{まえがき}

.. include:: preface.rest
