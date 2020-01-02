[Problem]
type = ParrotProblem
use_AFC = true
[]


[Mesh]
 file = refinedMesh_${typeMesh}_${origLevel}_000${adapSteps}_mesh.xdr
  boundary_id = '21 22'
  boundary_name = 'inflow outflow'
[]

[MeshModifiers]
active=''
[./fractureUserObject]
type = FractureUserObject
fn = 8
fx_string = '0.5  ,0.5  ,0.77,0.83, 0.2,0.2  , 0.5,0.5'
fy_string = '1.125,0.175,2.05,2.05, 2.05,2.05 , 1.6,1.6'
fz_string = '0.5  ,0.5  ,0.5 ,0.5, 0.5,0.5 , 0.675,0.31'
fa1_string = '0,90,90,90,78.6901,-78.6901,0,0'
fa2_string = '0, 0, 0, 0,0,0,0,0'
fa3_string = '0,90,90,90,90,90,16.2602,-15.8192'
fd1_string = '0.9,0.25,0.3,0.3,0.3059,0.3059,0.9,0.9'
fd2_string = '1.75,0.9,0.4,0.4,0.4,0.4,1.25,1.2472'
fd3_string = '0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01'
[../]
[]

[Variables]
[./CM] [../]
[]
 
[AuxVariables]
[./P_aux] [../]
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

#[./conductivity1] type = FractureMaterial fractureMeshModifier =  fractureUserObject
#matrixPorosity = 0.2 fracturePorosity = 0.2
#matrixPermeability = 1 fracturePermeability = 1e4
#pressure = P_aux
#[../]
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

[./Quadrature] order=SIXTH [../]

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
value_N_bc='-1.1629356736'
#'-1.309827939415' #'-1.371218453748253'
aux_variable=P_aux
conservative=true
#fractureMeshModifier = fractureUserObject
#output_file=matrix.e
[../]
[]

[Postprocessors]
[./fluxBoundary]
  type = SideIntegralForFluxPostprocessor
  variable = P_aux
  boundary   = '21'
#  execute_on = 'initial'
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
