# apma-360-project

Final project on age-structured population models (ASM). 
For the course Applied PDEs (APMA 0360), Brown University, Fall 2020.
With Bill Ma, Daniel Park and Jason Senthil.

We write MATLAB code that explores exercises 2 and 4 in Chapter 5.1 of Logan's Applied PDEs textbook (3rd edition).

Exercise 2 explores solutions to the ASM by explicitly evaluating the renewal equation. The file to run is exercise2.m. The Volterra integral solver (see isolve.m) we used was obtained from www.mathworks.com/matlabcentral/fileexchange/49721-volterra-integral-equations-solver.

Exercise 4 numerically solves a structured predator-prey population. The implementation of the Runge-Kutta method was based on a tutorial in https://yarpiz.com/523/yptdeq190515-runge-kutta-rk4-in-python-and-matlab.

(Thanks to Holly who help me set up my first (working) github repository. She physically typed the name of this repository, among other things.)
