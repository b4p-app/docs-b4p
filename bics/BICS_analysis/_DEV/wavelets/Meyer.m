BeginPackage["Meyer`"];

(*
   Package for the Meyer wavelets and associated functions --
   Usage Examples are in Meyer.ma
   
   Author:  Jack K. Cohen, Colorado School of Mines, 1993
   	    (jkc@keller.mines.colorado.edu)

   Reference: Daubechies, Ten Lectures, SIAM, 1992
   	See pages 117-119 and 137-138.
   
   Convention:  My Fourier transforms are done with the kernel
   	Exp[-2 Pi I x xi]).  Thus, for example, the orthonormalization
	sum add to  1 instead of to Daubechies' 1/2Pi.  And my half-period
	point is 1/2 instead of her Pi, etc.

   Typos:  Several minor typos in Daubechies are corrected here.  In
   particular, my NuTaper function shows that the coefficient 80 in
   Figure 4.3, page 119, should really be 70.  (This erroneous caption
   occurs in a few places.)  And in the definition of phihat on page 137,
   the 3/4Pi should really be 3/2Pi (and then is further adjusted by the
   convention mentioned above).  Daubechies knows about these fixes and
   she says "in the next edition, these and 600 other typos will be
   fixed."
*)


(* Declaration of public function names in Meyer wavelet package *)

NuTaper::usage = "NuTaper[n, x] -- NuTaper returns a function of x that ascends from 0 to 1 over the interval [0, 1] with n^th degree smoothness at the endpoints.  The degree of the polynomial is 2n -1." 

MeyerPhiHat::usage = "MeyerPhiHat[nu, xi] -- the Fourier Transform of the Meyer scaling function.  The argument nu is the name of the tapering function (see NuTaper[] in this package) to be used in defining the Meyer wavelet.  The argument xi is the Fourier variable.  MeyerPhiHat is a real valued function.   Note: The transform is done with the kernel Exp[-2 Pi I x xi], thus PhiHat has support on [-2/3, 2/3]."

MeyerPhi::usage = "MeyerPhi[nu, x, (L)] -- the Meyer scaling function.  The argument nu is the name of the tapering function (see NuTaper[] in this package) to be used in defining the Meyer wavelet.  The argument x is the independent variable.  MeyerPhi is computed by using a Fourier Cosine Series.  The series is constructed for the interval [-L, L], using the argument L (default 10) to define the `effective' support of the scaling function.  Note: MeyerPhi is continued periodically outside [-L, L]."

MeyerPsiHat::usage = "MeyerPsiHat[nu, xi] -- the Fourier Transform of the Meyer mother wavelet.  The argument nu is the name of the tapering function (see NuTaper[] in this package) to be used in defining the wavelet.  The argument xi is the Fourier variable.    MeyerPsiHat is a complex valued function with the phase factor chosen as Exp[- I pi xi].    Note: The transform is done with the kernel Exp[-2 Pi I x xi], thus Psi has support on [-4/3, 4/3]."

MeyerPsi::usage = "MeyerPsi[nu, x, (L)] -- the Meyer mother wavelet.  The argument nu is the name of the tapering function (see NuTaper[] in this package) to be used in defining the wavelet.  The argument x is the independent variable.  MeyerPsi is computed by using a Fourier Cosine Series.  The series is constructed for the interval [-L, L], using the argument L (default 10) to define the `effective' support of the scaling function.  Note: MeyerPsi is continued periodically outside [-L, L]."

MeyerM0::usage = "MeyerM0[nu, xi] -- the Meyer characteristic function (low pass or scaling function filter).  The argument nu is the name of the tapering function (see NuTaper[] in this package) to be used in defining the wavelet.  The argument xi is the independent variable.    MeyerM0 is 1-periodic."

MeyerM1::usage = "MeyerM1[nu, xi] -- the Meyer high pass or wavelet filter.  The argument nu is the name of the tapering function (see NuTaper[] in this package) to be used in defining the wavelet.  The argument xi is the independent variable.    MeyerM1 is 1-periodic."


Begin["`private`"];

NuTaper[n_Integer?Positive, x_] :=
Module[
        {v, xi, a, eqs, solns},
        
        v[xi_] := xi^n * Sum[a[k] xi^k, {k, 0, n-1}];
        
        eqs =
            CoefficientList[v[xi] + v[1 - xi] - 1, xi] == 0 //Thread;
            
        solns = Solve[eqs, Array[a, n, 0]];
        
        v[x] /. solns //First //Factor
]

MeyerPhiHat[v_, xi_] :=
        Which[
                (* If *)     Abs[xi] <= 1/3, (* then *) 1,
                (* Elseif *) Abs[xi] >= 2/3, (* then *) 0,
                (* Else *)   True,  (* then *) Cos[Pi/2 v[3 Abs[xi] - 1]]
        ]
	
MeyerM0[v_, xi_] = MeyerPhiHat[v, 2 (xi -  Floor[xi + 1/2])]
MeyerM1[v_, xi_] = - Exp[-I 2Pi xi]  Conjugate@MeyerM0[v, xi + 1/2]

MeyerPhi[v_, x_, L_:10] :=
Module[
        {nmax = Floor[2 (2/3) L], xi, phihat, sum},
        
        phihat[xi_] = MeyerPhiHat[v, xi];
        sum = 1/2 ;     (* first term *)  (* phihat[0] = 1 *)
        
        sum += Sum[             (* add the rest of the terms *)
                Cos[Pi x k/L] phihat[k/(2L)],
        {k, 1, nmax}];

        sum / L
]

MeyerPsiHat[v_, x_] :=
Module[
        {phihat, xi},

        phihat[xi_] = MeyerPhiHat[v, xi];
        
        Exp[- I Pi x]  (phihat[x + 1] + phihat[x - 1])  phihat[x/2]
]

MeyerPsi[v_, x_, L_:10] :=
Module[
        {nmax = Floor[2 (4/3) L], abspsihat, xi, sum},
        
        abspsihat[xi_] := Abs@MeyerPsiHat[v, xi]; (* ??? need colon  here *)
        sum = 0;        (* first term *)  (* psihat[0] = 0 *)
        
        sum += Sum[             (* add the rest of the terms *)
                Cos[(x - 1/2) Pi k/L] abspsihat[k/(2L)],
        {k, 1, nmax}];

        sum / L
]
                                         
End[];

Protect[
        NuTaper,
        MeyerPhiHat,
        MeyerPhi,
        MeyerPsi,
        MeyerPsiHat,
        MeyerM0,
        MeyerM1
]

EndPackage[];
