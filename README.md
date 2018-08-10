# GPU/OpenCL Value Function Iteration in Julia

![made in | Konstanz](https://img.shields.io/badge/made%20in-Konstanz-blue.svg)

**Tested on: Julia v0.6.4, MacOS 10.12+**

---

**JuliaCon 2018** Presentation: 
["_GPU-Accelerated Value Function Iteration in Julia: Faster Macroeconomic Modeling_"](https://github.com/giob1994/OpenCL-VFI-in-Julia/blob/master/JuliaCon%202018%20Presentation/GPU-Accelerated%20Value%20Function%20Iteration%20in%20Julia%20Faster%20Macroeconomic%20Modeling.pdf)

---

Ideas on using [Julia](http://julialang.org) to apply GPGPU computing to Economics:

| Notebook                                                     | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [GPU Computing for Value Function Iteration in OpenCL](https://github.com/giob1994/OpenCL-VFI-in-Julia/blob/master/OpenCL%20Value%20Function%20Iteration.ipynb) | Implementation of the basic RBC model in Julia and in pure OpenCL code. |
| [Value Function Iteration with GPUArray.jl](https://github.com/giob1994/OpenCL-VFI-in-Julia/blob/master/VFI%20with%20GPUArrays.ipynb) | Solving the simple RBC model on the GPU, but by using higher-level Julia code using GPUArrays.jl and CLArrays.jl. |
| [GPU Value Function Iteration under Uncertainty](https://github.com/giob1994/OpenCL-VFI-in-Julia/blob/master/GPU%20Value%20Function%20Iteration%20under%20Uncertainty.ipynb) | Introducing uncertainty in the RBC model through the mean of a simple Markov process for productivity, and solving it with the GPU. |
| [OLG Model with Individual Uncertainty](https://github.com/giob1994/GPU-OpenCL-VFI-in-Julia/blob/master/OLG%20-%20Dev.ipynb) | **[!] Experimental [!]** <br>Usage of an OLG model similar to that developed by Huggett (1993) to show the computational advantages of using GPUs to run the VFI algorithm.|

### A Basic Model & the Solution

Since this is supposed to work as a simple example, the model used is a simple **Real Business Cycle model**.
The value function is:

<p align="center">
   <img width=90% src="res/rbc.png">
</p>

For both the CPU and the GPU algorithm we employ a "brute force" algorithm:

1. Start with a guess for the value function, `V0`;
2. Take the capital grid point `k`;
3. Iterate from `k_lower_bound` to `k_u(k)`, where `k_u` is such that implied consumption is not negative;
4. Save the results in the new value function approxiamtion `V1`;
5. Iterate until convergence;

### Acknowledgements

The main concepts behind this work are from "**_Tapping the Supercomputer under your Desk: Solving Dynamic Equilibrium Models with Graphics Processors_**" by Eric M. Aldrich, Jesús Fernández-Villaverde, A. Ronald Gallant and Juan F. Rubio-Ramírez.

I would like to thank Simon Danish, who develops GPUArrays.jl and CPUArrays.jl, for his great help on using said packages.

### Notes:

- The **[OpenCL.jl](https://github.com/JuliaGPU/OpenCL.jl)**, **[GPUArrays.jl](https://github.com/JuliaGPU/GPUArrays.jl)** and **[CLArrays.jl](https://github.com/JuliaGPU/CLArrays.jl)** packages are required to run the GPU code.
- The `IJulia` package is necessary to run the IJupyter notebook.
- The OpenCL kernel used is available standalone in the repository.



