[Problem]
type = FEProblem
solve = false
[]

[Mesh]
file =mesh_${typeMesh}_${origLevel}.e
block_id = '1 2 3 4 5 6 7 8 11 12 13'
boundary_id = '21 22'
boundary_name = 'inflow outflow'
uniform_refine=2
#second_order=true
[]

[Variables]
[./pressure]  order = FIRST  family=LAGRANGE [../]
[]

[Kernels]
[./StressDivergenceParrot_real_x]
 type = Reaction
 variable = pressure
[../]
[]

[Executioner]
 type=Steady
 solve_type=LINEAR
 line_search = 'none'
 nl_abs_tol = 1e-8
 []

[Outputs]
 file_base = refinedMesh_${typeMesh}_${origLevel}
# exodus = true
 print_linear_residuals = true
 print_perf_log = true
 xdr = true
[]

[Adaptivity]
 marker = 'simplemark1'
 steps = ${adapSteps}
 [./Markers]
 [./simplemark1]
  type = UniformMarker
  block = '1 2 3 4 5 6 7 8'
  mark = REFINE
 [../]
 [../]
[]
