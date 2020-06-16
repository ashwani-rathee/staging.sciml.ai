@def title = "Home"
@def tags = ["home", "sciml"]

# SciML: Open Source Software for Scientific Machine Learning

SciML is an open source software organization created to unify the packages for
scientific machine learning. This includes the development of modular scientific
simulation support software, such as differential equation solvers, along with the
methodologies for inverse problems and automated model discovery. By providing
a diverse set of tools with a common interface, we provide a modular,
easily-extendable, and highly performant ecosystem for handling a wide variety
of scientific simulations.

## Core Components

- **High Performance and Feature-Filled Differential Equation Solving**. The
  library [DifferentialEquations.jl](https://docs.sciml.ai/dev/) is a library
  for solving ordinary differential equations (ODEs), stochastic differential
  equations (SDEs), delay differential equations (DDEs), differential-algebraic
  equations (DAEs), and hybrid differential equations which include multi-scale
  models and mixtures with agent-based simulations. The templated implementation
  allows arbitrary array and number types to be compatible, giving compatibility
  with arbitrary precision floating point numbers, GPU-based computations,
  unit-checked arithmetic, and other features. DifferentialEquations.jl is designed
  for both high performance on large-scale and small-scale problems, and routinely
  [benchmarks at the top of the pack](https://github.com/SciML/DiffEqBenchmarks.jl).
- **Physics-Informed Model Discovery and Learning**. SciML contains a litany of modules
  for automating the process of model discovery and fitting. Tools like
  [DiffEqParamEstim.jl](https://docs.sciml.ai/latest/analysis/parameter_estimation/)
  and [DiffEqBayes.jl](https://docs.sciml.ai/latest/analysis/parameter_estimation/#Bayesian-Methods-1)
  provide classical maximum likelihood and Bayesian estimation for differential
  equation based models, while [DiffEqFlux.jl](https://github.com/SciML/DiffEqFlux.jl)
  enables the training of embedded neural networks inside of differential
  equations (neural differential equations or universal differential equations)
  for discovering unknown dynamical equations,
  [DataDrivenDiffEq.jl](https://github.com/SciML/DataDrivenDiffEq.jl) estimates
  Koopman operators (DMD) and utilizes methods like SInDy to turn timeseries
  data into LaTeX for driving differential equations, and
  [ReservoirComputing.jl](https://github.com/SciML/ReservoirComputing.jl) for
  Echo State Networks that learn to predict the dynamics of chaotic systems.
- **A Polyglot Userbase**. While the majority of the tooling for SciML
  is built using the [Julia programming language](https://sciml.ai/),
  SciML is committed to ensure that these methodologies can be used throughout
  the greater scientific community. Tools like [diffeqpy](https://github.com/SciML/diffeqpy)
  and [diffeqr](https://cran.r-project.org/web/packages/diffeqr/index.html) bridge
  the DifferentialEquations.jl solvers to Python and R respectively, and we hope
  to see many more developments along these lines in the near future.
- **Compiler-Assisted Model Analysis and Sparsity Acceleration**. Scientific
  models generally have structures like locality which leads to sparsity in the
  program structures that can be exploited for major performance acceleration.
  The SciML builds a set of interconnected tools for generating numerical solver
  code directly on the models that are being simulated.
  [SparsityDetection.jl](https://github.com/SciML/SparsityDetection.jl) can automatically
  detect the sparsity patterns of Jacobians and Hessians from arbitrary source
  code, while [ModelingToolkit.jl](https://github.com/SciML/ModelingToolkit.jl)
  can rewrite differential equation models to re-arrange equations for better
  stability and automatically parallelize code. These tools then connect with
  affiliated packages like [SparseDiffTools.jl](https://github.com/JuliaDiff/SparseDiffTools.jl)
  to accelerate solving with DifferentialEquations.jl and training with DiffEqFlux.jl.
- **ML-Assisted Tooling for Model Acceleration**. SciML supports the development
  of the latest ML-accelerated toolsets for scientific machine learning. Methods
  like Physics-Informed Neural Networks (PINNs) and Deep BSDE methods for solving
  1000 dimensional partial differential equations are productionized in the
  [NeuralNetDiffEq.jl](https://github.com/SciML/NeuralNetDiffEq.jl) library.
  Surrogate-based acceleration methods are provided by
  [Surrogates.jl](https://github.com/SciML/Surrogates.jl).
- **Differentiable Scientific Data Structures and Simulators**. The SciML ecosystem
  contains pre-built scientific simulation tools along with data structures
  for accelerating the development of models. Tools like
  [LabelledArrays.jl](https://github.com/SciML/LabelledArrays.jl) and
  [MultiScaleArrays.jl](https://github.com/SciML/MultiScaleArrays.jl) make it easy
  to build large-scale scientific models, while other tools like
  [NBodySimulator.jl](https://github.com/SciML/NBodySimulator.jl) provide full-scale
  simulation simulators.
- **Tools for Accelerated Algorithm Development and Research**. SciML is an
  organization dedicated to helping state-of-the-art research in both
  numerical simulation methods and methodologies in scientific machine learning.
  Many tools throughout the organization automate the process of benchmarking
  and testing new methodologies to ensure they are safe and battle tested, both
  to accelerate the translation of the methods to publications and to users.
  We invite the larger research community to make use of our tooling like
  [DiffEqDevTools.jl](https://github.com/SciML/DiffEqDevTools.jl) and our large
  suite of wrapped algorithms for quickly test and deploying new algorithms.
