[Problem]
type = FEProblem
solve = false
[]

[Mesh]
 type = GeneratedMesh
 xmin=-50.0
 xmax= 50.0
 ymin=-50.0
 ymax= 50.0
 nx = 400
 ny = 400
 dim = 2
[]

[MeshModifiers]
[./createNewSidesetInflow]
type = AddSideSetsFromBoundingBox
boundary_id_old = 'left'
boundary_id_new = 11
top_right   = '-45.0  51.0  0.0'
bottom_left = '-51.0  39.0  0.0'
[../]

[./createNewSidesetOutflow]
type = AddSideSetsFromBoundingBox
boundary_id_old = 'right'
boundary_id_new = 22
bottom_left = '45.0 -51.0 0.0'
top_right =   '51.0 -39.0 0.0'
[../]

[./subdomains]
type = SubdomainBoundingBox
bottom_left = '-51.0 -51.0 0.0'
top_right =   ' 51.0 -39.0 0.0'
block_id = 2
[../]

[./fractureUserObject]
type = FractureUserObject
fn = 1
fx_string = '0.0'
fy_string = '0.0'
fa1_string = '-30.963756532073525'
fd1_string = '2000.0'
fd2_string = '0.01'
[../]

[]

[Variables]
[./pressure]  order = FIRST  family=LAGRANGE [../]
[]

[Kernels]
[./StressDivergenceParrot_real_x] type = Reaction variable = pressure [../]
[]

[Executioner]
 type=Steady
 solve_type=LINEAR
 line_search = 'none'
 nl_abs_tol = 1e-8
 []

[Outputs]
 file_base = refinedMesh
 #exodus = true
 perf_graph = true
 xdr = true
[]

[Adaptivity]
 marker = simplemark
 steps = ${adapSteps}
 [./Markers]
 [./simplemark]
 type = RegionMarker
 regionMeshModifier = fractureUserObject
 [../]
 [../]
[]
