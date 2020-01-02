 [Problem]
type = ParrotProblem
use_AFC = true
operator_userobject = storeOperatorsUO
[]

[Mesh]
file = refinedMesh_${typeMesh}_${origLevel}_000${adapSteps}_mesh.xdr
boundary_id = '11 22'
boundary_name = 'inflow outflow'
[]


[Variables]
[./CM] [../]
[]

[AuxVariables]
[./P_aux] [../]
[./correction] [../]
[]

[Materials]

[./porosity_1]
type = FlowAndTransport
conservative=true
block = '11 12 13'
k = 1.0
phi = 0.2
pressure=P_aux
[../]

[./porosity_2]
type = FlowAndTransport
conservative=true
block = '1 2 3 4 5 6 7 8'
k = 1.0e4
phi = 0.2
pressure=P_aux
[../]
[]

[Kernels]
active='time upwind'
[upwind] type = Advection variable = CM [../]
[./time] type = PorosityTimeDerivative variable = CM lumping = true [../]
[]

[BCs]
[./u_injection_left] type = DirichletBC boundary = 21 variable = CM value='1' [../]
[]

[Preconditioning]
[./SMP]
type = SMP
full = true
[../]
[]

[Executioner]

type = Transient
solve_type= LINEAR
line_search = none

petsc_options_iname=' -ksp_type            '   # -mat_view
petsc_options_value='  ksp_parrot_preonly  '   # ::ascii_matlab

dt = 0.01
num_steps=100

[./Quadrature] order=TENTH [../]

[]

[Outputs]
file_base = AdvectionOut_${typeMesh}_${origLevel}_${adapSteps}
exodus = true
csv=true
perf_graph = true
[]


[UserObjects]
[./soln]
type = SolveDiffusion
execute_on = 'initial'
block_id='1 2 3 4 5 6 7 8 11 12 13'
value_p ='1e4 1e4 1e4 1e4 1e4 1e4 1e4 1e4 1 1 1'
boundary_D_bc = '22'
value_D_bc='0.0'
boundary_N_bc = '21'
value_N_bc='-1.309827939415' #'-1.371218453748253'
aux_variable=P_aux
conservative = true
[../]

[./storeOperatorsUO]
type = StoreOperators
[../]

[./MassAssembly]
type = AssembleMassMatrix
operator_userobject = storeOperatorsUO
block_id='1 2 3 4 5 6 7 8 11 12 13'
value_p ='1e4 1e4 1e4 1e4 1e4 1e4 1e4 1e4 1 1 1'
execute_on = 'initial'
constrain_matrix = true
#fractureMeshModifier = fractureUserObject
[../]

[./antidiffusiveFluxes]
type = AntidiffusiveFluxes
operator_userobject = storeOperatorsUO
execute_on = 'timestep_end'
dc_boundaries = '11 22'
[../]
[]


[Postprocessors]
[./fluxBoundary]
type = SideIntegralForFluxPostprocessor
variable = P_aux
boundary   = '21'
[../]

[./integral1]
type = ElementIntegralVariablePostprocessor
variable = CM
block = 1
[../]

[./integral2]
type = ElementIntegralVariablePostprocessor
variable = CM
block = 2
[../]

[./integral3]
type = ElementIntegralVariablePostprocessor
variable = CM
block = 3
[../]

[./integral4]
type = ElementIntegralVariablePostprocessor
variable = CM
block = 4
[../]

[./integral5]
type = ElementIntegralVariablePostprocessor
variable = CM
block = 5
[../]

[./integral6]
type = ElementIntegralVariablePostprocessor
variable = CM
block = 6
[../]

[./integral7]
type = ElementIntegralVariablePostprocessor
variable = CM
block = 7
[../]

[./integral8]
type = ElementIntegralVariablePostprocessor
variable = CM
block = 8
[../]

[./volume1] type = VolumePostprocessor block = 1 [../] # execute_on = 'final'
[./volume2] type = VolumePostprocessor block = 2 [../] # execute_on = 'final'
[./volume3] type = VolumePostprocessor block = 3 [../] # execute_on = 'final'
[./volume4] type = VolumePostprocessor block = 4 [../] # execute_on = 'final'
[./volume5] type = VolumePostprocessor block = 5 [../] # execute_on = 'final'
[./volume6] type = VolumePostprocessor block = 6 [../] # execute_on = 'final'
[./volume7] type = VolumePostprocessor block = 7 [../] # execute_on = 'final'
[./volume8] type = VolumePostprocessor block = 8 [../] # execute_on = 'final'
[]
