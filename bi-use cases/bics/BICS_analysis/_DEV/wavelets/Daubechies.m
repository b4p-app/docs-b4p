(* Copyright 1992, Tong Chen & Meng Xu *)

(* Version: Mathematica 2.0 *)

(* Name: Daubechies *)

(* Authors: Tong Chen & Meng Xu *)

(* Keywords: dblh, dbm0 *)

(* Requirements: none *)

(* Warning: none *)

BeginPackage["Daubechies`"]

dbm0::usage = "dbm0[n,ksi] gives the frequency domain low pass filter of 
		Daubechies type of order n"

dblh::usage = "dblh[n] gives the coeffients of the low pass wavelet 
		filter of Daubechies type of order n"

Begin["`private`"];

(* The polynomial P_n *)
bp[n_,y_] := Sum[Binomial[n-1+k,k] y^k,{k,0,n-1}]

(* The function L[ksi] *)
bl[n_,ksi_] := Expand[bp[n,(1-Cos[ksi])/2]]

(* Strip the coefficients to form the polynomial in z *)
cl[n_] := CoefficientList[bl[n,ksi],Cos[ksi]]

(* Form the polynomial in z *)
eq1[n_,x_] := Block[
				{len},
				len = Length[cl[n]]-1;
				cl[n].Table[x^i,{i,0,len}]
				]

(* The equation for spectral factorization *) 
aeq[n_,x_] := Block[
				{len},
				len = Length[cl[n]]-1;
				Simplify[x^len*eq1[n,(x + 1/x)/2]]
				]

(* Factorized polynomial *)
beq[n_] := Block[
			{sl,x,solu,pole = {}},
			solu = NSolve[aeq[n,x] == 0,x];
			sl = x /. solu;
			Map[(If[Abs[#]<=1.,pole=Append[pole,#]])&,sl];
			Return[pole]
			]

(* Get the function m[z] *)
ll[n_,z_] := ((1+z)/2)^n*Apply[Times,z - beq[n]]

(* m[1] for normalization *)
lnorm[n_] := Re[ll[n,1]]

(* The normalized function m[z] *)
nll[n_,z_] := ll[n,z]/lnorm[n]

(* The low pass wavelet filter *)
dblh[n_] := Reverse[Re[N[Sqrt[2]*CoefficientList[nll[n,z],z],16]]] 

(* m0 function *)
dbm0[n_,ksi_] := Block[{allh},
			allh = dblh[n];
			Return[1/Sqrt[2] allh.Table[Cos[i ksi] - 
			I Sin[i ksi],{i,1,2*n}]];
			]

End[]

Protect[bp,bl,cl,eq1,aeq,beq,ll,lnorm,nll,dbm0,dblh]

EndPackage[]

Null
