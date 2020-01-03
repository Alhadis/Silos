# Global parameters

[GlobalParams]
  order = FIRST
  cfl = 0.3
  pressure_init_left = 3
  pressure_init_right = 3
  vel_init_left = 1
  vel_init_right = 1
  temp_init_left = 1
  temp_init_right = 1
[]

# Functions

[Functions]
  [./area]
    type = ConstantFunction
    value = 1.
  [../]
[]

# Userobjects

[UserObjects]
  [./eos]
    type = OneDStiffenedGasEquationOfState
    gamma = 1.4
    Pinf = 0.
    q = 0.
    q_prime = 0.
  [../]

  [./press_jump]
    type = OneDJumpInterfaceGradient
    variable = pressure_aux
    jump = press_jump_aux
  [../]

  [./rho_jump]
    type = OneDJumpInterfaceGradient
    variable = density_aux
    jump = rho_jump_aux
  [../]
[]

# Mesh

[Mesh]
  type = GeneratedMesh
  dim = 1
  nx = 400
  xmin = 0.
  xmax = 1.
  block_id = '0'
[]

# Variables

[Variables]
  [./rhoA]
    family = LAGRANGE
    scaling = 1.
	[./InitialCondition]
        type = OneDInitialConditionsPressTempVel
        eos = eos
        area = area
	[../]
  [../]

  [./rhouA]
    family = LAGRANGE
    scaling = 1.
    [./InitialCondition]
      type = OneDInitialConditionsPressTempVel
      eos = eos
      area = area
    [../]
  [../]

  [./rhoEA]
    family = LAGRANGE
    scaling = 1.
    [./InitialCondition]
      type = OneDInitialConditionsPressTempVel
      eos = eos
      area = area
    [../]
  [../]
[]

# Kernels

[Kernels]
  [./MassTime]
    type = TimeDerivative
    variable = rhoA
  [../]

  [./MomentumTime]
    type = TimeDerivative
    variable = rhouA
  [../]

  [./EnergyTime]
    type = TimeDerivative
    variable = rhoEA
  [../]

  [./Mass]
    type = OneDMass
    variable = rhoA
    rhouA = rhouA
  [../]

  [./Momentum]
    type = OneDMomentum
    variable = rhouA
    rhoA = rhoA
    rhoEA = rhoEA
    eos = eos
  [../]

  [./Energy]
    type = OneDEnergy
    variable = rhoEA
    rhoA = rhoA
    rhouA = rhouA
    eos = eos
  [../]

  [./MassVisc]
    type = OneDStabilization
    variable = rhoA
    equation_name = MASS
    rho = density_aux
    velocity = velocity_aux
    internal_energy = internal_energy_aux
    mu = mu_aux # visc_max_aux
    kappa = kappa_aux # visc_max_aux
  [../]

   [./MomentumVisc]
    type = OneDStabilization
    variable = rhouA
    equation_name = MOMENTUM
    rho = density_aux
    velocity = velocity_aux
    internal_energy = internal_energy_aux
    mu = mu_aux # visc_max_aux
    kappa = kappa_aux # visc_max_aux
  [../]

   [./EnergyVisc]
    type = OneDStabilization
    variable = rhoEA
    equation_name = ENERGY 
    rho = density_aux
    velocity = velocity_aux
    internal_energy = internal_energy_aux
    mu = mu_aux # visc_max_aux
    kappa = kappa_aux # visc_max_aux
  [../]
[]

# Auxvariables

[AuxVariables]
   [./velocity_aux]
      family = LAGRANGE
   [../]

   [./density_aux]
      family = LAGRANGE
   [../]

   [./internal_energy_aux]
      family = LAGRANGE
   [../]

   [./pressure_aux]
      family = LAGRANGE
   [../]

   [./visc_max_aux]
    family = MONOMIAL
    order = FIRST
   [../]

  [./mu_aux]
    family = MONOMIAL
    order = FIRST
  [../]

  [./kappa_aux]
    family = MONOMIAL
    order = FIRST
  [../]

  [./res_aux]
    family = MONOMIAL
    order = FIRST
  [../]

  [./press_jump_aux]
    family = MONOMIAL
    order = FIRST
  [../]

  [./rho_jump_aux]
    family = MONOMIAL
    order = FIRST
  [../]
[]

# Auxkernels

[AuxKernels]
  [./VelocityAux]
    type = OneDVelocityAux
    variable = velocity_aux
    rhoA = rhoA
    rhouA = rhouA
  [../]

  [./DensityAux]
    type = OneDDensityAux
    variable = density_aux
    rhoA = rhoA
  [../]

  [./InternalEnergyAux]
    type = OneDInternalEnergyAux
    variable = internal_energy_aux
    rhoA = rhoA
    rhouA = rhouA
    rhoEA = rhoEA
  [../]

  [./PressureAaux]
    type = OneDPressureAux
    variable = pressure_aux
    rhoA = rhoA
    rhouA = rhouA
    rhoEA = rhoEA
    eos = eos
  [../]

  [./FirstOrderViscosityCoefficientAux]
    type = OneDFirstOrderViscosityCoefficient
    variable = visc_max_aux
    rhoA = rhoA
    rhouA = rhouA
    rhoEA = rhoEA
    eos=eos
  [../]

  [./EntropyViscosityMethodMu]
    type = OneDEntropyViscosityMethod
    variable = mu_aux
    rhoA = rhoA
    rhouA = rhouA
    rhoEA = rhoEA
    rho = density_aux
    pressure = pressure_aux
    press_jump = press_jump_aux
    rho_jump = rho_jump_aux
    velocity_average = VelocityAverageValue
    Ce = 1.4
    eos=eos
  [../]

  [./EntropyViscosityMethodKappa]
    type = OneDEntropyViscosityMethod
    variable = kappa_aux
    rhoA = rhoA
    rhouA = rhouA
    rhoEA = rhoEA
    rho = density_aux
    pressure = pressure_aux
    rho_jump = rho_jump_aux
    press_jump = press_jump_aux
    velocity_average = VelocityAverageValue
    Ce = 1.4
    eos=eos
  [../]

  [./EntropyViscosityMethodRes]
    type = OneDEntropyViscosityMethod
    variable = res_aux
    rhoA = rhoA
    rhouA = rhouA
    rhoEA = rhoEA
    rho = density_aux
    pressure = pressure_aux
    velocity_average = VelocityAverageValue
    eos=eos
  [../]
[]

# Boundary conditions

[BCs]
  [./MomentumBC]
    type = OneDMomentumWallBC
    variable = rhouA
    rhoA = rhoA
    rhoEA = rhoEA
    eos = eos
    boundary = 'left right'
  [../]
[]

# Postprocessors

[Postprocessors]
  [./TimeStepCFL]
    type=OneDTimeStepCFL
    rhoA = rhoA
    rhouA = rhouA
    rhoEA = rhoEA
    eos = eos
  [../]

  [./VelocityAverageValue]
    type = ElementAverageAbsValue
    variable = velocity_aux
  [../]
[]

# Precondioner

[Preconditioning]
  active = 'FDP_Newton'
  [./FDP_Newton]
    type = FDP
    full = true
    solve_type = 'PJFNK'
#    line_search = 'default'
#    petsc_options = '-snes_ksp_ew'
#    petsc_options_iname = '-mat_fd_coloring_err  -mat_fd_type  -mat_mffd_type'
#    petsc_options_value = '1.e-12       ds             ds'
  [../]
[]

# Executioner

[Executioner]
  type = Transient
  scheme = 'bdf2'
  end_time = 1.
  num_steps = 2000
  dt = 1.e-4
  dtmin = 1e-10
  l_tol = 1e-8
  nl_rel_tol = 1e-9
  nl_abs_tol = 1e-7
  l_max_its = 50
  nl_max_its = 10

  [./TimeStepper]
    type = PostprocessorDT
    postprocessor = TimeStepCFL
    dt = 1.e-4
  [../]

#  [./TimeStepper]
#    type = FunctionDT
#   time_t =  '0      1.e-5  1.e-4'
#    time_dt = '1.e-7  1.e-7  1.e-7'
#  [../]

  [./Quadrature]
    type = GAUSS
    order = SECOND
  [../]
[]

# Output

[Outputs]
  [./console]
    type = Console
    perf_log = true
    interval = 1
  [../]

  [./out]
    type = Exodus
    interval = 1
  [../]
[]
