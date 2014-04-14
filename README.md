RCGE: a simple CGE model in R
========================================================

I translated Shoven and Walley's (1984) CGE model into R and solved it as a minimization problem.The only difference in my model is that I've allowed the number of households to be specified to any number: in this example there are 4.

In order to demonstrate the model's potential use, I solve for the benchmark equilbrium. Next the scale parameter on the production function for good 1 is increased (phi1 in the equation below).

$$
  \begin{aligned}
  Q_1 &= \phi_1[\delta_1L_1^\frac{\sigma_1-1}{\sigma_1}
  + (1-\delta_1)K_1^\frac{\sigma_1-1}{\sigma_1}]^
  \frac{\sigma_1}{(\sigma_1-1)}
  \end{aligned}
$$
