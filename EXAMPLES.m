%--------------------------------------------------------------------------------------
%EXAMPLE 1
%--------------------------------------------------------------------------------------

I  = [1 2;1 2;1 2];

I = 4*I;

[J,v] = generate_encoding_Q( I );

[L,R] = generate_encoding_P( J,v );

M = generate_minimal_encoding_P(J,R,v );

L_from_M = generate_encoding_P_from_M( M,v );

H = generate_boundary_surface( M,v );

%--------------------------------------------------------------------------------------
%EXAMPLE 2
%--------------------------------------------------------------------------------------

I2 = load('example34.txt');

I2 = 4*I2';

[J2,v2] = generate_encoding_Q( I2 );

[L2,R2] = generate_encoding_P( J2,v2 );

M2 = generate_minimal_encoding_P(J2,R2,v2 );

L_from_M2 = generate_encoding_P_from_M( M2,v2 );

H2 = generate_boundary_surface( M2,v2 );

