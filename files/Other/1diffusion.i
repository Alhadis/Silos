i[Mesh]
 file = refinedMesh_${unifSteps}_000${adapSteps}_mesh.xdr
  block_id = '1 6 4 7 2'
  boundary_id = '6 7'
  boundary_name = 'inflow outflow'
[]

[MeshModifiers]
 [./fractureUserObject]
 type = FractureUserObject
 fn = 2
 fx_string = '0.0,0.0'
 fy_string = '-6500.0,500.0'
 fa1_string = '79.695153531233970,-45.0'
 fd1_string = '20000000.0,200000000.0'
 fd2_string = '14.758048690536125,7.071067811865476'
 [../]
[]

[Variables]
[./pressure] order=FIRST  family=LAGRANGE [../]
[]

[Kernels]
[./myDiffusion] type = PermeabilityDiffusion variable = pressure [../]
[]

[Materials]
[./conductivity1]
type = FractureMaterial
fractureMeshModifier = fractureUserObject
matrixPorosity = 0.0
fracturePorosity = 0.0
matrixPermeability = 1e-8
fracturePermeability = 1e-6
[../]
[]

# observe that with the second BCs the stiffness matrix is SDP and we can use choleski factorization
[BCs]
[./inflowBC]  type = FunctionDirichletBC variable = pressure function = y  boundary = 1  [../]
[]
 
[Preconditioning]
[./prec] type = SMP full = true ksp_norm = default [../]
[]
 
[Executioner]

 type=Steady
 solve_type= NEWTON
 line_search = none
 petsc_options_iname=' -ksp_type -pc_type -pc_factor_shift_type -pc_factor_mat_solver_package '
 petsc_options_value='  preonly   lu       NONZERO               mumps '
 
# petsc_options_iname = '-pc_type -pc_hypre_type'
# petsc_options_value = 'hypre boomeramg'

[./Quadrature]
 order = TENTH
[../]

[]


[Outputs]
 file_base  = DiffusionOut_${unifSteps}_${adapSteps}
 exodus     = true
 perf_graph = true
[]

