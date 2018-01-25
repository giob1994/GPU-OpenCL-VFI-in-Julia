# OpenCL Value Function Iteration

A simple implementation in [Julia](https://julialang.org) of the technique presented in the paper "*Tapping the Supercomputer under your Desk: Solving Dynamic Equilibrium Models with Graphics Processors*" by Eric. M. Aldrich, Jesus Fernandez-Villaverde, A. Ronald Gallant, Juan F. Rubio-Ramirez.

### The Model & the Solution

Since this is supposed to work as a simple example, the model used is a simple Real Business Cycle model.
The value function is:

<p align="center">
   <img width=90% src="res/rbc.png">
</p>

For both the CPU and the GPU algorithm we employ a "brute force" algorithm:

1. Start with a guess for the value function, *V0*;
2. Take the capital grid point *k*;
3. Iterate from *k_lower_bound* to *k_u(k)*, where *k_u* is such that implied consumption is not negative;
4. Save the results in the new value function approxiamtion *V1*;
5. Iterate until convergence;

### Notes:

- The `OpenCL.jl` package is necessary to run the GPU code.
- The `IJulia` package is necessary to run the IJupyter notebook.
- The OpenCL kernel used is available standalone in the repository.



