@def rss_pubdate = Date(2018, 1, 1)
@def rss = """ DifferentialEquations.jl 3.3: IMEX Solvers """
@def published = "1 January 2018"
@def title = "DifferentialEquations.jl 3.3: IMEX Solvers"
@def authors = """<a href="https://github.com/ChrisRackauckas">ChrisRackauckas</a>"""  


What's a better way to ring in the new year than to announce new features?
This ecosystem 3.3 release we have a few exciting developments, and at the
top of the list is new IMEX schemes. Let's get right to it.

## Additive Runge-Kutta Schemes for Implicit-Explicit Problems

Using an implicit solver is required for solving a stiff differential equation.
However, an implicit solver has to solve a rootfinding problem every step
which takes considerable computational resources. What if there was a way
so that the solver was only implicit for certain parts of the equation?

Enter the IMEX problems. Instead of defining an ODE like

```julia
u' = f(t,u)
```

we can instead define the ODE like:

```julia
u' = f1(t,u) + f2(t,u)
```

Then we can designate one of these parts as "stiff" and "non-stiff", and do
only the implicit solving of one of these functions. The hope is that the
cheaper function is the one that's implicit, and thus the net cost of solving
the differential equation is drastically reduced.

The main method for solving like this are additive Runge-Kutta schemes. The
most well-regarded schemes are due to Kennedy and Carpenter, names you may
recognize from the ESDIRK `KenCarp` schemes. Our `KenCarp` methods can now
make use the full IMEX formulation. The documentation shows that
[defining a `SplitODEProblem`](https://docs.juliadiffeq.org/latest/types/split_ode_types)
is as easy as giving the two functions, and then you just choose
[one of the `KenCarp` methods](https://docs.juliadiffeq.org/latest/solvers/split_ode_solve)
and now it works in the IMEX fashion. These methods are well-known for being
highly efficient integrators for discretizations of large PDEs like
convection-reaction-diffusion equations but they are usually relegated to more
niche solvers like the ARKODE library of Sundials. However, now it's directly
available in DifferentialEquations.jl, and these are native Julia implementations
so they are compatible with all of the event, number type, etc. goodies.

## False Position Method for Event Handling

All of the `ContinuousCallback` solvers utilize false position methods for solving
the rootfinding problem. Previously bisection was used but we found this to give
substantial speedups. Classic solvers like those in Sundials have always made
use of the Illinois false position method, but we ran the gambit of newer versions
and found one that's one efficient (we are actually just using
[Roots.jl for this... so thanks!)](https://github.com/JuliaMath/Roots.jl)). The
net result shows that bypassing rootfinding algorithms of other libraries was
more efficient, so that means that wrapped solvers like `CVODE_BDF` make use of
native Julia handling for the event handling portions instead of relying on
the rootfinding built into these solvers. The main point I am trying to hit here
is that if you have a lot of `ContinuousCallback`s that trigger often, then
you will see a speedup and it seems our architecture is very well-optimized now
ecosystem wide (at least in comparison to other libraries).

## General IDA Fixes

In this last release there was a lot of interest in the new event handling with
`IDA`, which led to bug reports and fixes. Initial condition consistency handling,
linear solver choices, reinitialization after callbacks were all fixed or made
more robust. The test suite was also greatly expanded and so we hope this can
now serve as a robust almost feature-complete general purpose fully implicit DAE
solver with event handling!

# In development

We note that a huge update to the stochastic differential equation solvers is
right around the corner: stay tuned. In addition, note that some projects have
been sectioned off as [possible GSoC projects](https://sciml.ai/soc/projects/diffeq.html).
These would also do well as new contributor projects if anyone's interested, and
so these are not considered in the "in development" list as we are leaving these
open for newcomers/students.

Putting those aside, this is the main current "in development" list:

- Preconditioner choices for Sundials methods
- Small feature requests (for changing initial conditions, etc.)
- Improved jump methods (tau-leaping)
- Adaptivity in the MIRK BVP solvers
- More general Banded and sparse Jacobian support (outside of Sundials)
