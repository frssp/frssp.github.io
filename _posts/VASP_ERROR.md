http://blog.sciencenet.cn/blog-3222255-1066034.html



1. > ZBRENT: fatal error in bracketing

   This error is generally caused by a charge overlap or a symmetry mismatch. 

   - cp CONTCAR POSCAR; Try IBRION=1
   - ADDGRID=.TRUE. and a larger ENCUT

2. > VERY BAD NEWS! internal error in subroutine INVGRP:  
   > inverse of rotation matrix was not found (increase SYMPREC)2 

   - SYMPREC=1E-04 will do, if you don't add it, you will get an error and you can't run it.  

3. > internal error in SET_INDPW_FULL: insufficient memory (see wave.F safeguard)       279       278

     - remove NPAR 
     - other ways? 
     - mmm0035@thomas.rc.ucl.ac.uk:/scratch/scratch/mmm0035/00_PROJECT/10_CZGSe/00_CZGSe/bulk/10_DIE/10_380_666$

4. > internal error in GENERATE_KPOINTS_TRANS: G vector not found    30    0    1    0    1    0    0    2 mkpoints_change.F

   - commensurate KPAR and NPAR

5. When a calculation diverge...
   - ALGO = ALL
   - AMIX = 0.3 ; BMIX = 0.4

6. > internal error in FOCK_ACC: number of k-points incorrect           7

