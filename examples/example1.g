LoadPackage("CddInterface");

#! @Chunk Example1
#! @Example
A:= Cdd_PolyhedraByInequalities( [ [ 0, 1, 0 ], [ 0, 1, -1 ] ] );
#! < Polyhedra given by its H-representation >   
Display( A );
#! H-representation 
#! Begin 
#!    2 X 3  rational
#!               
#!    0   1   0 
#!    0   1  -1 
#! End
B:= Cdd_PolyhedraByInequalities( [ [ 0, 1, 0 ], [ 0, 1, -1 ] ], [ 2 ] );
#! < Polyhedra given by its H-representation >
Display( B );
#! H-representation 
#! Linearity 1, [ 2 ]
#! Begin 
#!    2 X 3  rational
#!               
#!    0   1   0 
#!    0   1  -1 
#! End   
#! @EndExample
#! @EndChunk


#! @Chunk Example2
#! @Example
A:= Cdd_PolyhedraByGenerators( [ [ 0, 1, 3 ], [ 1, 4, 5 ] ] );
#! < Polyhedra given by its V-representation >
Display( A );
#! V-representation 
#! Begin 
#!    2 X 3  rational
#!             
#!    0  1  3 
#!    1  4  5 
#! End
B:= Cdd_PolyhedraByGenerators( [ [ 0, 1, 3 ] ], [ 1 ] );      
#! < Polyhedra given by its V-representation >
Display( B );
#! V-representation 
#! Linearity 1, [ 1 ]
#! Begin 
#!    1 X 3  rational
#!             
#!    0  1  3 
#! End
#! @EndExample
#! @EndChunk

#! @Chunk Example3
#! @Example
A:= Cdd_PolyhedraByInequalities( [ [ 0, 2, 6 ], [ 0, 1, 3 ], [1, 4, 10 ] ] );
#! < Polyhedra given by its H-representation >
B:= Cdd_Canonicalize( A );                                                       
#! < Polyhedra given by its H-representation >
Display( B );                                                             
#! H-representation 
#! Begin 
#!    2 X 3  rational
#!               
#!    0   1   3 
#!    1   4  10 
#! End
#! @EndExample
#! @EndChunk

#! @Chunk Example4
#! @Example
A:= Cdd_PolyhedraByInequalities( [ [ 0, 1, 1 ], [0, 5, 5 ] ] );                          
#!< Polyhedra given by its H-representation >
B:= Cdd_V_Rep( A );                                    
#! < Polyhedra given by its V-representation >
Display( B );                                   
#! V-representation 
#! Linearity 1, [ 2 ]
#! Begin 
#!    2 X 3  rational
#!               
#!    0   1   0 
#!    0  -1   1 
#! End
C:= Cdd_H_Rep( B );
#! < Polyhedra given by its H-representation >
Display( C );
#! H-representation 
#! Begin 
#!    1 X 3  rational
#!             
#!    0  1  1 
#! End
D:= Cdd_PolyhedraByInequalities( [ [ 0, 1, 1, 34, 22, 43 ], 
[ 11, 2, 2, 54, 53, 221 ], [33, 23, 45, 2, 40, 11 ] ] );
#! < Polyhedra given by its H-representation >
Cdd_V_Rep( C );                                                                                                     
#! < Polyhedra given by its V-representation >
Display( last );                                                                                                    
#! V-representation 
#! Linearity 2, [ 5, 6 ]
#! Begin 
#!    6 X 6  rational
#!                                                         
#!    1  -743/14   369/14    11/14        0        0 
#!    0    -1213      619       22        0        0 
#!    0       -1        1        0        0        0 
#!    0      764     -390      -11        0        0 
#!    0   -13526     6772       99      154        0 
#!    0  -116608    59496     1485        0      154 
#! End
#! @EndExample
#! @EndChunk


#! @Chunk Example5
#! $\newline$
#! To illustrate the using of these functions, let us solve the linear program given by:
#! $\textbf{Maximize}\;\;\; P(x,y)= 1-2x+5y$, with $\newline$
#! $100\leq x \leq 200 \newline$
#! $80\leq y\leq 170 \newline$
#! $y \geq -x+200\newline\newline$
#! We bring the inequalities to the form $b+AX\geq 0$, we get:
#! $\newline -100+x\geq 0 \newline$
#! $200-x \geq 0 \newline$
#! $-80+y \geq 0 \newline$
#! $170 -y \geq 0 \newline$
#! $-200 +x+y \geq 0 \newline$
#! @Example
A:= Cdd_PolyhedraByInequalities( [ [ -100, 1, 0 ], [ 200, -1, 0 ], 
[ -80, 0, 1 ], [ 170, 0, -1 ], [ -200, 1, 1 ] ] );
#! < Polyhedra given by its H-representation >
Lp:= Cdd_LinearProgram( A, "max", [1, -2, 5 ] );
#! < Linear program >
S:= Cdd_SolveLinearProgram( Lp );
#! [ [ 100, 170 ], 651 ]
B:= Cdd_V_Rep( A );
#! < Polyhedra given by its V-representation >
Display( Lp );
#! Linear program given by: 
#! H-representation 
#! begin 
#!    5 X 3  rational
#!                     
#!    -100     1     0 
#!     200    -1     0 
#!     -80     0     1 
#!     170     0    -1 
#!    -200     1     1 
#! end
#! max  [ 1, -2, 5 ]
Display( B );
#! V-representation 
#! begin 
#!    5 X 3  rational
#!                   
#!    1  100  170 
#!    1  100  100 
#!    1  120   80 
#!    1  200   80 
#!    1  200  170 
#! end
#! @EndExample

#! So the optimal solution is $(x=100,y=170)$ with optimal value $p=1-2(100)+5(170)=651$.
#! @EndChunk
