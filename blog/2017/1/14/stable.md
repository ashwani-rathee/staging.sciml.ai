@def rss_pubdate = Date(2017, 1, 14)
@def rss = """ DifferentialEquations.jl v1.6.0 """
@def published = "14 January 2017"
@def title = "DifferentialEquations.jl v1.6.0"
@def authors = """<a href="https://github.com/Chris Rackauckas">Chris Rackauckas</a>"""  


DifferentialEquations.jl v1.6.0 is a stable version of the JuliaDiffEq ecosystem.
This tag includes many new features, including:

* [The integrator interface](https://docs.juliadiffeq.org/stable/basics/integrator)
* [New Events/Callbacks API](https://docs.juliadiffeq.org/stable/features/callback_functions)
* [Delay differential equation solvers](https://docs.juliadiffeq.org/stable/tutorials/dde_example)
* [Monte Carlo simulation methods](https://docs.juliadiffeq.org/stable/features/monte_carlo)
* [Uncertainty quantification](https://docs.juliadiffeq.org/stable/analysis/uncertainty_quantification)
* Updated Developer tools (benchmarking, etc.)
* [Greatly enhanced plot recipes](https://docs.juliadiffeq.org/stable/basics/plot)
* [A Callback Library](https://docs.juliadiffeq.org/stable/features/callback_library)
* [The new ParameterizedFunction constructor on arbitrary user-defined functions](https://docs.juliadiffeq.org/stable/analysis/parameterized_functions)
* [CompositeAlgorithms](https://docs.juliadiffeq.org/stable/solvers/ode_solve)
* [ODE.jl common interface bindings](https://docs.juliadiffeq.org/stable/solvers/ode_solve)
* [More control over the Sundials solvers](https://docs.juliadiffeq.org/stable/solvers/ode_solve)

Over the last few months these changes (among others) have been part of a large
feature expansion
[which was laid out in a previous blog post.](https://www.stochasticlifestyle.com/6-months-differentialequations-jl-going/)
While not entirely complete, the vast majority of API changes which were previously
discussed are now complete (only leaving out the choice of linear/nonlinear solvers,
which is currently not available). Thus the API is pretty much set and I will be
letting JuliaDiffEq have some time to stabilize its ecosystem. This means I will
not be focusing on new features for awhile, and instead be working mostly on
bug fixes, documentation, and applications. If you encounter any bugs, please
[file an issue at the DifferentialEquations.jl repository](https://github.com/JuliaDiffEq/DifferentialEquations.jl/issues).

A stable version of the documentation for v1.6.0 has also been tagged.
While this shouldn't be too much of a big deal given that the API has stabilized,
this means that users of previous versions will always have a documentation version
which matches the package version they are using to better help long-term usage.
Also, this is a good time for newcomers interested in the ecosystem to explore
the code and its designs. See the
[Julia Google Summer of Code projects page](https://sciml.ai/soc/ideas-page)
for some good beginner projects.

We hope that this stable version gives everyone who is new to Julia and JuliaDiffEq
some time to explore the ecosystem and start using it in various applications.

-------------

## Immediate Future Directions

As noted above, for the immediate future development will be focusing on bug fixes
and enhancing the documentation. In the meantime, I am working on publishing new algorithms
for state-dependent delay equations and semi-stiff stochastic differential equations,
along with better implementations of stiff solvers for ODEs. As these become available
they will be added to the ecosystem. Other work throughout the ecosystem will be
more internal, including:

- Automatic conversion/promotion of problems to expand the reach of each solver.
- More problem types: more DAEs, IMEX, 2nd order ODEs, Partitioned ODEs, and symplectic problems.
- [DiffEqDiffTools.jl](https://github.com/JuliaDiffEq/DiffEqDiffTools.jl) for more efficient usage of Jacobians
- Internals changes to allow for `Fun` types in OrdinaryDiffEq.jl methods
- An internals change of StochasticDiffEq.jl to be like OrdinaryDiffEq.jl and have the integrator interface

For more details on these changes, [see this blog post](https://www.stochasticlifestyle.com/6-months-differentialequations-jl-going/).
None of these changes are expected to break user codes.
