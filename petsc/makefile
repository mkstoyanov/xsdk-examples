CFLAGS       =
FFLAGS		 =
CPPFLAGS     =
FPPFLAGS     =

include @PETSc_DIR@/lib/petsc/conf/variables
include @PETSc_DIR@/lib/petsc/conf/rules

#-------------------------------------------------------------------------

runex19:
	-@@MPIEXEC_EXECUTABLE@ @MPIEXEC_NUMPROC_FLAG@ 2 ./ex19 -da_refine 3 -pc_type mg -ksp_type fgmres  > ex19_1.tmp 2>&1; \
	   if (${DIFF} output/ex19_1.testout ex19_1.tmp) then \
           echo "C/C++ example src/snes/tutorials/ex19 run successfully with 2 MPI processes"; \
           else  printf "${PWD}\nPossible problem with ex19, diffs above\n=========================================\n"; fi; \
		@RM@ -f ex19_1.tmp
runex19_cuda:
	-@@MPIEXEC_EXECUTABLE@ @MPIEXEC_NUMPROC_FLAG@ 2 ./ex19 -snes_monitor -dm_mat_type seqaijcusparse -dm_vec_type seqcuda -pc_type gamg -ksp_monitor -mg_levels_ksp_max_it 3  > ex19_1.tmp 2>&1; \
	   if (${DIFF} output/ex19_cuda_1.out ex19_1.tmp) then \
           echo "C/C++ example src/snes/tutorials/ex19 run successfully with cuda"; \
           else  printf "${PWD}\nPossible problem with ex19 running with cuda, diffs above\n=========================================\n"; fi; \
	   @RM@ -f ex19_1.tmp
runex19_hypre:
	-@@MPIEXEC_EXECUTABLE@ @MPIEXEC_NUMPROC_FLAG@ 2 ./ex19 -da_refine 3 -snes_monitor_short -pc_type hypre > ex19_1.tmp 2>&1; \
	   if (${DIFF} output/ex19_hypre.out ex19_1.tmp) then \
           echo "C/C++ example src/snes/examples/tutorials/ex19 run successfully with hypre"; \
           else  printf "${PWD}\nPossible problem with ex19 running with hypre, diffs above\n=========================================\n"; fi; \
	   @RM@ -f ex19_1.tmp
runex19_hypre_cuda:
	-@@MPIEXEC_EXECUTABLE@ @MPIEXEC_NUMPROC_FLAG@ 2 ./ex19 -dm_vec_type cuda -dm_mat_type aijcusparse -da_refine 3 -snes_monitor_short -ksp_norm_type unpreconditioned -pc_type hypre > ex19_1.tmp 2>&1; \
	   if (${DIFF} output/ex19_hypre.out ex19_1.tmp) then \
           echo "C/C++ example src/snes/tutorials/ex19 run successfully with hypre/cuda"; \
           else  printf "${PWD}\nPossible problem with ex19 running with hypre, diffs above\n=========================================\n"; fi; \
	   @RM@ -f ex19_1.tmp
runex19_ml:
	-@@MPIEXEC_EXECUTABLE@ @MPIEXEC_NUMPROC_FLAG@ 2 ./ex19 -da_refine 3 -snes_monitor_short -pc_type ml > ex19_1.tmp 2>&1; \
	   if (${DIFF} output/ex19_ml.out ex19_1.tmp) then  \
           echo "C/C++ example src/snes/examples/tutorials/ex19 run successfully with ml"; \
           else  printf "${PWD}\nPossible problem with ex19 running with ml, diffs above\n=========================================\n"; fi; \
		@RM@ -f ex19_1.tmp
runex19_superlu_dist:
	-@@MPIEXEC_EXECUTABLE@ @MPIEXEC_NUMPROC_FLAG@ 2 ./ex19 -da_grid_x 20 -da_grid_y 20 -pc_type lu -pc_factor_mat_solver_type superlu_dist > ex19.tmp 2>&1; \
	   if (${DIFF} output/ex19_superlu.out ex19.tmp) then \
           echo "C/C++ example src/snes/examples/tutorials/ex19 run successfully with superlu_dist"; \
           else  printf "${PWD}\nPossible problem with ex19 running with superlu_dist, diffs above\n=========================================\n"; fi; \
	   @RM@ -f ex19.tmp

include @PETSc_DIR@/lib/petsc/conf/test
