EFFICIENTLY STORING WELL-COMPOSED POLYHEDRAL COMPLEXES COMPUTED OVER 3D BINARY IMAGES

INPUT: Matrix of 3 rows and n columns where n is the number of points of a 3D binary image I.
Each column of the matrix represents the coordinates of the points of I rescaled with factor 4.

Step 1: Function generate_encoding_Q to obtain the 3D binary image J that encodes Q(I), being Q(I) the cubical complex associated to I.

Step 2: Function generate_encoding_P to obtain the 3D binary image L that encodes P(I) from J, being P(I) a polyhedral complexhomotopy equivalent to Q(I).

Step 3: Function generate_minimal_encoding_P to obtain the minimal enconding of P(I), M.

Step 4: Function generate_boundary_surface to obtain the 2-cells of the boundary P(I).

Function generate_encoding_P_from_M generates the 3D binary image L that encodes P(I) from M.

- For more details of each one of the functions, see the corresponding code.  

- In EXAMPLE.m, there are two examples to practice.    
