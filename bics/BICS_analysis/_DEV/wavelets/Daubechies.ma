(*^

::[paletteColors = 128; automaticGrouping; currentKernel; 
	fontset = title, inactive, noPageBreakBelow, nohscroll, preserveAspect, groupLikeTitle, center, M7, bold, L1, e8,  24, "Times"; ;
	fontset = subtitle, inactive, noPageBreakBelow, nohscroll, preserveAspect, groupLikeTitle, center, M7, bold, L1, e6,  18, "Times"; ;
	fontset = subsubtitle, inactive, noPageBreakBelow, nohscroll, preserveAspect, groupLikeTitle, center, M7, italic, L1, e6,  14, "Times"; ;
	fontset = section, inactive, noPageBreakBelow, nohscroll, preserveAspect, groupLikeSection, grayBox, M22, bold, L1, a20,  18, "Times"; ;
	fontset = subsection, inactive, noPageBreakBelow, nohscroll, preserveAspect, groupLikeSection, blackBox, M19, bold, L1, a15,  14, "Times"; ;
	fontset = subsubsection, inactive, noPageBreakBelow, nohscroll, preserveAspect, groupLikeSection, whiteBox, M18, bold, L1, a12,  12, "Times"; ;
	fontset = text, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, L1,  12;
	fontset = smalltext, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, L1,  10, "Times"; ;
	fontset = input, noPageBreakBelow, nowordwrap, preserveAspect, groupLikeInput, M42, N23, bold, L1,  12, "Courier"; ;
	fontset = output, output, inactive, noPageBreakBelow, nowordwrap, preserveAspect, groupLikeOutput, M42, N23, L-5,  12, "Courier"; ;
	fontset = message, inactive, noPageBreakBelow, nowordwrap, preserveAspect, groupLikeOutput, M42, N23, L1,  12, "Courier"; ;
	fontset = print, inactive, noPageBreakBelow, nowordwrap, preserveAspect, groupLikeOutput, M42, N23, L1,  12, "Courier"; ;
	fontset = info, inactive, noPageBreakBelow, nowordwrap, preserveAspect, groupLikeOutput, M42, N23, L1,  12, "Courier"; ;
	fontset = postscript, PostScript, formatAsPostScript, output, inactive, noPageBreakBelow, nowordwrap, preserveAspect, groupLikeGraphics, M7, l34, w282, h287, L1,  12, "Courier"; ;
	fontset = name, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, italic, L1,  10, "Times"; ;
	fontset = header, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, L1,  12;
	fontset = Left Header, nohscroll, cellOutline,  12;
	fontset = footer, inactive, nohscroll, noKeepOnOnePage, preserveAspect, center, M7, L1,  12;
	fontset = Left Footer, cellOutline, blackBox,  12;
	fontset = help, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, L1,  10, "Times"; ;
	fontset = clipboard, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, L1,  12;
	fontset = completions, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, L1,  12, "Courier"; ;
	fontset = special1, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, L1,  12;
	fontset = special2, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, L1,  12;
	fontset = special3, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, L1,  12;
	fontset = special4, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, L1,  12;
	fontset = special5, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, L1,  12;]
:[font = title; inactive; preserveAspect; startGroup; ]
Daubechies Minimum Phase Wavelets
:[font = subsubtitle; inactive; preserveAspect; ]
Jack K. Cohen
Colorado School of Mines, 1993
jkc@keller.mines.colorado.edu 
:[font = input; preserveAspect; ]
<<Daubechies.m
:[font = text; inactive; preserveAspect; ]
NOTE: There is more that could be done--even in just getting basic functionality, let alone efficiency.  Occasionally I plant a comment along these lines.  I've  only done what I needed to get plots for a tutorial I was writing.
:[font = section; inactive; Cclosed; preserveAspect; startGroup; ]
Daubechies Subband Coefficients
:[font = text; inactive; preserveAspect; ]
The package function dblh gives the hn that are in Table 6.1 on page 195 of Ten Lectures:  These are the low pass coefficients first introduced on page 131ff.
:[font = input; preserveAspect; startGroup; ]
?dblh
;[s]
2:0,0;1,1;5,-1;
2:1,10,8,Courier,1,12,0,0,0;1,10,8,Courier,0,12,0,0,0;
:[font = info; inactive; preserveAspect; endGroup; ]
dblh[n] gives the coeffients of the low pass wavelet   
   filter of Daubechies type of order n
:[font = input; preserveAspect; startGroup; ]
dblh[2]
:[font = output; output; inactive; preserveAspect; endGroup; ]
{0.4829629131445342, 0.836516303737808, 
  0.2241438680420134, -0.1294095225512604}
;[o]
{0.4829629131445342, 0.836516303737808, 
 
  0.2241438680420134, -0.1294095225512604}
:[font = text; inactive; preserveAspect; ]
To store the coefficients in a ZERO-based array:
:[font = input; preserveAspect; ]
Table[h2[n] = dblh[2][[n+1]], {n, 0, 3}];
:[font = input; preserveAspect; startGroup; ]
h2[3]
:[font = output; output; inactive; preserveAspect; endGroup; ]
-0.1294095225512604
;[o]
-0.1294095225512604
:[font = text; inactive; preserveAspect; endGroup; ]
The corresponding high pass coefficients, gn, are first defined on page 135, but note that these aren't unique and, indeed, often an extra -1 factor is used.   (Also see the next page for another variant..)   Finally,note that  the hn are sometimes replaced by cn  where cn=sqrt(2) hn, see page 145, for example.   The dblh routine plays a prominent part in the construction of Phi and Psi below.
:[font = section; inactive; Cclosed; preserveAspect; startGroup; ]
Daubechies Low and High Pass Filters
:[font = text; inactive; preserveAspect; ]
M0 is used to denote the low-pass filter and M1, the high pass filter.
:[font = input; preserveAspect; startGroup; ]
?dbm0
:[font = info; inactive; preserveAspect; endGroup; ]
dbm0[n,ksi] gives the frequency domain low pass filter of 
     Daubechies type of order n
:[font = text; inactive; preserveAspect; ]
The subroutines in Daubechies.m honor Daubechies' Fourier convention.  I prefer to put a 2Pi in the exponent of the kernel, to eliminate 2PI's popping up all over the place.  The effect in plotting M0 and M1 is to replace the half-period point Pi by the half-period point 1/2.  Note that the exponential phase factor in M1 is defined variously in Ten Lectures.  Here are definitions of M0 and M1:
PhiHat[xi] = M0[xi/2] PhiHat[xi/2]  (5.1.17)
PsiHat[xi] = M1[xi/2] PhiHat[xi/2]  (5.1.29)  (but phase choice of p. 193)
:[font = input; preserveAspect; ]
M0[m_, xi_] := dbm0[m, 2Pi xi]
M1[m_, xi_] := - Exp[-2Pi I xi] Conjugate@M0[m, xi + 1/2]
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup; ]
Basic usage
:[font = text; inactive; preserveAspect; ]
Check that the orthogonality condition is verified:
:[font = input; preserveAspect; startGroup; ]
Clear[norm];
n = 3;
norm[xi_] = N@Abs@M0[n, xi]^2 + N@Abs@M1[n, xi]^2;
Table[{xi, norm[xi]}, {xi, 0.0, 1.0, 0.1}]//
TableForm
:[font = output; output; inactive; preserveAspect; endGroup; endGroup; ]
TableForm[{{0., 1.}, {0.1, 1.}, {0.2, 1.}, {0.3, 1.}, 
   {0.4, 1.}, {0.5, 1.}, {0.6, 1.000000000000001}, 
   {0.7, 1.}, {0.8, 1.}, {0.9, 1.000000000000001}, 
   {1., 1.}}]
;[o]
0.    1.

0.1   1.

0.2   1.

0.3   1.

0.4   1.

0.5   1.

0.6   1.

0.7   1.

0.8   1.

0.9   1.

1.    1.
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup; ]
Plotting the filters
:[font = text; inactive; preserveAspect; ]
Here's a plotting Module for the postive frequencies of the moduli of M0 and M1.  The low pass filter, M0,  is plotted darker than the high pass filter, M1.
:[font = input; preserveAspect; ]
PlotFilters[n_] :=
Module[{string, label},
  string = StringForm["Daubechies' M0, M1: n = `1`", n];
  label = FontForm[string, {"Helvetica-Bold", 16}];
  Plot[Evaluate@Abs@{M0[n, xi], M1[n, xi]}, {xi, 0, 1/2},
	   	PlotRange->{0, 1.1},
	   	PlotStyle -> {GrayLevel[0], GrayLevel[0.5]},
	 	DefaultFont -> {"Courier", 12},
	    PlotLabel -> label
  ]
]
:[font = text; inactive; preserveAspect; ]
The degree of overlap between M0 and M1 is significant because the overlap represents aliased energy.  This is an issue if we decompose into wavelets and do a  non-trivial filtering operation before recomposition.  Naturally enough, the smaller support Daubechies wavelets have more overlap than the larger support ones.  Meyer wavelets are especially good if the overlap is bothersome in some application, but this trades off the compact support for the better frequency domain behavior.
:[font = input; preserveAspect; startGroup; ]
PlotFilters[2]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; animationSpeed = 120; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.02381 1.904762 1.94614e-17 0.561849 [
[(0)] 0.02381 0 0 2 Msboxa
[(0.1)] 0.21429 0 0 2 Msboxa
[(0.2)] 0.40476 0 0 2 Msboxa
[(0.3)] 0.59524 0 0 2 Msboxa
[(0.4)] 0.78571 0 0 2 Msboxa
[(0.5)] 0.97619 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' M0, M1: n = 2)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.01131 0.11237 1 0 Msboxa
[(0.4)] 0.01131 0.22474 1 0 Msboxa
[(0.6)] 0.01131 0.33711 1 0 Msboxa
[(0.8)] 0.01131 0.44948 1 0 Msboxa
[(1)] 0.01131 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.00625 lineto
stroke
grestore
[(0)] 0.02381 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.21429 0 moveto
0.21429 0.00625 lineto
stroke
grestore
[(0.1)] 0.21429 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.40476 0 moveto
0.40476 0.00625 lineto
stroke
grestore
[(0.2)] 0.40476 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.59524 0 moveto
0.59524 0.00625 lineto
stroke
grestore
[(0.3)] 0.59524 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.78571 0 moveto
0.78571 0.00625 lineto
stroke
grestore
[(0.4)] 0.78571 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.97619 0 moveto
0.97619 0.00625 lineto
stroke
grestore
[(0.5)] 0.97619 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.0619 0 moveto
0.0619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1 0 moveto
0.1 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1381 0 moveto
0.1381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.17619 0 moveto
0.17619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.25238 0 moveto
0.25238 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.29048 0 moveto
0.29048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.32857 0 moveto
0.32857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.36667 0 moveto
0.36667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.44286 0 moveto
0.44286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.48095 0 moveto
0.48095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.51905 0 moveto
0.51905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.55714 0 moveto
0.55714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.63333 0 moveto
0.63333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.67143 0 moveto
0.67143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.70952 0 moveto
0.70952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.74762 0 moveto
0.74762 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82381 0 moveto
0.82381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.8619 0 moveto
0.8619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.9 0 moveto
0.9 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.9381 0 moveto
0.9381 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' M0, M1: n = 2)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.02381 0.11237 moveto
0.03006 0.11237 lineto
stroke
grestore
[(0.2)] 0.01131 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.22474 moveto
0.03006 0.22474 lineto
stroke
grestore
[(0.4)] 0.01131 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.33711 moveto
0.03006 0.33711 lineto
stroke
grestore
[(0.6)] 0.01131 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.44948 moveto
0.03006 0.44948 lineto
stroke
grestore
[(0.8)] 0.01131 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.56185 moveto
0.03006 0.56185 lineto
stroke
grestore
[(1)] 0.01131 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.02381 0.02247 moveto
0.02756 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.04495 moveto
0.02756 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.06742 moveto
0.02756 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.0899 moveto
0.02756 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.13484 moveto
0.02756 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.15732 moveto
0.02756 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.17979 moveto
0.02756 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.20227 moveto
0.02756 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.24721 moveto
0.02756 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.26969 moveto
0.02756 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.29216 moveto
0.02756 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.31464 moveto
0.02756 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.35958 moveto
0.02756 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.38206 moveto
0.02756 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.40453 moveto
0.02756 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.42701 moveto
0.02756 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.47195 moveto
0.02756 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.49443 moveto
0.02756 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.5169 moveto
0.02756 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.53938 moveto
0.02756 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.58432 moveto
0.02756 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.6068 moveto
0.02756 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
gsave
0.004 setlinewidth
0.02381 0.56185 moveto
0.02505 0.56185 lineto
0.02629 0.56185 lineto
0.02753 0.56185 lineto
0.02877 0.56185 lineto
0.03001 0.56185 lineto
0.03125 0.56185 lineto
0.03249 0.56185 lineto
0.03373 0.56185 lineto
0.03497 0.56185 lineto
0.03621 0.56185 lineto
0.03745 0.56185 lineto
0.03869 0.56185 lineto
0.04117 0.56185 lineto
0.04241 0.56185 lineto
0.04365 0.56185 lineto
0.04613 0.56185 lineto
0.04861 0.56185 lineto
0.05109 0.56185 lineto
0.05357 0.56184 lineto
0.05605 0.56184 lineto
0.05853 0.56184 lineto
0.06101 0.56184 lineto
0.06349 0.56183 lineto
0.06845 0.56182 lineto
0.07341 0.56181 lineto
0.07837 0.56179 lineto
0.08333 0.56177 lineto
0.08829 0.56174 lineto
0.09325 0.56171 lineto
0.09821 0.56166 lineto
0.10317 0.56161 lineto
0.1131 0.56146 lineto
0.12302 0.56127 lineto
0.13294 0.561 lineto
0.14286 0.56066 lineto
0.15278 0.56022 lineto
0.1627 0.55968 lineto
0.18254 0.55822 lineto
0.20238 0.55617 lineto
0.22222 0.55341 lineto
0.24206 0.54982 lineto
0.2619 0.5453 lineto
0.30159 0.53307 lineto
0.34127 0.51609 lineto
0.38095 0.49398 lineto
0.42063 0.46663 lineto
0.46032 0.43424 lineto
0.5 0.39729 lineto
0.53968 0.35652 lineto
Mistroke
0.57937 0.31294 lineto
0.61905 0.26769 lineto
0.65873 0.22209 lineto
0.69841 0.17752 lineto
0.7381 0.13538 lineto
0.77778 0.09702 lineto
0.81746 0.06372 lineto
0.85714 0.03657 lineto
0.87698 0.02559 lineto
0.89683 0.01649 lineto
0.91667 0.00932 lineto
0.92659 0.00648 lineto
0.93651 0.00416 lineto
0.94643 0.00234 lineto
0.95139 0.00163 lineto
0.95635 0.00104 lineto
0.96131 0.00059 lineto
0.96379 0.00041 lineto
0.96627 0.00026 lineto
0.96875 0.00015 lineto
0.96999 0.0001 lineto
0.97123 7e-05 lineto
0.97247 4e-05 lineto
0.97371 2e-05 lineto
0.97495 0 lineto
0.97619 0 lineto
Mfstroke
grestore
grestore
gsave
0.5 setgray
gsave
0.004 setlinewidth
0.02381 0 moveto
0.02505 0 lineto
0.02629 2e-05 lineto
0.02753 4e-05 lineto
0.02877 7e-05 lineto
0.03001 0.0001 lineto
0.03125 0.00015 lineto
0.03373 0.00026 lineto
0.03621 0.00041 lineto
0.03869 0.00059 lineto
0.04365 0.00104 lineto
0.04861 0.00163 lineto
0.05357 0.00234 lineto
0.06349 0.00416 lineto
0.07341 0.00648 lineto
0.08333 0.00932 lineto
0.10317 0.01649 lineto
0.14286 0.03657 lineto
0.18254 0.06372 lineto
0.22222 0.09702 lineto
0.2619 0.13538 lineto
0.30159 0.17752 lineto
0.34127 0.22209 lineto
0.38095 0.26769 lineto
0.42063 0.31294 lineto
0.46032 0.35652 lineto
0.5 0.39729 lineto
0.53968 0.43424 lineto
0.57937 0.46663 lineto
0.61905 0.49398 lineto
0.65873 0.51609 lineto
0.69841 0.53307 lineto
0.71825 0.53974 lineto
0.7381 0.5453 lineto
0.75794 0.54982 lineto
0.77778 0.55341 lineto
0.79762 0.55617 lineto
0.81746 0.55822 lineto
0.82738 0.55902 lineto
0.8373 0.55968 lineto
0.84722 0.56022 lineto
0.85714 0.56066 lineto
0.86706 0.561 lineto
0.87698 0.56127 lineto
0.8869 0.56146 lineto
0.89187 0.56154 lineto
0.89683 0.56161 lineto
0.90675 0.56171 lineto
0.91171 0.56174 lineto
0.91667 0.56177 lineto
Mistroke
0.92163 0.56179 lineto
0.92659 0.56181 lineto
0.93155 0.56182 lineto
0.93651 0.56183 lineto
0.93899 0.56184 lineto
0.94147 0.56184 lineto
0.94395 0.56184 lineto
0.94643 0.56184 lineto
0.94891 0.56185 lineto
0.95139 0.56185 lineto
0.95387 0.56185 lineto
0.95511 0.56185 lineto
0.95635 0.56185 lineto
0.95883 0.56185 lineto
0.96007 0.56185 lineto
0.96131 0.56185 lineto
0.96255 0.56185 lineto
0.96379 0.56185 lineto
0.96503 0.56185 lineto
0.96627 0.56185 lineto
0.96751 0.56185 lineto
0.96875 0.56185 lineto
0.96999 0.56185 lineto
0.97123 0.56185 lineto
0.97247 0.56185 lineto
0.97371 0.56185 lineto
0.97495 0.56185 lineto
0.97619 0.56185 lineto
Mfstroke
grestore
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; endGroup; ]
The Unformatted text for this cell was not generated.
Use options in the Actions Settings dialog box to control
when Unformatted text is generated.
;[o]
-Graphics-
:[font = input; preserveAspect; startGroup; ]
PlotFilters[#]& /@ Range[4, 8, 2]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; startGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.02381 1.904762 1.946143e-17 0.561849 [
[(0)] 0.02381 0 0 2 Msboxa
[(0.1)] 0.21429 0 0 2 Msboxa
[(0.2)] 0.40476 0 0 2 Msboxa
[(0.3)] 0.59524 0 0 2 Msboxa
[(0.4)] 0.78571 0 0 2 Msboxa
[(0.5)] 0.97619 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' M0, M1: n = 4)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.01131 0.11237 1 0 Msboxa
[(0.4)] 0.01131 0.22474 1 0 Msboxa
[(0.6)] 0.01131 0.33711 1 0 Msboxa
[(0.8)] 0.01131 0.44948 1 0 Msboxa
[(1)] 0.01131 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.00625 lineto
stroke
grestore
[(0)] 0.02381 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.21429 0 moveto
0.21429 0.00625 lineto
stroke
grestore
[(0.1)] 0.21429 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.40476 0 moveto
0.40476 0.00625 lineto
stroke
grestore
[(0.2)] 0.40476 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.59524 0 moveto
0.59524 0.00625 lineto
stroke
grestore
[(0.3)] 0.59524 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.78571 0 moveto
0.78571 0.00625 lineto
stroke
grestore
[(0.4)] 0.78571 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.97619 0 moveto
0.97619 0.00625 lineto
stroke
grestore
[(0.5)] 0.97619 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.0619 0 moveto
0.0619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1 0 moveto
0.1 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1381 0 moveto
0.1381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.17619 0 moveto
0.17619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.25238 0 moveto
0.25238 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.29048 0 moveto
0.29048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.32857 0 moveto
0.32857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.36667 0 moveto
0.36667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.44286 0 moveto
0.44286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.48095 0 moveto
0.48095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.51905 0 moveto
0.51905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.55714 0 moveto
0.55714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.63333 0 moveto
0.63333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.67143 0 moveto
0.67143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.70952 0 moveto
0.70952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.74762 0 moveto
0.74762 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82381 0 moveto
0.82381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.8619 0 moveto
0.8619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.9 0 moveto
0.9 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.9381 0 moveto
0.9381 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' M0, M1: n = 4)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.02381 0.11237 moveto
0.03006 0.11237 lineto
stroke
grestore
[(0.2)] 0.01131 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.22474 moveto
0.03006 0.22474 lineto
stroke
grestore
[(0.4)] 0.01131 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.33711 moveto
0.03006 0.33711 lineto
stroke
grestore
[(0.6)] 0.01131 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.44948 moveto
0.03006 0.44948 lineto
stroke
grestore
[(0.8)] 0.01131 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.56185 moveto
0.03006 0.56185 lineto
stroke
grestore
[(1)] 0.01131 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.02381 0.02247 moveto
0.02756 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.04495 moveto
0.02756 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.06742 moveto
0.02756 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.0899 moveto
0.02756 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.13484 moveto
0.02756 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.15732 moveto
0.02756 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.17979 moveto
0.02756 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.20227 moveto
0.02756 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.24721 moveto
0.02756 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.26969 moveto
0.02756 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.29216 moveto
0.02756 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.31464 moveto
0.02756 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.35958 moveto
0.02756 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.38206 moveto
0.02756 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.40453 moveto
0.02756 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.42701 moveto
0.02756 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.47195 moveto
0.02756 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.49443 moveto
0.02756 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.5169 moveto
0.02756 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.53938 moveto
0.02756 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.58432 moveto
0.02756 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.6068 moveto
0.02756 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
gsave
0.004 setlinewidth
0.02381 0.56185 moveto
0.02505 0.56185 lineto
0.02629 0.56185 lineto
0.02753 0.56185 lineto
0.02877 0.56185 lineto
0.03001 0.56185 lineto
0.03125 0.56185 lineto
0.03249 0.56185 lineto
0.03373 0.56185 lineto
0.03497 0.56185 lineto
0.03621 0.56185 lineto
0.03745 0.56185 lineto
0.03869 0.56185 lineto
0.03993 0.56185 lineto
0.04117 0.56185 lineto
0.04241 0.56185 lineto
0.04365 0.56185 lineto
0.04489 0.56185 lineto
0.04613 0.56185 lineto
0.04737 0.56185 lineto
0.04861 0.56185 lineto
0.04985 0.56185 lineto
0.05109 0.56185 lineto
0.05233 0.56185 lineto
0.05357 0.56185 lineto
0.05481 0.56185 lineto
0.05605 0.56185 lineto
0.05729 0.56185 lineto
0.05853 0.56185 lineto
0.05977 0.56185 lineto
0.06101 0.56185 lineto
0.06225 0.56185 lineto
0.06349 0.56185 lineto
0.06597 0.56185 lineto
0.06721 0.56185 lineto
0.06845 0.56185 lineto
0.06969 0.56185 lineto
0.07093 0.56185 lineto
0.07341 0.56185 lineto
0.07589 0.56185 lineto
0.07837 0.56185 lineto
0.08085 0.56185 lineto
0.08333 0.56185 lineto
0.08581 0.56185 lineto
0.08829 0.56185 lineto
0.09077 0.56185 lineto
0.09325 0.56185 lineto
0.09573 0.56185 lineto
0.09821 0.56185 lineto
0.10069 0.56185 lineto
Mistroke
0.10317 0.56185 lineto
0.10813 0.56185 lineto
0.11062 0.56185 lineto
0.1131 0.56185 lineto
0.11558 0.56185 lineto
0.11806 0.56185 lineto
0.12302 0.56184 lineto
0.12798 0.56184 lineto
0.13294 0.56184 lineto
0.1379 0.56184 lineto
0.14286 0.56183 lineto
0.14782 0.56182 lineto
0.15278 0.56181 lineto
0.15774 0.5618 lineto
0.1627 0.56179 lineto
0.16766 0.56177 lineto
0.17262 0.56175 lineto
0.17758 0.56172 lineto
0.18254 0.56168 lineto
0.19246 0.56159 lineto
0.19742 0.56152 lineto
0.20238 0.56145 lineto
0.2123 0.56125 lineto
0.22222 0.56098 lineto
0.23214 0.56062 lineto
0.24206 0.56014 lineto
0.25198 0.55952 lineto
0.2619 0.55872 lineto
0.27183 0.55772 lineto
0.28175 0.55647 lineto
0.30159 0.5531 lineto
0.31151 0.55089 lineto
0.32143 0.54828 lineto
0.34127 0.54167 lineto
0.36111 0.53293 lineto
0.38095 0.52178 lineto
0.42063 0.49138 lineto
0.46032 0.4496 lineto
0.5 0.39729 lineto
0.53968 0.33694 lineto
0.57937 0.27244 lineto
0.61905 0.20837 lineto
0.65873 0.14924 lineto
0.69841 0.09875 lineto
0.7381 0.0592 lineto
0.75794 0.04378 lineto
0.77778 0.03119 lineto
0.79762 0.02126 lineto
0.81746 0.01374 lineto
0.82738 0.01078 lineto
Mistroke
0.8373 0.0083 lineto
0.84722 0.00625 lineto
0.85714 0.0046 lineto
0.86706 0.00328 lineto
0.87698 0.00227 lineto
0.8869 0.0015 lineto
0.89187 0.0012 lineto
0.89683 0.00095 lineto
0.90675 0.00056 lineto
0.91171 0.00042 lineto
0.91667 0.0003 lineto
0.92163 0.00021 lineto
0.92659 0.00015 lineto
0.93155 0.0001 lineto
0.93651 6e-05 lineto
0.93899 5e-05 lineto
0.94147 4e-05 lineto
0.94395 3e-05 lineto
0.94643 2e-05 lineto
0.94891 1e-05 lineto
0.95139 1e-05 lineto
0.95387 1e-05 lineto
0.95511 0 lineto
0.95635 0 lineto
0.95883 0 lineto
0.96007 0 lineto
0.96131 0 lineto
0.96255 0 lineto
0.96379 0 lineto
0.96503 0 lineto
0.96627 0 lineto
0.96751 0 lineto
0.96875 0 lineto
0.96999 0 lineto
0.97123 0 lineto
0.97247 0 lineto
0.97371 0 lineto
0.97495 0 lineto
0.97619 0 lineto
Mfstroke
grestore
grestore
gsave
0.5 setgray
gsave
0.004 setlinewidth
0.02381 0 moveto
0.02505 0 lineto
0.02629 0 lineto
0.02753 0 lineto
0.02877 0 lineto
0.03001 0 lineto
0.03125 0 lineto
0.03249 0 lineto
0.03373 0 lineto
0.03497 0 lineto
0.03621 0 lineto
0.03745 0 lineto
0.03869 0 lineto
0.04117 0 lineto
0.04241 0 lineto
0.04365 0 lineto
0.04613 1e-05 lineto
0.04861 1e-05 lineto
0.05109 1e-05 lineto
0.05357 2e-05 lineto
0.05605 3e-05 lineto
0.05853 4e-05 lineto
0.06101 5e-05 lineto
0.06349 6e-05 lineto
0.06845 0.0001 lineto
0.07341 0.00015 lineto
0.07837 0.00021 lineto
0.08333 0.0003 lineto
0.08829 0.00042 lineto
0.09325 0.00056 lineto
0.09821 0.00073 lineto
0.10317 0.00095 lineto
0.1131 0.0015 lineto
0.12302 0.00227 lineto
0.13294 0.00328 lineto
0.14286 0.0046 lineto
0.1627 0.0083 lineto
0.17262 0.01078 lineto
0.18254 0.01374 lineto
0.20238 0.02126 lineto
0.22222 0.03119 lineto
0.2619 0.0592 lineto
0.30159 0.09875 lineto
0.34127 0.14924 lineto
0.38095 0.20837 lineto
0.42063 0.27244 lineto
0.46032 0.33694 lineto
0.5 0.39729 lineto
0.53968 0.4496 lineto
0.57937 0.49138 lineto
Mistroke
0.59921 0.50798 lineto
0.61905 0.52178 lineto
0.63889 0.53293 lineto
0.65873 0.54167 lineto
0.67857 0.54828 lineto
0.69841 0.5531 lineto
0.70833 0.55495 lineto
0.71825 0.55647 lineto
0.72817 0.55772 lineto
0.7381 0.55872 lineto
0.74802 0.55952 lineto
0.75794 0.56014 lineto
0.76786 0.56062 lineto
0.77778 0.56098 lineto
0.7877 0.56125 lineto
0.79762 0.56145 lineto
0.80258 0.56152 lineto
0.80754 0.56159 lineto
0.81746 0.56168 lineto
0.82242 0.56172 lineto
0.82738 0.56175 lineto
0.83234 0.56177 lineto
0.8373 0.56179 lineto
0.84226 0.5618 lineto
0.84722 0.56181 lineto
0.85218 0.56182 lineto
0.85714 0.56183 lineto
0.8621 0.56184 lineto
0.86706 0.56184 lineto
0.87202 0.56184 lineto
0.87698 0.56184 lineto
0.87946 0.56185 lineto
0.88194 0.56185 lineto
0.88442 0.56185 lineto
0.8869 0.56185 lineto
0.89187 0.56185 lineto
0.89435 0.56185 lineto
0.89683 0.56185 lineto
0.89931 0.56185 lineto
0.90179 0.56185 lineto
0.90427 0.56185 lineto
0.90675 0.56185 lineto
0.90923 0.56185 lineto
0.91171 0.56185 lineto
0.91419 0.56185 lineto
0.91667 0.56185 lineto
0.91915 0.56185 lineto
0.92163 0.56185 lineto
0.92411 0.56185 lineto
0.92659 0.56185 lineto
Mistroke
0.92907 0.56185 lineto
0.93031 0.56185 lineto
0.93155 0.56185 lineto
0.93279 0.56185 lineto
0.93403 0.56185 lineto
0.93651 0.56185 lineto
0.93775 0.56185 lineto
0.93899 0.56185 lineto
0.94023 0.56185 lineto
0.94147 0.56185 lineto
0.94271 0.56185 lineto
0.94395 0.56185 lineto
0.94519 0.56185 lineto
0.94643 0.56185 lineto
0.94767 0.56185 lineto
0.94891 0.56185 lineto
0.95015 0.56185 lineto
0.95139 0.56185 lineto
0.95263 0.56185 lineto
0.95387 0.56185 lineto
0.95511 0.56185 lineto
0.95635 0.56185 lineto
0.95759 0.56185 lineto
0.95883 0.56185 lineto
0.96007 0.56185 lineto
0.96131 0.56185 lineto
0.96255 0.56185 lineto
0.96379 0.56185 lineto
0.96503 0.56185 lineto
0.96627 0.56185 lineto
0.96751 0.56185 lineto
0.96875 0.56185 lineto
0.96999 0.56185 lineto
0.97123 0.56185 lineto
0.97247 0.56185 lineto
0.97371 0.56185 lineto
0.97495 0.56185 lineto
0.97619 0.56185 lineto
Mfstroke
grestore
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.02381 1.904762 1.946143e-17 0.561849 [
[(0)] 0.02381 0 0 2 Msboxa
[(0.1)] 0.21429 0 0 2 Msboxa
[(0.2)] 0.40476 0 0 2 Msboxa
[(0.3)] 0.59524 0 0 2 Msboxa
[(0.4)] 0.78571 0 0 2 Msboxa
[(0.5)] 0.97619 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' M0, M1: n = 6)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.01131 0.11237 1 0 Msboxa
[(0.4)] 0.01131 0.22474 1 0 Msboxa
[(0.6)] 0.01131 0.33711 1 0 Msboxa
[(0.8)] 0.01131 0.44948 1 0 Msboxa
[(1)] 0.01131 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.00625 lineto
stroke
grestore
[(0)] 0.02381 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.21429 0 moveto
0.21429 0.00625 lineto
stroke
grestore
[(0.1)] 0.21429 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.40476 0 moveto
0.40476 0.00625 lineto
stroke
grestore
[(0.2)] 0.40476 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.59524 0 moveto
0.59524 0.00625 lineto
stroke
grestore
[(0.3)] 0.59524 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.78571 0 moveto
0.78571 0.00625 lineto
stroke
grestore
[(0.4)] 0.78571 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.97619 0 moveto
0.97619 0.00625 lineto
stroke
grestore
[(0.5)] 0.97619 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.0619 0 moveto
0.0619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1 0 moveto
0.1 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1381 0 moveto
0.1381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.17619 0 moveto
0.17619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.25238 0 moveto
0.25238 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.29048 0 moveto
0.29048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.32857 0 moveto
0.32857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.36667 0 moveto
0.36667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.44286 0 moveto
0.44286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.48095 0 moveto
0.48095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.51905 0 moveto
0.51905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.55714 0 moveto
0.55714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.63333 0 moveto
0.63333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.67143 0 moveto
0.67143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.70952 0 moveto
0.70952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.74762 0 moveto
0.74762 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82381 0 moveto
0.82381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.8619 0 moveto
0.8619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.9 0 moveto
0.9 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.9381 0 moveto
0.9381 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' M0, M1: n = 6)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.02381 0.11237 moveto
0.03006 0.11237 lineto
stroke
grestore
[(0.2)] 0.01131 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.22474 moveto
0.03006 0.22474 lineto
stroke
grestore
[(0.4)] 0.01131 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.33711 moveto
0.03006 0.33711 lineto
stroke
grestore
[(0.6)] 0.01131 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.44948 moveto
0.03006 0.44948 lineto
stroke
grestore
[(0.8)] 0.01131 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.56185 moveto
0.03006 0.56185 lineto
stroke
grestore
[(1)] 0.01131 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.02381 0.02247 moveto
0.02756 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.04495 moveto
0.02756 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.06742 moveto
0.02756 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.0899 moveto
0.02756 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.13484 moveto
0.02756 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.15732 moveto
0.02756 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.17979 moveto
0.02756 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.20227 moveto
0.02756 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.24721 moveto
0.02756 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.26969 moveto
0.02756 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.29216 moveto
0.02756 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.31464 moveto
0.02756 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.35958 moveto
0.02756 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.38206 moveto
0.02756 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.40453 moveto
0.02756 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.42701 moveto
0.02756 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.47195 moveto
0.02756 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.49443 moveto
0.02756 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.5169 moveto
0.02756 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.53938 moveto
0.02756 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.58432 moveto
0.02756 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.6068 moveto
0.02756 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
gsave
0.004 setlinewidth
0.02381 0.56185 moveto
0.02877 0.56185 lineto
0.03001 0.56185 lineto
0.03125 0.56185 lineto
0.03249 0.56185 lineto
0.03373 0.56185 lineto
0.03497 0.56185 lineto
0.03621 0.56185 lineto
0.03745 0.56185 lineto
0.03869 0.56185 lineto
0.03993 0.56185 lineto
0.04117 0.56185 lineto
0.04241 0.56185 lineto
0.04365 0.56185 lineto
0.04489 0.56185 lineto
0.04613 0.56185 lineto
0.04737 0.56185 lineto
0.04861 0.56185 lineto
0.04985 0.56185 lineto
0.05109 0.56185 lineto
0.05233 0.56185 lineto
0.05357 0.56185 lineto
0.05481 0.56185 lineto
0.05605 0.56185 lineto
0.05729 0.56185 lineto
0.05853 0.56185 lineto
0.05977 0.56185 lineto
0.06101 0.56185 lineto
0.06225 0.56185 lineto
0.06349 0.56185 lineto
0.06473 0.56185 lineto
0.06597 0.56185 lineto
0.06721 0.56185 lineto
0.06845 0.56185 lineto
0.06969 0.56185 lineto
0.07093 0.56185 lineto
0.07217 0.56185 lineto
0.07341 0.56185 lineto
0.07465 0.56185 lineto
0.07589 0.56185 lineto
0.07713 0.56185 lineto
0.07837 0.56185 lineto
0.08085 0.56185 lineto
0.08209 0.56185 lineto
0.08333 0.56185 lineto
0.08581 0.56185 lineto
0.08705 0.56185 lineto
0.08829 0.56185 lineto
0.08953 0.56185 lineto
0.09077 0.56185 lineto
Mistroke
0.09325 0.56185 lineto
0.09449 0.56185 lineto
0.09573 0.56185 lineto
0.09697 0.56185 lineto
0.09821 0.56185 lineto
0.10069 0.56185 lineto
0.10317 0.56185 lineto
0.10565 0.56185 lineto
0.10813 0.56185 lineto
0.11062 0.56185 lineto
0.1131 0.56185 lineto
0.11558 0.56185 lineto
0.11806 0.56185 lineto
0.12054 0.56185 lineto
0.12302 0.56185 lineto
0.1255 0.56185 lineto
0.12798 0.56185 lineto
0.13046 0.56185 lineto
0.13294 0.56185 lineto
0.13542 0.56185 lineto
0.1379 0.56185 lineto
0.14038 0.56185 lineto
0.14286 0.56185 lineto
0.14782 0.56185 lineto
0.1503 0.56185 lineto
0.15278 0.56185 lineto
0.15526 0.56185 lineto
0.15774 0.56185 lineto
0.1627 0.56185 lineto
0.16518 0.56185 lineto
0.16766 0.56185 lineto
0.17262 0.56184 lineto
0.17758 0.56184 lineto
0.18254 0.56184 lineto
0.1875 0.56184 lineto
0.19246 0.56183 lineto
0.19742 0.56183 lineto
0.20238 0.56182 lineto
0.20734 0.56181 lineto
0.2123 0.56179 lineto
0.21726 0.56177 lineto
0.22222 0.56175 lineto
0.22718 0.56172 lineto
0.23214 0.56168 lineto
0.2371 0.56164 lineto
0.24206 0.56158 lineto
0.25198 0.56142 lineto
0.25694 0.56132 lineto
0.2619 0.56119 lineto
0.27183 0.56086 lineto
Mistroke
0.28175 0.5604 lineto
0.29167 0.55976 lineto
0.30159 0.55891 lineto
0.31151 0.55778 lineto
0.32143 0.55632 lineto
0.33135 0.55446 lineto
0.34127 0.55212 lineto
0.36111 0.5457 lineto
0.37103 0.54146 lineto
0.38095 0.53643 lineto
0.40079 0.52369 lineto
0.42063 0.50697 lineto
0.46032 0.46049 lineto
0.5 0.39729 lineto
0.53968 0.3219 lineto
0.57937 0.24218 lineto
0.61905 0.16708 lineto
0.65873 0.1041 lineto
0.69841 0.05739 lineto
0.71825 0.04035 lineto
0.7381 0.02718 lineto
0.75794 0.01744 lineto
0.76786 0.01369 lineto
0.77778 0.01058 lineto
0.7877 0.00804 lineto
0.79762 0.00599 lineto
0.80754 0.00438 lineto
0.81746 0.00313 lineto
0.82738 0.00218 lineto
0.8373 0.00148 lineto
0.84722 0.00097 lineto
0.85218 0.00077 lineto
0.85714 0.00061 lineto
0.8621 0.00048 lineto
0.86706 0.00037 lineto
0.87202 0.00028 lineto
0.87698 0.00021 lineto
0.88194 0.00016 lineto
0.8869 0.00012 lineto
0.89187 8e-05 lineto
0.89683 6e-05 lineto
0.90179 4e-05 lineto
0.90675 3e-05 lineto
0.90923 2e-05 lineto
0.91171 2e-05 lineto
0.91419 1e-05 lineto
0.91667 1e-05 lineto
0.92163 1e-05 lineto
0.92411 0 lineto
0.92659 0 lineto
Mistroke
0.92907 0 lineto
0.93155 0 lineto
0.93403 0 lineto
0.93651 0 lineto
0.93899 0 lineto
0.94023 0 lineto
0.94147 0 lineto
0.94395 0 lineto
0.94519 0 lineto
0.94643 0 lineto
0.94767 0 lineto
0.94891 0 lineto
0.95015 0 lineto
0.95139 0 lineto
0.95263 0 lineto
0.95387 0 lineto
0.95511 0 lineto
0.95635 0 lineto
0.95759 0 lineto
0.95883 0 lineto
0.96007 0 lineto
0.96131 0 lineto
0.96255 0 lineto
0.96379 0 lineto
0.96503 0 lineto
0.96627 0 lineto
0.96751 0 lineto
0.96875 0 lineto
0.96999 0 lineto
0.97123 0 lineto
0.97247 0 lineto
0.97371 0 lineto
0.97495 0 lineto
0.97619 0 lineto
Mfstroke
grestore
grestore
gsave
0.5 setgray
gsave
0.004 setlinewidth
0.02381 0 moveto
0.02505 0 lineto
0.02629 0 lineto
0.02753 0 lineto
0.02877 0 lineto
0.03001 0 lineto
0.03125 0 lineto
0.03249 0 lineto
0.03373 0 lineto
0.03497 0 lineto
0.03621 0 lineto
0.03745 0 lineto
0.03869 0 lineto
0.03993 0 lineto
0.04117 0 lineto
0.04241 0 lineto
0.04365 0 lineto
0.04489 0 lineto
0.04613 0 lineto
0.04737 0 lineto
0.04861 0 lineto
0.04985 0 lineto
0.05109 0 lineto
0.05233 0 lineto
0.05357 0 lineto
0.05481 0 lineto
0.05605 0 lineto
0.05853 0 lineto
0.05977 0 lineto
0.06101 0 lineto
0.06349 0 lineto
0.06597 0 lineto
0.06845 0 lineto
0.07093 0 lineto
0.07341 0 lineto
0.07589 0 lineto
0.07837 1e-05 lineto
0.08085 1e-05 lineto
0.08333 1e-05 lineto
0.08581 1e-05 lineto
0.08829 2e-05 lineto
0.09325 3e-05 lineto
0.09821 4e-05 lineto
0.10317 6e-05 lineto
0.10813 8e-05 lineto
0.1131 0.00012 lineto
0.11806 0.00016 lineto
0.12302 0.00021 lineto
0.12798 0.00028 lineto
0.13294 0.00037 lineto
Mistroke
0.1379 0.00048 lineto
0.14286 0.00061 lineto
0.14782 0.00077 lineto
0.15278 0.00097 lineto
0.1627 0.00148 lineto
0.17262 0.00218 lineto
0.18254 0.00313 lineto
0.19246 0.00438 lineto
0.20238 0.00599 lineto
0.22222 0.01058 lineto
0.23214 0.01369 lineto
0.24206 0.01744 lineto
0.2619 0.02718 lineto
0.28175 0.04035 lineto
0.30159 0.05739 lineto
0.34127 0.1041 lineto
0.38095 0.16708 lineto
0.42063 0.24218 lineto
0.46032 0.3219 lineto
0.5 0.39729 lineto
0.53968 0.46049 lineto
0.57937 0.50697 lineto
0.59921 0.52369 lineto
0.61905 0.53643 lineto
0.63889 0.5457 lineto
0.64881 0.54923 lineto
0.65873 0.55212 lineto
0.66865 0.55446 lineto
0.67857 0.55632 lineto
0.68849 0.55778 lineto
0.69841 0.55891 lineto
0.70833 0.55976 lineto
0.71825 0.5604 lineto
0.72817 0.56086 lineto
0.73313 0.56104 lineto
0.7381 0.56119 lineto
0.74306 0.56132 lineto
0.74802 0.56142 lineto
0.75794 0.56158 lineto
0.7629 0.56164 lineto
0.76786 0.56168 lineto
0.77282 0.56172 lineto
0.77778 0.56175 lineto
0.78274 0.56177 lineto
0.7877 0.56179 lineto
0.79266 0.56181 lineto
0.79762 0.56182 lineto
0.80258 0.56183 lineto
0.80754 0.56183 lineto
0.8125 0.56184 lineto
Mistroke
0.81746 0.56184 lineto
0.82242 0.56184 lineto
0.82738 0.56184 lineto
0.83234 0.56185 lineto
0.83482 0.56185 lineto
0.8373 0.56185 lineto
0.83978 0.56185 lineto
0.84226 0.56185 lineto
0.84722 0.56185 lineto
0.8497 0.56185 lineto
0.85218 0.56185 lineto
0.85466 0.56185 lineto
0.85714 0.56185 lineto
0.8621 0.56185 lineto
0.86458 0.56185 lineto
0.86706 0.56185 lineto
0.86954 0.56185 lineto
0.87202 0.56185 lineto
0.8745 0.56185 lineto
0.87698 0.56185 lineto
0.87946 0.56185 lineto
0.88194 0.56185 lineto
0.88442 0.56185 lineto
0.8869 0.56185 lineto
0.88938 0.56185 lineto
0.89187 0.56185 lineto
0.89435 0.56185 lineto
0.89683 0.56185 lineto
0.89931 0.56185 lineto
0.90055 0.56185 lineto
0.90179 0.56185 lineto
0.90303 0.56185 lineto
0.90427 0.56185 lineto
0.90675 0.56185 lineto
0.90799 0.56185 lineto
0.90923 0.56185 lineto
0.91047 0.56185 lineto
0.91171 0.56185 lineto
0.91419 0.56185 lineto
0.91543 0.56185 lineto
0.91667 0.56185 lineto
0.91791 0.56185 lineto
0.91915 0.56185 lineto
0.92039 0.56185 lineto
0.92163 0.56185 lineto
0.92287 0.56185 lineto
0.92411 0.56185 lineto
0.92535 0.56185 lineto
0.92659 0.56185 lineto
0.92783 0.56185 lineto
Mistroke
0.92907 0.56185 lineto
0.93031 0.56185 lineto
0.93155 0.56185 lineto
0.93279 0.56185 lineto
0.93403 0.56185 lineto
0.93527 0.56185 lineto
0.93651 0.56185 lineto
0.93775 0.56185 lineto
0.93899 0.56185 lineto
0.94023 0.56185 lineto
0.94147 0.56185 lineto
0.94271 0.56185 lineto
0.94395 0.56185 lineto
0.94519 0.56185 lineto
0.94643 0.56185 lineto
0.94767 0.56185 lineto
0.94891 0.56185 lineto
0.95015 0.56185 lineto
0.95139 0.56185 lineto
0.95263 0.56185 lineto
0.95387 0.56185 lineto
0.95511 0.56185 lineto
0.95635 0.56185 lineto
0.95759 0.56185 lineto
0.95883 0.56185 lineto
0.96007 0.56185 lineto
0.96131 0.56185 lineto
0.96255 0.56185 lineto
0.96379 0.56185 lineto
0.96503 0.56185 lineto
0.96627 0.56185 lineto
0.96751 0.56185 lineto
0.96875 0.56185 lineto
0.96999 0.56185 lineto
0.97123 0.56185 lineto
0.97247 0.56185 lineto
0.97371 0.56185 lineto
0.97495 0.56185 lineto
0.97619 0.56185 lineto
Mfstroke
grestore
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; endGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.02381 1.904762 1.946143e-17 0.561849 [
[(0)] 0.02381 0 0 2 Msboxa
[(0.1)] 0.21429 0 0 2 Msboxa
[(0.2)] 0.40476 0 0 2 Msboxa
[(0.3)] 0.59524 0 0 2 Msboxa
[(0.4)] 0.78571 0 0 2 Msboxa
[(0.5)] 0.97619 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' M0, M1: n = 8)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.01131 0.11237 1 0 Msboxa
[(0.4)] 0.01131 0.22474 1 0 Msboxa
[(0.6)] 0.01131 0.33711 1 0 Msboxa
[(0.8)] 0.01131 0.44948 1 0 Msboxa
[(1)] 0.01131 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.00625 lineto
stroke
grestore
[(0)] 0.02381 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.21429 0 moveto
0.21429 0.00625 lineto
stroke
grestore
[(0.1)] 0.21429 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.40476 0 moveto
0.40476 0.00625 lineto
stroke
grestore
[(0.2)] 0.40476 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.59524 0 moveto
0.59524 0.00625 lineto
stroke
grestore
[(0.3)] 0.59524 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.78571 0 moveto
0.78571 0.00625 lineto
stroke
grestore
[(0.4)] 0.78571 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.97619 0 moveto
0.97619 0.00625 lineto
stroke
grestore
[(0.5)] 0.97619 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.0619 0 moveto
0.0619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1 0 moveto
0.1 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1381 0 moveto
0.1381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.17619 0 moveto
0.17619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.25238 0 moveto
0.25238 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.29048 0 moveto
0.29048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.32857 0 moveto
0.32857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.36667 0 moveto
0.36667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.44286 0 moveto
0.44286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.48095 0 moveto
0.48095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.51905 0 moveto
0.51905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.55714 0 moveto
0.55714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.63333 0 moveto
0.63333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.67143 0 moveto
0.67143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.70952 0 moveto
0.70952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.74762 0 moveto
0.74762 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82381 0 moveto
0.82381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.8619 0 moveto
0.8619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.9 0 moveto
0.9 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.9381 0 moveto
0.9381 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' M0, M1: n = 8)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.02381 0.11237 moveto
0.03006 0.11237 lineto
stroke
grestore
[(0.2)] 0.01131 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.22474 moveto
0.03006 0.22474 lineto
stroke
grestore
[(0.4)] 0.01131 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.33711 moveto
0.03006 0.33711 lineto
stroke
grestore
[(0.6)] 0.01131 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.44948 moveto
0.03006 0.44948 lineto
stroke
grestore
[(0.8)] 0.01131 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.56185 moveto
0.03006 0.56185 lineto
stroke
grestore
[(1)] 0.01131 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.02381 0.02247 moveto
0.02756 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.04495 moveto
0.02756 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.06742 moveto
0.02756 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.0899 moveto
0.02756 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.13484 moveto
0.02756 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.15732 moveto
0.02756 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.17979 moveto
0.02756 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.20227 moveto
0.02756 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.24721 moveto
0.02756 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.26969 moveto
0.02756 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.29216 moveto
0.02756 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.31464 moveto
0.02756 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.35958 moveto
0.02756 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.38206 moveto
0.02756 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.40453 moveto
0.02756 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.42701 moveto
0.02756 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.47195 moveto
0.02756 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.49443 moveto
0.02756 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.5169 moveto
0.02756 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.53938 moveto
0.02756 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.58432 moveto
0.02756 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.6068 moveto
0.02756 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
gsave
0.004 setlinewidth
0.02381 0.56185 moveto
0.02505 0.56185 lineto
0.02629 0.56185 lineto
0.02877 0.56185 lineto
0.03001 0.56185 lineto
0.03125 0.56185 lineto
0.03373 0.56185 lineto
0.03497 0.56185 lineto
0.03621 0.56185 lineto
0.03745 0.56185 lineto
0.03869 0.56185 lineto
0.03993 0.56185 lineto
0.04117 0.56185 lineto
0.04241 0.56185 lineto
0.04365 0.56185 lineto
0.04861 0.56185 lineto
0.04985 0.56185 lineto
0.05109 0.56185 lineto
0.05233 0.56185 lineto
0.05357 0.56185 lineto
0.05481 0.56185 lineto
0.05605 0.56185 lineto
0.05853 0.56185 lineto
0.06101 0.56185 lineto
0.06225 0.56185 lineto
0.06349 0.56185 lineto
0.06473 0.56185 lineto
0.06597 0.56185 lineto
0.06721 0.56185 lineto
0.06845 0.56185 lineto
0.06969 0.56185 lineto
0.07093 0.56185 lineto
0.07217 0.56185 lineto
0.07341 0.56185 lineto
0.07465 0.56185 lineto
0.07589 0.56185 lineto
0.07713 0.56185 lineto
0.07837 0.56185 lineto
0.07961 0.56185 lineto
0.08085 0.56185 lineto
0.08209 0.56185 lineto
0.08333 0.56185 lineto
0.08457 0.56185 lineto
0.08581 0.56185 lineto
0.08705 0.56185 lineto
0.08829 0.56185 lineto
0.08953 0.56185 lineto
0.09077 0.56185 lineto
0.09201 0.56185 lineto
0.09325 0.56185 lineto
Mistroke
0.09449 0.56185 lineto
0.09573 0.56185 lineto
0.09697 0.56185 lineto
0.09821 0.56185 lineto
0.10069 0.56185 lineto
0.10193 0.56185 lineto
0.10317 0.56185 lineto
0.10441 0.56185 lineto
0.10565 0.56185 lineto
0.10813 0.56185 lineto
0.10938 0.56185 lineto
0.11062 0.56185 lineto
0.11186 0.56185 lineto
0.1131 0.56185 lineto
0.11558 0.56185 lineto
0.11682 0.56185 lineto
0.11806 0.56185 lineto
0.1193 0.56185 lineto
0.12054 0.56185 lineto
0.12302 0.56185 lineto
0.12426 0.56185 lineto
0.1255 0.56185 lineto
0.12798 0.56185 lineto
0.13046 0.56185 lineto
0.13294 0.56185 lineto
0.13542 0.56185 lineto
0.1379 0.56185 lineto
0.14038 0.56185 lineto
0.14286 0.56185 lineto
0.14534 0.56185 lineto
0.14782 0.56185 lineto
0.1503 0.56185 lineto
0.15278 0.56185 lineto
0.15526 0.56185 lineto
0.15774 0.56185 lineto
0.16022 0.56185 lineto
0.1627 0.56185 lineto
0.16518 0.56185 lineto
0.16766 0.56185 lineto
0.17014 0.56185 lineto
0.17262 0.56185 lineto
0.17758 0.56185 lineto
0.18006 0.56185 lineto
0.18254 0.56185 lineto
0.18502 0.56185 lineto
0.1875 0.56185 lineto
0.19246 0.56185 lineto
0.19494 0.56185 lineto
0.19742 0.56185 lineto
0.1999 0.56185 lineto
Mistroke
0.20238 0.56185 lineto
0.20734 0.56185 lineto
0.20982 0.56184 lineto
0.2123 0.56184 lineto
0.21726 0.56184 lineto
0.22222 0.56184 lineto
0.22718 0.56183 lineto
0.23214 0.56183 lineto
0.2371 0.56182 lineto
0.24206 0.5618 lineto
0.24702 0.56179 lineto
0.25198 0.56177 lineto
0.25694 0.56174 lineto
0.2619 0.5617 lineto
0.26687 0.56166 lineto
0.27183 0.5616 lineto
0.27679 0.56153 lineto
0.28175 0.56144 lineto
0.28671 0.56133 lineto
0.29167 0.56119 lineto
0.30159 0.56082 lineto
0.30655 0.56057 lineto
0.31151 0.56027 lineto
0.32143 0.5595 lineto
0.33135 0.55843 lineto
0.34127 0.55697 lineto
0.35119 0.55502 lineto
0.36111 0.55249 lineto
0.37103 0.54924 lineto
0.38095 0.54516 lineto
0.39087 0.54012 lineto
0.40079 0.534 lineto
0.42063 0.51804 lineto
0.44048 0.49655 lineto
0.46032 0.46912 lineto
0.5 0.39729 lineto
0.53968 0.30919 lineto
0.57937 0.2175 lineto
0.61905 0.13591 lineto
0.63889 0.10213 lineto
0.65873 0.0739 lineto
0.67857 0.05131 lineto
0.69841 0.03403 lineto
0.70833 0.0272 lineto
0.71825 0.02145 lineto
0.72817 0.01667 lineto
0.7381 0.01276 lineto
0.74802 0.00961 lineto
0.75794 0.00711 lineto
0.76786 0.00516 lineto
Mistroke
0.77778 0.00367 lineto
0.7877 0.00255 lineto
0.79762 0.00173 lineto
0.80258 0.00141 lineto
0.80754 0.00114 lineto
0.81746 0.00073 lineto
0.82242 0.00058 lineto
0.82738 0.00045 lineto
0.83234 0.00035 lineto
0.8373 0.00027 lineto
0.84226 0.00021 lineto
0.84722 0.00015 lineto
0.85218 0.00011 lineto
0.85714 8e-05 lineto
0.8621 6e-05 lineto
0.86706 4e-05 lineto
0.87202 3e-05 lineto
0.87698 2e-05 lineto
0.87946 2e-05 lineto
0.88194 1e-05 lineto
0.88442 1e-05 lineto
0.8869 1e-05 lineto
0.89187 1e-05 lineto
0.89435 0 lineto
0.89683 0 lineto
0.89931 0 lineto
0.90179 0 lineto
0.90427 0 lineto
0.90675 0 lineto
0.90923 0 lineto
0.91171 0 lineto
0.91419 0 lineto
0.91667 0 lineto
0.91915 0 lineto
0.92163 0 lineto
0.92411 0 lineto
0.92659 0 lineto
0.92907 0 lineto
0.93031 0 lineto
0.93155 0 lineto
0.93279 0 lineto
0.93403 0 lineto
0.93651 0 lineto
0.93775 0 lineto
0.93899 0 lineto
0.94023 0 lineto
0.94147 0 lineto
0.94271 0 lineto
0.94395 0 lineto
0.94519 0 lineto
Mistroke
0.94643 0 lineto
0.94767 0 lineto
0.94891 0 lineto
0.95015 0 lineto
0.95139 0 lineto
0.95263 0 lineto
0.95387 0 lineto
0.95511 0 lineto
0.95635 0 lineto
0.95759 0 lineto
0.95883 0 lineto
0.96007 0 lineto
0.96131 0 lineto
0.96255 0 lineto
0.96379 0 lineto
0.96503 0 lineto
0.96627 0 lineto
0.96751 0 lineto
0.96875 0 lineto
0.96999 0 lineto
0.97123 0 lineto
0.97247 0 lineto
0.97371 0 lineto
0.97495 0 lineto
0.97619 0 lineto
Mfstroke
grestore
grestore
gsave
0.5 setgray
gsave
0.004 setlinewidth
0.02381 0 moveto
0.02505 0 lineto
0.02629 0 lineto
0.02753 0 lineto
0.02877 0 lineto
0.03001 0 lineto
0.03125 0 lineto
0.03249 0 lineto
0.03373 0 lineto
0.03497 0 lineto
0.03621 0 lineto
0.03745 0 lineto
0.03869 0 lineto
0.03993 0 lineto
0.04117 0 lineto
0.04241 0 lineto
0.04365 0 lineto
0.04489 0 lineto
0.04613 0 lineto
0.04737 0 lineto
0.04861 0 lineto
0.04985 0 lineto
0.05109 0 lineto
0.05233 0 lineto
0.05357 0 lineto
0.05481 0 lineto
0.05605 0 lineto
0.05729 0 lineto
0.05853 0 lineto
0.05977 0 lineto
0.06101 0 lineto
0.06225 0 lineto
0.06349 0 lineto
0.06597 0 lineto
0.06721 0 lineto
0.06845 0 lineto
0.06969 0 lineto
0.07093 0 lineto
0.07341 0 lineto
0.07589 0 lineto
0.07837 0 lineto
0.08085 0 lineto
0.08333 0 lineto
0.08581 0 lineto
0.08829 0 lineto
0.09077 0 lineto
0.09325 0 lineto
0.09573 0 lineto
0.09821 0 lineto
0.10069 0 lineto
Mistroke
0.10317 0 lineto
0.10813 1e-05 lineto
0.11062 1e-05 lineto
0.1131 1e-05 lineto
0.11558 1e-05 lineto
0.11806 1e-05 lineto
0.12302 2e-05 lineto
0.12798 3e-05 lineto
0.13294 4e-05 lineto
0.1379 6e-05 lineto
0.14286 8e-05 lineto
0.14782 0.00011 lineto
0.15278 0.00015 lineto
0.15774 0.00021 lineto
0.1627 0.00027 lineto
0.16766 0.00035 lineto
0.17262 0.00045 lineto
0.17758 0.00058 lineto
0.18254 0.00073 lineto
0.19246 0.00114 lineto
0.19742 0.00141 lineto
0.20238 0.00173 lineto
0.2123 0.00255 lineto
0.22222 0.00367 lineto
0.23214 0.00516 lineto
0.24206 0.00711 lineto
0.25198 0.00961 lineto
0.2619 0.01276 lineto
0.27183 0.01667 lineto
0.28175 0.02145 lineto
0.30159 0.03403 lineto
0.32143 0.05131 lineto
0.34127 0.0739 lineto
0.38095 0.13591 lineto
0.42063 0.2175 lineto
0.46032 0.30919 lineto
0.5 0.39729 lineto
0.51984 0.43583 lineto
0.53968 0.46912 lineto
0.55952 0.49655 lineto
0.57937 0.51804 lineto
0.58929 0.52667 lineto
0.59921 0.534 lineto
0.60913 0.54012 lineto
0.61905 0.54516 lineto
0.62897 0.54924 lineto
0.63889 0.55249 lineto
0.64881 0.55502 lineto
0.65873 0.55697 lineto
0.66865 0.55843 lineto
Mistroke
0.67857 0.5595 lineto
0.68353 0.55992 lineto
0.68849 0.56027 lineto
0.69841 0.56082 lineto
0.70337 0.56102 lineto
0.70833 0.56119 lineto
0.71329 0.56133 lineto
0.71825 0.56144 lineto
0.72817 0.5616 lineto
0.73313 0.56166 lineto
0.7381 0.5617 lineto
0.74306 0.56174 lineto
0.74802 0.56177 lineto
0.75298 0.56179 lineto
0.75794 0.5618 lineto
0.7629 0.56182 lineto
0.76786 0.56183 lineto
0.77282 0.56183 lineto
0.77778 0.56184 lineto
0.78274 0.56184 lineto
0.7877 0.56184 lineto
0.79018 0.56184 lineto
0.79266 0.56185 lineto
0.79514 0.56185 lineto
0.79762 0.56185 lineto
0.80258 0.56185 lineto
0.80506 0.56185 lineto
0.80754 0.56185 lineto
0.81002 0.56185 lineto
0.8125 0.56185 lineto
0.81746 0.56185 lineto
0.81994 0.56185 lineto
0.82242 0.56185 lineto
0.8249 0.56185 lineto
0.82738 0.56185 lineto
0.82986 0.56185 lineto
0.83234 0.56185 lineto
0.83482 0.56185 lineto
0.8373 0.56185 lineto
0.83978 0.56185 lineto
0.84226 0.56185 lineto
0.84474 0.56185 lineto
0.84722 0.56185 lineto
0.8497 0.56185 lineto
0.85218 0.56185 lineto
0.85466 0.56185 lineto
0.85714 0.56185 lineto
0.85962 0.56185 lineto
0.8621 0.56185 lineto
0.86458 0.56185 lineto
Mistroke
0.86706 0.56185 lineto
0.86954 0.56185 lineto
0.87202 0.56185 lineto
0.87326 0.56185 lineto
0.8745 0.56185 lineto
0.87698 0.56185 lineto
0.87822 0.56185 lineto
0.87946 0.56185 lineto
0.8807 0.56185 lineto
0.88194 0.56185 lineto
0.88442 0.56185 lineto
0.88566 0.56185 lineto
0.8869 0.56185 lineto
0.88814 0.56185 lineto
0.88938 0.56185 lineto
0.89187 0.56185 lineto
0.89311 0.56185 lineto
0.89435 0.56185 lineto
0.89559 0.56185 lineto
0.89683 0.56185 lineto
0.89807 0.56185 lineto
0.89931 0.56185 lineto
0.90055 0.56185 lineto
0.90179 0.56185 lineto
0.90303 0.56185 lineto
0.90427 0.56185 lineto
0.90551 0.56185 lineto
0.90675 0.56185 lineto
0.90799 0.56185 lineto
0.90923 0.56185 lineto
0.91047 0.56185 lineto
0.91171 0.56185 lineto
0.91295 0.56185 lineto
0.91419 0.56185 lineto
0.91543 0.56185 lineto
0.91667 0.56185 lineto
0.91791 0.56185 lineto
0.91915 0.56185 lineto
0.92039 0.56185 lineto
0.92163 0.56185 lineto
0.92287 0.56185 lineto
0.92411 0.56185 lineto
0.92535 0.56185 lineto
0.92659 0.56185 lineto
0.92783 0.56185 lineto
0.92907 0.56185 lineto
0.93031 0.56185 lineto
0.93155 0.56185 lineto
0.93279 0.56185 lineto
0.93403 0.56185 lineto
Mistroke
0.93527 0.56185 lineto
0.93651 0.56185 lineto
0.93775 0.56185 lineto
0.93899 0.56185 lineto
0.94023 0.56185 lineto
0.94147 0.56185 lineto
0.94271 0.56185 lineto
0.94395 0.56185 lineto
0.94519 0.56185 lineto
0.94643 0.56185 lineto
0.95635 0.56185 lineto
0.95759 0.56185 lineto
0.95883 0.56185 lineto
0.96007 0.56185 lineto
0.96131 0.56185 lineto
0.96627 0.56185 lineto
0.96751 0.56185 lineto
0.96875 0.56185 lineto
0.97123 0.56185 lineto
0.97619 0.56185 lineto
Mfstroke
grestore
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; endGroup; endGroup; endGroup; ]
{Graphics[{{GrayLevel[0], 
     {Line[{{0., 1.}, {0.0006510416666666666, 1.}, 
        {0.001302083333333333, 1.}, 
        {0.001953125, 1.}, 
        {0.002604166666666666, 1.}, 
        {0.003255208333333333, 0.999999999999998}, 
        {0.00390625, 0.999999999999991}, 
        {0.004557291666666666, 0.999999999999969}, 
        {0.005208333333333333, 0.99999999999991}, 
        {0.005859375, 0.99999999999977}, 
        {0.006510416666666666, 0.999999999999465}, 
        {0.007161458333333333, 0.999999999998853}, 
        {0.0078125, 0.999999999997701}, 
        {0.00846354166666667, 0.99999999999564}, 
        {0.00911458333333333, 0.999999999992115}, 
        {0.009765625, 0.999999999986313}, 
        {0.01041666666666666, 0.999999999977073}, 
        {0.01106770833333333, 0.999999999962783}, 
        {0.01171875, 0.999999999941239}, 
        {0.01236979166666666, 0.999999999909492}, 
        {0.01302083333333333, 0.999999999863656}, 
        {0.013671875, 0.999999999798688}, 
        {0.01432291666666666, 0.999999999708119}, 
        {0.01497395833333333, 0.999999999583762}, 
        {0.015625, 0.999999999415358}, 
        {0.01627604166666666, 0.999999999190181}, 
        {0.01692708333333333, 0.99999999889259}, 
        {0.017578125, 0.999999998503515}, 
        {0.01822916666666666, 0.999999997999892}, 
        {0.01888020833333333, 0.999999997354021}, 
        {0.01953125, 0.999999996532853}, 
        {0.02018229166666666, 0.999999995497208}, 
        {0.02083333333333333, 0.999999994200898}, 
        {0.02213541666666666, 0.999999990600675}, 
        {0.02278645833333333, 0.999999988160278}, 
        {0.0234375, 0.999999985183847}, 
        {0.02408854166666666, 0.99999998157388}, 
        {0.02473958333333333, 0.999999977218622}, 
        {0.02604166666666666, 0.999999965744318}, 
        {0.02734375, 0.99999994951828}, 
        {0.02864583333333333, 0.999999926954405}, 
        {0.02994791666666666, 0.999999896052578}, 
        {0.03125, 0.999999854318279}, 
        {0.03255208333333333, 0.999999798671649}, 
        {0.03385416666666666, 0.999999725345311}, 
        {0.03515625, 0.999999629770229}, 
        {0.03645833333333333, 0.999999506448947}, 
        {0.03776041666666666, 0.999999348815537}, 
        {0.0390625, 0.999999149081632}, 
        {0.04036458333333333, 0.999998898067944}, 
        {0.04166666666666666, 0.999998585020713}, 
        {0.04427083333333333, 0.999997720727294}, 
        {0.04557291666666666, 0.999997138228192}, 
        {0.046875, 0.999996430709485}, 
        {0.04817708333333333, 0.999995576230647}, 
        {0.04947916666666666, 0.999994549833293}, 
        {0.05208333333333333, 0.999991864538422}, 
        {0.0546875, 0.999988102932239}, 
        {0.05729166666666666, 0.999982923753036}, 
        {0.05989583333333333, 0.999975904213089}, 
        {0.0625, 0.999966526752648}, 
        {0.06510416666666666, 0.999954164757575}, 
        {0.06770833333333333, 0.999938067315485}, 
        {0.0703125, 0.999917343107556}, 
        {0.07291666666666666, 0.99989094355527}, 
        {0.07552083333333333, 0.999857645362852}, 
        {0.078125, 0.999816032616545}, 
        {0.0807291666666667, 0.99976447862087}, 
        {0.0833333333333333, 0.999701127669066}, 
        {0.0885416666666667, 0.999530358884427}, 
        {0.0911458333333333, 0.999417923918537}, 
        {0.09375, 0.999283624357537}, 
        {0.0989583333333333, 0.998936059993697}, 
        {0.1041666666666666, 0.998457578910973}, 
        {0.109375, 0.997812510701925}, 
        {0.1145833333333333, 0.996959368880301}, 
        {0.1197916666666666, 0.995850771069931}, 
        {0.125, 0.994433531177303}, 
        {0.1302083333333333, 0.992648936252602}, 
        {0.1354166666666666, 0.990433213405403}, 
        {0.1458333333333333, 0.984432098610689}, 
        {0.1510416666666666, 0.980500626061003}, 
        {0.15625, 0.975847990327945}, 
        {0.1666666666666666, 0.964076428181396}, 
        {0.1770833333333333, 0.948531238710286}, 
        {0.1875, 0.928688066882529}, 
        {0.2083333333333333, 0.874568667755471}, 
        {0.2291666666666666, 0.800222168589753}, 
        {0.25, 0.7071067811865471}, 
        {0.2708333333333333, 0.599703660900542}, 
        {0.2916666666666666, 0.4849016863039548}, 
        {0.3125, 0.3708617996369952}, 
        {0.3333333333333333, 0.2656249999999998}, 
        {0.3541666666666666, 0.1757653072279989}, 
        {0.375, 0.1053658012366376}, 
        {0.3854166666666666, 0.07792314676519976}, 
        {0.3958333333333333, 0.05551993439511149}, 
        {0.40625, 0.03784492159939999}, 
        {0.4166666666666666, 0.02444699035047588}, 
        {0.421875, 0.01918074354425293}, 
        {0.4270833333333333, 0.01476824282545714}, 
        {0.4322916666666666, 0.01112930965389732}, 
        {0.4375, 0.00818201529239342}, 
        {0.4427083333333333, 0.005843988563464641}, 
        {0.4479166666666666, 0.004033715033328806}, 
        {0.453125, 0.002671809927828795}, 
        {0.4557291666666666, 0.002135073819828016}, 
        {0.4583333333333333, 0.001682247476430983}, 
        {0.4635416666666666, 0.000993530000366182}, 
        {0.4661458333333333, 0.0007411540338081977}, 
        {0.46875, 0.0005397809010154531}, 
        {0.4713541666666666, 0.0003822187651999449}, 
        {0.4739583333333333, 0.0002617467536159123}, 
        {0.4765625, 0.0001721403633826939}, 
        {0.4791666666666666, 0.0001076949553554166}, 
        {0.48046875, 0.0000832724038524164}, 
        {0.4817708333333333, 
         0.00006324725669308838}, 
        {0.4830729166666666, 
         0.00004706188259624924}, 
        {0.484375, 0.00003419479951349737}, 
        {0.4856770833333333, 
         0.00002416116467590094}, 
        {0.4869791666666666, 
         0.00001651323002024865}, 
        {0.48828125, 0.00001084076260673277}, 
        {0.4889322916666666, 
         8.62748485493013*10^-6}, 
        {0.4895833333333333, 
         6.77142967834545*10^-6}, 
        {0.4908854166666666, 
         3.971148032579243*10^-6}, 
        {0.4915364583333333, 
         2.953037168837462*10^-6}, 
        {0.4921875, 2.144397414227648*10^-6}, 
        {0.4928385416666666, 
         1.514359667890006*10^-6}, 
        {0.4934895833333333, 
         1.034497662495158*10^-6}, 
        {0.494140625, 6.788346282107269*10^-7}, 
        {0.4947916666666666, 
         4.238493796475242*10^-7}, 
        {0.4954427083333333, 
         2.484818286102931*10^-7}, 
        {0.49609375, 1.341379187031954*10^-7}, 
        {0.4967447916666666, 
         6.469398198490424*10^-8}, 
        {0.4973958333333333, 
         2.650051736700973*10^-8}, 
        {0.498046875, 8.38538760577879*10^-9}, 
        {0.4986979166666666, 
         1.656437431131146*10^-9}, 
        {0.4993489583333333, 
         1.035296962503548*10^-10}, 
        {0.5, 7.850462293418875*10^-17}}]}}, 
    {GrayLevel[0.5], {Line[{{0., 
         7.850462293418875*10^-17}, 
        {0.0006510416666666666, 
         1.035296898967528*10^-10}, 
        {0.001302083333333333, 
         1.656437427546882*10^-9}, 
        {0.001953125, 8.38538766211628*10^-9}, 
        {0.002604166666666666, 
         2.650051739662033*10^-8}, 
        {0.003255208333333333, 
         6.469398204609144*10^-8}, 
        {0.00390625, 1.341379186812936*10^-7}, 
        {0.004557291666666666, 
         2.484818286557481*10^-7}, 
        {0.005208333333333333, 
         4.238493796412122*10^-7}, 
        {0.005859375, 6.788346281972423*10^-7}, 
        {0.006510416666666666, 
         1.034497662552569*10^-6}, 
        {0.007161458333333333, 
         1.514359667938942*10^-6}, 
        {0.0078125, 2.144397414238054*10^-6}, 
        {0.00911458333333333, 
         3.971148032631539*10^-6}, 
        {0.009765625, 5.232034705516817*10^-6}, 
        {0.01041666666666666, 
         6.771429678232811*10^-6}, 
        {0.01171875, 0.00001084076260670975}, 
        {0.01302083333333333, 0.0000165132300203276}, 
        {0.01432291666666666, 
         0.00002416116467600911}, 
        {0.015625, 0.00003419479951340869}, 
        {0.01692708333333333, 
         0.00004706188259628736}, 
        {0.01822916666666666, 
         0.00006324725669308331}, 
        {0.01953125, 0.000083272403852356}, 
        {0.02083333333333333, 0.0001076949553554787}, 
        {0.0234375, 0.0001721403633826456}, 
        {0.02604166666666666, 0.0002617467536160281}, 
        {0.02864583333333333, 0.0003822187652000197}, 
        {0.03125, 0.0005397809010154034}, 
        {0.03385416666666666, 0.0007411540338082822}, 
        {0.03645833333333333, 0.000993530000366154}, 
        {0.0390625, 0.001304544369580563}, 
        {0.04166666666666666, 0.001682247476430944}, 
        {0.046875, 0.002671809927828706}, 
        {0.05208333333333333, 0.004033715033328822}, 
        {0.05729166666666666, 0.005843988563464845}, 
        {0.0625, 0.00818201529239336}, 
        {0.07291666666666666, 0.01476824282545679}, 
        {0.078125, 0.01918074354425273}, 
        {0.0833333333333333, 0.02444699035047565}, 
        {0.09375, 0.03784492159939966}, 
        {0.1041666666666666, 0.05551993439511104}, 
        {0.125, 0.1053658012366372}, 
        {0.1458333333333333, 0.1757653072279979}, 
        {0.1666666666666666, 0.2656249999999995}, 
        {0.1875, 0.3708617996369953}, 
        {0.2083333333333333, 0.4849016863039541}, 
        {0.2291666666666666, 0.5997036609005413}, 
        {0.25, 0.7071067811865466}, 
        {0.2708333333333333, 0.800222168589752}, 
        {0.2916666666666666, 0.874568667755471}, 
        {0.3020833333333333, 0.904126738527082}, 
        {0.3125, 0.928688066882528}, 
        {0.3229166666666666, 0.948531238710286}, 
        {0.3333333333333333, 0.964076428181396}, 
        {0.34375, 0.975847990327945}, 
        {0.3541666666666666, 0.984432098610689}, 
        {0.359375, 0.987718184472171}, 
        {0.3645833333333333, 0.990433213405403}, 
        {0.3697916666666666, 0.992648936252602}, 
        {0.375, 0.994433531177304}, 
        {0.3802083333333333, 0.995850771069931}, 
        {0.3854166666666666, 0.996959368880301}, 
        {0.390625, 0.997812510701925}, 
        {0.3958333333333333, 0.998457578910973}, 
        {0.4010416666666666, 0.998936059993697}, 
        {0.40625, 0.999283624357537}, 
        {0.4088541666666666, 0.999417923918537}, 
        {0.4114583333333333, 0.999530358884427}, 
        {0.4166666666666666, 0.999701127669066}, 
        {0.4192708333333333, 0.99976447862087}, 
        {0.421875, 0.999816032616545}, 
        {0.4244791666666666, 0.999857645362852}, 
        {0.4270833333333333, 0.99989094355527}, 
        {0.4296875, 0.999917343107556}, 
        {0.4322916666666666, 0.999938067315486}, 
        {0.4348958333333333, 0.999954164757575}, 
        {0.4375, 0.999966526752649}, 
        {0.4401041666666666, 0.999975904213089}, 
        {0.4427083333333333, 0.999982923753036}, 
        {0.4453125, 0.999988102932239}, 
        {0.4479166666666666, 0.999991864538422}, 
        {0.44921875, 0.999993323240498}, 
        {0.4505208333333333, 0.999994549833293}, 
        {0.4518229166666666, 0.999995576230647}, 
        {0.453125, 0.999996430709485}, 
        {0.4557291666666666, 0.999997720727295}, 
        {0.45703125, 0.999998197412563}, 
        {0.4583333333333333, 0.999998585020713}, 
        {0.4596354166666666, 0.999998898067943}, 
        {0.4609375, 0.999999149081632}, 
        {0.4622395833333333, 0.999999348815537}, 
        {0.4635416666666666, 0.999999506448947}, 
        {0.46484375, 0.999999629770229}, 
        {0.4661458333333333, 0.999999725345311}, 
        {0.4674479166666666, 0.99999979867165}, 
        {0.46875, 0.999999854318278}, 
        {0.4700520833333333, 0.999999896052578}, 
        {0.4713541666666666, 0.999999926954405}, 
        {0.47265625, 0.99999994951828}, 
        {0.4739583333333333, 0.999999965744318}, 
        {0.4752604166666666, 0.999999977218622}, 
        {0.4759114583333333, 0.999999981573879}, 
        {0.4765625, 0.999999985183847}, 
        {0.4772135416666666, 0.999999988160278}, 
        {0.4778645833333333, 0.999999990600675}, 
        {0.4791666666666666, 0.999999994200898}, 
        {0.4798177083333333, 0.999999995497208}, 
        {0.48046875, 0.999999996532853}, 
        {0.4811197916666666, 0.999999997354021}, 
        {0.4817708333333333, 0.999999997999892}, 
        {0.482421875, 0.999999998503515}, 
        {0.4830729166666666, 0.999999998892589}, 
        {0.4837239583333333, 0.999999999190181}, 
        {0.484375, 0.999999999415358}, 
        {0.4850260416666666, 0.999999999583762}, 
        {0.4856770833333333, 0.999999999708119}, 
        {0.486328125, 0.999999999798688}, 
        {0.4869791666666666, 0.999999999863657}, 
        {0.4876302083333333, 0.999999999909492}, 
        {0.48828125, 0.999999999941239}, 
        {0.4889322916666666, 0.999999999962783}, 
        {0.4895833333333333, 0.999999999977074}, 
        {0.490234375, 0.999999999986313}, 
        {0.4908854166666666, 0.999999999992115}, 
        {0.4915364583333333, 0.99999999999564}, 
        {0.4921875, 0.999999999997701}, 
        {0.4928385416666666, 0.999999999998853}, 
        {0.4934895833333333, 0.999999999999465}, 
        {0.494140625, 0.999999999999769}, 
        {0.4947916666666666, 0.99999999999991}, 
        {0.4954427083333333, 0.999999999999969}, 
        {0.49609375, 0.999999999999991}, 
        {0.4967447916666666, 0.999999999999998}, 
        {0.4973958333333333, 1.}, {0.498046875, 1.}, 
        {0.4986979166666666, 1.}, 
        {0.4993489583333333, 1.}, {0.5, 1.}}]}}}, 
   {PlotRange -> {0, 1.1}, 
    AspectRatio -> GoldenRatio^(-1), 
    DisplayFunction :> $DisplayFunction, 
    ColorOutput -> Automatic, Axes -> Automatic, 
    AxesOrigin -> Automatic, 
    PlotLabel -> 
     FontForm[StringForm["Daubechies' M0, M1: n =\
        `1`", 4], {"Helvetica-Bold", 16}], 
    AxesLabel -> None, Ticks -> Automatic, 
    GridLines -> None, Prolog -> {}, Epilog -> {}, 
    AxesStyle -> Automatic, Background -> Automatic, 
    DefaultColor -> Automatic, 
    DefaultFont :> {"Courier", 12}, 
    RotateLabel -> True, Frame -> False, 
    FrameStyle -> Automatic, FrameTicks -> Automatic, 
    FrameLabel -> None, PlotRegion -> Automatic}], 
  Graphics[{{GrayLevel[0], 
     {Line[{{0., 0.999999999999999}, 
        {0.002604166666666666, 1.}, 
        {0.003255208333333333, 1.}, 
        {0.00390625, 0.999999999999999}, 
        {0.004557291666666666, 0.999999999999999}, 
        {0.005208333333333333, 1.}, 
        {0.005859375, 0.999999999999999}, 
        {0.006510416666666666, 0.999999999999999}, 
        {0.007161458333333333, 1.}, {0.0078125, 1.}, 
        {0.00846354166666667, 0.999999999999999}, 
        {0.00911458333333333, 1.}, 
        {0.009765625, 1.}, 
        {0.01041666666666666, 1.}, 
        {0.01106770833333333, 0.999999999999999}, 
        {0.01171875, 0.999999999999998}, 
        {0.01236979166666666, 0.999999999999997}, 
        {0.01302083333333333, 0.999999999999995}, 
        {0.013671875, 0.999999999999991}, 
        {0.01432291666666666, 0.999999999999984}, 
        {0.01497395833333333, 0.999999999999973}, 
        {0.015625, 0.999999999999955}, 
        {0.01627604166666666, 0.999999999999928}, 
        {0.01692708333333333, 0.999999999999884}, 
        {0.017578125, 0.999999999999818}, 
        {0.01822916666666666, 0.999999999999718}, 
        {0.01888020833333333, 0.999999999999572}, 
        {0.01953125, 0.999999999999358}, 
        {0.02018229166666666, 0.99999999999905}, 
        {0.02083333333333333, 0.999999999998611}, 
        {0.021484375, 0.999999999997994}, 
        {0.02213541666666666, 0.999999999997134}, 
        {0.02278645833333333, 0.99999999999595}, 
        {0.0234375, 0.999999999994331}, 
        {0.02408854166666666, 0.999999999992139}, 
        {0.02473958333333333, 0.999999999989196}, 
        {0.025390625, 0.999999999985274}, 
        {0.02604166666666666, 0.999999999980087}, 
        {0.02669270833333333, 0.999999999973276}, 
        {0.02734375, 0.999999999964392}, 
        {0.02799479166666666, 0.99999999995288}, 
        {0.02864583333333333, 0.999999999938053}, 
        {0.02994791666666666, 0.999999999894894}, 
        {0.03059895833333333, 0.999999999864279}, 
        {0.03125, 0.999999999825706}, 
        {0.03255208333333333, 0.999999999716998}, 
        {0.033203125, 0.999999999642038}, 
        {0.03385416666666666, 0.999999999549331}, 
        {0.03450520833333333, 0.999999999435157}, 
        {0.03515625, 0.999999999295114}, 
        {0.03645833333333333, 0.999999998915736}, 
        {0.037109375, 0.999999998663143}, 
        {0.03776041666666666, 0.99999999835787}, 
        {0.03841145833333333, 0.999999997990176}, 
        {0.0390625, 0.999999997548748}, 
        {0.04036458333333333, 0.999999996390206}, 
        {0.04166666666666666, 0.999999994751208}, 
        {0.04296875, 0.99999999245859}, 
        {0.04427083333333333, 0.999999989285645}, 
        {0.04557291666666666, 0.999999984938181}, 
        {0.046875, 0.999999979037608}, 
        {0.04817708333333333, 0.999999971100556}, 
        {0.04947916666666666, 0.999999960514472}, 
        {0.05078125, 0.999999946508589}, 
        {0.05208333333333333, 0.999999928119582}, 
        {0.05338541666666666, 0.999999904151169}, 
        {0.0546875, 0.999999873126841}, 
        {0.05598958333333333, 0.999999833234846}, 
        {0.05729166666666666, 0.999999782264448}, 
        {0.05859375, 0.999999717532455}, 
        {0.05989583333333333, 0.999999635798886}, 
        {0.06119791666666666, 0.999999533170615}, 
        {0.0625, 0.99999940499173}, 
        {0.06510416666666666, 0.999999048783085}, 
        {0.06640625, 0.999998806427942}, 
        {0.06770833333333333, 0.999998509537076}, 
        {0.06901041666666666, 0.999998147434897}, 
        {0.0703125, 0.999997707667678}, 
        {0.07291666666666666, 0.999996534948167}, 
        {0.07421875, 0.999995765880274}, 
        {0.07552083333333333, 0.999994846295544}, 
        {0.078125, 0.999992449813586}, 
        {0.0807291666666667, 0.999989094875647}, 
        {0.0833333333333333, 0.999984458032074}, 
        {0.0859375, 0.999978126538014}, 
        {0.0885416666666667, 0.999969579316454}, 
        {0.0911458333333333, 0.999958165199045}, 
        {0.09375, 0.9999430783243}, 
        {0.0963541666666667, 0.999923330619175}, 
        {0.0989583333333333, 0.999897721345943}, 
        {0.1015625, 0.999864803761083}, 
        {0.1041666666666666, 0.999822849006012}, 
        {0.1067708333333333, 0.999769807429758}, 
        {0.109375, 0.999703267629489}, 
        {0.1119791666666666, 0.999620413584586}, 
        {0.1145833333333333, 0.999517980351219}, 
        {0.1197916666666666, 0.999238800566581}, 
        {0.1223958333333333, 0.999052872365321}, 
        {0.125, 0.998828913089455}, 
        {0.1302083333333333, 0.998241469989313}, 
        {0.1354166666666666, 0.997418325791336}, 
        {0.140625, 0.996289027849613}, 
        {0.1458333333333333, 0.994770180002616}, 
        {0.1510416666666666, 0.992765289697107}, 
        {0.15625, 0.990165190366579}, 
        {0.1614583333333333, 0.986849102980498}, 
        {0.1666666666666666, 0.982686365521068}, 
        {0.1770833333333333, 0.971263804566283}, 
        {0.1822916666666666, 0.963717667705009}, 
        {0.1875, 0.954759676199205}, 
        {0.1979166666666666, 0.9320848828335}, 
        {0.2083333333333333, 0.902331339129785}, 
        {0.2291666666666666, 0.819606010822925}, 
        {0.25, 0.7071067811865618}, 
        {0.2708333333333333, 0.5729275582680364}, 
        {0.2916666666666666, 0.4310431004253456}, 
        {0.3125, 0.2973784805664937}, 
        {0.3333333333333333, 0.1852768388629411}, 
        {0.3541666666666666, 0.1021385773232245}, 
        {0.3645833333333333, 0.0718100506590543}, 
        {0.375, 0.04838183932615759}, 
        {0.3854166666666666, 0.03104524045100572}, 
        {0.390625, 0.02435932451773412}, 
        {0.3958333333333333, 0.0188220776094626}, 
        {0.4010416666666666, 0.01430198752703423}, 
        {0.40625, 0.01066958815295376}, 
        {0.4114583333333333, 0.007800028314211509}, 
        {0.4166666666666666, 0.005575275268925483}, 
        {0.421875, 0.003885912485656122}, 
        {0.4270833333333333, 0.002632506728984905}, 
        {0.4322916666666666, 0.001726535156063512}, 
        {0.4348958333333333, 0.001379287113081053}, 
        {0.4375, 0.00109087863672501}, 
        {0.4401041666666666, 0.000853464767292924}, 
        {0.4427083333333333, 0.0006599023173127805}, 
        {0.4453125, 0.0005037323818064189}, 
        {0.4479166666666666, 0.0003791580679031766}, 
        {0.4505208333333333, 0.000281017906843187}, 
        {0.453125, 0.0002047554415512342}, 
        {0.4557291666666666, 0.0001463855081203804}, 
        {0.4583333333333333, 0.00010245774958847}, 
        {0.4609375, 0.00007001791518543266}, 
        {0.4635416666666666, 
         0.00004656750763726358}, 
        {0.46484375, 0.00003754699413249893}, 
        {0.4661458333333333, 0.0000300223451633477}, 
        {0.4674479166666666, 0.0000237908894281617}, 
        {0.46875, 0.00001867060339724584}, 
        {0.4713541666666666, 
         0.00001113089575487975}, 
        {0.47265625, 8.43903270782125*10^-6}, 
        {0.4739583333333333, 
         6.310938752268765*10^-6}, 
        {0.4752604166666666, 
         4.648650701904637*10^-6}, 
        {0.4765625, 3.367331663134031*10^-6}, 
        {0.4778645833333333, 
         2.394110501744748*10^-6}, 
        {0.4791666666666666, 
         1.666957828059494*10^-6}, 
        {0.48046875, 1.133601954451985*10^-6}, 
        {0.4811197916666666, 9.2567397249392*10^-7}, 
        {0.4817708333333333, 
         7.504881320181294*10^-7}, 
        {0.4830729166666666, 
         4.817842372581138*10^-7}, 
        {0.4837239583333333, 
         3.810165458268358*10^-7}, 
        {0.484375, 2.984359166082701*10^-7}, 
        {0.4850260416666666, 
         2.31323141761951*10^-7}, 
        {0.4856770833333333, 
         1.772740435293008*10^-7}, 
        {0.486328125, 1.341746302334083*10^-7}, 
        {0.4869791666666666, 
         1.001771700574612*10^-7}, 
        {0.4876302083333333, 
         7.367719995091304*10^-8}, 
        {0.48828125, 5.329148626541334*10^-8}, 
        {0.4889322916666666, 
         3.783695694168941*10^-8}, 
        {0.4895833333333333, 
         2.631061583169722*10^-8}, 
        {0.490234375, 1.787045852161603*10^-8}, 
        {0.4908854166666666, 
         1.181740049650016*10^-8}, 
        {0.4915364583333333, 
         7.578234231316586*10^-9}, 
        {0.4921875, 4.689625288492418*10^-9}, 
        {0.4928385416666666, 
         2.783159504038542*10^-9}, 
        {0.4934895833333333, 
         1.571454739188784*10^-9}, 
        {0.494140625, 8.35344058936895*10^-10}, 
        {0.4947916666666666, 
         4.12142328688112*10^-10}, 
        {0.4954427083333333, 
         1.850039317400405*10^-10}, 
        {0.49609375, 7.337933008594037*10^-11}, 
        {0.4967447916666666, 
         2.457803925592509*10^-11}, 
        {0.4973958333333333, 
         6.443601393985432*10^-12}, 
        {0.498046875, 1.146776411797387*10^-12}, 
        {0.4986979166666666, 
         1.005093230047845*10^-13}, 
        {0.4993489583333333, 
         1.45713034093204*10^-15}, 
        {0.5, 2.009135326550961*10^-16}}]}}, 
    {GrayLevel[0.5], {Line[{{0., 
         2.009135326550961*10^-16}, 
        {0.0006510416666666666, 
         1.472420415923986*10^-15}, 
        {0.001302083333333333, 
         1.004522016628501*10^-13}, 
        {0.001953125, 1.146755302132251*10^-12}, 
        {0.002604166666666666, 
         6.443569939357658*10^-12}, 
        {0.003255208333333333, 
         2.45779571048948*10^-11}, 
        {0.00390625, 7.33792867195626*10^-11}, 
        {0.004557291666666666, 
         1.850038941465816*10^-10}, 
        {0.005208333333333333, 
         4.121422914723561*10^-10}, 
        {0.005859375, 8.35344038200515*10^-10}, 
        {0.006510416666666666, 
         1.571454715855326*10^-9}, 
        {0.007161458333333333, 
         2.783159501802549*10^-9}, 
        {0.0078125, 4.689625230485485*10^-9}, 
        {0.00846354166666667, 
         7.578234380301573*10^-9}, 
        {0.00911458333333333, 
         1.181740053066653*10^-8}, 
        {0.009765625, 1.787045850382197*10^-8}, 
        {0.01041666666666666, 
         2.631061595503851*10^-8}, 
        {0.01106770833333333, 
         3.783695691090884*10^-8}, 
        {0.01171875, 5.329148632503506*10^-8}, 
        {0.01236979166666666, 
         7.367719981489685*10^-8}, 
        {0.01302083333333333, 
         1.001771700253663*10^-7}, 
        {0.013671875, 1.341746301829686*10^-7}, 
        {0.01432291666666666, 
         1.77274043450998*10^-7}, 
        {0.01497395833333333, 
         2.313231418017408*10^-7}, 
        {0.015625, 2.984359165630959*10^-7}, 
        {0.01627604166666666, 
         3.810165458361115*10^-7}, 
        {0.01692708333333333, 
         4.817842372095038*10^-7}, 
        {0.01822916666666666, 
         7.504881321083755*10^-7}, 
        {0.01888020833333333, 
         9.25673972548747*10^-7}, 
        {0.01953125, 1.133601954458999*10^-6}, 
        {0.02083333333333333, 
         1.66695782799253*10^-6}, 
        {0.02213541666666666, 
         2.394110501598183*10^-6}, 
        {0.0234375, 3.367331663123776*10^-6}, 
        {0.02473958333333333, 
         4.648650701921916*10^-6}, 
        {0.02604166666666666, 
         6.310938752077879*10^-6}, 
        {0.02734375, 8.43903270789453*10^-6}, 
        {0.02864583333333333, 
         0.00001113089575485346}, 
        {0.02994791666666666, 0.0000144988108443528}, 
        {0.03125, 0.00001867060339723986}, 
        {0.03255208333333333, 
         0.00002379088942811522}, 
        {0.03385416666666666, 
         0.00003002234516323135}, 
        {0.03645833333333333, 
         0.00004656750763725713}, 
        {0.0390625, 0.00007001791518548788}, 
        {0.04166666666666666, 0.0001024577495887105}, 
        {0.04427083333333333, 0.0001463855081203532}, 
        {0.046875, 0.0002047554415512793}, 
        {0.04947916666666666, 0.0002810179068436415}, 
        {0.05208333333333333, 0.0003791580679032404}, 
        {0.0546875, 0.0005037323818063856}, 
        {0.05729166666666666, 0.0006599023173121851}, 
        {0.05989583333333333, 0.000853464767292891}, 
        {0.0625, 0.001090878636725013}, 
        {0.06510416666666666, 0.001379287113081139}, 
        {0.06770833333333333, 0.001726535156063522}, 
        {0.07291666666666666, 0.002632506728985533}, 
        {0.078125, 0.003885912485656074}, 
        {0.0833333333333333, 0.005575275268925877}, 
        {0.0885416666666667, 0.007800028314211421}, 
        {0.09375, 0.01066958815295415}, 
        {0.1041666666666666, 0.01882207760946263}, 
        {0.109375, 0.02435932451773401}, 
        {0.1145833333333333, 0.0310452404510053}, 
        {0.125, 0.04838183932615784}, 
        {0.1354166666666666, 0.07181005065905478}, 
        {0.1458333333333333, 0.1021385773232246}, 
        {0.1666666666666666, 0.1852768388629404}, 
        {0.1875, 0.2973784805664934}, 
        {0.2083333333333333, 0.4310431004253445}, 
        {0.2291666666666666, 0.5729275582680362}, 
        {0.25, 0.7071067811865618}, 
        {0.2708333333333333, 0.819606010822924}, 
        {0.2916666666666666, 0.902331339129784}, 
        {0.3020833333333333, 0.932084882833499}, 
        {0.3125, 0.954759676199205}, 
        {0.3229166666666666, 0.971263804566282}, 
        {0.328125, 0.977538819756229}, 
        {0.3333333333333333, 0.982686365521067}, 
        {0.3385416666666666, 0.986849102980498}, 
        {0.34375, 0.990165190366579}, 
        {0.3489583333333333, 0.992765289697107}, 
        {0.3541666666666666, 0.994770180002616}, 
        {0.359375, 0.996289027849612}, 
        {0.3645833333333333, 0.997418325791336}, 
        {0.3697916666666666, 0.998241469989313}, 
        {0.3723958333333333, 0.998560741929572}, 
        {0.375, 0.998828913089455}, 
        {0.3776041666666666, 0.99905287236532}, 
        {0.3802083333333333, 0.999238800566581}, 
        {0.3854166666666666, 0.999517980351219}, 
        {0.3880208333333333, 0.999620413584586}, 
        {0.390625, 0.999703267629489}, 
        {0.3932291666666666, 0.999769807429758}, 
        {0.3958333333333333, 0.999822849006013}, 
        {0.3984375, 0.999864803761083}, 
        {0.4010416666666666, 0.999897721345944}, 
        {0.4036458333333333, 0.999923330619175}, 
        {0.40625, 0.9999430783243}, 
        {0.4088541666666666, 0.999958165199046}, 
        {0.4114583333333333, 0.999969579316454}, 
        {0.4140625, 0.999978126538014}, 
        {0.4166666666666666, 0.999984458032074}, 
        {0.4192708333333333, 0.999989094875647}, 
        {0.421875, 0.999992449813585}, 
        {0.4244791666666666, 0.999994846295544}, 
        {0.42578125, 0.999995765880274}, 
        {0.4270833333333333, 0.999996534948168}, 
        {0.4283854166666666, 0.99999717576041}, 
        {0.4296875, 0.999997707667678}, 
        {0.4322916666666666, 0.999998509537076}, 
        {0.43359375, 0.999998806427942}, 
        {0.4348958333333333, 0.999999048783086}, 
        {0.4361979166666666, 0.999999245719291}, 
        {0.4375, 0.99999940499173}, 
        {0.4401041666666666, 0.999999635798886}, 
        {0.44140625, 0.999999717532456}, 
        {0.4427083333333333, 0.999999782264448}, 
        {0.4440104166666666, 0.999999833234846}, 
        {0.4453125, 0.999999873126841}, 
        {0.4466145833333333, 0.99999990415117}, 
        {0.4479166666666666, 0.999999928119582}, 
        {0.44921875, 0.999999946508589}, 
        {0.4505208333333333, 0.999999960514472}, 
        {0.4518229166666666, 0.999999971100556}, 
        {0.453125, 0.999999979037609}, 
        {0.4544270833333333, 0.999999984938181}, 
        {0.4557291666666666, 0.999999989285644}, 
        {0.45703125, 0.99999999245859}, 
        {0.4583333333333333, 0.999999994751208}, 
        {0.4596354166666666, 0.999999996390206}, 
        {0.4602864583333333, 0.999999997020475}, 
        {0.4609375, 0.999999997548748}, 
        {0.4615885416666666, 0.999999997990176}, 
        {0.4622395833333333, 0.999999998357869}, 
        {0.4635416666666666, 0.999999998915736}, 
        {0.4641927083333333, 0.999999999124008}, 
        {0.46484375, 0.999999999295114}, 
        {0.4654947916666666, 0.999999999435157}, 
        {0.4661458333333333, 0.999999999549331}, 
        {0.4674479166666666, 0.999999999716998}, 
        {0.4680989583333333, 0.999999999777345}, 
        {0.46875, 0.999999999825706}, 
        {0.4694010416666666, 0.999999999864279}, 
        {0.4700520833333333, 0.999999999894893}, 
        {0.470703125, 0.999999999919067}, 
        {0.4713541666666666, 0.999999999938052}, 
        {0.4720052083333333, 0.99999999995288}, 
        {0.47265625, 0.999999999964392}, 
        {0.4733072916666666, 0.999999999973276}, 
        {0.4739583333333333, 0.999999999980087}, 
        {0.474609375, 0.999999999985274}, 
        {0.4752604166666666, 0.999999999989196}, 
        {0.4759114583333333, 0.999999999992139}, 
        {0.4765625, 0.999999999994331}, 
        {0.4772135416666666, 0.999999999995949}, 
        {0.4778645833333333, 0.999999999997135}, 
        {0.478515625, 0.999999999997993}, 
        {0.4791666666666666, 0.999999999998611}, 
        {0.4798177083333333, 0.99999999999905}, 
        {0.48046875, 0.999999999999358}, 
        {0.4811197916666666, 0.999999999999572}, 
        {0.4817708333333333, 0.999999999999718}, 
        {0.482421875, 0.999999999999817}, 
        {0.4830729166666666, 0.999999999999884}, 
        {0.4837239583333333, 0.999999999999927}, 
        {0.484375, 0.999999999999955}, 
        {0.4850260416666666, 0.999999999999973}, 
        {0.4856770833333333, 0.999999999999984}, 
        {0.486328125, 0.999999999999991}, 
        {0.4869791666666666, 0.999999999999995}, 
        {0.4876302083333333, 0.999999999999997}, 
        {0.48828125, 0.999999999999998}, 
        {0.4889322916666666, 0.999999999999999}, 
        {0.4895833333333333, 0.999999999999999}, 
        {0.490234375, 0.999999999999999}, 
        {0.4908854166666666, 0.999999999999999}, 
        {0.4915364583333333, 0.999999999999999}, 
        {0.4921875, 1.}, 
        {0.4928385416666666, 0.999999999999999}, 
        {0.4934895833333333, 0.999999999999999}, 
        {0.494140625, 1.}, 
        {0.4947916666666666, 0.999999999999999}, 
        {0.4954427083333333, 0.999999999999999}, 
        {0.49609375, 0.999999999999999}, 
        {0.4967447916666666, 1.}, 
        {0.4973958333333333, 1.}, 
        {0.498046875, 0.999999999999999}, 
        {0.4986979166666666, 0.999999999999999}, 
        {0.4993489583333333, 1.}, 
        {0.5, 0.999999999999999}}]}}}, 
   {PlotRange -> {0, 1.1}, 
    AspectRatio -> GoldenRatio^(-1), 
    DisplayFunction :> $DisplayFunction, 
    ColorOutput -> Automatic, Axes -> Automatic, 
    AxesOrigin -> Automatic, 
    PlotLabel -> 
     FontForm[StringForm["Daubechies' M0, M1: n =\
        `1`", 6], {"Helvetica-Bold", 16}], 
    AxesLabel -> None, Ticks -> Automatic, 
    GridLines -> None, Prolog -> {}, Epilog -> {}, 
    AxesStyle -> Automatic, Background -> Automatic, 
    DefaultColor -> Automatic, 
    DefaultFont :> {"Courier", 12}, 
    RotateLabel -> True, Frame -> False, 
    FrameStyle -> Automatic, FrameTicks -> Automatic, 
    FrameLabel -> None, PlotRegion -> Automatic}], 
  Graphics[{{GrayLevel[0], 
     {Line[{{0., 1.000000000000002}, 
        {0.0006510416666666666, 1.000000000000002}, 
        {0.001302083333333333, 1.000000000000002}, 
        {0.002604166666666666, 1.000000000000002}, 
        {0.003255208333333333, 1.000000000000002}, 
        {0.00390625, 1.000000000000002}, 
        {0.005208333333333333, 1.000000000000002}, 
        {0.005859375, 1.000000000000002}, 
        {0.006510416666666666, 1.000000000000002}, 
        {0.007161458333333333, 1.000000000000002}, 
        {0.0078125, 1.000000000000003}, 
        {0.00846354166666667, 1.000000000000003}, 
        {0.00911458333333333, 1.000000000000003}, 
        {0.009765625, 1.000000000000003}, 
        {0.01041666666666666, 1.000000000000003}, 
        {0.01302083333333333, 1.000000000000003}, 
        {0.013671875, 1.000000000000004}, 
        {0.01432291666666666, 1.000000000000004}, 
        {0.01497395833333333, 1.000000000000004}, 
        {0.015625, 1.000000000000004}, 
        {0.01627604166666666, 1.000000000000005}, 
        {0.01692708333333333, 1.000000000000005}, 
        {0.01822916666666666, 1.000000000000005}, 
        {0.01953125, 1.000000000000006}, 
        {0.02018229166666666, 1.000000000000006}, 
        {0.02083333333333333, 1.000000000000006}, 
        {0.021484375, 1.000000000000006}, 
        {0.02213541666666666, 1.000000000000006}, 
        {0.02278645833333333, 1.000000000000006}, 
        {0.0234375, 1.000000000000005}, 
        {0.02408854166666666, 1.000000000000004}, 
        {0.02473958333333333, 1.000000000000003}, 
        {0.025390625, 1.}, 
        {0.02604166666666666, 0.999999999999997}, 
        {0.02669270833333333, 0.999999999999991}, 
        {0.02734375, 0.999999999999983}, 
        {0.02799479166666666, 0.999999999999971}, 
        {0.02864583333333333, 0.999999999999954}, 
        {0.029296875, 0.999999999999931}, 
        {0.02994791666666666, 0.999999999999898}, 
        {0.03059895833333333, 0.999999999999853}, 
        {0.03125, 0.999999999999791}, 
        {0.03190104166666666, 0.999999999999707}, 
        {0.03255208333333333, 0.999999999999593}, 
        {0.033203125, 0.999999999999439}, 
        {0.03385416666666666, 0.999999999999233}, 
        {0.03450520833333333, 0.99999999999896}, 
        {0.03515625, 0.999999999998599}, 
        {0.03580729166666666, 0.999999999998124}, 
        {0.03645833333333333, 0.999999999997503}, 
        {0.037109375, 0.999999999996695}, 
        {0.03776041666666666, 0.999999999995649}, 
        {0.03841145833333333, 0.999999999994301}, 
        {0.0390625, 0.999999999992571}, 
        {0.04036458333333333, 0.999999999987549}, 
        {0.041015625, 0.999999999983988}, 
        {0.04166666666666666, 0.999999999979491}, 
        {0.04231770833333333, 0.999999999973839}, 
        {0.04296875, 0.999999999966758}, 
        {0.04427083333333333, 0.999999999946927}, 
        {0.044921875, 0.9999999999333}, 
        {0.04557291666666666, 0.999999999916462}, 
        {0.04622395833333333, 0.999999999895724}, 
        {0.046875, 0.999999999870261}, 
        {0.04817708333333333, 0.999999999801046}, 
        {0.048828125, 0.999999999754744}, 
        {0.04947916666666666, 0.999999999698548}, 
        {0.05013020833333333, 0.999999999630529}, 
        {0.05078125, 0.999999999548419}, 
        {0.05208333333333333, 0.999999999330811}, 
        {0.052734375, 0.999999999188547}, 
        {0.05338541666666666, 0.999999999018512}, 
        {0.0546875, 0.999999998574542}, 
        {0.05598958333333333, 0.999999997949066}, 
        {0.05729166666666666, 0.999999997075454}, 
        {0.05859375, 0.999999995865301}, 
        {0.05989583333333333, 0.999999994202166}, 
        {0.06119791666666666, 0.999999991933745}, 
        {0.0625, 0.99999998886217}, 
        {0.06380208333333333, 0.999999984732025}, 
        {0.06510416666666666, 0.999999979215652}, 
        {0.06640625, 0.999999971895227}, 
        {0.06770833333333333, 0.999999962241011}, 
        {0.06901041666666666, 0.999999949585091}, 
        {0.0703125, 0.999999933089852}, 
        {0.07161458333333333, 0.99999991171029}, 
        {0.07291666666666666, 0.999999884149181}, 
        {0.07421875, 0.999999848804001}, 
        {0.07552083333333333, 0.999999803704352}, 
        {0.07682291666666666, 0.999999746438521}, 
        {0.078125, 0.999999674067642}, 
        {0.0807291666666667, 0.999999469004147}, 
        {0.08203125, 0.99999932681728}, 
        {0.0833333333333333, 0.999999150249274}, 
        {0.0846354166666667, 0.999998931877427}, 
        {0.0859375, 0.999998662870943}, 
        {0.0885416666666667, 0.999997929185578}, 
        {0.08984375, 0.99999743758718}, 
        {0.0911458333333333, 0.999996840891498}, 
        {0.0924479166666667, 0.999996119132338}, 
        {0.09375, 0.999995249038014}, 
        {0.0963541666666667, 0.999992951405793}, 
        {0.09765625, 0.999991456377482}, 
        {0.0989583333333333, 0.999989676836373}, 
        {0.1015625, 0.999985066019283}, 
        {0.1041666666666666, 0.99997864822737}, 
        {0.1067708333333333, 0.999969813488244}, 
        {0.109375, 0.999957779695979}, 
        {0.1119791666666666, 0.999941554205697}, 
        {0.1145833333333333, 0.999919889517921}, 
        {0.1171875, 0.999891232751982}, 
        {0.1197916666666666, 0.999853668730378}, 
        {0.1223958333333333, 0.999804856649491}, 
        {0.125, 0.999741960496167}, 
        {0.1276041666666666, 0.999661573582219}, 
        {0.1302083333333333, 0.999559637806667}, 
        {0.1328125, 0.999431358513013}, 
        {0.1354166666666666, 0.999271116079377}, 
        {0.1380208333333333, 0.999072375654325}, 
        {0.140625, 0.998827596720954}, 
        {0.1458333333333333, 0.99816420483207}, 
        {0.1484375, 0.997724706454831}, 
        {0.1510416666666666, 0.997197250550555}, 
        {0.15625, 0.995821898515322}, 
        {0.1614583333333333, 0.993910562514352}, 
        {0.1666666666666666, 0.991312343127068}, 
        {0.171875, 0.98785378949253}, 
        {0.1770833333333333, 0.983341192100371}, 
        {0.1822916666666666, 0.977564507579503}, 
        {0.1875, 0.970302889925594}, 
        {0.1927083333333333, 0.961331669789891}, 
        {0.1979166666666666, 0.950430499334653}, 
        {0.2083333333333333, 0.922032402182885}, 
        {0.21875, 0.883775611407101}, 
        {0.2291666666666666, 0.834958446980125}, 
        {0.25, 0.7071067811866229}, 
        {0.2708333333333333, 0.5503129944102265}, 
        {0.2916666666666666, 0.387112708813688}, 
        {0.3125, 0.2418931619584386}, 
        {0.3229166666666666, 0.181769359130826}, 
        {0.3333333333333333, 0.1315288499308345}, 
        {0.34375, 0.0913167368971434}, 
        {0.3541666666666666, 0.06056583353802743}, 
        {0.359375, 0.04840900772410704}, 
        {0.3645833333333333, 0.03817376808309202}, 
        {0.3697916666666666, 0.02967373363739516}, 
        {0.375, 0.02271590683759894}, 
        {0.3802083333333333, 0.0171067567519636}, 
        {0.3854166666666666, 0.01265758849974613}, 
        {0.390625, 0.0091890601063761}, 
        {0.3958333333333333, 0.006534760095548292}, 
        {0.4010416666666666, 0.004543811265958133}, 
        {0.40625, 0.003082515454285462}, 
        {0.4088541666666666, 0.002513604412920802}, 
        {0.4114583333333333, 0.002035098197043646}, 
        {0.4166666666666666, 0.001303649047121256}, 
        {0.4192708333333333, 0.00103052973163587}, 
        {0.421875, 0.000807381388819123}, 
        {0.4244791666666666, 0.0006265711056197996}, 
        {0.4270833333333333, 0.0004813540416787945}, 
        {0.4296875, 0.0003658146733718892}, 
        {0.4322916666666666, 0.0002748054882760697}, 
        {0.4348958333333333, 0.0002038842089585545}, 
        {0.4375, 0.0001492505572972911}, 
        {0.4401041666666666, 0.0001076834911398176}, 
        {0.4427083333333333, 0.00007647975575021205}, 
        {0.4453125, 0.00005339449539001675}, 
        {0.4479166666666666, 0.00003658456732602959}, 
        {0.44921875, 0.00003005348739029203}, 
        {0.4505208333333333, 0.00002455509394242564}, 
        {0.4518229166666666, 0.00001994877545052026}, 
        {0.453125, 0.00001610968027143723}, 
        {0.4557291666666666, 0.00001030461639227339}, 
        {0.45703125, 8.1560744242468*10^-6}, 
        {0.4583333333333333, 
         6.407278652589018*10^-6}, 
        {0.4596354166666666, 
         4.993515960838492*10^-6}, 
        {0.4609375, 3.858842415439354*10^-6}, 
        {0.4622395833333333, 
         2.955154119864704*10^-6}, 
        {0.4635416666666666, 
         2.241323816788767*10^-6}, 
        {0.46484375, 1.682401904009132*10^-6}, 
        {0.4661458333333333, 
         1.248880274490743*10^-6}, 
        {0.4674479166666666, 9.16017140889217*10^-7}, 
        {0.46875, 6.632207684806177*10^-7}, 
        {0.4700520833333333, 
         4.734898680680557*10^-7}, 
        {0.4713541666666666, 
         3.329081672294565*10^-7}, 
        {0.47265625, 2.301905895150513*10^-7}, 
        {0.4739583333333333, 
         1.562782708252799*10^-7}, 
        {0.4752604166666666, 1.03979590091579*10^-7}, 
        {0.4759114583333333, 8.41199814898503*10^-8}, 
        {0.4765625, 6.765427561839337*10^-8}, 
        {0.4772135416666666, 
         5.407459524828412*10^-8}, 
        {0.4778645833333333, 
         4.293759903759661*10^-8}, 
        {0.4791666666666666, 
         2.650163738637716*10^-8}, 
        {0.4798177083333333, 
         2.058142314369362*10^-8}, 
        {0.48046875, 1.585056223077025*10^-8}, 
        {0.4811197916666666, 
         1.209860306806325*10^-8}, 
        {0.4817708333333333, 9.1469424666611*10^-9}, 
        {0.482421875, 6.844883443743709*10^-9}, 
        {0.4830729166666666, 
         5.066066056723315*10^-9}, 
        {0.4837239583333333, 
         3.705237313825919*10^-9}, 
        {0.484375, 2.675356506866688*10^-9}, 
        {0.4850260416666666, 1.90499557125953*10^-9}, 
        {0.4856770833333333, 
         1.336029428174307*10^-9}, 
        {0.486328125, 9.21586583784718*10^-10}, 
        {0.4869791666666666, 
         6.242417249414059*10^-10}, 
        {0.4876302083333333, 
         4.144345071335632*10^-10}, 
        {0.48828125, 2.690950310721859*10^-10}, 
        {0.4889322916666666, 
         1.70450736554635*10^-10}, 
        {0.4895833333333333, 
         1.050106336141909*10^-10}, 
        {0.490234375, 6.269759187076146*10^-11}, 
        {0.4908854166666666, 
         3.612218785371292*10^-11}, 
        {0.4915364583333333, 
         1.997605004321547*10^-11}, 
        {0.4921875, 1.053400250533644*10^-11}, 
        {0.4928385416666666, 
         5.25324189960075*10^-12}, 
        {0.4934895833333333, 
         2.45119053744939*10^-12}, 
        {0.494140625, 1.054834038528784*10^-12}, 
        {0.4947916666666666, 
         4.108524992129011*10^-13}, 
        {0.4954427083333333, 1.4054445814745*10^-13}, 
        {0.49609375, 4.037348326608857*10^-14}, 
        {0.4967447916666666, 8.6769236256912*10^-15}, 
        {0.4973958333333333, 
         7.488056029259908*10^-16}, 
        {0.498046875, 8.87851639425081*10^-16}, 
        {0.4986979166666666, 
         8.74269473731308*10^-16}, 
        {0.4993489583333333, 
         1.279946348594005*10^-15}, 
        {0.5, 9.38699870717378*10^-16}}]}}, 
    {GrayLevel[0.5], {Line[{{0., 
         9.38699870717378*10^-16}, 
        {0.0006510416666666666, 
         1.042317271367845*10^-15}, 
        {0.001302083333333333, 
         8.0660263277355*10^-16}, 
        {0.001953125, 7.948071925461766*10^-16}, 
        {0.002604166666666666, 
         1.108967662275124*10^-15}, 
        {0.003255208333333333, 
         8.70590803649003*10^-15}, 
        {0.00390625, 4.03899201055564*10^-14}, 
        {0.004557291666666666, 
         1.406207596926174*10^-13}, 
        {0.005208333333333333, 
         4.107810836026891*10^-13}, 
        {0.005859375, 1.054916215661813*10^-12}, 
        {0.006510416666666666, 
         2.451125453361986*10^-12}, 
        {0.007161458333333333, 
         5.253284999679379*10^-12}, 
        {0.0078125, 1.053395529835167*10^-11}, 
        {0.00846354166666667, 
         1.997581509084736*10^-11}, 
        {0.00911458333333333, 
         3.61222464751582*10^-11}, 
        {0.009765625, 6.269757737705965*10^-11}, 
        {0.01041666666666666, 
         1.050103492922719*10^-10}, 
        {0.01106770833333333, 
         1.70450815617844*10^-10}, 
        {0.01171875, 2.690949837229907*10^-10}, 
        {0.01236979166666666, 
         4.144348034539823*10^-10}, 
        {0.01302083333333333, 
         6.242416485697598*10^-10}, 
        {0.013671875, 9.21586674723338*10^-10}, 
        {0.01432291666666666, 
         1.336029644980678*10^-9}, 
        {0.01497395833333333, 
         1.904995509590434*10^-9}, 
        {0.015625, 2.675356592384915*10^-9}, 
        {0.01627604166666666, 3.70523722163214*10^-9}, 
        {0.01692708333333333, 
         5.066066113168353*10^-9}, 
        {0.017578125, 6.844883455771024*10^-9}, 
        {0.01822916666666666, 9.14694228524524*10^-9}, 
        {0.01888020833333333, 
         1.209860300862043*10^-8}, 
        {0.01953125, 1.585056221065531*10^-8}, 
        {0.02018229166666666, 
         2.058142297187897*10^-8}, 
        {0.02083333333333333, 
         2.650163747669907*10^-8}, 
        {0.02213541666666666, 4.29375993471979*10^-8}, 
        {0.02278645833333333, 
         5.407459527365191*10^-8}, 
        {0.0234375, 6.765427553214304*10^-8}, 
        {0.02408854166666666, 8.41199819199438*10^-8}, 
        {0.02473958333333333, 
         1.039795900091137*10^-7}, 
        {0.02604166666666666, 
         1.562782712502891*10^-7}, 
        {0.02734375, 2.301905894127119*10^-7}, 
        {0.02864583333333333, 
         3.329081672825666*10^-7}, 
        {0.02994791666666666, 4.73489867431347*10^-7}, 
        {0.03125, 6.632207684645742*10^-7}, 
        {0.03255208333333333, 9.16017141011823*10^-7}, 
        {0.03385416666666666, 
         1.248880274982906*10^-6}, 
        {0.03515625, 1.682401904027214*10^-6}, 
        {0.03645833333333333, 
         2.241323816772329*10^-6}, 
        {0.03776041666666666, 
         2.955154119598836*10^-6}, 
        {0.0390625, 3.858842415388287*10^-6}, 
        {0.04036458333333333, 4.99351596084614*10^-6}, 
        {0.04166666666666666, 
         6.407278652169325*10^-6}, 
        {0.04427083333333333, 0.00001030461639240727}, 
        {0.04557291666666666, 0.00001292738276766515}, 
        {0.046875, 0.00001610968027147695}, 
        {0.04817708333333333, 0.0000199487754505542}, 
        {0.04947916666666666, 0.00002455509394140913}, 
        {0.05208333333333333, 0.00003658456732589682}, 
        {0.0546875, 0.00005339449539004517}, 
        {0.05729166666666666, 0.00007647975575105281}, 
        {0.05989583333333333, 0.0001076834911398686}, 
        {0.0625, 0.0001492505572972316}, 
        {0.06510416666666666, 0.0002038842089582663}, 
        {0.06770833333333333, 0.000274805488275993}, 
        {0.0703125, 0.0003658146733717551}, 
        {0.07291666666666666, 0.0004813540416776543}, 
        {0.07552083333333333, 0.0006265711056200029}, 
        {0.078125, 0.000807381388819229}, 
        {0.0807291666666667, 0.001030529731636781}, 
        {0.0833333333333333, 0.001303649047120704}, 
        {0.0885416666666667, 0.002035098197043831}, 
        {0.0911458333333333, 0.002513604412921365}, 
        {0.09375, 0.003082515454284896}, 
        {0.0989583333333333, 0.004543811265958018}, 
        {0.1041666666666666, 0.00653476009554815}, 
        {0.109375, 0.0091890601063762}, 
        {0.1145833333333333, 0.01265758849974635}, 
        {0.1197916666666666, 0.01710675675196364}, 
        {0.125, 0.02271590683759864}, 
        {0.1302083333333333, 0.02967373363739485}, 
        {0.1354166666666666, 0.03817376808309164}, 
        {0.1458333333333333, 0.06056583353802696}, 
        {0.15625, 0.0913167368971433}, 
        {0.1666666666666666, 0.1315288499308338}, 
        {0.1875, 0.241893161958438}, 
        {0.2083333333333333, 0.3871127088136865}, 
        {0.2291666666666666, 0.5503129944102262}, 
        {0.25, 0.7071067811866224}, 
        {0.2604166666666666, 0.7757148642638507}, 
        {0.2708333333333333, 0.834958446980125}, 
        {0.28125, 0.883775611407101}, 
        {0.2916666666666666, 0.922032402182885}, 
        {0.296875, 0.937392277849979}, 
        {0.3020833333333333, 0.950430499334653}, 
        {0.3072916666666666, 0.961331669789891}, 
        {0.3125, 0.970302889925595}, 
        {0.3177083333333333, 0.977564507579503}, 
        {0.3229166666666666, 0.983341192100371}, 
        {0.328125, 0.98785378949253}, 
        {0.3333333333333333, 0.991312343127068}, 
        {0.3385416666666666, 0.993910562514352}, 
        {0.34375, 0.995821898515322}, 
        {0.3463541666666666, 0.996568052738175}, 
        {0.3489583333333333, 0.997197250550555}, 
        {0.3541666666666666, 0.99816420483207}, 
        {0.3567708333333333, 0.998528144425403}, 
        {0.359375, 0.998827596720955}, 
        {0.3619791666666666, 0.999072375654325}, 
        {0.3645833333333333, 0.999271116079377}, 
        {0.3697916666666666, 0.999559637806668}, 
        {0.3723958333333333, 0.999661573582219}, 
        {0.375, 0.999741960496166}, 
        {0.3776041666666666, 0.999804856649491}, 
        {0.3802083333333333, 0.999853668730378}, 
        {0.3828125, 0.999891232751983}, 
        {0.3854166666666666, 0.99991988951792}, 
        {0.3880208333333333, 0.999941554205697}, 
        {0.390625, 0.999957779695979}, 
        {0.3932291666666666, 0.999969813488245}, 
        {0.3958333333333333, 0.999978648227369}, 
        {0.3984375, 0.999985066019283}, 
        {0.4010416666666666, 0.999989676836374}, 
        {0.40234375, 0.999991456377483}, 
        {0.4036458333333333, 0.999992951405794}, 
        {0.4049479166666666, 0.999994203569267}, 
        {0.40625, 0.999995249038015}, 
        {0.4088541666666666, 0.999996840891498}, 
        {0.41015625, 0.999997437587181}, 
        {0.4114583333333333, 0.999997929185578}, 
        {0.4127604166666666, 0.999998332761894}, 
        {0.4140625, 0.999998662870943}, 
        {0.4166666666666666, 0.999999150249274}, 
        {0.41796875, 0.999999326817279}, 
        {0.4192708333333333, 0.999999469004146}, 
        {0.4205729166666666, 0.999999583025788}, 
        {0.421875, 0.999999674067642}, 
        {0.4231770833333333, 0.999999746438522}, 
        {0.4244791666666666, 0.999999803704352}, 
        {0.42578125, 0.999999848804001}, 
        {0.4270833333333333, 0.999999884149181}, 
        {0.4283854166666666, 0.999999911710289}, 
        {0.4296875, 0.999999933089852}, 
        {0.4309895833333333, 0.99999994958509}, 
        {0.4322916666666666, 0.999999962241009}, 
        {0.43359375, 0.999999971895227}, 
        {0.4348958333333333, 0.999999979215652}, 
        {0.4361979166666666, 0.999999984732026}, 
        {0.4375, 0.99999998886217}, 
        {0.4388020833333333, 0.999999991933745}, 
        {0.4401041666666666, 0.999999994202166}, 
        {0.44140625, 0.999999995865301}, 
        {0.4427083333333333, 0.999999997075454}, 
        {0.4440104166666666, 0.999999997949066}, 
        {0.4453125, 0.999999998574542}, 
        {0.4459635416666666, 0.999999998815757}, 
        {0.4466145833333333, 0.999999999018512}, 
        {0.4479166666666666, 0.999999999330811}, 
        {0.4485677083333333, 0.999999999449553}, 
        {0.44921875, 0.99999999954842}, 
        {0.4498697916666666, 0.999999999630529}, 
        {0.4505208333333333, 0.999999999698548}, 
        {0.4518229166666666, 0.999999999801046}, 
        {0.4524739583333333, 0.999999999839091}, 
        {0.453125, 0.999999999870261}, 
        {0.4537760416666666, 0.999999999895723}, 
        {0.4544270833333333, 0.999999999916462}, 
        {0.4557291666666666, 0.999999999946927}, 
        {0.4563802083333333, 0.999999999957921}, 
        {0.45703125, 0.999999999966758}, 
        {0.4576822916666666, 0.999999999973839}, 
        {0.4583333333333333, 0.999999999979491}, 
        {0.458984375, 0.999999999983988}, 
        {0.4596354166666666, 0.99999999998755}, 
        {0.4602864583333333, 0.999999999990361}, 
        {0.4609375, 0.999999999992571}, 
        {0.4615885416666666, 0.999999999994301}, 
        {0.4622395833333333, 0.999999999995648}, 
        {0.462890625, 0.999999999996695}, 
        {0.4635416666666666, 0.999999999997503}, 
        {0.4641927083333333, 0.999999999998124}, 
        {0.46484375, 0.999999999998598}, 
        {0.4654947916666666, 0.99999999999896}, 
        {0.4661458333333333, 0.999999999999233}, 
        {0.466796875, 0.999999999999439}, 
        {0.4674479166666666, 0.999999999999593}, 
        {0.4680989583333333, 0.999999999999707}, 
        {0.46875, 0.999999999999791}, 
        {0.4694010416666666, 0.999999999999853}, 
        {0.4700520833333333, 0.999999999999899}, 
        {0.470703125, 0.999999999999931}, 
        {0.4713541666666666, 0.999999999999954}, 
        {0.4720052083333333, 0.999999999999971}, 
        {0.47265625, 0.999999999999983}, 
        {0.4733072916666666, 0.999999999999991}, 
        {0.4739583333333333, 0.999999999999997}, 
        {0.474609375, 1.}, 
        {0.4752604166666666, 1.000000000000002}, 
        {0.4759114583333333, 1.000000000000004}, 
        {0.4765625, 1.000000000000004}, 
        {0.4772135416666666, 1.000000000000005}, 
        {0.4778645833333333, 1.000000000000006}, 
        {0.478515625, 1.000000000000006}, 
        {0.4791666666666666, 1.000000000000007}, 
        {0.4798177083333333, 1.000000000000006}, 
        {0.48046875, 1.000000000000006}, 
        {0.4811197916666666, 1.000000000000005}, 
        {0.4817708333333333, 1.000000000000005}, 
        {0.482421875, 1.000000000000005}, 
        {0.4830729166666666, 1.000000000000005}, 
        {0.4837239583333333, 1.000000000000004}, 
        {0.484375, 1.000000000000004}, 
        {0.4895833333333333, 1.000000000000003}, 
        {0.490234375, 1.000000000000003}, 
        {0.4908854166666666, 1.000000000000003}, 
        {0.4915364583333333, 1.000000000000003}, 
        {0.4921875, 1.000000000000002}, 
        {0.4947916666666666, 1.000000000000002}, 
        {0.4954427083333333, 1.000000000000002}, 
        {0.49609375, 1.000000000000002}, 
        {0.4973958333333333, 1.000000000000002}, 
        {0.5, 1.000000000000002}}]}}}, 
   {PlotRange -> {0, 1.1}, 
    AspectRatio -> GoldenRatio^(-1), 
    DisplayFunction :> $DisplayFunction, 
    ColorOutput -> Automatic, Axes -> Automatic, 
    AxesOrigin -> Automatic, 
    PlotLabel -> 
     FontForm[StringForm["Daubechies' M0, M1: n =\
        `1`", 8], {"Helvetica-Bold", 16}], 
    AxesLabel -> None, Ticks -> Automatic, 
    GridLines -> None, Prolog -> {}, Epilog -> {}, 
    AxesStyle -> Automatic, Background -> Automatic, 
    DefaultColor -> Automatic, 
    DefaultFont :> {"Courier", 12}, 
    RotateLabel -> True, Frame -> False, 
    FrameStyle -> Automatic, FrameTicks -> Automatic, 
    FrameLabel -> None, PlotRegion -> Automatic}]}
;[o]
{-Graphics-, -Graphics-, -Graphics-}
:[font = section; inactive; Cclosed; preserveAspect; startGroup; ]
Daubechies PhiHat and PsiHat
:[font = text; inactive; preserveAspect; ]
The  idea is to use the infinite product representation.  It turns out that for most purposes, sufficiently good convergence occurs with just a few factors.  Recall that PhiHat is just the product of the M0's with successively halved arguments, while PsiHat has one initial factor of M1.  A reference for this is Ten Lectures, page 175, top formula.  I don't need the fractional power of 2Pi because of my putting a 2PI in the Fourier exponent.  The root result for the product formula for PhiHat is the fundamental equation 5.1.17 cited above.

Note: we can construct frequency domain wavelet packets in a similar way.

Note: the third argument specifies how many factors to take---these functions
are just approximations that get better for large `fac'.  Empirically though, `fac' doesn't have to be very large and the convergence is superb once n is 4 or larger.

Caution: M0 and M1 were defined above.
:[font = input; preserveAspect; ]
PhiHat[n_, xi_, facs_] := Product[M0[n, xi/2^k], {k, facs}]  
PsiHat[n_, xi_, facs_] := M1[n, xi/2] *
						Product[M0[n, xi/2^(k+1)], {k, facs}]  

:[font = subsection; inactive; Cclosed; preserveAspect; startGroup; ]
Basic usage
:[font = input; preserveAspect; startGroup; ]
Clear[phihat];
n = 3; facs = 8;
phihat[xi_] = N@Abs@PhiHat[n, xi, facs];
Table[{xi, phihat[xi]}, {xi, 0, 1.0, 0.1}]//TableForm
:[font = output; output; inactive; preserveAspect; endGroup; endGroup; ]
TableForm[{{0, 1.000000000000002}, 
   {0.1, 0.999928210408839}, 
   {0.2, 0.996167450738771}, 
   {0.3, 0.967399498096586}, 
   {0.4, 0.875148249695441}, 
   {0.5, 0.6980584999875913}, 
   {0.6, 0.4621406617153238}, 
   {0.7, 0.2332662156863307}, 
   {0.8, 0.0758300379325094}, 
   {0.9, 0.00946926794401827}, 
   {1., 1.040922256204261*10^-16}}]
;[o]
0     1.

0.1   0.999928

0.2   0.996167

0.3   0.967399

0.4   0.875148

0.5   0.698058

0.6   0.462141

0.7   0.233266

0.8   0.07583

0.9   0.00946927

                -16
1.    1.04092 10
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup; ]
Plotting the transforms
:[font = text; inactive; preserveAspect; ]
Warning: this isn't a fully general plotter.  In particular, the plot range is hard wired to something that seemed nice for the small number of tests that I did.
:[font = input; preserveAspect; ]
PlotPhiHat[n_, facs_] :=
Module[{string, label},
  string = StringForm["Daubechies' |Phi^|: n = `1`", n];
  label = FontForm[string, {"Helvetica-Bold", 16}];
	Plot[Evaluate@Abs@PhiHat[n, xi, facs], {xi, -16/n, 16/n},
   	PlotRange->{0, 1.1},
 	DefaultFont -> {"Courier", 12},
    PlotLabel -> label
  ]
]

PlotPsiHat[n_, facs_] :=
Module[{string, label},
  string = StringForm["Daubechies' |Psi^|: n = `1`", n];
  label = FontForm[string, {"Helvetica-Bold", 16}];
	Plot[Evaluate@Abs@PsiHat[m, xi, facs], {xi, -16/n, 16/n},
   	PlotRange->{0, 1.1},
 	DefaultFont -> {"Courier", 12},
    PlotLabel -> label
  ]
]
:[font = text; inactive; preserveAspect; ]
Experiment with PhiHat[2] to get suitable `fac' value.  Notice that 6 factors are enough for graphical accuracy and that the ``effective support'' in frequency domain of D2 is about 15 in my normalized coordinates.
:[font = input; preserveAspect; startGroup; ]
Do[
	PlotPhiHat[2, fac],
{fac, 2, 8, 2}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; startGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.059524 1.946143e-17 0.561849 [
[(-7.5)] 0.05357 0 0 2 Msboxa
[(-5)] 0.20238 0 0 2 Msboxa
[(-2.5)] 0.35119 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(2.5)] 0.64881 0 0 2 Msboxa
[(5)] 0.79762 0 0 2 Msboxa
[(7.5)] 0.94643 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 2)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.05357 0 moveto
0.05357 0.00625 lineto
stroke
grestore
[(-7.5)] 0.05357 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.20238 0 moveto
0.20238 0.00625 lineto
stroke
grestore
[(-5)] 0.20238 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.35119 0 moveto
0.35119 0.00625 lineto
stroke
grestore
[(-2.5)] 0.35119 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.64881 0 moveto
0.64881 0.00625 lineto
stroke
grestore
[(2.5)] 0.64881 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.79762 0 moveto
0.79762 0.00625 lineto
stroke
grestore
[(5)] 0.79762 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.94643 0 moveto
0.94643 0.00625 lineto
stroke
grestore
[(7.5)] 0.94643 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.08333 0 moveto
0.08333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1131 0 moveto
0.1131 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.14286 0 moveto
0.14286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.17262 0 moveto
0.17262 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.23214 0 moveto
0.23214 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.2619 0 moveto
0.2619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.29167 0 moveto
0.29167 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.32143 0 moveto
0.32143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.38095 0 moveto
0.38095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.41071 0 moveto
0.41071 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.44048 0 moveto
0.44048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.47024 0 moveto
0.47024 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.52976 0 moveto
0.52976 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.55952 0 moveto
0.55952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.58929 0 moveto
0.58929 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.61905 0 moveto
0.61905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.67857 0 moveto
0.67857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.70833 0 moveto
0.70833 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.7381 0 moveto
0.7381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.76786 0 moveto
0.76786 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82738 0 moveto
0.82738 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.85714 0 moveto
0.85714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.8869 0 moveto
0.8869 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.91667 0 moveto
0.91667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0 moveto
0.02381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.97619 0 moveto
0.97619 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 2)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0.56185 moveto
0.02505 0.56185 lineto
0.02629 0.56183 lineto
0.02753 0.56177 lineto
0.02877 0.56159 lineto
0.03001 0.56123 lineto
0.03125 0.56058 lineto
0.03249 0.55954 lineto
0.03373 0.55798 lineto
0.03497 0.55579 lineto
0.03621 0.55283 lineto
0.03869 0.54414 lineto
0.03993 0.53818 lineto
0.04117 0.53101 lineto
0.04365 0.51276 lineto
0.04613 0.48899 lineto
0.04861 0.45962 lineto
0.05357 0.38558 lineto
0.06349 0.204 lineto
0.06845 0.11903 lineto
0.07093 0.08306 lineto
0.07341 0.05292 lineto
0.07589 0.02935 lineto
0.07713 0.02017 lineto
0.07837 0.01274 lineto
0.07961 0.00706 lineto
0.08085 0.00308 lineto
0.08209 0.00075 lineto
0.08333 0 lineto
0.08457 0.00072 lineto
0.08581 0.00279 lineto
0.08705 0.00609 lineto
0.08829 0.01046 lineto
0.09325 0.03549 lineto
0.09821 0.0645 lineto
0.10069 0.07736 lineto
0.10193 0.08293 lineto
0.10317 0.08779 lineto
0.10441 0.09186 lineto
0.10565 0.09509 lineto
0.10689 0.09744 lineto
0.10813 0.09887 lineto
0.10938 0.0994 lineto
0.11062 0.09903 lineto
0.11186 0.09779 lineto
0.1131 0.09573 lineto
0.11558 0.08938 lineto
0.11806 0.08058 lineto
0.12302 0.05853 lineto
0.12798 0.03549 lineto
Mistroke
0.13046 0.02521 lineto
0.13294 0.01638 lineto
0.13542 0.0093 lineto
0.1379 0.00415 lineto
0.13914 0.00234 lineto
0.14038 0.00104 lineto
0.14162 0.00026 lineto
0.14286 0 lineto
0.1441 0.00026 lineto
0.14534 0.00104 lineto
0.14658 0.00234 lineto
0.14782 0.00415 lineto
0.1503 0.0093 lineto
0.15278 0.01638 lineto
0.15526 0.02521 lineto
0.15774 0.03549 lineto
0.1627 0.05853 lineto
0.16766 0.08058 lineto
0.17014 0.08938 lineto
0.17138 0.0929 lineto
0.17262 0.09573 lineto
0.17386 0.09779 lineto
0.1751 0.09903 lineto
0.17634 0.0994 lineto
0.17758 0.09887 lineto
0.17882 0.09744 lineto
0.18006 0.09509 lineto
0.18254 0.08779 lineto
0.18378 0.08293 lineto
0.18502 0.07736 lineto
0.1875 0.0645 lineto
0.19246 0.03549 lineto
0.19494 0.0218 lineto
0.19742 0.01046 lineto
0.19866 0.00609 lineto
0.1999 0.00279 lineto
0.20114 0.00072 lineto
0.20238 0 lineto
0.20362 0.00075 lineto
0.20486 0.00308 lineto
0.2061 0.00706 lineto
0.20734 0.01274 lineto
0.20982 0.02935 lineto
0.2123 0.05292 lineto
0.21478 0.08306 lineto
0.21726 0.11903 lineto
0.22222 0.204 lineto
0.22718 0.2969 lineto
0.23214 0.38558 lineto
0.2371 0.45962 lineto
Mistroke
0.23958 0.48899 lineto
0.24206 0.51276 lineto
0.24454 0.53101 lineto
0.24578 0.53818 lineto
0.24702 0.54414 lineto
0.24826 0.54899 lineto
0.2495 0.55283 lineto
0.25074 0.55579 lineto
0.25198 0.55798 lineto
0.25322 0.55954 lineto
0.25446 0.56058 lineto
0.2557 0.56123 lineto
0.25694 0.56159 lineto
0.25818 0.56177 lineto
0.25942 0.56183 lineto
0.26066 0.56185 lineto
0.2619 0.56185 lineto
0.26314 0.56185 lineto
0.26438 0.56183 lineto
0.26563 0.56177 lineto
0.26687 0.56159 lineto
0.26811 0.56123 lineto
0.26935 0.56058 lineto
0.27059 0.55954 lineto
0.27183 0.55798 lineto
0.27307 0.55579 lineto
0.27431 0.55283 lineto
0.27555 0.54899 lineto
0.27679 0.54414 lineto
0.27927 0.53101 lineto
0.28175 0.51276 lineto
0.28423 0.48899 lineto
0.28671 0.45962 lineto
0.29167 0.38558 lineto
0.30159 0.204 lineto
0.30655 0.11903 lineto
0.31151 0.05292 lineto
0.31399 0.02935 lineto
0.31523 0.02017 lineto
0.31647 0.01274 lineto
0.31771 0.00706 lineto
0.31895 0.00308 lineto
0.32019 0.00075 lineto
0.32143 0 lineto
0.32267 0.00072 lineto
0.32391 0.00279 lineto
0.32639 0.01046 lineto
0.32763 0.01575 lineto
0.32887 0.0218 lineto
0.33135 0.03549 lineto
Mistroke
0.33631 0.0645 lineto
0.33879 0.07736 lineto
0.34003 0.08293 lineto
0.34127 0.08779 lineto
0.34251 0.09186 lineto
0.34375 0.09509 lineto
0.34499 0.09744 lineto
0.34623 0.09887 lineto
0.34747 0.0994 lineto
0.34871 0.09903 lineto
0.34995 0.09779 lineto
0.35119 0.09573 lineto
0.35367 0.08938 lineto
0.35615 0.08058 lineto
0.36111 0.05853 lineto
0.36607 0.03549 lineto
0.36855 0.02521 lineto
0.37103 0.01638 lineto
0.37351 0.0093 lineto
0.37599 0.00415 lineto
0.37723 0.00234 lineto
0.37847 0.00104 lineto
0.37971 0.00026 lineto
0.38095 0 lineto
0.38219 0.00026 lineto
0.38343 0.00104 lineto
0.38467 0.00234 lineto
0.38591 0.00415 lineto
0.38839 0.0093 lineto
0.39087 0.01638 lineto
0.39583 0.03549 lineto
0.40079 0.05853 lineto
0.40327 0.07004 lineto
0.40575 0.08058 lineto
0.40823 0.08938 lineto
0.40947 0.0929 lineto
0.41071 0.09573 lineto
0.41195 0.09779 lineto
0.41319 0.09903 lineto
0.41443 0.0994 lineto
0.41567 0.09887 lineto
0.41691 0.09744 lineto
0.41815 0.09509 lineto
0.41939 0.09186 lineto
0.42063 0.08779 lineto
0.4256 0.0645 lineto
0.43056 0.03549 lineto
0.43304 0.0218 lineto
0.43428 0.01575 lineto
0.43552 0.01046 lineto
Mistroke
0.43676 0.00609 lineto
0.438 0.00279 lineto
0.43924 0.00072 lineto
0.44048 0 lineto
0.44172 0.00075 lineto
0.44296 0.00308 lineto
0.4442 0.00706 lineto
0.44544 0.01274 lineto
0.44792 0.02935 lineto
0.4504 0.05292 lineto
0.45536 0.11903 lineto
0.46032 0.204 lineto
0.47024 0.38558 lineto
0.4752 0.45962 lineto
0.47768 0.48899 lineto
0.48016 0.51276 lineto
0.48264 0.53101 lineto
0.48512 0.54414 lineto
0.48636 0.54899 lineto
0.4876 0.55283 lineto
0.48884 0.55579 lineto
0.49008 0.55798 lineto
0.49132 0.55954 lineto
0.49256 0.56058 lineto
0.4938 0.56123 lineto
0.49504 0.56159 lineto
0.49628 0.56177 lineto
0.49752 0.56183 lineto
0.49876 0.56185 lineto
0.5 0.56185 lineto
0.50124 0.56185 lineto
0.50248 0.56183 lineto
0.50372 0.56177 lineto
0.50496 0.56159 lineto
0.5062 0.56123 lineto
0.50744 0.56058 lineto
0.50868 0.55954 lineto
0.50992 0.55798 lineto
0.51116 0.55579 lineto
0.5124 0.55283 lineto
0.51364 0.54899 lineto
0.51488 0.54414 lineto
0.51736 0.53101 lineto
0.51984 0.51276 lineto
0.52232 0.48899 lineto
0.5248 0.45962 lineto
0.52976 0.38558 lineto
0.53968 0.204 lineto
0.54464 0.11903 lineto
0.5496 0.05292 lineto
Mistroke
0.55208 0.02935 lineto
0.55332 0.02017 lineto
0.55456 0.01274 lineto
0.5558 0.00706 lineto
0.55704 0.00308 lineto
0.55828 0.00075 lineto
0.55952 0 lineto
0.56076 0.00072 lineto
0.562 0.00279 lineto
0.56324 0.00609 lineto
0.56448 0.01046 lineto
0.56944 0.03549 lineto
0.5744 0.0645 lineto
0.57688 0.07736 lineto
0.57813 0.08293 lineto
0.57937 0.08779 lineto
0.58061 0.09186 lineto
0.58185 0.09509 lineto
0.58309 0.09744 lineto
0.58433 0.09887 lineto
0.58557 0.0994 lineto
0.58681 0.09903 lineto
0.58805 0.09779 lineto
0.58929 0.09573 lineto
0.59177 0.08938 lineto
0.59425 0.08058 lineto
0.59921 0.05853 lineto
0.60417 0.03549 lineto
0.60665 0.02521 lineto
0.60913 0.01638 lineto
0.61161 0.0093 lineto
0.61409 0.00415 lineto
0.61533 0.00234 lineto
0.61657 0.00104 lineto
0.61781 0.00026 lineto
0.61905 0 lineto
0.62029 0.00026 lineto
0.62153 0.00104 lineto
0.62277 0.00234 lineto
0.62401 0.00415 lineto
0.62649 0.0093 lineto
0.62897 0.01638 lineto
0.63145 0.02521 lineto
0.63393 0.03549 lineto
0.63889 0.05853 lineto
0.64385 0.08058 lineto
0.64633 0.08938 lineto
0.64757 0.0929 lineto
0.64881 0.09573 lineto
0.65005 0.09779 lineto
Mistroke
0.65129 0.09903 lineto
0.65253 0.0994 lineto
0.65377 0.09887 lineto
0.65501 0.09744 lineto
0.65625 0.09509 lineto
0.65749 0.09186 lineto
0.65873 0.08779 lineto
0.66121 0.07736 lineto
0.66369 0.0645 lineto
0.66865 0.03549 lineto
0.67113 0.0218 lineto
0.67237 0.01575 lineto
0.67361 0.01046 lineto
0.67485 0.00609 lineto
0.67609 0.00279 lineto
0.67733 0.00072 lineto
0.67857 0 lineto
0.67981 0.00075 lineto
0.68105 0.00308 lineto
0.68229 0.00706 lineto
0.68353 0.01274 lineto
0.68601 0.02935 lineto
0.68849 0.05292 lineto
0.69345 0.11903 lineto
0.69841 0.204 lineto
0.70833 0.38558 lineto
0.71329 0.45962 lineto
0.71577 0.48899 lineto
0.71825 0.51276 lineto
0.72073 0.53101 lineto
0.72321 0.54414 lineto
0.72445 0.54899 lineto
0.72569 0.55283 lineto
0.72693 0.55579 lineto
0.72817 0.55798 lineto
0.72941 0.55954 lineto
0.73065 0.56058 lineto
0.73189 0.56123 lineto
0.73313 0.56159 lineto
0.73438 0.56177 lineto
0.73562 0.56183 lineto
0.73686 0.56185 lineto
0.7381 0.56185 lineto
0.73934 0.56185 lineto
0.74058 0.56183 lineto
0.74182 0.56177 lineto
0.74306 0.56159 lineto
0.7443 0.56123 lineto
0.74554 0.56058 lineto
0.74678 0.55954 lineto
Mistroke
0.74802 0.55798 lineto
0.74926 0.55579 lineto
0.7505 0.55283 lineto
0.75174 0.54899 lineto
0.75298 0.54414 lineto
0.75546 0.53101 lineto
0.75794 0.51276 lineto
0.76042 0.48899 lineto
0.7629 0.45962 lineto
0.76786 0.38558 lineto
0.77778 0.204 lineto
0.78274 0.11903 lineto
0.7877 0.05292 lineto
0.79018 0.02935 lineto
0.79142 0.02017 lineto
0.79266 0.01274 lineto
0.7939 0.00706 lineto
0.79514 0.00308 lineto
0.79638 0.00075 lineto
0.79762 0 lineto
0.79886 0.00072 lineto
0.8001 0.00279 lineto
0.80258 0.01046 lineto
0.80382 0.01575 lineto
0.80506 0.0218 lineto
0.80754 0.03549 lineto
0.8125 0.0645 lineto
0.81498 0.07736 lineto
0.81746 0.08779 lineto
0.8187 0.09186 lineto
0.81994 0.09509 lineto
0.82118 0.09744 lineto
0.82242 0.09887 lineto
0.82366 0.0994 lineto
0.8249 0.09903 lineto
0.82614 0.09779 lineto
0.82738 0.09573 lineto
0.8373 0.05853 lineto
0.84226 0.03549 lineto
0.84722 0.01638 lineto
0.8497 0.0093 lineto
0.85094 0.00648 lineto
0.85218 0.00415 lineto
0.85342 0.00234 lineto
0.85466 0.00104 lineto
0.8559 0.00026 lineto
0.85714 0 lineto
0.87698 0.05853 lineto
0.87946 0.07004 lineto
0.88194 0.08058 lineto
Mistroke
0.88442 0.08938 lineto
0.88566 0.0929 lineto
0.8869 0.09573 lineto
0.88814 0.09779 lineto
0.88938 0.09903 lineto
0.89062 0.0994 lineto
0.89187 0.09887 lineto
0.89311 0.09744 lineto
0.89435 0.09509 lineto
0.89559 0.09186 lineto
0.89683 0.08779 lineto
0.89931 0.07736 lineto
0.90179 0.0645 lineto
0.90675 0.03549 lineto
0.90923 0.0218 lineto
0.91047 0.01575 lineto
0.91171 0.01046 lineto
0.91295 0.00609 lineto
0.91419 0.00279 lineto
0.91543 0.00072 lineto
0.91667 0 lineto
0.93651 0.204 lineto
0.97619 0.56185 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.059524 1.946143e-17 0.561849 [
[(-7.5)] 0.05357 0 0 2 Msboxa
[(-5)] 0.20238 0 0 2 Msboxa
[(-2.5)] 0.35119 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(2.5)] 0.64881 0 0 2 Msboxa
[(5)] 0.79762 0 0 2 Msboxa
[(7.5)] 0.94643 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 2)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.05357 0 moveto
0.05357 0.00625 lineto
stroke
grestore
[(-7.5)] 0.05357 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.20238 0 moveto
0.20238 0.00625 lineto
stroke
grestore
[(-5)] 0.20238 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.35119 0 moveto
0.35119 0.00625 lineto
stroke
grestore
[(-2.5)] 0.35119 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.64881 0 moveto
0.64881 0.00625 lineto
stroke
grestore
[(2.5)] 0.64881 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.79762 0 moveto
0.79762 0.00625 lineto
stroke
grestore
[(5)] 0.79762 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.94643 0 moveto
0.94643 0.00625 lineto
stroke
grestore
[(7.5)] 0.94643 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.08333 0 moveto
0.08333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1131 0 moveto
0.1131 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.14286 0 moveto
0.14286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.17262 0 moveto
0.17262 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.23214 0 moveto
0.23214 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.2619 0 moveto
0.2619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.29167 0 moveto
0.29167 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.32143 0 moveto
0.32143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.38095 0 moveto
0.38095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.41071 0 moveto
0.41071 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.44048 0 moveto
0.44048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.47024 0 moveto
0.47024 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.52976 0 moveto
0.52976 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.55952 0 moveto
0.55952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.58929 0 moveto
0.58929 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.61905 0 moveto
0.61905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.67857 0 moveto
0.67857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.70833 0 moveto
0.70833 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.7381 0 moveto
0.7381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.76786 0 moveto
0.76786 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82738 0 moveto
0.82738 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.85714 0 moveto
0.85714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.8869 0 moveto
0.8869 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.91667 0 moveto
0.91667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0 moveto
0.02381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.97619 0 moveto
0.97619 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 2)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0 moveto
0.02505 2e-05 lineto
0.02629 7e-05 lineto
0.02753 0.00015 lineto
0.02877 0.00026 lineto
0.03125 0.00058 lineto
0.03373 0.00103 lineto
0.03869 0.00227 lineto
0.04365 0.00379 lineto
0.04861 0.0053 lineto
0.05109 0.00592 lineto
0.05233 0.00617 lineto
0.05357 0.00638 lineto
0.05481 0.00654 lineto
0.05605 0.00664 lineto
0.05729 0.00668 lineto
0.05853 0.00666 lineto
0.05977 0.00658 lineto
0.06101 0.00643 lineto
0.06225 0.00622 lineto
0.06349 0.00595 lineto
0.06845 0.00436 lineto
0.07341 0.00237 lineto
0.07589 0.00144 lineto
0.07713 0.00104 lineto
0.07837 0.00068 lineto
0.07961 0.0004 lineto
0.08085 0.00018 lineto
0.08209 5e-05 lineto
0.08333 0 lineto
0.08457 5e-05 lineto
0.08581 0.00019 lineto
0.08705 0.00043 lineto
0.08829 0.00076 lineto
0.09325 0.00296 lineto
0.09821 0.00604 lineto
0.10069 0.00765 lineto
0.10317 0.00914 lineto
0.10565 0.0104 lineto
0.10689 0.01091 lineto
0.10813 0.01133 lineto
0.10938 0.01164 lineto
0.11062 0.01185 lineto
0.11186 0.01195 lineto
0.1131 0.01193 lineto
0.11434 0.01181 lineto
0.11558 0.01158 lineto
0.11682 0.01125 lineto
0.11806 0.01083 lineto
0.12302 0.00839 lineto
Mistroke
0.12798 0.00538 lineto
0.13046 0.00392 lineto
0.13294 0.00261 lineto
0.13542 0.00151 lineto
0.1379 0.00069 lineto
0.13914 0.00039 lineto
0.14038 0.00017 lineto
0.14162 4e-05 lineto
0.14286 0 lineto
0.1441 4e-05 lineto
0.14534 0.00018 lineto
0.14658 0.00041 lineto
0.14782 0.00072 lineto
0.1503 0.00163 lineto
0.15278 0.00289 lineto
0.15526 0.00446 lineto
0.15774 0.00628 lineto
0.1627 0.0103 lineto
0.16766 0.01397 lineto
0.1689 0.01471 lineto
0.17014 0.01533 lineto
0.17138 0.01583 lineto
0.17262 0.0162 lineto
0.17386 0.01642 lineto
0.1751 0.0165 lineto
0.17634 0.01641 lineto
0.17758 0.01617 lineto
0.18254 0.01372 lineto
0.1875 0.00952 lineto
0.19246 0.00489 lineto
0.19494 0.00288 lineto
0.19742 0.00133 lineto
0.19866 0.00075 lineto
0.1999 0.00034 lineto
0.20114 8e-05 lineto
0.20238 0 lineto
0.20362 8e-05 lineto
0.20486 0.00033 lineto
0.2061 0.00074 lineto
0.20734 0.0013 lineto
0.2123 0.00472 lineto
0.21726 0.00906 lineto
0.21974 0.01112 lineto
0.22222 0.01289 lineto
0.22346 0.01361 lineto
0.2247 0.01422 lineto
0.22594 0.01469 lineto
0.22718 0.01503 lineto
0.22842 0.01522 lineto
0.22966 0.01527 lineto
Mistroke
0.2309 0.01519 lineto
0.23214 0.01496 lineto
0.23462 0.01414 lineto
0.23586 0.01356 lineto
0.2371 0.01289 lineto
0.24206 0.00955 lineto
0.24702 0.0059 lineto
0.2495 0.00423 lineto
0.25198 0.00277 lineto
0.25446 0.00159 lineto
0.25694 0.00072 lineto
0.25818 0.00041 lineto
0.25942 0.00018 lineto
0.26066 5e-05 lineto
0.2619 0 lineto
0.26314 5e-05 lineto
0.26438 0.00019 lineto
0.26563 0.00042 lineto
0.26687 0.00075 lineto
0.26811 0.00118 lineto
0.26935 0.00171 lineto
0.27183 0.00306 lineto
0.27679 0.00683 lineto
0.28175 0.01163 lineto
0.28671 0.0165 lineto
0.28919 0.01856 lineto
0.29043 0.01942 lineto
0.29167 0.02014 lineto
0.29291 0.02071 lineto
0.29415 0.02109 lineto
0.29539 0.02129 lineto
0.29663 0.02129 lineto
0.29787 0.02108 lineto
0.29911 0.02066 lineto
0.30035 0.02004 lineto
0.30159 0.01921 lineto
0.30407 0.01702 lineto
0.30655 0.01424 lineto
0.31151 0.00782 lineto
0.31399 0.00478 lineto
0.31523 0.00344 lineto
0.31647 0.00228 lineto
0.31771 0.00132 lineto
0.31895 0.0006 lineto
0.32019 0.00015 lineto
0.32143 0 lineto
0.32267 0.00016 lineto
0.32391 0.00064 lineto
0.32515 0.00145 lineto
0.32639 0.00259 lineto
Mistroke
0.32763 0.00404 lineto
0.32887 0.00579 lineto
0.33135 0.01009 lineto
0.33631 0.02084 lineto
0.34127 0.03188 lineto
0.34375 0.03646 lineto
0.34623 0.03994 lineto
0.34747 0.04118 lineto
0.34871 0.04205 lineto
0.34995 0.04254 lineto
0.35119 0.04263 lineto
0.35243 0.04234 lineto
0.35367 0.04167 lineto
0.35491 0.04063 lineto
0.35615 0.03924 lineto
0.36111 0.03093 lineto
0.36607 0.02021 lineto
0.37103 0.00998 lineto
0.37351 0.00585 lineto
0.37599 0.0027 lineto
0.37723 0.00154 lineto
0.37847 0.0007 lineto
0.37971 0.00018 lineto
0.38095 0 lineto
0.38219 0.00018 lineto
0.38343 0.00073 lineto
0.38467 0.00167 lineto
0.38591 0.003 lineto
0.38839 0.00688 lineto
0.38963 0.00943 lineto
0.39087 0.01239 lineto
0.40079 0.04788 lineto
0.40575 0.06813 lineto
0.40823 0.0767 lineto
0.41071 0.08331 lineto
0.41195 0.08568 lineto
0.41319 0.08733 lineto
0.41443 0.0882 lineto
0.41567 0.08827 lineto
0.41691 0.08749 lineto
0.41815 0.08587 lineto
0.41939 0.0834 lineto
0.42063 0.08012 lineto
0.43056 0.03354 lineto
0.43304 0.02075 lineto
0.43428 0.01504 lineto
0.43552 0.01002 lineto
0.43676 0.00585 lineto
0.438 0.00269 lineto
0.43924 0.00069 lineto
Mistroke
0.44048 0 lineto
0.44172 0.00073 lineto
0.44296 0.003 lineto
0.4442 0.00688 lineto
0.44544 0.01245 lineto
0.44792 0.02879 lineto
0.44916 0.03957 lineto
0.4504 0.05207 lineto
0.46032 0.2026 lineto
0.47024 0.38471 lineto
0.4752 0.45911 lineto
0.47768 0.48863 lineto
0.48016 0.51253 lineto
0.48264 0.53087 lineto
0.48512 0.54406 lineto
0.48636 0.54893 lineto
0.4876 0.55279 lineto
0.48884 0.55577 lineto
0.49008 0.55797 lineto
0.49132 0.55953 lineto
0.49256 0.56058 lineto
0.4938 0.56123 lineto
0.49504 0.56159 lineto
0.49628 0.56177 lineto
0.49752 0.56183 lineto
0.49876 0.56185 lineto
0.5 0.56185 lineto
0.50124 0.56185 lineto
0.50248 0.56183 lineto
0.50372 0.56177 lineto
0.50496 0.56159 lineto
0.5062 0.56123 lineto
0.50744 0.56058 lineto
0.50868 0.55953 lineto
0.50992 0.55797 lineto
0.51116 0.55577 lineto
0.5124 0.55279 lineto
0.51364 0.54893 lineto
0.51488 0.54406 lineto
0.51736 0.53087 lineto
0.51984 0.51253 lineto
0.52232 0.48863 lineto
0.5248 0.45911 lineto
0.52976 0.38471 lineto
0.53968 0.2026 lineto
0.54464 0.11774 lineto
0.5496 0.05207 lineto
0.55084 0.03957 lineto
0.55208 0.02879 lineto
0.55332 0.01975 lineto
Mistroke
0.55456 0.01245 lineto
0.5558 0.00688 lineto
0.55704 0.003 lineto
0.55828 0.00073 lineto
0.55952 0 lineto
0.56944 0.03354 lineto
0.5744 0.05999 lineto
0.57688 0.0713 lineto
0.57813 0.07606 lineto
0.57937 0.08012 lineto
0.58061 0.0834 lineto
0.58185 0.08587 lineto
0.58309 0.08749 lineto
0.58433 0.08827 lineto
0.58557 0.0882 lineto
0.58681 0.08733 lineto
0.58805 0.08568 lineto
0.58929 0.08331 lineto
0.59177 0.0767 lineto
0.59425 0.06813 lineto
0.59921 0.04788 lineto
0.60417 0.02798 lineto
0.60665 0.01948 lineto
0.60913 0.01239 lineto
0.61037 0.00943 lineto
0.61161 0.00688 lineto
0.61285 0.00473 lineto
0.61409 0.003 lineto
0.61533 0.00167 lineto
0.61657 0.00073 lineto
0.61781 0.00018 lineto
0.61905 0 lineto
0.62029 0.00018 lineto
0.62153 0.0007 lineto
0.62277 0.00154 lineto
0.62401 0.0027 lineto
0.62897 0.00998 lineto
0.63393 0.02021 lineto
0.63889 0.03093 lineto
0.64137 0.03556 lineto
0.64385 0.03924 lineto
0.64509 0.04063 lineto
0.64633 0.04167 lineto
0.64757 0.04234 lineto
0.64881 0.04263 lineto
0.65005 0.04254 lineto
0.65129 0.04205 lineto
0.65253 0.04118 lineto
0.65377 0.03994 lineto
0.65873 0.03188 lineto
Mistroke
0.66369 0.02084 lineto
0.66617 0.01523 lineto
0.66865 0.01009 lineto
0.67113 0.00579 lineto
0.67237 0.00404 lineto
0.67361 0.00259 lineto
0.67485 0.00145 lineto
0.67609 0.00064 lineto
0.67733 0.00016 lineto
0.67857 0 lineto
0.67981 0.00015 lineto
0.68105 0.0006 lineto
0.68229 0.00132 lineto
0.68353 0.00228 lineto
0.68601 0.00478 lineto
0.68849 0.00782 lineto
0.69345 0.01424 lineto
0.69593 0.01702 lineto
0.69717 0.0182 lineto
0.69841 0.01921 lineto
0.69965 0.02004 lineto
0.70089 0.02066 lineto
0.70213 0.02108 lineto
0.70337 0.02129 lineto
0.70461 0.02129 lineto
0.70585 0.02109 lineto
0.70709 0.02071 lineto
0.70833 0.02014 lineto
0.70957 0.01942 lineto
0.71081 0.01856 lineto
0.71329 0.0165 lineto
0.71825 0.01163 lineto
0.72321 0.00683 lineto
0.72569 0.00478 lineto
0.72817 0.00306 lineto
0.73065 0.00171 lineto
0.73189 0.00118 lineto
0.73313 0.00075 lineto
0.73438 0.00042 lineto
0.73562 0.00019 lineto
0.73686 5e-05 lineto
0.7381 0 lineto
0.73934 5e-05 lineto
0.74058 0.00018 lineto
0.74182 0.00041 lineto
0.74306 0.00072 lineto
0.7443 0.00111 lineto
0.74554 0.00159 lineto
0.74802 0.00277 lineto
0.75298 0.0059 lineto
Mistroke
0.75794 0.00955 lineto
0.76042 0.01132 lineto
0.7629 0.01289 lineto
0.76538 0.01414 lineto
0.76662 0.01461 lineto
0.76786 0.01496 lineto
0.7691 0.01519 lineto
0.77034 0.01527 lineto
0.77158 0.01522 lineto
0.77282 0.01503 lineto
0.77406 0.01469 lineto
0.7753 0.01422 lineto
0.77778 0.01289 lineto
0.78026 0.01112 lineto
0.78274 0.00906 lineto
0.7877 0.00472 lineto
0.79018 0.00281 lineto
0.79142 0.002 lineto
0.79266 0.0013 lineto
0.7939 0.00074 lineto
0.79514 0.00033 lineto
0.79638 8e-05 lineto
0.79762 0 lineto
0.79886 8e-05 lineto
0.8001 0.00034 lineto
0.80134 0.00075 lineto
0.80258 0.00133 lineto
0.80382 0.00204 lineto
0.80506 0.00288 lineto
0.80754 0.00489 lineto
0.8125 0.00952 lineto
0.81746 0.01372 lineto
0.8187 0.01453 lineto
0.81994 0.01522 lineto
0.82118 0.01577 lineto
0.82242 0.01617 lineto
0.82366 0.01641 lineto
0.8249 0.0165 lineto
0.82614 0.01642 lineto
0.82738 0.0162 lineto
0.8373 0.0103 lineto
0.84226 0.00628 lineto
0.84722 0.00289 lineto
0.8497 0.00163 lineto
0.85094 0.00113 lineto
0.85218 0.00072 lineto
0.85342 0.00041 lineto
0.85466 0.00018 lineto
0.8559 4e-05 lineto
0.85714 0 lineto
Mistroke
0.87698 0.00839 lineto
0.87946 0.00973 lineto
0.8807 0.01032 lineto
0.88194 0.01083 lineto
0.88318 0.01125 lineto
0.88442 0.01158 lineto
0.88566 0.01181 lineto
0.8869 0.01193 lineto
0.88814 0.01195 lineto
0.88938 0.01185 lineto
0.89062 0.01164 lineto
0.89187 0.01133 lineto
0.89311 0.01091 lineto
0.89435 0.0104 lineto
0.89683 0.00914 lineto
0.90675 0.00296 lineto
0.90923 0.0017 lineto
0.91047 0.00119 lineto
0.91171 0.00076 lineto
0.91295 0.00043 lineto
0.91419 0.00019 lineto
0.91543 5e-05 lineto
0.91667 0 lineto
0.91791 5e-05 lineto
0.91915 0.00018 lineto
0.92163 0.00068 lineto
0.92287 0.00104 lineto
0.92411 0.00144 lineto
0.92659 0.00237 lineto
0.93155 0.00436 lineto
0.93403 0.00524 lineto
0.93651 0.00595 lineto
0.93775 0.00622 lineto
0.93899 0.00643 lineto
0.94023 0.00658 lineto
0.94147 0.00666 lineto
0.94271 0.00668 lineto
0.94395 0.00664 lineto
0.94519 0.00654 lineto
0.94643 0.00638 lineto
0.95635 0.00379 lineto
0.97619 0 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.059524 1.946143e-17 0.561849 [
[(-7.5)] 0.05357 0 0 2 Msboxa
[(-5)] 0.20238 0 0 2 Msboxa
[(-2.5)] 0.35119 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(2.5)] 0.64881 0 0 2 Msboxa
[(5)] 0.79762 0 0 2 Msboxa
[(7.5)] 0.94643 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 2)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.05357 0 moveto
0.05357 0.00625 lineto
stroke
grestore
[(-7.5)] 0.05357 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.20238 0 moveto
0.20238 0.00625 lineto
stroke
grestore
[(-5)] 0.20238 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.35119 0 moveto
0.35119 0.00625 lineto
stroke
grestore
[(-2.5)] 0.35119 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.64881 0 moveto
0.64881 0.00625 lineto
stroke
grestore
[(2.5)] 0.64881 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.79762 0 moveto
0.79762 0.00625 lineto
stroke
grestore
[(5)] 0.79762 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.94643 0 moveto
0.94643 0.00625 lineto
stroke
grestore
[(7.5)] 0.94643 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.08333 0 moveto
0.08333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1131 0 moveto
0.1131 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.14286 0 moveto
0.14286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.17262 0 moveto
0.17262 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.23214 0 moveto
0.23214 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.2619 0 moveto
0.2619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.29167 0 moveto
0.29167 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.32143 0 moveto
0.32143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.38095 0 moveto
0.38095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.41071 0 moveto
0.41071 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.44048 0 moveto
0.44048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.47024 0 moveto
0.47024 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.52976 0 moveto
0.52976 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.55952 0 moveto
0.55952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.58929 0 moveto
0.58929 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.61905 0 moveto
0.61905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.67857 0 moveto
0.67857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.70833 0 moveto
0.70833 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.7381 0 moveto
0.7381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.76786 0 moveto
0.76786 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82738 0 moveto
0.82738 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.85714 0 moveto
0.85714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.8869 0 moveto
0.8869 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.91667 0 moveto
0.91667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0 moveto
0.02381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.97619 0 moveto
0.97619 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 2)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0 moveto
0.02505 1e-05 lineto
0.02629 4e-05 lineto
0.02753 0.0001 lineto
0.02877 0.00018 lineto
0.03125 0.00041 lineto
0.03373 0.00073 lineto
0.03869 0.00162 lineto
0.04365 0.00274 lineto
0.04861 0.00387 lineto
0.05109 0.00435 lineto
0.05357 0.00472 lineto
0.05481 0.00485 lineto
0.05605 0.00494 lineto
0.05729 0.00498 lineto
0.05853 0.00498 lineto
0.05977 0.00493 lineto
0.06101 0.00484 lineto
0.06225 0.00469 lineto
0.06349 0.0045 lineto
0.06845 0.00333 lineto
0.07341 0.00183 lineto
0.07589 0.00112 lineto
0.07713 0.00081 lineto
0.07837 0.00053 lineto
0.07961 0.00031 lineto
0.08085 0.00014 lineto
0.08209 4e-05 lineto
0.08333 0 lineto
0.08457 4e-05 lineto
0.08581 0.00015 lineto
0.08705 0.00034 lineto
0.08829 0.00061 lineto
0.09325 0.00237 lineto
0.09573 0.00358 lineto
0.09821 0.0049 lineto
0.10317 0.00748 lineto
0.10565 0.00855 lineto
0.10689 0.00898 lineto
0.10813 0.00935 lineto
0.10938 0.00963 lineto
0.11062 0.00982 lineto
0.11186 0.00992 lineto
0.1131 0.00993 lineto
0.11434 0.00985 lineto
0.11558 0.00968 lineto
0.11682 0.00942 lineto
0.11806 0.00908 lineto
0.12302 0.0071 lineto
0.12798 0.00459 lineto
Mistroke
0.13046 0.00335 lineto
0.13294 0.00224 lineto
0.13542 0.0013 lineto
0.1379 0.00059 lineto
0.13914 0.00034 lineto
0.14038 0.00015 lineto
0.14162 4e-05 lineto
0.14286 0 lineto
0.1441 4e-05 lineto
0.14534 0.00016 lineto
0.14658 0.00035 lineto
0.14782 0.00063 lineto
0.1503 0.00143 lineto
0.15278 0.00255 lineto
0.15526 0.00394 lineto
0.15774 0.00557 lineto
0.1627 0.00919 lineto
0.16766 0.01255 lineto
0.1689 0.01323 lineto
0.17014 0.01381 lineto
0.17138 0.01428 lineto
0.17262 0.01463 lineto
0.17386 0.01485 lineto
0.1751 0.01494 lineto
0.17634 0.01488 lineto
0.17758 0.01468 lineto
0.17882 0.01433 lineto
0.18006 0.01385 lineto
0.18254 0.01252 lineto
0.18502 0.01077 lineto
0.1875 0.00873 lineto
0.19246 0.0045 lineto
0.19494 0.00267 lineto
0.19742 0.00123 lineto
0.19866 0.0007 lineto
0.1999 0.00031 lineto
0.20114 8e-05 lineto
0.20238 0 lineto
0.20362 8e-05 lineto
0.20486 0.00031 lineto
0.2061 0.00069 lineto
0.20734 0.00122 lineto
0.2123 0.00443 lineto
0.21726 0.00853 lineto
0.21974 0.01049 lineto
0.22222 0.01218 lineto
0.22346 0.01288 lineto
0.2247 0.01346 lineto
0.22594 0.01392 lineto
0.22718 0.01425 lineto
Mistroke
0.22842 0.01445 lineto
0.22966 0.01451 lineto
0.2309 0.01444 lineto
0.23214 0.01424 lineto
0.23338 0.01392 lineto
0.23462 0.01348 lineto
0.23586 0.01294 lineto
0.2371 0.01231 lineto
0.24206 0.00914 lineto
0.24702 0.00566 lineto
0.2495 0.00407 lineto
0.25198 0.00267 lineto
0.25446 0.00153 lineto
0.25694 0.00069 lineto
0.25818 0.00039 lineto
0.25942 0.00018 lineto
0.26066 4e-05 lineto
0.2619 0 lineto
0.26314 4e-05 lineto
0.26438 0.00018 lineto
0.26563 0.00041 lineto
0.26687 0.00073 lineto
0.26811 0.00115 lineto
0.26935 0.00166 lineto
0.27183 0.00298 lineto
0.27679 0.00666 lineto
0.28175 0.01136 lineto
0.28671 0.01615 lineto
0.28919 0.01819 lineto
0.29043 0.01904 lineto
0.29167 0.01976 lineto
0.29291 0.02032 lineto
0.29415 0.0207 lineto
0.29539 0.02091 lineto
0.29663 0.02091 lineto
0.29787 0.02072 lineto
0.29911 0.02031 lineto
0.30035 0.01971 lineto
0.30159 0.01891 lineto
0.30407 0.01676 lineto
0.30655 0.01403 lineto
0.31151 0.00772 lineto
0.31399 0.00472 lineto
0.31523 0.0034 lineto
0.31647 0.00225 lineto
0.31771 0.0013 lineto
0.31895 0.00059 lineto
0.32019 0.00015 lineto
0.32143 0 lineto
0.32267 0.00016 lineto
Mistroke
0.32391 0.00063 lineto
0.32515 0.00144 lineto
0.32639 0.00256 lineto
0.32763 0.004 lineto
0.32887 0.00574 lineto
0.33135 0.01 lineto
0.33631 0.02068 lineto
0.34127 0.03166 lineto
0.34375 0.03623 lineto
0.34623 0.0397 lineto
0.34747 0.04094 lineto
0.34871 0.04181 lineto
0.34995 0.0423 lineto
0.35119 0.04241 lineto
0.35243 0.04212 lineto
0.35367 0.04146 lineto
0.35491 0.04043 lineto
0.35615 0.03906 lineto
0.36111 0.0308 lineto
0.36607 0.02014 lineto
0.37103 0.00995 lineto
0.37351 0.00584 lineto
0.37599 0.00269 lineto
0.37723 0.00154 lineto
0.37847 0.00069 lineto
0.37971 0.00018 lineto
0.38095 0 lineto
0.38219 0.00018 lineto
0.38343 0.00073 lineto
0.38467 0.00167 lineto
0.38591 0.003 lineto
0.38839 0.00687 lineto
0.38963 0.00941 lineto
0.39087 0.01237 lineto
0.40079 0.04783 lineto
0.40575 0.06806 lineto
0.40823 0.07664 lineto
0.41071 0.08325 lineto
0.41195 0.08562 lineto
0.41319 0.08727 lineto
0.41443 0.08815 lineto
0.41567 0.08822 lineto
0.41691 0.08744 lineto
0.41815 0.08582 lineto
0.41939 0.08336 lineto
0.42063 0.08008 lineto
0.43056 0.03353 lineto
0.43304 0.02075 lineto
0.43428 0.01504 lineto
0.43552 0.01002 lineto
Mistroke
0.43676 0.00585 lineto
0.438 0.00269 lineto
0.43924 0.00069 lineto
0.44048 0 lineto
0.44172 0.00073 lineto
0.44296 0.003 lineto
0.4442 0.00688 lineto
0.44544 0.01245 lineto
0.44792 0.02879 lineto
0.44916 0.03957 lineto
0.4504 0.05207 lineto
0.46032 0.20259 lineto
0.47024 0.38471 lineto
0.4752 0.45911 lineto
0.47768 0.48863 lineto
0.48016 0.51253 lineto
0.48264 0.53087 lineto
0.48512 0.54406 lineto
0.48636 0.54893 lineto
0.4876 0.55279 lineto
0.48884 0.55577 lineto
0.49008 0.55797 lineto
0.49132 0.55953 lineto
0.49256 0.56058 lineto
0.4938 0.56123 lineto
0.49504 0.56159 lineto
0.49628 0.56177 lineto
0.49752 0.56183 lineto
0.49876 0.56185 lineto
0.5 0.56185 lineto
0.50124 0.56185 lineto
0.50248 0.56183 lineto
0.50372 0.56177 lineto
0.50496 0.56159 lineto
0.5062 0.56123 lineto
0.50744 0.56058 lineto
0.50868 0.55953 lineto
0.50992 0.55797 lineto
0.51116 0.55577 lineto
0.5124 0.55279 lineto
0.51364 0.54893 lineto
0.51488 0.54406 lineto
0.51736 0.53087 lineto
0.51984 0.51253 lineto
0.52232 0.48863 lineto
0.5248 0.45911 lineto
0.52976 0.38471 lineto
0.53968 0.20259 lineto
0.54464 0.11774 lineto
0.5496 0.05207 lineto
Mistroke
0.55084 0.03957 lineto
0.55208 0.02879 lineto
0.55332 0.01974 lineto
0.55456 0.01245 lineto
0.5558 0.00688 lineto
0.55704 0.003 lineto
0.55828 0.00073 lineto
0.55952 0 lineto
0.56944 0.03353 lineto
0.5744 0.05997 lineto
0.57688 0.07127 lineto
0.57813 0.07603 lineto
0.57937 0.08008 lineto
0.58061 0.08336 lineto
0.58185 0.08582 lineto
0.58309 0.08744 lineto
0.58433 0.08822 lineto
0.58557 0.08815 lineto
0.58681 0.08727 lineto
0.58805 0.08562 lineto
0.58929 0.08325 lineto
0.59177 0.07664 lineto
0.59425 0.06806 lineto
0.59921 0.04783 lineto
0.60417 0.02794 lineto
0.60665 0.01945 lineto
0.60913 0.01237 lineto
0.61037 0.00941 lineto
0.61161 0.00687 lineto
0.61285 0.00473 lineto
0.61409 0.003 lineto
0.61533 0.00167 lineto
0.61657 0.00073 lineto
0.61781 0.00018 lineto
0.61905 0 lineto
0.62029 0.00018 lineto
0.62153 0.00069 lineto
0.62277 0.00154 lineto
0.62401 0.00269 lineto
0.62897 0.00995 lineto
0.63393 0.02014 lineto
0.63889 0.0308 lineto
0.64137 0.03541 lineto
0.64385 0.03906 lineto
0.64509 0.04043 lineto
0.64633 0.04146 lineto
0.64757 0.04212 lineto
0.64881 0.04241 lineto
0.65005 0.0423 lineto
0.65129 0.04181 lineto
Mistroke
0.65253 0.04094 lineto
0.65377 0.0397 lineto
0.65873 0.03166 lineto
0.66369 0.02068 lineto
0.66617 0.0151 lineto
0.66865 0.01 lineto
0.67113 0.00574 lineto
0.67237 0.004 lineto
0.67361 0.00256 lineto
0.67485 0.00144 lineto
0.67609 0.00063 lineto
0.67733 0.00016 lineto
0.67857 0 lineto
0.67981 0.00015 lineto
0.68105 0.00059 lineto
0.68229 0.0013 lineto
0.68353 0.00225 lineto
0.68601 0.00472 lineto
0.68849 0.00772 lineto
0.69345 0.01403 lineto
0.69593 0.01676 lineto
0.69717 0.01792 lineto
0.69841 0.01891 lineto
0.69965 0.01971 lineto
0.70089 0.02031 lineto
0.70213 0.02072 lineto
0.70337 0.02091 lineto
0.70461 0.02091 lineto
0.70585 0.0207 lineto
0.70709 0.02032 lineto
0.70833 0.01976 lineto
0.70957 0.01904 lineto
0.71081 0.01819 lineto
0.71329 0.01615 lineto
0.71825 0.01136 lineto
0.72321 0.00666 lineto
0.72569 0.00466 lineto
0.72817 0.00298 lineto
0.73065 0.00166 lineto
0.73189 0.00115 lineto
0.73313 0.00073 lineto
0.73438 0.00041 lineto
0.73562 0.00018 lineto
0.73686 4e-05 lineto
0.7381 0 lineto
0.73934 4e-05 lineto
0.74058 0.00018 lineto
0.74182 0.00039 lineto
0.74306 0.00069 lineto
0.7443 0.00107 lineto
Mistroke
0.74554 0.00153 lineto
0.74802 0.00267 lineto
0.75794 0.00914 lineto
0.76042 0.01082 lineto
0.7629 0.01231 lineto
0.76538 0.01348 lineto
0.76662 0.01392 lineto
0.76786 0.01424 lineto
0.7691 0.01444 lineto
0.77034 0.01451 lineto
0.77158 0.01445 lineto
0.77282 0.01425 lineto
0.77406 0.01392 lineto
0.7753 0.01346 lineto
0.77778 0.01218 lineto
0.78274 0.00853 lineto
0.7877 0.00443 lineto
0.79018 0.00263 lineto
0.79142 0.00187 lineto
0.79266 0.00122 lineto
0.7939 0.00069 lineto
0.79514 0.00031 lineto
0.79638 8e-05 lineto
0.79762 0 lineto
0.79886 8e-05 lineto
0.8001 0.00031 lineto
0.80134 0.0007 lineto
0.80258 0.00123 lineto
0.80382 0.00189 lineto
0.80506 0.00267 lineto
0.80754 0.0045 lineto
0.8125 0.00873 lineto
0.81746 0.01252 lineto
0.8187 0.01325 lineto
0.81994 0.01385 lineto
0.82118 0.01433 lineto
0.82242 0.01468 lineto
0.82366 0.01488 lineto
0.8249 0.01494 lineto
0.82614 0.01485 lineto
0.82738 0.01463 lineto
0.8373 0.00919 lineto
0.84226 0.00557 lineto
0.84722 0.00255 lineto
0.8497 0.00143 lineto
0.85094 0.00099 lineto
0.85218 0.00063 lineto
0.85342 0.00035 lineto
0.85466 0.00016 lineto
0.8559 4e-05 lineto
Mistroke
0.85714 0 lineto
0.87698 0.0071 lineto
0.87946 0.0082 lineto
0.8807 0.00867 lineto
0.88194 0.00908 lineto
0.88318 0.00942 lineto
0.88442 0.00968 lineto
0.88566 0.00985 lineto
0.8869 0.00993 lineto
0.88814 0.00992 lineto
0.88938 0.00982 lineto
0.89062 0.00963 lineto
0.89187 0.00935 lineto
0.89311 0.00898 lineto
0.89435 0.00855 lineto
0.89683 0.00748 lineto
0.90179 0.0049 lineto
0.90675 0.00237 lineto
0.90923 0.00136 lineto
0.91047 0.00095 lineto
0.91171 0.00061 lineto
0.91295 0.00034 lineto
0.91419 0.00015 lineto
0.91543 4e-05 lineto
0.91667 0 lineto
0.91791 4e-05 lineto
0.91915 0.00014 lineto
0.92163 0.00053 lineto
0.92287 0.00081 lineto
0.92411 0.00112 lineto
0.92659 0.00183 lineto
0.93155 0.00333 lineto
0.93403 0.00399 lineto
0.93651 0.0045 lineto
0.93775 0.00469 lineto
0.93899 0.00484 lineto
0.94023 0.00493 lineto
0.94147 0.00498 lineto
0.94271 0.00498 lineto
0.94395 0.00494 lineto
0.94519 0.00485 lineto
0.94643 0.00472 lineto
0.95635 0.00274 lineto
0.96131 0.00162 lineto
0.96379 0.00113 lineto
0.96627 0.00073 lineto
0.96875 0.00041 lineto
0.96999 0.00028 lineto
0.97123 0.00018 lineto
0.97247 0.0001 lineto
Mistroke
0.97371 4e-05 lineto
0.97495 1e-05 lineto
0.97619 0 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; endGroup; endGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.059524 1.946143e-17 0.561849 [
[(-7.5)] 0.05357 0 0 2 Msboxa
[(-5)] 0.20238 0 0 2 Msboxa
[(-2.5)] 0.35119 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(2.5)] 0.64881 0 0 2 Msboxa
[(5)] 0.79762 0 0 2 Msboxa
[(7.5)] 0.94643 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 2)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.05357 0 moveto
0.05357 0.00625 lineto
stroke
grestore
[(-7.5)] 0.05357 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.20238 0 moveto
0.20238 0.00625 lineto
stroke
grestore
[(-5)] 0.20238 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.35119 0 moveto
0.35119 0.00625 lineto
stroke
grestore
[(-2.5)] 0.35119 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.64881 0 moveto
0.64881 0.00625 lineto
stroke
grestore
[(2.5)] 0.64881 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.79762 0 moveto
0.79762 0.00625 lineto
stroke
grestore
[(5)] 0.79762 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.94643 0 moveto
0.94643 0.00625 lineto
stroke
grestore
[(7.5)] 0.94643 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.08333 0 moveto
0.08333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1131 0 moveto
0.1131 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.14286 0 moveto
0.14286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.17262 0 moveto
0.17262 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.23214 0 moveto
0.23214 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.2619 0 moveto
0.2619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.29167 0 moveto
0.29167 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.32143 0 moveto
0.32143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.38095 0 moveto
0.38095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.41071 0 moveto
0.41071 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.44048 0 moveto
0.44048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.47024 0 moveto
0.47024 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.52976 0 moveto
0.52976 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.55952 0 moveto
0.55952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.58929 0 moveto
0.58929 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.61905 0 moveto
0.61905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.67857 0 moveto
0.67857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.70833 0 moveto
0.70833 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.7381 0 moveto
0.7381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.76786 0 moveto
0.76786 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82738 0 moveto
0.82738 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.85714 0 moveto
0.85714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.8869 0 moveto
0.8869 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.91667 0 moveto
0.91667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0 moveto
0.02381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.97619 0 moveto
0.97619 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 2)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0 moveto
0.02505 1e-05 lineto
0.02629 4e-05 lineto
0.02753 0.0001 lineto
0.02877 0.00018 lineto
0.03125 0.00041 lineto
0.03373 0.00073 lineto
0.03869 0.00161 lineto
0.04365 0.00273 lineto
0.04861 0.00387 lineto
0.05109 0.00434 lineto
0.05357 0.00471 lineto
0.05481 0.00484 lineto
0.05605 0.00493 lineto
0.05729 0.00498 lineto
0.05853 0.00497 lineto
0.05977 0.00493 lineto
0.06101 0.00483 lineto
0.06225 0.00468 lineto
0.06349 0.00449 lineto
0.06845 0.00333 lineto
0.07341 0.00183 lineto
0.07589 0.00112 lineto
0.07713 0.00081 lineto
0.07837 0.00053 lineto
0.07961 0.00031 lineto
0.08085 0.00014 lineto
0.08209 4e-05 lineto
0.08333 0 lineto
0.08457 4e-05 lineto
0.08581 0.00015 lineto
0.08705 0.00034 lineto
0.08829 0.00061 lineto
0.09325 0.00237 lineto
0.09573 0.00358 lineto
0.09821 0.00489 lineto
0.10317 0.00747 lineto
0.10565 0.00854 lineto
0.10689 0.00897 lineto
0.10813 0.00934 lineto
0.10938 0.00962 lineto
0.11062 0.00981 lineto
0.11186 0.00991 lineto
0.1131 0.00992 lineto
0.11434 0.00984 lineto
0.11558 0.00967 lineto
0.11682 0.00941 lineto
0.11806 0.00907 lineto
0.12302 0.00709 lineto
0.12798 0.00458 lineto
Mistroke
0.13046 0.00335 lineto
0.13294 0.00223 lineto
0.13542 0.0013 lineto
0.1379 0.00059 lineto
0.13914 0.00034 lineto
0.14038 0.00015 lineto
0.14162 4e-05 lineto
0.14286 0 lineto
0.1441 4e-05 lineto
0.14534 0.00016 lineto
0.14658 0.00035 lineto
0.14782 0.00063 lineto
0.1503 0.00143 lineto
0.15278 0.00254 lineto
0.15526 0.00394 lineto
0.15774 0.00557 lineto
0.1627 0.00919 lineto
0.16766 0.01254 lineto
0.1689 0.01322 lineto
0.17014 0.0138 lineto
0.17138 0.01427 lineto
0.17262 0.01462 lineto
0.17386 0.01484 lineto
0.1751 0.01493 lineto
0.17634 0.01487 lineto
0.17758 0.01467 lineto
0.17882 0.01433 lineto
0.18006 0.01385 lineto
0.18254 0.01251 lineto
0.18502 0.01076 lineto
0.1875 0.00873 lineto
0.19246 0.0045 lineto
0.19494 0.00266 lineto
0.19742 0.00123 lineto
0.19866 0.0007 lineto
0.1999 0.00031 lineto
0.20114 8e-05 lineto
0.20238 0 lineto
0.20362 8e-05 lineto
0.20486 0.00031 lineto
0.2061 0.00069 lineto
0.20734 0.00122 lineto
0.2123 0.00443 lineto
0.21726 0.00853 lineto
0.21974 0.01049 lineto
0.22222 0.01218 lineto
0.22346 0.01287 lineto
0.2247 0.01346 lineto
0.22594 0.01392 lineto
0.22718 0.01425 lineto
Mistroke
0.22842 0.01445 lineto
0.22966 0.01451 lineto
0.2309 0.01444 lineto
0.23214 0.01424 lineto
0.23338 0.01391 lineto
0.23462 0.01348 lineto
0.23586 0.01294 lineto
0.2371 0.0123 lineto
0.24206 0.00914 lineto
0.24702 0.00566 lineto
0.2495 0.00407 lineto
0.25198 0.00267 lineto
0.25446 0.00153 lineto
0.25694 0.00069 lineto
0.25818 0.00039 lineto
0.25942 0.00018 lineto
0.26066 4e-05 lineto
0.2619 0 lineto
0.26314 4e-05 lineto
0.26438 0.00018 lineto
0.26563 0.00041 lineto
0.26687 0.00073 lineto
0.26811 0.00115 lineto
0.26935 0.00166 lineto
0.27183 0.00298 lineto
0.27679 0.00666 lineto
0.28175 0.01136 lineto
0.28671 0.01615 lineto
0.28919 0.01819 lineto
0.29043 0.01904 lineto
0.29167 0.01976 lineto
0.29291 0.02032 lineto
0.29415 0.0207 lineto
0.29539 0.0209 lineto
0.29663 0.02091 lineto
0.29787 0.02071 lineto
0.29911 0.02031 lineto
0.30035 0.01971 lineto
0.30159 0.0189 lineto
0.30407 0.01676 lineto
0.30655 0.01403 lineto
0.31151 0.00772 lineto
0.31399 0.00472 lineto
0.31523 0.0034 lineto
0.31647 0.00225 lineto
0.31771 0.0013 lineto
0.31895 0.00059 lineto
0.32019 0.00015 lineto
0.32143 0 lineto
0.32267 0.00016 lineto
Mistroke
0.32391 0.00063 lineto
0.32515 0.00144 lineto
0.32639 0.00256 lineto
0.32763 0.004 lineto
0.32887 0.00574 lineto
0.33135 0.01 lineto
0.33631 0.02068 lineto
0.34127 0.03166 lineto
0.34375 0.03622 lineto
0.34623 0.0397 lineto
0.34747 0.04093 lineto
0.34871 0.04181 lineto
0.34995 0.0423 lineto
0.35119 0.0424 lineto
0.35243 0.04212 lineto
0.35367 0.04146 lineto
0.35491 0.04043 lineto
0.35615 0.03906 lineto
0.36111 0.0308 lineto
0.36607 0.02014 lineto
0.37103 0.00995 lineto
0.37351 0.00584 lineto
0.37599 0.00269 lineto
0.37723 0.00154 lineto
0.37847 0.00069 lineto
0.37971 0.00018 lineto
0.38095 0 lineto
0.38219 0.00018 lineto
0.38343 0.00073 lineto
0.38467 0.00167 lineto
0.38591 0.003 lineto
0.38839 0.00687 lineto
0.38963 0.00941 lineto
0.39087 0.01237 lineto
0.40079 0.04783 lineto
0.40575 0.06806 lineto
0.40823 0.07664 lineto
0.41071 0.08325 lineto
0.41195 0.08562 lineto
0.41319 0.08727 lineto
0.41443 0.08815 lineto
0.41567 0.08822 lineto
0.41691 0.08744 lineto
0.41815 0.08582 lineto
0.41939 0.08336 lineto
0.42063 0.08008 lineto
0.43056 0.03353 lineto
0.43304 0.02075 lineto
0.43428 0.01504 lineto
0.43552 0.01002 lineto
Mistroke
0.43676 0.00585 lineto
0.438 0.00269 lineto
0.43924 0.00069 lineto
0.44048 0 lineto
0.44172 0.00073 lineto
0.44296 0.003 lineto
0.4442 0.00688 lineto
0.44544 0.01245 lineto
0.44792 0.02879 lineto
0.44916 0.03957 lineto
0.4504 0.05207 lineto
0.46032 0.20259 lineto
0.47024 0.38471 lineto
0.4752 0.45911 lineto
0.47768 0.48863 lineto
0.48016 0.51253 lineto
0.48264 0.53087 lineto
0.48512 0.54406 lineto
0.48636 0.54893 lineto
0.4876 0.55279 lineto
0.48884 0.55577 lineto
0.49008 0.55797 lineto
0.49132 0.55953 lineto
0.49256 0.56058 lineto
0.4938 0.56123 lineto
0.49504 0.56159 lineto
0.49628 0.56177 lineto
0.49752 0.56183 lineto
0.49876 0.56185 lineto
0.5 0.56185 lineto
0.50124 0.56185 lineto
0.50248 0.56183 lineto
0.50372 0.56177 lineto
0.50496 0.56159 lineto
0.5062 0.56123 lineto
0.50744 0.56058 lineto
0.50868 0.55953 lineto
0.50992 0.55797 lineto
0.51116 0.55577 lineto
0.5124 0.55279 lineto
0.51364 0.54893 lineto
0.51488 0.54406 lineto
0.51736 0.53087 lineto
0.51984 0.51253 lineto
0.52232 0.48863 lineto
0.5248 0.45911 lineto
0.52976 0.38471 lineto
0.53968 0.20259 lineto
0.54464 0.11774 lineto
0.5496 0.05207 lineto
Mistroke
0.55084 0.03957 lineto
0.55208 0.02879 lineto
0.55332 0.01974 lineto
0.55456 0.01245 lineto
0.5558 0.00688 lineto
0.55704 0.003 lineto
0.55828 0.00073 lineto
0.55952 0 lineto
0.56944 0.03353 lineto
0.5744 0.05997 lineto
0.57688 0.07127 lineto
0.57813 0.07603 lineto
0.57937 0.08008 lineto
0.58061 0.08336 lineto
0.58185 0.08582 lineto
0.58309 0.08744 lineto
0.58433 0.08822 lineto
0.58557 0.08815 lineto
0.58681 0.08727 lineto
0.58805 0.08562 lineto
0.58929 0.08325 lineto
0.59177 0.07664 lineto
0.59425 0.06806 lineto
0.59921 0.04783 lineto
0.60417 0.02794 lineto
0.60665 0.01945 lineto
0.60913 0.01237 lineto
0.61037 0.00941 lineto
0.61161 0.00687 lineto
0.61285 0.00473 lineto
0.61409 0.003 lineto
0.61533 0.00167 lineto
0.61657 0.00073 lineto
0.61781 0.00018 lineto
0.61905 0 lineto
0.62029 0.00018 lineto
0.62153 0.00069 lineto
0.62277 0.00154 lineto
0.62401 0.00269 lineto
0.62897 0.00995 lineto
0.63393 0.02014 lineto
0.63889 0.0308 lineto
0.64137 0.03541 lineto
0.64385 0.03906 lineto
0.64509 0.04043 lineto
0.64633 0.04146 lineto
0.64757 0.04212 lineto
0.64881 0.0424 lineto
0.65005 0.0423 lineto
0.65129 0.04181 lineto
Mistroke
0.65253 0.04093 lineto
0.65377 0.0397 lineto
0.65873 0.03166 lineto
0.66369 0.02068 lineto
0.66617 0.0151 lineto
0.66865 0.01 lineto
0.67113 0.00574 lineto
0.67237 0.004 lineto
0.67361 0.00256 lineto
0.67485 0.00144 lineto
0.67609 0.00063 lineto
0.67733 0.00016 lineto
0.67857 0 lineto
0.67981 0.00015 lineto
0.68105 0.00059 lineto
0.68229 0.0013 lineto
0.68353 0.00225 lineto
0.68601 0.00472 lineto
0.68849 0.00772 lineto
0.69345 0.01403 lineto
0.69593 0.01676 lineto
0.69717 0.01792 lineto
0.69841 0.0189 lineto
0.69965 0.01971 lineto
0.70089 0.02031 lineto
0.70213 0.02071 lineto
0.70337 0.02091 lineto
0.70461 0.0209 lineto
0.70585 0.0207 lineto
0.70709 0.02032 lineto
0.70833 0.01976 lineto
0.70957 0.01904 lineto
0.71081 0.01819 lineto
0.71329 0.01615 lineto
0.71825 0.01136 lineto
0.72321 0.00666 lineto
0.72569 0.00466 lineto
0.72817 0.00298 lineto
0.73065 0.00166 lineto
0.73189 0.00115 lineto
0.73313 0.00073 lineto
0.73438 0.00041 lineto
0.73562 0.00018 lineto
0.73686 4e-05 lineto
0.7381 0 lineto
0.73934 4e-05 lineto
0.74058 0.00018 lineto
0.74182 0.00039 lineto
0.74306 0.00069 lineto
0.7443 0.00107 lineto
Mistroke
0.74554 0.00153 lineto
0.74802 0.00267 lineto
0.75794 0.00914 lineto
0.76042 0.01082 lineto
0.7629 0.0123 lineto
0.76538 0.01348 lineto
0.76662 0.01391 lineto
0.76786 0.01424 lineto
0.7691 0.01444 lineto
0.77034 0.01451 lineto
0.77158 0.01445 lineto
0.77282 0.01425 lineto
0.77406 0.01392 lineto
0.7753 0.01346 lineto
0.77778 0.01218 lineto
0.78274 0.00853 lineto
0.7877 0.00443 lineto
0.79018 0.00263 lineto
0.79142 0.00187 lineto
0.79266 0.00122 lineto
0.7939 0.00069 lineto
0.79514 0.00031 lineto
0.79638 8e-05 lineto
0.79762 0 lineto
0.79886 8e-05 lineto
0.8001 0.00031 lineto
0.80134 0.0007 lineto
0.80258 0.00123 lineto
0.80382 0.00189 lineto
0.80506 0.00266 lineto
0.80754 0.0045 lineto
0.8125 0.00873 lineto
0.81746 0.01251 lineto
0.8187 0.01324 lineto
0.81994 0.01385 lineto
0.82118 0.01433 lineto
0.82242 0.01467 lineto
0.82366 0.01487 lineto
0.8249 0.01493 lineto
0.82614 0.01484 lineto
0.82738 0.01462 lineto
0.8373 0.00919 lineto
0.84226 0.00557 lineto
0.84722 0.00254 lineto
0.8497 0.00143 lineto
0.85094 0.00099 lineto
0.85218 0.00063 lineto
0.85342 0.00035 lineto
0.85466 0.00016 lineto
0.8559 4e-05 lineto
Mistroke
0.85714 0 lineto
0.87698 0.00709 lineto
0.87946 0.00819 lineto
0.8807 0.00866 lineto
0.88194 0.00907 lineto
0.88318 0.00941 lineto
0.88442 0.00967 lineto
0.88566 0.00984 lineto
0.8869 0.00992 lineto
0.88814 0.00991 lineto
0.88938 0.00981 lineto
0.89062 0.00962 lineto
0.89187 0.00934 lineto
0.89311 0.00897 lineto
0.89435 0.00854 lineto
0.89683 0.00747 lineto
0.90179 0.00489 lineto
0.90675 0.00237 lineto
0.90923 0.00136 lineto
0.91047 0.00095 lineto
0.91171 0.00061 lineto
0.91295 0.00034 lineto
0.91419 0.00015 lineto
0.91543 4e-05 lineto
0.91667 0 lineto
0.91791 4e-05 lineto
0.91915 0.00014 lineto
0.92163 0.00053 lineto
0.92287 0.00081 lineto
0.92411 0.00112 lineto
0.92659 0.00183 lineto
0.93155 0.00333 lineto
0.93403 0.00398 lineto
0.93651 0.00449 lineto
0.93775 0.00468 lineto
0.93899 0.00483 lineto
0.94023 0.00493 lineto
0.94147 0.00497 lineto
0.94271 0.00498 lineto
0.94395 0.00493 lineto
0.94519 0.00484 lineto
0.94643 0.00471 lineto
0.95635 0.00273 lineto
0.96131 0.00161 lineto
0.96379 0.00113 lineto
0.96627 0.00073 lineto
0.96875 0.00041 lineto
0.96999 0.00028 lineto
0.97123 0.00018 lineto
0.97247 0.0001 lineto
Mistroke
0.97371 4e-05 lineto
0.97495 1e-05 lineto
0.97619 0 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = text; inactive; preserveAspect; ]
Experiment with PhiHat[6] to get suitable n value.  Notice that 3 factors are enough for graphical accuracy and that the ``effective support'' in frequency domain of D6 is about 6.
:[font = input; preserveAspect; startGroup; ]
Do[
	PlotPhiHat[6, fac],
{fac, 2, 5}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; startGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.178571 1.946143e-17 0.561849 [
[(-2)] 0.14286 0 0 2 Msboxa
[(-1)] 0.32143 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(1)] 0.67857 0 0 2 Msboxa
[(2)] 0.85714 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 6)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.14286 0 moveto
0.14286 0.00625 lineto
stroke
grestore
[(-2)] 0.14286 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.32143 0 moveto
0.32143 0.00625 lineto
stroke
grestore
[(-1)] 0.32143 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.67857 0 moveto
0.67857 0.00625 lineto
stroke
grestore
[(1)] 0.67857 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.85714 0 moveto
0.85714 0.00625 lineto
stroke
grestore
[(2)] 0.85714 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.17857 0 moveto
0.17857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.21429 0 moveto
0.21429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.25 0 moveto
0.25 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.28571 0 moveto
0.28571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.35714 0 moveto
0.35714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.39286 0 moveto
0.39286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.42857 0 moveto
0.42857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.46429 0 moveto
0.46429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.53571 0 moveto
0.53571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.57143 0 moveto
0.57143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.60714 0 moveto
0.60714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.64286 0 moveto
0.64286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.71429 0 moveto
0.71429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.75 0 moveto
0.75 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.78571 0 moveto
0.78571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82143 0 moveto
0.82143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.10714 0 moveto
0.10714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.07143 0 moveto
0.07143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.03571 0 moveto
0.03571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.89286 0 moveto
0.89286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.92857 0 moveto
0.92857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.96429 0 moveto
0.96429 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 6)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0.01929 moveto
0.02629 0.02089 lineto
0.02877 0.02227 lineto
0.03125 0.02338 lineto
0.03249 0.02381 lineto
0.03373 0.02417 lineto
0.03497 0.02444 lineto
0.03621 0.02462 lineto
0.03745 0.02472 lineto
0.03869 0.02474 lineto
0.03993 0.02466 lineto
0.04117 0.02451 lineto
0.04241 0.02427 lineto
0.04365 0.02396 lineto
0.04613 0.02312 lineto
0.04861 0.02201 lineto
0.05357 0.01922 lineto
0.06349 0.01264 lineto
0.06845 0.00954 lineto
0.07341 0.00687 lineto
0.07837 0.00471 lineto
0.08333 0.00308 lineto
0.08581 0.00244 lineto
0.08829 0.00191 lineto
0.09077 0.00147 lineto
0.09325 0.00112 lineto
0.09573 0.00083 lineto
0.09821 0.00061 lineto
0.10069 0.00044 lineto
0.10317 0.00031 lineto
0.10565 0.00021 lineto
0.10813 0.00014 lineto
0.10938 0.00012 lineto
0.11062 9e-05 lineto
0.11186 7e-05 lineto
0.1131 6e-05 lineto
0.11434 4e-05 lineto
0.11558 3e-05 lineto
0.11682 3e-05 lineto
0.11806 2e-05 lineto
0.1193 1e-05 lineto
0.12054 1e-05 lineto
0.12178 1e-05 lineto
0.12302 1e-05 lineto
0.12426 0 lineto
0.1255 0 lineto
0.12674 0 lineto
0.12798 0 lineto
0.12922 0 lineto
0.13046 0 lineto
Mistroke
0.1317 0 lineto
0.13294 0 lineto
0.13418 0 lineto
0.13542 0 lineto
0.13666 0 lineto
0.1379 0 lineto
0.13914 0 lineto
0.14038 0 lineto
0.14162 0 lineto
0.14286 0 lineto
0.1441 0 lineto
0.14534 0 lineto
0.14658 0 lineto
0.14782 0 lineto
0.14906 0 lineto
0.1503 0 lineto
0.15154 0 lineto
0.15278 0 lineto
0.15402 0 lineto
0.15526 0 lineto
0.1565 0 lineto
0.15774 0 lineto
0.15898 0 lineto
0.16022 0 lineto
0.16146 0 lineto
0.1627 1e-05 lineto
0.16394 1e-05 lineto
0.16518 1e-05 lineto
0.16642 1e-05 lineto
0.16766 2e-05 lineto
0.17014 3e-05 lineto
0.17138 4e-05 lineto
0.17262 6e-05 lineto
0.17386 7e-05 lineto
0.1751 9e-05 lineto
0.17758 0.00014 lineto
0.18006 0.00021 lineto
0.18254 0.00031 lineto
0.18502 0.00044 lineto
0.1875 0.00061 lineto
0.18998 0.00083 lineto
0.19246 0.00112 lineto
0.19494 0.00147 lineto
0.19742 0.00191 lineto
0.20238 0.00308 lineto
0.20734 0.00471 lineto
0.2123 0.00687 lineto
0.22222 0.01264 lineto
0.23214 0.01922 lineto
0.23462 0.0207 lineto
Mistroke
0.2371 0.02201 lineto
0.23958 0.02312 lineto
0.24082 0.02357 lineto
0.24206 0.02396 lineto
0.2433 0.02427 lineto
0.24454 0.02451 lineto
0.24578 0.02466 lineto
0.24702 0.02474 lineto
0.24826 0.02472 lineto
0.2495 0.02462 lineto
0.25074 0.02444 lineto
0.25198 0.02417 lineto
0.25446 0.02338 lineto
0.25694 0.02227 lineto
0.2619 0.01929 lineto
0.27183 0.01172 lineto
0.27679 0.00808 lineto
0.28175 0.00505 lineto
0.28671 0.00281 lineto
0.28919 0.00199 lineto
0.29167 0.00135 lineto
0.29415 0.00087 lineto
0.29539 0.00069 lineto
0.29663 0.00054 lineto
0.29787 0.00041 lineto
0.29911 0.00031 lineto
0.30035 0.00023 lineto
0.30159 0.00016 lineto
0.30283 0.00011 lineto
0.30407 8e-05 lineto
0.30531 5e-05 lineto
0.30655 3e-05 lineto
0.30779 2e-05 lineto
0.30903 1e-05 lineto
0.31027 1e-05 lineto
0.31151 0 lineto
0.31275 0 lineto
0.31399 0 lineto
0.31523 0 lineto
0.31647 0 lineto
0.31771 0 lineto
0.31895 0 lineto
0.32019 0 lineto
0.32143 0 lineto
0.32267 0 lineto
0.32391 0 lineto
0.32515 0 lineto
0.32639 0 lineto
0.32763 0 lineto
0.32887 0 lineto
Mistroke
0.33011 0 lineto
0.33135 0 lineto
0.33259 1e-05 lineto
0.33383 2e-05 lineto
0.33507 3e-05 lineto
0.33631 5e-05 lineto
0.33755 8e-05 lineto
0.33879 0.00012 lineto
0.34003 0.00018 lineto
0.34127 0.00026 lineto
0.34251 0.00038 lineto
0.34375 0.00053 lineto
0.34499 0.00073 lineto
0.34623 0.00098 lineto
0.34747 0.00131 lineto
0.34871 0.00171 lineto
0.34995 0.00221 lineto
0.35119 0.00283 lineto
0.35367 0.00445 lineto
0.35615 0.00674 lineto
0.35863 0.00986 lineto
0.36111 0.01398 lineto
0.36359 0.01928 lineto
0.36607 0.02595 lineto
0.37103 0.04404 lineto
0.37599 0.06932 lineto
0.38095 0.1023 lineto
0.40079 0.29439 lineto
0.41071 0.39682 lineto
0.41567 0.44086 lineto
0.42063 0.47778 lineto
0.4256 0.50688 lineto
0.42808 0.51852 lineto
0.43056 0.52831 lineto
0.43304 0.5364 lineto
0.43552 0.54294 lineto
0.438 0.54812 lineto
0.44048 0.55211 lineto
0.44296 0.55513 lineto
0.44544 0.55733 lineto
0.44668 0.55819 lineto
0.44792 0.55891 lineto
0.44916 0.5595 lineto
0.4504 0.56 lineto
0.45164 0.5604 lineto
0.45288 0.56072 lineto
0.45412 0.56098 lineto
0.45536 0.56119 lineto
0.4566 0.56135 lineto
0.45784 0.56148 lineto
Mistroke
0.45908 0.56158 lineto
0.46032 0.56165 lineto
0.46156 0.56171 lineto
0.4628 0.56175 lineto
0.46404 0.56178 lineto
0.46528 0.5618 lineto
0.46652 0.56182 lineto
0.46776 0.56183 lineto
0.469 0.56184 lineto
0.47024 0.56184 lineto
0.47148 0.56184 lineto
0.47272 0.56185 lineto
0.47396 0.56185 lineto
0.4752 0.56185 lineto
0.47644 0.56185 lineto
0.47768 0.56185 lineto
0.47892 0.56185 lineto
0.48016 0.56185 lineto
0.4814 0.56185 lineto
0.48264 0.56185 lineto
0.48388 0.56185 lineto
0.48512 0.56185 lineto
0.48636 0.56185 lineto
0.4876 0.56185 lineto
0.48884 0.56185 lineto
0.49008 0.56185 lineto
0.49132 0.56185 lineto
0.49256 0.56185 lineto
0.4938 0.56185 lineto
0.49504 0.56185 lineto
0.49628 0.56185 lineto
0.49752 0.56185 lineto
0.49876 0.56185 lineto
0.5 0.56185 lineto
0.50124 0.56185 lineto
0.50248 0.56185 lineto
0.50372 0.56185 lineto
0.50496 0.56185 lineto
0.5062 0.56185 lineto
0.50744 0.56185 lineto
0.50868 0.56185 lineto
0.50992 0.56185 lineto
0.51116 0.56185 lineto
0.5124 0.56185 lineto
0.51364 0.56185 lineto
0.51488 0.56185 lineto
0.51612 0.56185 lineto
0.51736 0.56185 lineto
0.5186 0.56185 lineto
0.51984 0.56185 lineto
Mistroke
0.52108 0.56185 lineto
0.52232 0.56185 lineto
0.52356 0.56185 lineto
0.5248 0.56185 lineto
0.52604 0.56185 lineto
0.52728 0.56185 lineto
0.52852 0.56184 lineto
0.52976 0.56184 lineto
0.531 0.56184 lineto
0.53224 0.56183 lineto
0.53348 0.56182 lineto
0.53472 0.5618 lineto
0.53596 0.56178 lineto
0.5372 0.56175 lineto
0.53844 0.56171 lineto
0.53968 0.56165 lineto
0.54092 0.56158 lineto
0.54216 0.56148 lineto
0.5434 0.56135 lineto
0.54464 0.56119 lineto
0.54588 0.56098 lineto
0.54712 0.56072 lineto
0.54836 0.5604 lineto
0.5496 0.56 lineto
0.55084 0.5595 lineto
0.55208 0.55891 lineto
0.55456 0.55733 lineto
0.55704 0.55513 lineto
0.55952 0.55211 lineto
0.562 0.54812 lineto
0.56448 0.54294 lineto
0.56696 0.5364 lineto
0.56944 0.52831 lineto
0.5744 0.50688 lineto
0.57937 0.47778 lineto
0.58929 0.39682 lineto
0.59921 0.29439 lineto
0.60913 0.18955 lineto
0.61409 0.14273 lineto
0.61905 0.1023 lineto
0.62401 0.06932 lineto
0.62897 0.04404 lineto
0.63145 0.03416 lineto
0.63393 0.02595 lineto
0.63641 0.01928 lineto
0.63889 0.01398 lineto
0.64137 0.00986 lineto
0.64385 0.00674 lineto
0.64633 0.00445 lineto
0.64757 0.00357 lineto
Mistroke
0.64881 0.00283 lineto
0.65129 0.00171 lineto
0.65253 0.00131 lineto
0.65377 0.00098 lineto
0.65501 0.00073 lineto
0.65625 0.00053 lineto
0.65749 0.00038 lineto
0.65873 0.00026 lineto
0.65997 0.00018 lineto
0.66121 0.00012 lineto
0.66245 8e-05 lineto
0.66369 5e-05 lineto
0.66493 3e-05 lineto
0.66617 2e-05 lineto
0.66741 1e-05 lineto
0.66865 0 lineto
0.66989 0 lineto
0.67113 0 lineto
0.67237 0 lineto
0.67361 0 lineto
0.67485 0 lineto
0.67609 0 lineto
0.67733 0 lineto
0.67857 0 lineto
0.67981 0 lineto
0.68105 0 lineto
0.68229 0 lineto
0.68353 0 lineto
0.68477 0 lineto
0.68601 0 lineto
0.68725 0 lineto
0.68849 0 lineto
0.68973 1e-05 lineto
0.69097 1e-05 lineto
0.69221 2e-05 lineto
0.69345 3e-05 lineto
0.69469 5e-05 lineto
0.69593 8e-05 lineto
0.69717 0.00011 lineto
0.69841 0.00016 lineto
0.69965 0.00023 lineto
0.70089 0.00031 lineto
0.70213 0.00041 lineto
0.70337 0.00054 lineto
0.70585 0.00087 lineto
0.70833 0.00135 lineto
0.71081 0.00199 lineto
0.71329 0.00281 lineto
0.71825 0.00505 lineto
0.72321 0.00808 lineto
Mistroke
0.72817 0.01172 lineto
0.73313 0.01561 lineto
0.7381 0.01929 lineto
0.74058 0.02089 lineto
0.74306 0.02227 lineto
0.74554 0.02338 lineto
0.74678 0.02381 lineto
0.74802 0.02417 lineto
0.74926 0.02444 lineto
0.7505 0.02462 lineto
0.75174 0.02472 lineto
0.75298 0.02474 lineto
0.75422 0.02466 lineto
0.75546 0.02451 lineto
0.7567 0.02427 lineto
0.75794 0.02396 lineto
0.76042 0.02312 lineto
0.7629 0.02201 lineto
0.76786 0.01922 lineto
0.77778 0.01264 lineto
0.78274 0.00954 lineto
0.7877 0.00687 lineto
0.79266 0.00471 lineto
0.79762 0.00308 lineto
0.80258 0.00191 lineto
0.80506 0.00147 lineto
0.80754 0.00112 lineto
0.81002 0.00083 lineto
0.8125 0.00061 lineto
0.81498 0.00044 lineto
0.81746 0.00031 lineto
0.81994 0.00021 lineto
0.82242 0.00014 lineto
0.8249 9e-05 lineto
0.82614 7e-05 lineto
0.82738 6e-05 lineto
0.82862 4e-05 lineto
0.82986 3e-05 lineto
0.8311 3e-05 lineto
0.83234 2e-05 lineto
0.83358 1e-05 lineto
0.83482 1e-05 lineto
0.83606 1e-05 lineto
0.8373 1e-05 lineto
0.83854 0 lineto
0.83978 0 lineto
0.84102 0 lineto
0.84226 0 lineto
0.8435 0 lineto
0.84474 0 lineto
Mistroke
0.84598 0 lineto
0.84722 0 lineto
0.84846 0 lineto
0.8497 0 lineto
0.85094 0 lineto
0.85218 0 lineto
0.85342 0 lineto
0.85466 0 lineto
0.8559 0 lineto
0.85714 0 lineto
0.85838 0 lineto
0.85962 0 lineto
0.86086 0 lineto
0.8621 0 lineto
0.86334 0 lineto
0.86458 0 lineto
0.86582 0 lineto
0.86706 0 lineto
0.8683 0 lineto
0.86954 0 lineto
0.87078 0 lineto
0.87202 0 lineto
0.87326 0 lineto
0.8745 0 lineto
0.87574 0 lineto
0.87698 1e-05 lineto
0.87822 1e-05 lineto
0.87946 1e-05 lineto
0.8807 1e-05 lineto
0.88194 2e-05 lineto
0.88318 3e-05 lineto
0.88442 3e-05 lineto
0.88566 4e-05 lineto
0.8869 6e-05 lineto
0.88814 7e-05 lineto
0.88938 9e-05 lineto
0.89187 0.00014 lineto
0.89435 0.00021 lineto
0.89683 0.00031 lineto
0.89931 0.00044 lineto
0.90179 0.00061 lineto
0.90427 0.00083 lineto
0.90675 0.00112 lineto
0.90923 0.00147 lineto
0.91171 0.00191 lineto
0.91667 0.00308 lineto
0.92163 0.00471 lineto
0.92659 0.00687 lineto
0.93651 0.01264 lineto
0.94643 0.01922 lineto
Mistroke
0.94891 0.0207 lineto
0.95139 0.02201 lineto
0.95387 0.02312 lineto
0.95511 0.02357 lineto
0.95635 0.02396 lineto
0.95759 0.02427 lineto
0.95883 0.02451 lineto
0.96007 0.02466 lineto
0.96131 0.02474 lineto
0.96255 0.02472 lineto
0.96379 0.02462 lineto
0.96503 0.02444 lineto
0.96627 0.02417 lineto
0.96875 0.02338 lineto
0.97123 0.02227 lineto
0.97619 0.01929 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.178571 1.946143e-17 0.561849 [
[(-2)] 0.14286 0 0 2 Msboxa
[(-1)] 0.32143 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(1)] 0.67857 0 0 2 Msboxa
[(2)] 0.85714 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 6)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.14286 0 moveto
0.14286 0.00625 lineto
stroke
grestore
[(-2)] 0.14286 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.32143 0 moveto
0.32143 0.00625 lineto
stroke
grestore
[(-1)] 0.32143 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.67857 0 moveto
0.67857 0.00625 lineto
stroke
grestore
[(1)] 0.67857 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.85714 0 moveto
0.85714 0.00625 lineto
stroke
grestore
[(2)] 0.85714 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.17857 0 moveto
0.17857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.21429 0 moveto
0.21429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.25 0 moveto
0.25 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.28571 0 moveto
0.28571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.35714 0 moveto
0.35714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.39286 0 moveto
0.39286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.42857 0 moveto
0.42857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.46429 0 moveto
0.46429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.53571 0 moveto
0.53571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.57143 0 moveto
0.57143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.60714 0 moveto
0.60714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.64286 0 moveto
0.64286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.71429 0 moveto
0.71429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.75 0 moveto
0.75 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.78571 0 moveto
0.78571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82143 0 moveto
0.82143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.10714 0 moveto
0.10714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.07143 0 moveto
0.07143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.03571 0 moveto
0.03571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.89286 0 moveto
0.89286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.92857 0 moveto
0.92857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.96429 0 moveto
0.96429 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 6)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0.00357 moveto
0.02877 0.0045 lineto
0.03373 0.00531 lineto
0.03621 0.00563 lineto
0.03745 0.00577 lineto
0.03869 0.00589 lineto
0.03993 0.00599 lineto
0.04117 0.00607 lineto
0.04241 0.00612 lineto
0.04365 0.00616 lineto
0.04489 0.00618 lineto
0.04613 0.00617 lineto
0.04737 0.00614 lineto
0.04861 0.0061 lineto
0.04985 0.00603 lineto
0.05109 0.00594 lineto
0.05357 0.00572 lineto
0.05853 0.00509 lineto
0.06349 0.0043 lineto
0.07341 0.00264 lineto
0.07837 0.00192 lineto
0.08333 0.00133 lineto
0.08829 0.00087 lineto
0.09077 0.00069 lineto
0.09325 0.00053 lineto
0.09573 0.00041 lineto
0.09821 0.00031 lineto
0.10069 0.00023 lineto
0.10317 0.00016 lineto
0.10565 0.00011 lineto
0.10813 8e-05 lineto
0.11062 5e-05 lineto
0.11186 4e-05 lineto
0.1131 3e-05 lineto
0.11434 3e-05 lineto
0.11558 2e-05 lineto
0.11806 1e-05 lineto
0.1193 1e-05 lineto
0.12054 1e-05 lineto
0.12178 0 lineto
0.12302 0 lineto
0.12426 0 lineto
0.1255 0 lineto
0.12674 0 lineto
0.12798 0 lineto
0.12922 0 lineto
0.13046 0 lineto
0.1317 0 lineto
0.13294 0 lineto
0.13418 0 lineto
Mistroke
0.13542 0 lineto
0.13666 0 lineto
0.1379 0 lineto
0.13914 0 lineto
0.14038 0 lineto
0.14162 0 lineto
0.14286 0 lineto
0.1441 0 lineto
0.14534 0 lineto
0.14658 0 lineto
0.14782 0 lineto
0.14906 0 lineto
0.1503 0 lineto
0.15154 0 lineto
0.15278 0 lineto
0.15402 0 lineto
0.15526 0 lineto
0.1565 0 lineto
0.15774 0 lineto
0.15898 0 lineto
0.16022 0 lineto
0.16146 0 lineto
0.1627 0 lineto
0.16394 1e-05 lineto
0.16518 1e-05 lineto
0.16642 1e-05 lineto
0.16766 2e-05 lineto
0.17014 3e-05 lineto
0.17138 4e-05 lineto
0.17262 5e-05 lineto
0.17386 6e-05 lineto
0.1751 8e-05 lineto
0.17634 0.0001 lineto
0.17758 0.00012 lineto
0.18006 0.00018 lineto
0.18254 0.00026 lineto
0.18502 0.00038 lineto
0.1875 0.00053 lineto
0.18998 0.00073 lineto
0.19246 0.00098 lineto
0.19494 0.0013 lineto
0.19742 0.0017 lineto
0.20238 0.00278 lineto
0.20734 0.0043 lineto
0.2123 0.00634 lineto
0.22222 0.01189 lineto
0.23214 0.01835 lineto
0.2371 0.02115 lineto
0.23958 0.02228 lineto
0.24082 0.02275 lineto
Mistroke
0.24206 0.02315 lineto
0.2433 0.02349 lineto
0.24454 0.02375 lineto
0.24578 0.02393 lineto
0.24702 0.02403 lineto
0.24826 0.02404 lineto
0.2495 0.02397 lineto
0.25074 0.02382 lineto
0.25198 0.02358 lineto
0.25322 0.02325 lineto
0.25446 0.02285 lineto
0.25694 0.02181 lineto
0.2619 0.01895 lineto
0.27183 0.01158 lineto
0.27679 0.008 lineto
0.28175 0.00501 lineto
0.28671 0.00279 lineto
0.28919 0.00198 lineto
0.29167 0.00134 lineto
0.29415 0.00087 lineto
0.29539 0.00069 lineto
0.29663 0.00053 lineto
0.29787 0.00041 lineto
0.29911 0.00031 lineto
0.30035 0.00023 lineto
0.30159 0.00016 lineto
0.30283 0.00011 lineto
0.30407 8e-05 lineto
0.30531 5e-05 lineto
0.30655 3e-05 lineto
0.30779 2e-05 lineto
0.30903 1e-05 lineto
0.31027 1e-05 lineto
0.31151 0 lineto
0.31275 0 lineto
0.31399 0 lineto
0.31523 0 lineto
0.31647 0 lineto
0.31771 0 lineto
0.31895 0 lineto
0.32019 0 lineto
0.32143 0 lineto
0.32267 0 lineto
0.32391 0 lineto
0.32515 0 lineto
0.32639 0 lineto
0.32763 0 lineto
0.32887 0 lineto
0.33011 0 lineto
0.33135 0 lineto
Mistroke
0.33259 1e-05 lineto
0.33383 2e-05 lineto
0.33507 3e-05 lineto
0.33631 5e-05 lineto
0.33755 8e-05 lineto
0.33879 0.00012 lineto
0.34003 0.00018 lineto
0.34127 0.00026 lineto
0.34251 0.00038 lineto
0.34375 0.00053 lineto
0.34499 0.00073 lineto
0.34623 0.00098 lineto
0.34747 0.00131 lineto
0.34871 0.00171 lineto
0.34995 0.00221 lineto
0.35119 0.00283 lineto
0.35367 0.00445 lineto
0.35615 0.00674 lineto
0.35863 0.00986 lineto
0.36111 0.01398 lineto
0.36359 0.01928 lineto
0.36607 0.02595 lineto
0.37103 0.04404 lineto
0.37599 0.06932 lineto
0.38095 0.10229 lineto
0.40079 0.29439 lineto
0.41071 0.39682 lineto
0.41567 0.44086 lineto
0.42063 0.47778 lineto
0.4256 0.50688 lineto
0.42808 0.51852 lineto
0.43056 0.52831 lineto
0.43304 0.5364 lineto
0.43552 0.54294 lineto
0.438 0.54812 lineto
0.44048 0.55211 lineto
0.44296 0.55513 lineto
0.44544 0.55733 lineto
0.44668 0.55819 lineto
0.44792 0.55891 lineto
0.44916 0.5595 lineto
0.4504 0.56 lineto
0.45164 0.5604 lineto
0.45288 0.56072 lineto
0.45412 0.56098 lineto
0.45536 0.56119 lineto
0.4566 0.56135 lineto
0.45784 0.56148 lineto
0.45908 0.56158 lineto
0.46032 0.56165 lineto
Mistroke
0.46156 0.56171 lineto
0.4628 0.56175 lineto
0.46404 0.56178 lineto
0.46528 0.5618 lineto
0.46652 0.56182 lineto
0.46776 0.56183 lineto
0.469 0.56184 lineto
0.47024 0.56184 lineto
0.47148 0.56184 lineto
0.47272 0.56185 lineto
0.47396 0.56185 lineto
0.4752 0.56185 lineto
0.47644 0.56185 lineto
0.47768 0.56185 lineto
0.47892 0.56185 lineto
0.48016 0.56185 lineto
0.4814 0.56185 lineto
0.48264 0.56185 lineto
0.48388 0.56185 lineto
0.48512 0.56185 lineto
0.48636 0.56185 lineto
0.4876 0.56185 lineto
0.48884 0.56185 lineto
0.49008 0.56185 lineto
0.49132 0.56185 lineto
0.49256 0.56185 lineto
0.4938 0.56185 lineto
0.49504 0.56185 lineto
0.49628 0.56185 lineto
0.49752 0.56185 lineto
0.49876 0.56185 lineto
0.5 0.56185 lineto
0.50124 0.56185 lineto
0.50248 0.56185 lineto
0.50372 0.56185 lineto
0.50496 0.56185 lineto
0.5062 0.56185 lineto
0.50744 0.56185 lineto
0.50868 0.56185 lineto
0.50992 0.56185 lineto
0.51116 0.56185 lineto
0.5124 0.56185 lineto
0.51364 0.56185 lineto
0.51488 0.56185 lineto
0.51612 0.56185 lineto
0.51736 0.56185 lineto
0.5186 0.56185 lineto
0.51984 0.56185 lineto
0.52108 0.56185 lineto
0.52232 0.56185 lineto
Mistroke
0.52356 0.56185 lineto
0.5248 0.56185 lineto
0.52604 0.56185 lineto
0.52728 0.56185 lineto
0.52852 0.56184 lineto
0.52976 0.56184 lineto
0.531 0.56184 lineto
0.53224 0.56183 lineto
0.53348 0.56182 lineto
0.53472 0.5618 lineto
0.53596 0.56178 lineto
0.5372 0.56175 lineto
0.53844 0.56171 lineto
0.53968 0.56165 lineto
0.54092 0.56158 lineto
0.54216 0.56148 lineto
0.5434 0.56135 lineto
0.54464 0.56119 lineto
0.54588 0.56098 lineto
0.54712 0.56072 lineto
0.54836 0.5604 lineto
0.5496 0.56 lineto
0.55084 0.5595 lineto
0.55208 0.55891 lineto
0.55456 0.55733 lineto
0.55704 0.55513 lineto
0.55952 0.55211 lineto
0.562 0.54812 lineto
0.56448 0.54294 lineto
0.56696 0.5364 lineto
0.56944 0.52831 lineto
0.5744 0.50688 lineto
0.57937 0.47778 lineto
0.58929 0.39682 lineto
0.59921 0.29439 lineto
0.60913 0.18955 lineto
0.61409 0.14273 lineto
0.61905 0.10229 lineto
0.62401 0.06932 lineto
0.62897 0.04404 lineto
0.63145 0.03416 lineto
0.63393 0.02595 lineto
0.63641 0.01928 lineto
0.63889 0.01398 lineto
0.64137 0.00986 lineto
0.64385 0.00674 lineto
0.64633 0.00445 lineto
0.64757 0.00357 lineto
0.64881 0.00283 lineto
0.65129 0.00171 lineto
Mistroke
0.65253 0.00131 lineto
0.65377 0.00098 lineto
0.65501 0.00073 lineto
0.65625 0.00053 lineto
0.65749 0.00038 lineto
0.65873 0.00026 lineto
0.65997 0.00018 lineto
0.66121 0.00012 lineto
0.66245 8e-05 lineto
0.66369 5e-05 lineto
0.66493 3e-05 lineto
0.66617 2e-05 lineto
0.66741 1e-05 lineto
0.66865 0 lineto
0.66989 0 lineto
0.67113 0 lineto
0.67237 0 lineto
0.67361 0 lineto
0.67485 0 lineto
0.67609 0 lineto
0.67733 0 lineto
0.67857 0 lineto
0.67981 0 lineto
0.68105 0 lineto
0.68229 0 lineto
0.68353 0 lineto
0.68477 0 lineto
0.68601 0 lineto
0.68725 0 lineto
0.68849 0 lineto
0.68973 1e-05 lineto
0.69097 1e-05 lineto
0.69221 2e-05 lineto
0.69345 3e-05 lineto
0.69469 5e-05 lineto
0.69593 8e-05 lineto
0.69717 0.00011 lineto
0.69841 0.00016 lineto
0.69965 0.00023 lineto
0.70089 0.00031 lineto
0.70213 0.00041 lineto
0.70337 0.00053 lineto
0.70585 0.00087 lineto
0.70833 0.00134 lineto
0.71081 0.00198 lineto
0.71329 0.00279 lineto
0.71825 0.00501 lineto
0.72321 0.008 lineto
0.72817 0.01158 lineto
0.73313 0.01538 lineto
Mistroke
0.7381 0.01895 lineto
0.74058 0.0205 lineto
0.74306 0.02181 lineto
0.7443 0.02237 lineto
0.74554 0.02285 lineto
0.74678 0.02325 lineto
0.74802 0.02358 lineto
0.74926 0.02382 lineto
0.7505 0.02397 lineto
0.75174 0.02404 lineto
0.75298 0.02403 lineto
0.75422 0.02393 lineto
0.75546 0.02375 lineto
0.7567 0.02349 lineto
0.75794 0.02315 lineto
0.76042 0.02228 lineto
0.7629 0.02115 lineto
0.76786 0.01835 lineto
0.77778 0.01189 lineto
0.78274 0.00889 lineto
0.7877 0.00634 lineto
0.79266 0.0043 lineto
0.79762 0.00278 lineto
0.80258 0.0017 lineto
0.80506 0.0013 lineto
0.80754 0.00098 lineto
0.81002 0.00073 lineto
0.8125 0.00053 lineto
0.81498 0.00038 lineto
0.81746 0.00026 lineto
0.81994 0.00018 lineto
0.82118 0.00015 lineto
0.82242 0.00012 lineto
0.8249 8e-05 lineto
0.82614 6e-05 lineto
0.82738 5e-05 lineto
0.82862 4e-05 lineto
0.82986 3e-05 lineto
0.8311 2e-05 lineto
0.83234 2e-05 lineto
0.83358 1e-05 lineto
0.83482 1e-05 lineto
0.83606 1e-05 lineto
0.8373 0 lineto
0.83854 0 lineto
0.83978 0 lineto
0.84102 0 lineto
0.84226 0 lineto
0.8435 0 lineto
0.84474 0 lineto
Mistroke
0.84598 0 lineto
0.84722 0 lineto
0.84846 0 lineto
0.8497 0 lineto
0.85094 0 lineto
0.85218 0 lineto
0.85342 0 lineto
0.85466 0 lineto
0.8559 0 lineto
0.85714 0 lineto
0.85838 0 lineto
0.85962 0 lineto
0.86086 0 lineto
0.8621 0 lineto
0.86334 0 lineto
0.86458 0 lineto
0.86582 0 lineto
0.86706 0 lineto
0.8683 0 lineto
0.86954 0 lineto
0.87078 0 lineto
0.87202 0 lineto
0.87326 0 lineto
0.8745 0 lineto
0.87574 0 lineto
0.87698 0 lineto
0.87822 0 lineto
0.87946 1e-05 lineto
0.8807 1e-05 lineto
0.88194 1e-05 lineto
0.88318 2e-05 lineto
0.88442 2e-05 lineto
0.88566 3e-05 lineto
0.8869 3e-05 lineto
0.88938 5e-05 lineto
0.89187 8e-05 lineto
0.89435 0.00011 lineto
0.89683 0.00016 lineto
0.89931 0.00023 lineto
0.90179 0.00031 lineto
0.90427 0.00041 lineto
0.90675 0.00053 lineto
0.91171 0.00087 lineto
0.91667 0.00133 lineto
0.92163 0.00192 lineto
0.92659 0.00264 lineto
0.93651 0.0043 lineto
0.94147 0.00509 lineto
0.94395 0.00543 lineto
0.94643 0.00572 lineto
Mistroke
0.94767 0.00584 lineto
0.94891 0.00594 lineto
0.95015 0.00603 lineto
0.95139 0.0061 lineto
0.95263 0.00614 lineto
0.95387 0.00617 lineto
0.95511 0.00618 lineto
0.95635 0.00616 lineto
0.95759 0.00612 lineto
0.95883 0.00607 lineto
0.96007 0.00599 lineto
0.96131 0.00589 lineto
0.96379 0.00563 lineto
0.96627 0.00531 lineto
0.97619 0.00357 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.178571 1.946143e-17 0.561849 [
[(-2)] 0.14286 0 0 2 Msboxa
[(-1)] 0.32143 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(1)] 0.67857 0 0 2 Msboxa
[(2)] 0.85714 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 6)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.14286 0 moveto
0.14286 0.00625 lineto
stroke
grestore
[(-2)] 0.14286 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.32143 0 moveto
0.32143 0.00625 lineto
stroke
grestore
[(-1)] 0.32143 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.67857 0 moveto
0.67857 0.00625 lineto
stroke
grestore
[(1)] 0.67857 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.85714 0 moveto
0.85714 0.00625 lineto
stroke
grestore
[(2)] 0.85714 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.17857 0 moveto
0.17857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.21429 0 moveto
0.21429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.25 0 moveto
0.25 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.28571 0 moveto
0.28571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.35714 0 moveto
0.35714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.39286 0 moveto
0.39286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.42857 0 moveto
0.42857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.46429 0 moveto
0.46429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.53571 0 moveto
0.53571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.57143 0 moveto
0.57143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.60714 0 moveto
0.60714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.64286 0 moveto
0.64286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.71429 0 moveto
0.71429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.75 0 moveto
0.75 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.78571 0 moveto
0.78571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82143 0 moveto
0.82143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.10714 0 moveto
0.10714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.07143 0 moveto
0.07143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.03571 0 moveto
0.03571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.89286 0 moveto
0.89286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.92857 0 moveto
0.92857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.96429 0 moveto
0.96429 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 6)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0.00351 moveto
0.02877 0.00443 lineto
0.03373 0.00523 lineto
0.03621 0.00555 lineto
0.03745 0.00569 lineto
0.03869 0.00581 lineto
0.03993 0.00591 lineto
0.04117 0.00599 lineto
0.04241 0.00605 lineto
0.04365 0.00609 lineto
0.04489 0.0061 lineto
0.04613 0.0061 lineto
0.04737 0.00608 lineto
0.04861 0.00603 lineto
0.04985 0.00596 lineto
0.05109 0.00588 lineto
0.05357 0.00566 lineto
0.05853 0.00504 lineto
0.06349 0.00427 lineto
0.07341 0.00263 lineto
0.07837 0.00191 lineto
0.08333 0.00132 lineto
0.08829 0.00086 lineto
0.09077 0.00068 lineto
0.09325 0.00053 lineto
0.09573 0.00041 lineto
0.09821 0.00031 lineto
0.10069 0.00023 lineto
0.10317 0.00016 lineto
0.10565 0.00011 lineto
0.10813 8e-05 lineto
0.11062 5e-05 lineto
0.11186 4e-05 lineto
0.1131 3e-05 lineto
0.11434 3e-05 lineto
0.11558 2e-05 lineto
0.11806 1e-05 lineto
0.1193 1e-05 lineto
0.12054 1e-05 lineto
0.12178 0 lineto
0.12302 0 lineto
0.12426 0 lineto
0.1255 0 lineto
0.12674 0 lineto
0.12798 0 lineto
0.12922 0 lineto
0.13046 0 lineto
0.1317 0 lineto
0.13294 0 lineto
0.13418 0 lineto
Mistroke
0.13542 0 lineto
0.13666 0 lineto
0.1379 0 lineto
0.13914 0 lineto
0.14038 0 lineto
0.14162 0 lineto
0.14286 0 lineto
0.1441 0 lineto
0.14534 0 lineto
0.14658 0 lineto
0.14782 0 lineto
0.14906 0 lineto
0.1503 0 lineto
0.15154 0 lineto
0.15278 0 lineto
0.15402 0 lineto
0.15526 0 lineto
0.1565 0 lineto
0.15774 0 lineto
0.15898 0 lineto
0.16022 0 lineto
0.16146 0 lineto
0.1627 0 lineto
0.16394 1e-05 lineto
0.16518 1e-05 lineto
0.16642 1e-05 lineto
0.16766 2e-05 lineto
0.17014 3e-05 lineto
0.17138 4e-05 lineto
0.17262 5e-05 lineto
0.17386 6e-05 lineto
0.1751 8e-05 lineto
0.17634 0.0001 lineto
0.17758 0.00012 lineto
0.18006 0.00018 lineto
0.18254 0.00026 lineto
0.18502 0.00038 lineto
0.1875 0.00053 lineto
0.18998 0.00073 lineto
0.19246 0.00098 lineto
0.19494 0.0013 lineto
0.19742 0.0017 lineto
0.20238 0.00278 lineto
0.20734 0.0043 lineto
0.2123 0.00634 lineto
0.22222 0.01189 lineto
0.23214 0.01835 lineto
0.2371 0.02115 lineto
0.23958 0.02228 lineto
0.24082 0.02275 lineto
Mistroke
0.24206 0.02315 lineto
0.2433 0.02349 lineto
0.24454 0.02375 lineto
0.24578 0.02393 lineto
0.24702 0.02402 lineto
0.24826 0.02404 lineto
0.2495 0.02397 lineto
0.25074 0.02381 lineto
0.25198 0.02358 lineto
0.25322 0.02325 lineto
0.25446 0.02285 lineto
0.25694 0.02181 lineto
0.2619 0.01895 lineto
0.27183 0.01158 lineto
0.27679 0.008 lineto
0.28175 0.00501 lineto
0.28671 0.00279 lineto
0.28919 0.00198 lineto
0.29167 0.00134 lineto
0.29415 0.00087 lineto
0.29539 0.00069 lineto
0.29663 0.00053 lineto
0.29787 0.00041 lineto
0.29911 0.00031 lineto
0.30035 0.00023 lineto
0.30159 0.00016 lineto
0.30283 0.00011 lineto
0.30407 8e-05 lineto
0.30531 5e-05 lineto
0.30655 3e-05 lineto
0.30779 2e-05 lineto
0.30903 1e-05 lineto
0.31027 1e-05 lineto
0.31151 0 lineto
0.31275 0 lineto
0.31399 0 lineto
0.31523 0 lineto
0.31647 0 lineto
0.31771 0 lineto
0.31895 0 lineto
0.32019 0 lineto
0.32143 0 lineto
0.32267 0 lineto
0.32391 0 lineto
0.32515 0 lineto
0.32639 0 lineto
0.32763 0 lineto
0.32887 0 lineto
0.33011 0 lineto
0.33135 0 lineto
Mistroke
0.33259 1e-05 lineto
0.33383 2e-05 lineto
0.33507 3e-05 lineto
0.33631 5e-05 lineto
0.33755 8e-05 lineto
0.33879 0.00012 lineto
0.34003 0.00018 lineto
0.34127 0.00026 lineto
0.34251 0.00038 lineto
0.34375 0.00053 lineto
0.34499 0.00073 lineto
0.34623 0.00098 lineto
0.34747 0.00131 lineto
0.34871 0.00171 lineto
0.34995 0.00221 lineto
0.35119 0.00283 lineto
0.35367 0.00445 lineto
0.35615 0.00674 lineto
0.35863 0.00986 lineto
0.36111 0.01398 lineto
0.36359 0.01928 lineto
0.36607 0.02595 lineto
0.37103 0.04404 lineto
0.37599 0.06932 lineto
0.38095 0.10229 lineto
0.40079 0.29439 lineto
0.41071 0.39682 lineto
0.41567 0.44086 lineto
0.42063 0.47778 lineto
0.4256 0.50688 lineto
0.42808 0.51852 lineto
0.43056 0.52831 lineto
0.43304 0.5364 lineto
0.43552 0.54294 lineto
0.438 0.54812 lineto
0.44048 0.55211 lineto
0.44296 0.55513 lineto
0.44544 0.55733 lineto
0.44668 0.55819 lineto
0.44792 0.55891 lineto
0.44916 0.5595 lineto
0.4504 0.56 lineto
0.45164 0.5604 lineto
0.45288 0.56072 lineto
0.45412 0.56098 lineto
0.45536 0.56119 lineto
0.4566 0.56135 lineto
0.45784 0.56148 lineto
0.45908 0.56158 lineto
0.46032 0.56165 lineto
Mistroke
0.46156 0.56171 lineto
0.4628 0.56175 lineto
0.46404 0.56178 lineto
0.46528 0.5618 lineto
0.46652 0.56182 lineto
0.46776 0.56183 lineto
0.469 0.56184 lineto
0.47024 0.56184 lineto
0.47148 0.56184 lineto
0.47272 0.56185 lineto
0.47396 0.56185 lineto
0.4752 0.56185 lineto
0.47644 0.56185 lineto
0.47768 0.56185 lineto
0.47892 0.56185 lineto
0.48016 0.56185 lineto
0.4814 0.56185 lineto
0.48264 0.56185 lineto
0.48388 0.56185 lineto
0.48512 0.56185 lineto
0.48636 0.56185 lineto
0.4876 0.56185 lineto
0.48884 0.56185 lineto
0.49008 0.56185 lineto
0.49132 0.56185 lineto
0.49256 0.56185 lineto
0.4938 0.56185 lineto
0.49504 0.56185 lineto
0.49628 0.56185 lineto
0.49752 0.56185 lineto
0.5 0.56185 lineto
0.50124 0.56185 lineto
0.50248 0.56185 lineto
0.50372 0.56185 lineto
0.50496 0.56185 lineto
0.5062 0.56185 lineto
0.50744 0.56185 lineto
0.50868 0.56185 lineto
0.50992 0.56185 lineto
0.51116 0.56185 lineto
0.5124 0.56185 lineto
0.51364 0.56185 lineto
0.51488 0.56185 lineto
0.51612 0.56185 lineto
0.51736 0.56185 lineto
0.5186 0.56185 lineto
0.51984 0.56185 lineto
0.52108 0.56185 lineto
0.52232 0.56185 lineto
0.52356 0.56185 lineto
Mistroke
0.5248 0.56185 lineto
0.52604 0.56185 lineto
0.52728 0.56185 lineto
0.52852 0.56184 lineto
0.52976 0.56184 lineto
0.531 0.56184 lineto
0.53224 0.56183 lineto
0.53348 0.56182 lineto
0.53472 0.5618 lineto
0.53596 0.56178 lineto
0.5372 0.56175 lineto
0.53844 0.56171 lineto
0.53968 0.56165 lineto
0.54092 0.56158 lineto
0.54216 0.56148 lineto
0.5434 0.56135 lineto
0.54464 0.56119 lineto
0.54588 0.56098 lineto
0.54712 0.56072 lineto
0.54836 0.5604 lineto
0.5496 0.56 lineto
0.55084 0.5595 lineto
0.55208 0.55891 lineto
0.55456 0.55733 lineto
0.55704 0.55513 lineto
0.55952 0.55211 lineto
0.562 0.54812 lineto
0.56448 0.54294 lineto
0.56696 0.5364 lineto
0.56944 0.52831 lineto
0.5744 0.50688 lineto
0.57937 0.47778 lineto
0.58929 0.39682 lineto
0.59921 0.29439 lineto
0.60913 0.18955 lineto
0.61409 0.14273 lineto
0.61905 0.10229 lineto
0.62401 0.06932 lineto
0.62897 0.04404 lineto
0.63145 0.03416 lineto
0.63393 0.02595 lineto
0.63641 0.01928 lineto
0.63889 0.01398 lineto
0.64137 0.00986 lineto
0.64385 0.00674 lineto
0.64633 0.00445 lineto
0.64757 0.00357 lineto
0.64881 0.00283 lineto
0.65129 0.00171 lineto
0.65253 0.00131 lineto
Mistroke
0.65377 0.00098 lineto
0.65501 0.00073 lineto
0.65625 0.00053 lineto
0.65749 0.00038 lineto
0.65873 0.00026 lineto
0.65997 0.00018 lineto
0.66121 0.00012 lineto
0.66245 8e-05 lineto
0.66369 5e-05 lineto
0.66493 3e-05 lineto
0.66617 2e-05 lineto
0.66741 1e-05 lineto
0.66865 0 lineto
0.66989 0 lineto
0.67113 0 lineto
0.67237 0 lineto
0.67361 0 lineto
0.67485 0 lineto
0.67609 0 lineto
0.67733 0 lineto
0.67857 0 lineto
0.67981 0 lineto
0.68105 0 lineto
0.68229 0 lineto
0.68353 0 lineto
0.68477 0 lineto
0.68601 0 lineto
0.68725 0 lineto
0.68849 0 lineto
0.68973 1e-05 lineto
0.69097 1e-05 lineto
0.69221 2e-05 lineto
0.69345 3e-05 lineto
0.69469 5e-05 lineto
0.69593 8e-05 lineto
0.69717 0.00011 lineto
0.69841 0.00016 lineto
0.69965 0.00023 lineto
0.70089 0.00031 lineto
0.70213 0.00041 lineto
0.70337 0.00053 lineto
0.70585 0.00087 lineto
0.70833 0.00134 lineto
0.71081 0.00198 lineto
0.71329 0.00279 lineto
0.71825 0.00501 lineto
0.72321 0.008 lineto
0.72817 0.01158 lineto
0.73313 0.01538 lineto
0.7381 0.01895 lineto
Mistroke
0.74058 0.0205 lineto
0.74306 0.02181 lineto
0.7443 0.02237 lineto
0.74554 0.02285 lineto
0.74678 0.02325 lineto
0.74802 0.02358 lineto
0.74926 0.02381 lineto
0.7505 0.02397 lineto
0.75174 0.02404 lineto
0.75298 0.02402 lineto
0.75422 0.02393 lineto
0.75546 0.02375 lineto
0.7567 0.02349 lineto
0.75794 0.02315 lineto
0.76042 0.02228 lineto
0.7629 0.02115 lineto
0.76786 0.01835 lineto
0.77778 0.01189 lineto
0.78274 0.00889 lineto
0.7877 0.00634 lineto
0.79266 0.0043 lineto
0.79762 0.00278 lineto
0.80258 0.0017 lineto
0.80506 0.0013 lineto
0.80754 0.00098 lineto
0.81002 0.00073 lineto
0.8125 0.00053 lineto
0.81498 0.00038 lineto
0.81746 0.00026 lineto
0.81994 0.00018 lineto
0.82118 0.00015 lineto
0.82242 0.00012 lineto
0.8249 8e-05 lineto
0.82614 6e-05 lineto
0.82738 5e-05 lineto
0.82862 4e-05 lineto
0.82986 3e-05 lineto
0.8311 2e-05 lineto
0.83234 2e-05 lineto
0.83358 1e-05 lineto
0.83482 1e-05 lineto
0.83606 1e-05 lineto
0.8373 0 lineto
0.83854 0 lineto
0.83978 0 lineto
0.84102 0 lineto
0.84226 0 lineto
0.8435 0 lineto
0.84474 0 lineto
0.84598 0 lineto
Mistroke
0.84722 0 lineto
0.84846 0 lineto
0.8497 0 lineto
0.85094 0 lineto
0.85218 0 lineto
0.85342 0 lineto
0.85466 0 lineto
0.8559 0 lineto
0.85714 0 lineto
0.85838 0 lineto
0.85962 0 lineto
0.86086 0 lineto
0.8621 0 lineto
0.86334 0 lineto
0.86458 0 lineto
0.86582 0 lineto
0.86706 0 lineto
0.8683 0 lineto
0.86954 0 lineto
0.87078 0 lineto
0.87202 0 lineto
0.87326 0 lineto
0.8745 0 lineto
0.87574 0 lineto
0.87698 0 lineto
0.87822 0 lineto
0.87946 1e-05 lineto
0.8807 1e-05 lineto
0.88194 1e-05 lineto
0.88318 2e-05 lineto
0.88442 2e-05 lineto
0.88566 3e-05 lineto
0.8869 3e-05 lineto
0.88938 5e-05 lineto
0.89187 8e-05 lineto
0.89435 0.00011 lineto
0.89683 0.00016 lineto
0.89931 0.00023 lineto
0.90179 0.00031 lineto
0.90427 0.00041 lineto
0.90675 0.00053 lineto
0.91171 0.00086 lineto
0.91667 0.00132 lineto
0.92163 0.00191 lineto
0.92659 0.00263 lineto
0.93651 0.00427 lineto
0.94147 0.00504 lineto
0.94395 0.00538 lineto
0.94643 0.00566 lineto
0.94767 0.00578 lineto
Mistroke
0.94891 0.00588 lineto
0.95015 0.00596 lineto
0.95139 0.00603 lineto
0.95263 0.00608 lineto
0.95387 0.0061 lineto
0.95511 0.0061 lineto
0.95635 0.00609 lineto
0.95759 0.00605 lineto
0.95883 0.00599 lineto
0.96007 0.00591 lineto
0.96131 0.00581 lineto
0.96379 0.00555 lineto
0.96627 0.00523 lineto
0.97619 0.00351 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; endGroup; endGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.178571 1.946143e-17 0.561849 [
[(-2)] 0.14286 0 0 2 Msboxa
[(-1)] 0.32143 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(1)] 0.67857 0 0 2 Msboxa
[(2)] 0.85714 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 6)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.14286 0 moveto
0.14286 0.00625 lineto
stroke
grestore
[(-2)] 0.14286 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.32143 0 moveto
0.32143 0.00625 lineto
stroke
grestore
[(-1)] 0.32143 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.67857 0 moveto
0.67857 0.00625 lineto
stroke
grestore
[(1)] 0.67857 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.85714 0 moveto
0.85714 0.00625 lineto
stroke
grestore
[(2)] 0.85714 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.17857 0 moveto
0.17857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.21429 0 moveto
0.21429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.25 0 moveto
0.25 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.28571 0 moveto
0.28571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.35714 0 moveto
0.35714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.39286 0 moveto
0.39286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.42857 0 moveto
0.42857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.46429 0 moveto
0.46429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.53571 0 moveto
0.53571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.57143 0 moveto
0.57143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.60714 0 moveto
0.60714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.64286 0 moveto
0.64286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.71429 0 moveto
0.71429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.75 0 moveto
0.75 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.78571 0 moveto
0.78571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82143 0 moveto
0.82143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.10714 0 moveto
0.10714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.07143 0 moveto
0.07143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.03571 0 moveto
0.03571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.89286 0 moveto
0.89286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.92857 0 moveto
0.92857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.96429 0 moveto
0.96429 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 6)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0.00351 moveto
0.02877 0.00443 lineto
0.03373 0.00523 lineto
0.03621 0.00555 lineto
0.03745 0.00569 lineto
0.03869 0.00581 lineto
0.03993 0.00591 lineto
0.04117 0.00599 lineto
0.04241 0.00605 lineto
0.04365 0.00609 lineto
0.04489 0.0061 lineto
0.04613 0.0061 lineto
0.04737 0.00607 lineto
0.04861 0.00603 lineto
0.04985 0.00596 lineto
0.05109 0.00588 lineto
0.05357 0.00566 lineto
0.05853 0.00504 lineto
0.06349 0.00427 lineto
0.07341 0.00263 lineto
0.07837 0.00191 lineto
0.08333 0.00132 lineto
0.08829 0.00086 lineto
0.09077 0.00068 lineto
0.09325 0.00053 lineto
0.09573 0.00041 lineto
0.09821 0.00031 lineto
0.10069 0.00023 lineto
0.10317 0.00016 lineto
0.10565 0.00011 lineto
0.10813 8e-05 lineto
0.11062 5e-05 lineto
0.11186 4e-05 lineto
0.1131 3e-05 lineto
0.11434 3e-05 lineto
0.11558 2e-05 lineto
0.11806 1e-05 lineto
0.1193 1e-05 lineto
0.12054 1e-05 lineto
0.12178 0 lineto
0.12302 0 lineto
0.12426 0 lineto
0.1255 0 lineto
0.12674 0 lineto
0.12798 0 lineto
0.12922 0 lineto
0.13046 0 lineto
0.1317 0 lineto
0.13294 0 lineto
0.13418 0 lineto
Mistroke
0.13542 0 lineto
0.13666 0 lineto
0.1379 0 lineto
0.13914 0 lineto
0.14038 0 lineto
0.14162 0 lineto
0.14286 0 lineto
0.1441 0 lineto
0.14534 0 lineto
0.14658 0 lineto
0.14782 0 lineto
0.14906 0 lineto
0.1503 0 lineto
0.15154 0 lineto
0.15278 0 lineto
0.15402 0 lineto
0.15526 0 lineto
0.1565 0 lineto
0.15774 0 lineto
0.15898 0 lineto
0.16022 0 lineto
0.16146 0 lineto
0.1627 0 lineto
0.16394 1e-05 lineto
0.16518 1e-05 lineto
0.16642 1e-05 lineto
0.16766 2e-05 lineto
0.17014 3e-05 lineto
0.17138 4e-05 lineto
0.17262 5e-05 lineto
0.17386 6e-05 lineto
0.1751 8e-05 lineto
0.17634 0.0001 lineto
0.17758 0.00012 lineto
0.18006 0.00018 lineto
0.18254 0.00026 lineto
0.18502 0.00038 lineto
0.1875 0.00053 lineto
0.18998 0.00073 lineto
0.19246 0.00098 lineto
0.19494 0.0013 lineto
0.19742 0.0017 lineto
0.20238 0.00278 lineto
0.20734 0.0043 lineto
0.2123 0.00634 lineto
0.22222 0.01189 lineto
0.23214 0.01835 lineto
0.2371 0.02115 lineto
0.23958 0.02228 lineto
0.24082 0.02275 lineto
Mistroke
0.24206 0.02315 lineto
0.2433 0.02349 lineto
0.24454 0.02375 lineto
0.24578 0.02393 lineto
0.24702 0.02402 lineto
0.24826 0.02404 lineto
0.2495 0.02397 lineto
0.25074 0.02381 lineto
0.25198 0.02358 lineto
0.25322 0.02325 lineto
0.25446 0.02285 lineto
0.25694 0.02181 lineto
0.2619 0.01895 lineto
0.27183 0.01158 lineto
0.27679 0.008 lineto
0.28175 0.00501 lineto
0.28671 0.00279 lineto
0.28919 0.00198 lineto
0.29167 0.00134 lineto
0.29415 0.00087 lineto
0.29539 0.00069 lineto
0.29663 0.00053 lineto
0.29787 0.00041 lineto
0.29911 0.00031 lineto
0.30035 0.00023 lineto
0.30159 0.00016 lineto
0.30283 0.00011 lineto
0.30407 8e-05 lineto
0.30531 5e-05 lineto
0.30655 3e-05 lineto
0.30779 2e-05 lineto
0.30903 1e-05 lineto
0.31027 1e-05 lineto
0.31151 0 lineto
0.31275 0 lineto
0.31399 0 lineto
0.31523 0 lineto
0.31647 0 lineto
0.31771 0 lineto
0.31895 0 lineto
0.32019 0 lineto
0.32143 0 lineto
0.32267 0 lineto
0.32391 0 lineto
0.32515 0 lineto
0.32639 0 lineto
0.32763 0 lineto
0.32887 0 lineto
0.33011 0 lineto
0.33135 0 lineto
Mistroke
0.33259 1e-05 lineto
0.33383 2e-05 lineto
0.33507 3e-05 lineto
0.33631 5e-05 lineto
0.33755 8e-05 lineto
0.33879 0.00012 lineto
0.34003 0.00018 lineto
0.34127 0.00026 lineto
0.34251 0.00038 lineto
0.34375 0.00053 lineto
0.34499 0.00073 lineto
0.34623 0.00098 lineto
0.34747 0.00131 lineto
0.34871 0.00171 lineto
0.34995 0.00221 lineto
0.35119 0.00283 lineto
0.35367 0.00445 lineto
0.35615 0.00674 lineto
0.35863 0.00986 lineto
0.36111 0.01398 lineto
0.36359 0.01928 lineto
0.36607 0.02595 lineto
0.37103 0.04404 lineto
0.37599 0.06932 lineto
0.38095 0.10229 lineto
0.40079 0.29439 lineto
0.41071 0.39682 lineto
0.41567 0.44086 lineto
0.42063 0.47778 lineto
0.4256 0.50688 lineto
0.42808 0.51852 lineto
0.43056 0.52831 lineto
0.43304 0.5364 lineto
0.43552 0.54294 lineto
0.438 0.54812 lineto
0.44048 0.55211 lineto
0.44296 0.55513 lineto
0.44544 0.55733 lineto
0.44668 0.55819 lineto
0.44792 0.55891 lineto
0.44916 0.5595 lineto
0.4504 0.56 lineto
0.45164 0.5604 lineto
0.45288 0.56072 lineto
0.45412 0.56098 lineto
0.45536 0.56119 lineto
0.4566 0.56135 lineto
0.45784 0.56148 lineto
0.45908 0.56158 lineto
0.46032 0.56165 lineto
Mistroke
0.46156 0.56171 lineto
0.4628 0.56175 lineto
0.46404 0.56178 lineto
0.46528 0.5618 lineto
0.46652 0.56182 lineto
0.46776 0.56183 lineto
0.469 0.56184 lineto
0.47024 0.56184 lineto
0.47148 0.56184 lineto
0.47272 0.56185 lineto
0.47396 0.56185 lineto
0.4752 0.56185 lineto
0.47644 0.56185 lineto
0.47768 0.56185 lineto
0.47892 0.56185 lineto
0.48016 0.56185 lineto
0.4814 0.56185 lineto
0.48264 0.56185 lineto
0.48388 0.56185 lineto
0.48512 0.56185 lineto
0.48636 0.56185 lineto
0.4876 0.56185 lineto
0.48884 0.56185 lineto
0.49008 0.56185 lineto
0.49132 0.56185 lineto
0.49256 0.56185 lineto
0.4938 0.56185 lineto
0.49504 0.56185 lineto
0.49628 0.56185 lineto
0.49752 0.56185 lineto
0.49876 0.56185 lineto
0.5 0.56185 lineto
0.50124 0.56185 lineto
0.50248 0.56185 lineto
0.50372 0.56185 lineto
0.50496 0.56185 lineto
0.5062 0.56185 lineto
0.50744 0.56185 lineto
0.50868 0.56185 lineto
0.50992 0.56185 lineto
0.51116 0.56185 lineto
0.5124 0.56185 lineto
0.51364 0.56185 lineto
0.51488 0.56185 lineto
0.51612 0.56185 lineto
0.51736 0.56185 lineto
0.5186 0.56185 lineto
0.51984 0.56185 lineto
0.52108 0.56185 lineto
0.52232 0.56185 lineto
Mistroke
0.52356 0.56185 lineto
0.5248 0.56185 lineto
0.52604 0.56185 lineto
0.52728 0.56185 lineto
0.52852 0.56184 lineto
0.52976 0.56184 lineto
0.531 0.56184 lineto
0.53224 0.56183 lineto
0.53348 0.56182 lineto
0.53472 0.5618 lineto
0.53596 0.56178 lineto
0.5372 0.56175 lineto
0.53844 0.56171 lineto
0.53968 0.56165 lineto
0.54092 0.56158 lineto
0.54216 0.56148 lineto
0.5434 0.56135 lineto
0.54464 0.56119 lineto
0.54588 0.56098 lineto
0.54712 0.56072 lineto
0.54836 0.5604 lineto
0.5496 0.56 lineto
0.55084 0.5595 lineto
0.55208 0.55891 lineto
0.55456 0.55733 lineto
0.55704 0.55513 lineto
0.55952 0.55211 lineto
0.562 0.54812 lineto
0.56448 0.54294 lineto
0.56696 0.5364 lineto
0.56944 0.52831 lineto
0.5744 0.50688 lineto
0.57937 0.47778 lineto
0.58929 0.39682 lineto
0.59921 0.29439 lineto
0.60913 0.18955 lineto
0.61409 0.14273 lineto
0.61905 0.10229 lineto
0.62401 0.06932 lineto
0.62897 0.04404 lineto
0.63145 0.03416 lineto
0.63393 0.02595 lineto
0.63641 0.01928 lineto
0.63889 0.01398 lineto
0.64137 0.00986 lineto
0.64385 0.00674 lineto
0.64633 0.00445 lineto
0.64757 0.00357 lineto
0.64881 0.00283 lineto
0.65129 0.00171 lineto
Mistroke
0.65253 0.00131 lineto
0.65377 0.00098 lineto
0.65501 0.00073 lineto
0.65625 0.00053 lineto
0.65749 0.00038 lineto
0.65873 0.00026 lineto
0.65997 0.00018 lineto
0.66121 0.00012 lineto
0.66245 8e-05 lineto
0.66369 5e-05 lineto
0.66493 3e-05 lineto
0.66617 2e-05 lineto
0.66741 1e-05 lineto
0.66865 0 lineto
0.66989 0 lineto
0.67113 0 lineto
0.67237 0 lineto
0.67361 0 lineto
0.67485 0 lineto
0.67609 0 lineto
0.67733 0 lineto
0.67857 0 lineto
0.67981 0 lineto
0.68105 0 lineto
0.68229 0 lineto
0.68353 0 lineto
0.68477 0 lineto
0.68601 0 lineto
0.68725 0 lineto
0.68849 0 lineto
0.68973 1e-05 lineto
0.69097 1e-05 lineto
0.69221 2e-05 lineto
0.69345 3e-05 lineto
0.69469 5e-05 lineto
0.69593 8e-05 lineto
0.69717 0.00011 lineto
0.69841 0.00016 lineto
0.69965 0.00023 lineto
0.70089 0.00031 lineto
0.70213 0.00041 lineto
0.70337 0.00053 lineto
0.70585 0.00087 lineto
0.70833 0.00134 lineto
0.71081 0.00198 lineto
0.71329 0.00279 lineto
0.71825 0.00501 lineto
0.72321 0.008 lineto
0.72817 0.01158 lineto
0.73313 0.01538 lineto
Mistroke
0.7381 0.01895 lineto
0.74058 0.0205 lineto
0.74306 0.02181 lineto
0.7443 0.02237 lineto
0.74554 0.02285 lineto
0.74678 0.02325 lineto
0.74802 0.02358 lineto
0.74926 0.02381 lineto
0.7505 0.02397 lineto
0.75174 0.02404 lineto
0.75298 0.02402 lineto
0.75422 0.02393 lineto
0.75546 0.02375 lineto
0.7567 0.02349 lineto
0.75794 0.02315 lineto
0.76042 0.02228 lineto
0.7629 0.02115 lineto
0.76786 0.01835 lineto
0.77778 0.01189 lineto
0.78274 0.00889 lineto
0.7877 0.00634 lineto
0.79266 0.0043 lineto
0.79762 0.00278 lineto
0.80258 0.0017 lineto
0.80506 0.0013 lineto
0.80754 0.00098 lineto
0.81002 0.00073 lineto
0.8125 0.00053 lineto
0.81498 0.00038 lineto
0.81746 0.00026 lineto
0.81994 0.00018 lineto
0.82118 0.00015 lineto
0.82242 0.00012 lineto
0.8249 8e-05 lineto
0.82614 6e-05 lineto
0.82738 5e-05 lineto
0.82862 4e-05 lineto
0.82986 3e-05 lineto
0.8311 2e-05 lineto
0.83234 2e-05 lineto
0.83358 1e-05 lineto
0.83482 1e-05 lineto
0.83606 1e-05 lineto
0.8373 0 lineto
0.83854 0 lineto
0.83978 0 lineto
0.84102 0 lineto
0.84226 0 lineto
0.8435 0 lineto
0.84474 0 lineto
Mistroke
0.84598 0 lineto
0.84722 0 lineto
0.84846 0 lineto
0.8497 0 lineto
0.85094 0 lineto
0.85218 0 lineto
0.85342 0 lineto
0.85466 0 lineto
0.8559 0 lineto
0.85714 0 lineto
0.85838 0 lineto
0.85962 0 lineto
0.86086 0 lineto
0.8621 0 lineto
0.86334 0 lineto
0.86458 0 lineto
0.86582 0 lineto
0.86706 0 lineto
0.8683 0 lineto
0.86954 0 lineto
0.87078 0 lineto
0.87202 0 lineto
0.87326 0 lineto
0.8745 0 lineto
0.87574 0 lineto
0.87698 0 lineto
0.87822 0 lineto
0.87946 1e-05 lineto
0.8807 1e-05 lineto
0.88194 1e-05 lineto
0.88318 2e-05 lineto
0.88442 2e-05 lineto
0.88566 3e-05 lineto
0.8869 3e-05 lineto
0.88938 5e-05 lineto
0.89187 8e-05 lineto
0.89435 0.00011 lineto
0.89683 0.00016 lineto
0.89931 0.00023 lineto
0.90179 0.00031 lineto
0.90427 0.00041 lineto
0.90675 0.00053 lineto
0.91171 0.00086 lineto
0.91667 0.00132 lineto
0.92163 0.00191 lineto
0.92659 0.00263 lineto
0.93651 0.00427 lineto
0.94147 0.00504 lineto
0.94395 0.00538 lineto
0.94643 0.00566 lineto
Mistroke
0.94767 0.00578 lineto
0.94891 0.00588 lineto
0.95015 0.00596 lineto
0.95139 0.00603 lineto
0.95263 0.00607 lineto
0.95387 0.0061 lineto
0.95511 0.0061 lineto
0.95635 0.00609 lineto
0.95759 0.00605 lineto
0.95883 0.00599 lineto
0.96007 0.00591 lineto
0.96131 0.00581 lineto
0.96379 0.00555 lineto
0.96627 0.00523 lineto
0.97619 0.00351 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = text; inactive; preserveAspect; ]
Here's what I did to get plots for a paper I wrote:
:[font = input; preserveAspect; startGroup; ]
Do[
	PlotPhiHat[2^k, 6 - k],
{k, 3}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; startGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.059524 1.94614e-17 0.561849 [
[(-7.5)] 0.05357 0 0 2 Msboxa
[(-5)] 0.20238 0 0 2 Msboxa
[(-2.5)] 0.35119 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(2.5)] 0.64881 0 0 2 Msboxa
[(5)] 0.79762 0 0 2 Msboxa
[(7.5)] 0.94643 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 2)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.05357 0 moveto
0.05357 0.00625 lineto
stroke
grestore
[(-7.5)] 0.05357 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.20238 0 moveto
0.20238 0.00625 lineto
stroke
grestore
[(-5)] 0.20238 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.35119 0 moveto
0.35119 0.00625 lineto
stroke
grestore
[(-2.5)] 0.35119 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.64881 0 moveto
0.64881 0.00625 lineto
stroke
grestore
[(2.5)] 0.64881 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.79762 0 moveto
0.79762 0.00625 lineto
stroke
grestore
[(5)] 0.79762 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.94643 0 moveto
0.94643 0.00625 lineto
stroke
grestore
[(7.5)] 0.94643 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.08333 0 moveto
0.08333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1131 0 moveto
0.1131 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.14286 0 moveto
0.14286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.17262 0 moveto
0.17262 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.23214 0 moveto
0.23214 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.2619 0 moveto
0.2619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.29167 0 moveto
0.29167 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.32143 0 moveto
0.32143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.38095 0 moveto
0.38095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.41071 0 moveto
0.41071 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.44048 0 moveto
0.44048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.47024 0 moveto
0.47024 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.52976 0 moveto
0.52976 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.55952 0 moveto
0.55952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.58929 0 moveto
0.58929 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.61905 0 moveto
0.61905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.67857 0 moveto
0.67857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.70833 0 moveto
0.70833 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.7381 0 moveto
0.7381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.76786 0 moveto
0.76786 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82738 0 moveto
0.82738 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.85714 0 moveto
0.85714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.8869 0 moveto
0.8869 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.91667 0 moveto
0.91667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0 moveto
0.02381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.97619 0 moveto
0.97619 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 2)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0 moveto
0.02505 1e-05 lineto
0.02629 5e-05 lineto
0.02753 0.0001 lineto
0.02877 0.00019 lineto
0.03125 0.00042 lineto
0.03373 0.00075 lineto
0.03869 0.00166 lineto
0.04365 0.00281 lineto
0.04861 0.00397 lineto
0.05109 0.00446 lineto
0.05357 0.00483 lineto
0.05481 0.00496 lineto
0.05605 0.00505 lineto
0.05729 0.0051 lineto
0.05853 0.0051 lineto
0.05977 0.00505 lineto
0.06101 0.00494 lineto
0.06225 0.00479 lineto
0.06349 0.0046 lineto
0.06845 0.0034 lineto
0.07341 0.00187 lineto
0.07589 0.00114 lineto
0.07713 0.00082 lineto
0.07837 0.00054 lineto
0.07961 0.00032 lineto
0.08085 0.00014 lineto
0.08209 4e-05 lineto
0.08333 0 lineto
0.08457 4e-05 lineto
0.08581 0.00015 lineto
0.08705 0.00035 lineto
0.08829 0.00062 lineto
0.09325 0.00241 lineto
0.09573 0.00364 lineto
0.09821 0.00498 lineto
0.10317 0.0076 lineto
0.10565 0.00867 lineto
0.10689 0.00912 lineto
0.10813 0.00948 lineto
0.10938 0.00976 lineto
0.11062 0.00996 lineto
0.11186 0.01006 lineto
0.1131 0.01007 lineto
0.11434 0.00998 lineto
0.11558 0.00981 lineto
0.11682 0.00954 lineto
0.11806 0.0092 lineto
0.12302 0.00719 lineto
0.12798 0.00464 lineto
Mistroke
0.13046 0.00339 lineto
0.13294 0.00226 lineto
0.13542 0.00131 lineto
0.1379 0.0006 lineto
0.13914 0.00034 lineto
0.14038 0.00015 lineto
0.14162 4e-05 lineto
0.14286 0 lineto
0.1441 4e-05 lineto
0.14534 0.00016 lineto
0.14658 0.00036 lineto
0.14782 0.00064 lineto
0.1503 0.00145 lineto
0.15278 0.00257 lineto
0.15526 0.00398 lineto
0.15774 0.00562 lineto
0.1627 0.00927 lineto
0.16766 0.01265 lineto
0.1689 0.01333 lineto
0.17014 0.01391 lineto
0.17138 0.01438 lineto
0.17262 0.01474 lineto
0.17386 0.01496 lineto
0.1751 0.01504 lineto
0.17634 0.01498 lineto
0.17758 0.01478 lineto
0.17882 0.01443 lineto
0.18006 0.01395 lineto
0.18254 0.0126 lineto
0.18502 0.01083 lineto
0.1875 0.00879 lineto
0.19246 0.00453 lineto
0.19494 0.00268 lineto
0.19742 0.00123 lineto
0.19866 0.0007 lineto
0.1999 0.00031 lineto
0.20114 8e-05 lineto
0.20238 0 lineto
0.20362 8e-05 lineto
0.20486 0.00031 lineto
0.2061 0.0007 lineto
0.20734 0.00122 lineto
0.2123 0.00445 lineto
0.21726 0.00857 lineto
0.21974 0.01054 lineto
0.22222 0.01223 lineto
0.22346 0.01293 lineto
0.2247 0.01351 lineto
0.22594 0.01397 lineto
0.22718 0.01431 lineto
Mistroke
0.22842 0.0145 lineto
0.22966 0.01456 lineto
0.2309 0.01449 lineto
0.23214 0.01429 lineto
0.23462 0.01352 lineto
0.23586 0.01298 lineto
0.2371 0.01234 lineto
0.24206 0.00917 lineto
0.24702 0.00568 lineto
0.2495 0.00408 lineto
0.25198 0.00268 lineto
0.25446 0.00154 lineto
0.25694 0.00069 lineto
0.25818 0.00039 lineto
0.25942 0.00018 lineto
0.26066 4e-05 lineto
0.2619 0 lineto
0.26314 4e-05 lineto
0.26438 0.00018 lineto
0.26563 0.00041 lineto
0.26687 0.00073 lineto
0.26811 0.00115 lineto
0.26935 0.00167 lineto
0.27183 0.00298 lineto
0.27679 0.00667 lineto
0.28175 0.01138 lineto
0.28671 0.01618 lineto
0.28919 0.01821 lineto
0.29043 0.01907 lineto
0.29167 0.01978 lineto
0.29291 0.02034 lineto
0.29415 0.02073 lineto
0.29539 0.02093 lineto
0.29663 0.02094 lineto
0.29787 0.02074 lineto
0.29911 0.02034 lineto
0.30035 0.01973 lineto
0.30159 0.01893 lineto
0.30407 0.01678 lineto
0.30655 0.01404 lineto
0.31151 0.00773 lineto
0.31399 0.00473 lineto
0.31523 0.0034 lineto
0.31647 0.00225 lineto
0.31771 0.0013 lineto
0.31895 0.00059 lineto
0.32019 0.00015 lineto
0.32143 0 lineto
0.32267 0.00016 lineto
0.32391 0.00063 lineto
Mistroke
0.32515 0.00144 lineto
0.32639 0.00256 lineto
0.32763 0.004 lineto
0.32887 0.00574 lineto
0.33135 0.01001 lineto
0.33631 0.02069 lineto
0.34127 0.03167 lineto
0.34375 0.03624 lineto
0.34623 0.03971 lineto
0.34747 0.04095 lineto
0.34871 0.04182 lineto
0.34995 0.04232 lineto
0.35119 0.04242 lineto
0.35243 0.04213 lineto
0.35367 0.04147 lineto
0.35491 0.04044 lineto
0.35615 0.03907 lineto
0.36111 0.03081 lineto
0.36607 0.02014 lineto
0.37103 0.00996 lineto
0.37351 0.00584 lineto
0.37599 0.00269 lineto
0.37723 0.00154 lineto
0.37847 0.00069 lineto
0.37971 0.00018 lineto
0.38095 0 lineto
0.38219 0.00018 lineto
0.38343 0.00073 lineto
0.38467 0.00167 lineto
0.38591 0.003 lineto
0.38839 0.00687 lineto
0.38963 0.00941 lineto
0.39087 0.01237 lineto
0.40079 0.04783 lineto
0.40575 0.06807 lineto
0.40823 0.07665 lineto
0.41071 0.08326 lineto
0.41195 0.08562 lineto
0.41319 0.08727 lineto
0.41443 0.08815 lineto
0.41567 0.08822 lineto
0.41691 0.08745 lineto
0.41815 0.08583 lineto
0.41939 0.08336 lineto
0.42063 0.08008 lineto
0.43056 0.03353 lineto
0.43304 0.02075 lineto
0.43428 0.01504 lineto
0.43552 0.01002 lineto
0.43676 0.00585 lineto
Mistroke
0.438 0.00269 lineto
0.43924 0.00069 lineto
0.44048 0 lineto
0.44172 0.00073 lineto
0.44296 0.003 lineto
0.4442 0.00688 lineto
0.44544 0.01245 lineto
0.44792 0.02879 lineto
0.44916 0.03957 lineto
0.4504 0.05207 lineto
0.46032 0.20259 lineto
0.47024 0.38471 lineto
0.4752 0.45911 lineto
0.47768 0.48863 lineto
0.48016 0.51253 lineto
0.48264 0.53087 lineto
0.48512 0.54406 lineto
0.48636 0.54893 lineto
0.4876 0.55279 lineto
0.48884 0.55577 lineto
0.49008 0.55797 lineto
0.49132 0.55953 lineto
0.49256 0.56058 lineto
0.4938 0.56123 lineto
0.49504 0.56159 lineto
0.49628 0.56177 lineto
0.49752 0.56183 lineto
0.49876 0.56185 lineto
0.5 0.56185 lineto
0.50124 0.56185 lineto
0.50248 0.56183 lineto
0.50372 0.56177 lineto
0.50496 0.56159 lineto
0.5062 0.56123 lineto
0.50744 0.56058 lineto
0.50868 0.55953 lineto
0.50992 0.55797 lineto
0.51116 0.55577 lineto
0.5124 0.55279 lineto
0.51364 0.54893 lineto
0.51488 0.54406 lineto
0.51736 0.53087 lineto
0.51984 0.51253 lineto
0.52232 0.48863 lineto
0.5248 0.45911 lineto
0.52976 0.38471 lineto
0.53968 0.20259 lineto
0.54464 0.11774 lineto
0.5496 0.05207 lineto
0.55084 0.03957 lineto
Mistroke
0.55208 0.02879 lineto
0.55332 0.01974 lineto
0.55456 0.01245 lineto
0.5558 0.00688 lineto
0.55704 0.003 lineto
0.55828 0.00073 lineto
0.55952 0 lineto
0.56944 0.03353 lineto
0.5744 0.05997 lineto
0.57688 0.07127 lineto
0.57813 0.07603 lineto
0.57937 0.08008 lineto
0.58061 0.08336 lineto
0.58185 0.08583 lineto
0.58309 0.08745 lineto
0.58433 0.08822 lineto
0.58557 0.08815 lineto
0.58681 0.08727 lineto
0.58805 0.08562 lineto
0.58929 0.08326 lineto
0.59177 0.07665 lineto
0.59425 0.06807 lineto
0.59921 0.04783 lineto
0.60417 0.02794 lineto
0.60665 0.01945 lineto
0.60913 0.01237 lineto
0.61037 0.00941 lineto
0.61161 0.00687 lineto
0.61285 0.00473 lineto
0.61409 0.003 lineto
0.61533 0.00167 lineto
0.61657 0.00073 lineto
0.61781 0.00018 lineto
0.61905 0 lineto
0.62029 0.00018 lineto
0.62153 0.00069 lineto
0.62277 0.00154 lineto
0.62401 0.00269 lineto
0.62897 0.00996 lineto
0.63393 0.02014 lineto
0.63889 0.03081 lineto
0.64137 0.03542 lineto
0.64385 0.03907 lineto
0.64509 0.04044 lineto
0.64633 0.04147 lineto
0.64757 0.04213 lineto
0.64881 0.04242 lineto
0.65005 0.04232 lineto
0.65129 0.04182 lineto
0.65253 0.04095 lineto
Mistroke
0.65377 0.03971 lineto
0.65873 0.03167 lineto
0.66369 0.02069 lineto
0.66617 0.01511 lineto
0.66865 0.01001 lineto
0.67113 0.00574 lineto
0.67237 0.004 lineto
0.67361 0.00256 lineto
0.67485 0.00144 lineto
0.67609 0.00063 lineto
0.67733 0.00016 lineto
0.67857 0 lineto
0.67981 0.00015 lineto
0.68105 0.00059 lineto
0.68229 0.0013 lineto
0.68353 0.00225 lineto
0.68601 0.00473 lineto
0.68849 0.00773 lineto
0.69345 0.01404 lineto
0.69593 0.01678 lineto
0.69717 0.01794 lineto
0.69841 0.01893 lineto
0.69965 0.01973 lineto
0.70089 0.02034 lineto
0.70213 0.02074 lineto
0.70337 0.02094 lineto
0.70461 0.02093 lineto
0.70585 0.02073 lineto
0.70709 0.02034 lineto
0.70833 0.01978 lineto
0.70957 0.01907 lineto
0.71081 0.01821 lineto
0.71329 0.01618 lineto
0.71825 0.01138 lineto
0.72321 0.00667 lineto
0.72569 0.00466 lineto
0.72817 0.00298 lineto
0.73065 0.00167 lineto
0.73189 0.00115 lineto
0.73313 0.00073 lineto
0.73438 0.00041 lineto
0.73562 0.00018 lineto
0.73686 4e-05 lineto
0.7381 0 lineto
0.73934 4e-05 lineto
0.74058 0.00018 lineto
0.74182 0.00039 lineto
0.74306 0.00069 lineto
0.7443 0.00108 lineto
0.74554 0.00154 lineto
Mistroke
0.74802 0.00268 lineto
0.75298 0.00568 lineto
0.75794 0.00917 lineto
0.76042 0.01086 lineto
0.7629 0.01234 lineto
0.76538 0.01352 lineto
0.76662 0.01396 lineto
0.76786 0.01429 lineto
0.7691 0.01449 lineto
0.77034 0.01456 lineto
0.77158 0.0145 lineto
0.77282 0.01431 lineto
0.77406 0.01397 lineto
0.7753 0.01351 lineto
0.77778 0.01223 lineto
0.78274 0.00857 lineto
0.7877 0.00445 lineto
0.79018 0.00264 lineto
0.79142 0.00188 lineto
0.79266 0.00122 lineto
0.7939 0.0007 lineto
0.79514 0.00031 lineto
0.79638 8e-05 lineto
0.79762 0 lineto
0.79886 8e-05 lineto
0.8001 0.00031 lineto
0.80134 0.0007 lineto
0.80258 0.00123 lineto
0.80382 0.0019 lineto
0.80506 0.00268 lineto
0.80754 0.00453 lineto
0.8125 0.00879 lineto
0.81746 0.0126 lineto
0.8187 0.01333 lineto
0.81994 0.01395 lineto
0.82118 0.01443 lineto
0.82242 0.01478 lineto
0.82366 0.01498 lineto
0.8249 0.01504 lineto
0.82614 0.01496 lineto
0.82738 0.01474 lineto
0.8373 0.00927 lineto
0.84226 0.00562 lineto
0.84722 0.00257 lineto
0.8497 0.00145 lineto
0.85094 0.001 lineto
0.85218 0.00064 lineto
0.85342 0.00036 lineto
0.85466 0.00016 lineto
0.8559 4e-05 lineto
Mistroke
0.85714 0 lineto
0.87698 0.00719 lineto
0.87946 0.0083 lineto
0.8807 0.00878 lineto
0.88194 0.0092 lineto
0.88318 0.00954 lineto
0.88442 0.00981 lineto
0.88566 0.00998 lineto
0.8869 0.01007 lineto
0.88814 0.01006 lineto
0.88938 0.00996 lineto
0.89062 0.00976 lineto
0.89187 0.00948 lineto
0.89311 0.00912 lineto
0.89435 0.00867 lineto
0.89683 0.0076 lineto
0.90179 0.00498 lineto
0.90675 0.00241 lineto
0.90923 0.00139 lineto
0.91047 0.00097 lineto
0.91171 0.00062 lineto
0.91295 0.00035 lineto
0.91419 0.00015 lineto
0.91543 4e-05 lineto
0.91667 0 lineto
0.91791 4e-05 lineto
0.91915 0.00014 lineto
0.92163 0.00054 lineto
0.92287 0.00082 lineto
0.92411 0.00114 lineto
0.92659 0.00187 lineto
0.93155 0.0034 lineto
0.93403 0.00407 lineto
0.93651 0.0046 lineto
0.93775 0.00479 lineto
0.93899 0.00494 lineto
0.94023 0.00505 lineto
0.94147 0.0051 lineto
0.94271 0.0051 lineto
0.94395 0.00505 lineto
0.94519 0.00496 lineto
0.94643 0.00483 lineto
0.95635 0.00281 lineto
0.96131 0.00166 lineto
0.96379 0.00117 lineto
0.96627 0.00075 lineto
0.96875 0.00042 lineto
0.96999 0.00029 lineto
0.97123 0.00019 lineto
0.97247 0.0001 lineto
Mistroke
0.97371 5e-05 lineto
0.97495 1e-05 lineto
0.97619 0 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.119048 1.94614e-17 0.561849 [
[(-4)] 0.02381 0 0 2 Msboxa
[(-2)] 0.2619 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(2)] 0.7381 0 0 2 Msboxa
[(4)] 0.97619 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 4)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.00625 lineto
stroke
grestore
[(-4)] 0.02381 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.2619 0 moveto
0.2619 0.00625 lineto
stroke
grestore
[(-2)] 0.2619 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.7381 0 moveto
0.7381 0.00625 lineto
stroke
grestore
[(2)] 0.7381 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.97619 0 moveto
0.97619 0.00625 lineto
stroke
grestore
[(4)] 0.97619 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.07143 0 moveto
0.07143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.11905 0 moveto
0.11905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.16667 0 moveto
0.16667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.21429 0 moveto
0.21429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.30952 0 moveto
0.30952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.35714 0 moveto
0.35714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.40476 0 moveto
0.40476 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.45238 0 moveto
0.45238 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.54762 0 moveto
0.54762 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.59524 0 moveto
0.59524 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.64286 0 moveto
0.64286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.69048 0 moveto
0.69048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.78571 0 moveto
0.78571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.83333 0 moveto
0.83333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.88095 0 moveto
0.88095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.92857 0 moveto
0.92857 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 4)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0 moveto
0.02505 0 lineto
0.02629 0 lineto
0.02753 0 lineto
0.02877 0 lineto
0.03001 0 lineto
0.03125 0 lineto
0.03249 0 lineto
0.03373 0 lineto
0.03497 0 lineto
0.03621 1e-05 lineto
0.03745 1e-05 lineto
0.03869 1e-05 lineto
0.03993 2e-05 lineto
0.04117 3e-05 lineto
0.04241 4e-05 lineto
0.04365 5e-05 lineto
0.04613 7e-05 lineto
0.04861 0.00011 lineto
0.05109 0.00017 lineto
0.05357 0.00023 lineto
0.05605 0.00032 lineto
0.05853 0.00043 lineto
0.06349 0.00073 lineto
0.07341 0.00162 lineto
0.07837 0.00218 lineto
0.08333 0.00272 lineto
0.08581 0.00295 lineto
0.08829 0.00315 lineto
0.08953 0.00324 lineto
0.09077 0.00331 lineto
0.09201 0.00336 lineto
0.09325 0.0034 lineto
0.09449 0.00342 lineto
0.09573 0.00342 lineto
0.09697 0.00341 lineto
0.09821 0.00338 lineto
0.09945 0.00333 lineto
0.10069 0.00326 lineto
0.10193 0.00318 lineto
0.10317 0.00308 lineto
0.1131 0.00185 lineto
0.11806 0.00117 lineto
0.12302 0.0006 lineto
0.1255 0.00039 lineto
0.12674 0.00031 lineto
0.12798 0.00023 lineto
0.12922 0.00017 lineto
0.13046 0.00012 lineto
0.1317 8e-05 lineto
Mistroke
0.13294 5e-05 lineto
0.13418 3e-05 lineto
0.13542 2e-05 lineto
0.13666 1e-05 lineto
0.1379 0 lineto
0.13914 0 lineto
0.14038 0 lineto
0.14162 0 lineto
0.14286 0 lineto
0.1441 0 lineto
0.14534 0 lineto
0.14658 0 lineto
0.14782 0 lineto
0.14906 1e-05 lineto
0.1503 2e-05 lineto
0.15154 4e-05 lineto
0.15278 7e-05 lineto
0.15402 0.00012 lineto
0.15526 0.00018 lineto
0.1565 0.00026 lineto
0.15774 0.00037 lineto
0.16022 0.00067 lineto
0.16146 0.00087 lineto
0.1627 0.00111 lineto
0.18254 0.01015 lineto
0.1875 0.0128 lineto
0.18998 0.01388 lineto
0.19122 0.01433 lineto
0.19246 0.01472 lineto
0.1937 0.01503 lineto
0.19494 0.01528 lineto
0.19618 0.01545 lineto
0.19742 0.01554 lineto
0.19866 0.01556 lineto
0.1999 0.01549 lineto
0.20114 0.01536 lineto
0.20238 0.01515 lineto
0.20486 0.01453 lineto
0.20734 0.01367 lineto
0.2123 0.01143 lineto
0.22222 0.00632 lineto
0.22718 0.00414 lineto
0.22966 0.00323 lineto
0.23214 0.00245 lineto
0.23462 0.0018 lineto
0.2371 0.00128 lineto
0.23958 0.00087 lineto
0.24206 0.00056 lineto
0.2433 0.00044 lineto
0.24454 0.00034 lineto
Mistroke
0.24578 0.00026 lineto
0.24702 0.00019 lineto
0.24826 0.00014 lineto
0.2495 9e-05 lineto
0.25074 6e-05 lineto
0.25198 4e-05 lineto
0.25322 2e-05 lineto
0.25446 1e-05 lineto
0.2557 1e-05 lineto
0.25694 0 lineto
0.25818 0 lineto
0.25942 0 lineto
0.26066 0 lineto
0.2619 0 lineto
0.26314 0 lineto
0.26438 0 lineto
0.26563 0 lineto
0.26687 0 lineto
0.26811 1e-05 lineto
0.26935 1e-05 lineto
0.27059 3e-05 lineto
0.27183 5e-05 lineto
0.27307 7e-05 lineto
0.27431 0.00011 lineto
0.27555 0.00017 lineto
0.27679 0.00024 lineto
0.27803 0.00033 lineto
0.27927 0.00044 lineto
0.28175 0.00075 lineto
0.28299 0.00096 lineto
0.28423 0.00121 lineto
0.28671 0.00185 lineto
0.28919 0.00271 lineto
0.29167 0.00383 lineto
0.29663 0.00699 lineto
0.29911 0.0091 lineto
0.30159 0.01156 lineto
0.31151 0.02464 lineto
0.31647 0.0321 lineto
0.32143 0.03885 lineto
0.32391 0.04156 lineto
0.32639 0.04364 lineto
0.32763 0.0444 lineto
0.32887 0.04495 lineto
0.33011 0.04529 lineto
0.33135 0.0454 lineto
0.33259 0.04528 lineto
0.33383 0.04493 lineto
0.33507 0.04435 lineto
0.33631 0.04354 lineto
Mistroke
0.34127 0.03821 lineto
0.35119 0.02142 lineto
0.35615 0.01307 lineto
0.36111 0.00656 lineto
0.36359 0.0042 lineto
0.36483 0.00326 lineto
0.36607 0.00246 lineto
0.36731 0.00181 lineto
0.36855 0.00128 lineto
0.36979 0.00087 lineto
0.37103 0.00056 lineto
0.37227 0.00034 lineto
0.37351 0.00019 lineto
0.37475 9e-05 lineto
0.37599 4e-05 lineto
0.37723 1e-05 lineto
0.37847 0 lineto
0.37971 0 lineto
0.38095 0 lineto
0.38219 0 lineto
0.38343 0 lineto
0.38467 1e-05 lineto
0.38591 5e-05 lineto
0.38715 0.00011 lineto
0.38839 0.00024 lineto
0.38963 0.00044 lineto
0.39087 0.00075 lineto
0.39211 0.00121 lineto
0.39335 0.00186 lineto
0.39459 0.00272 lineto
0.39583 0.00385 lineto
0.39707 0.0053 lineto
0.39831 0.00711 lineto
0.40079 0.01199 lineto
0.40327 0.0189 lineto
0.40575 0.02817 lineto
0.40823 0.04011 lineto
0.41071 0.05494 lineto
0.41567 0.09363 lineto
0.42063 0.14384 lineto
0.44048 0.39506 lineto
0.44544 0.44823 lineto
0.4504 0.49061 lineto
0.45536 0.52141 lineto
0.45784 0.53268 lineto
0.46032 0.5415 lineto
0.4628 0.54818 lineto
0.46404 0.55081 lineto
0.46528 0.55304 lineto
0.46652 0.5549 lineto
Mistroke
0.46776 0.55644 lineto
0.47024 0.5587 lineto
0.47148 0.5595 lineto
0.47272 0.56013 lineto
0.47396 0.56061 lineto
0.4752 0.56098 lineto
0.47644 0.56125 lineto
0.47768 0.56144 lineto
0.47892 0.56158 lineto
0.48016 0.56168 lineto
0.4814 0.56175 lineto
0.48264 0.56179 lineto
0.48388 0.56181 lineto
0.48512 0.56183 lineto
0.48636 0.56184 lineto
0.4876 0.56184 lineto
0.48884 0.56185 lineto
0.49008 0.56185 lineto
0.49132 0.56185 lineto
0.49256 0.56185 lineto
0.4938 0.56185 lineto
0.49504 0.56185 lineto
0.49628 0.56185 lineto
0.49752 0.56185 lineto
0.49876 0.56185 lineto
0.5 0.56185 lineto
0.50124 0.56185 lineto
0.50248 0.56185 lineto
0.50372 0.56185 lineto
0.50496 0.56185 lineto
0.5062 0.56185 lineto
0.50744 0.56185 lineto
0.50868 0.56185 lineto
0.50992 0.56185 lineto
0.51116 0.56185 lineto
0.5124 0.56184 lineto
0.51364 0.56184 lineto
0.51488 0.56183 lineto
0.51612 0.56181 lineto
0.51736 0.56179 lineto
0.5186 0.56175 lineto
0.51984 0.56168 lineto
0.52108 0.56158 lineto
0.52232 0.56144 lineto
0.52356 0.56125 lineto
0.5248 0.56098 lineto
0.52604 0.56061 lineto
0.52728 0.56013 lineto
0.52852 0.5595 lineto
0.52976 0.5587 lineto
Mistroke
0.531 0.55769 lineto
0.53224 0.55644 lineto
0.53472 0.55304 lineto
0.53596 0.55081 lineto
0.5372 0.54818 lineto
0.53968 0.5415 lineto
0.54216 0.53268 lineto
0.54464 0.52141 lineto
0.5496 0.49061 lineto
0.55456 0.44823 lineto
0.55952 0.39506 lineto
0.56944 0.26817 lineto
0.57937 0.14384 lineto
0.58433 0.09363 lineto
0.58681 0.07277 lineto
0.58929 0.05494 lineto
0.59177 0.04011 lineto
0.59425 0.02817 lineto
0.59673 0.0189 lineto
0.59921 0.01199 lineto
0.60045 0.00932 lineto
0.60169 0.00711 lineto
0.60293 0.0053 lineto
0.60417 0.00385 lineto
0.60541 0.00272 lineto
0.60665 0.00186 lineto
0.60789 0.00121 lineto
0.60913 0.00075 lineto
0.61037 0.00044 lineto
0.61161 0.00024 lineto
0.61285 0.00011 lineto
0.61409 5e-05 lineto
0.61533 1e-05 lineto
0.61657 0 lineto
0.61781 0 lineto
0.61905 0 lineto
0.62029 0 lineto
0.62153 0 lineto
0.62277 1e-05 lineto
0.62401 4e-05 lineto
0.62525 9e-05 lineto
0.62649 0.00019 lineto
0.62773 0.00034 lineto
0.62897 0.00056 lineto
0.63021 0.00087 lineto
0.63145 0.00128 lineto
0.63269 0.00181 lineto
0.63393 0.00246 lineto
0.63641 0.0042 lineto
0.63889 0.00656 lineto
Mistroke
0.64385 0.01307 lineto
0.64881 0.02142 lineto
0.65377 0.03034 lineto
0.65625 0.03451 lineto
0.65873 0.03821 lineto
0.66121 0.04126 lineto
0.66369 0.04354 lineto
0.66493 0.04435 lineto
0.66617 0.04493 lineto
0.66741 0.04528 lineto
0.66865 0.0454 lineto
0.66989 0.04529 lineto
0.67113 0.04495 lineto
0.67237 0.0444 lineto
0.67361 0.04364 lineto
0.67857 0.03885 lineto
0.68849 0.02464 lineto
0.69345 0.01755 lineto
0.69841 0.01156 lineto
0.70089 0.0091 lineto
0.70337 0.00699 lineto
0.70833 0.00383 lineto
0.71081 0.00271 lineto
0.71329 0.00185 lineto
0.71577 0.00121 lineto
0.71701 0.00096 lineto
0.71825 0.00075 lineto
0.71949 0.00058 lineto
0.72073 0.00044 lineto
0.72197 0.00033 lineto
0.72321 0.00024 lineto
0.72445 0.00017 lineto
0.72569 0.00011 lineto
0.72693 7e-05 lineto
0.72817 5e-05 lineto
0.72941 3e-05 lineto
0.73065 1e-05 lineto
0.73189 1e-05 lineto
0.73313 0 lineto
0.73438 0 lineto
0.73562 0 lineto
0.73686 0 lineto
0.7381 0 lineto
0.73934 0 lineto
0.74058 0 lineto
0.74182 0 lineto
0.74306 0 lineto
0.7443 1e-05 lineto
0.74554 1e-05 lineto
0.74678 2e-05 lineto
Mistroke
0.74802 4e-05 lineto
0.74926 6e-05 lineto
0.7505 9e-05 lineto
0.75174 0.00014 lineto
0.75298 0.00019 lineto
0.75422 0.00026 lineto
0.75546 0.00034 lineto
0.75794 0.00056 lineto
0.76042 0.00087 lineto
0.7629 0.00128 lineto
0.76538 0.0018 lineto
0.76786 0.00245 lineto
0.77282 0.00414 lineto
0.77778 0.00632 lineto
0.7877 0.01143 lineto
0.79018 0.01262 lineto
0.79266 0.01367 lineto
0.79514 0.01453 lineto
0.79638 0.01487 lineto
0.79762 0.01515 lineto
0.79886 0.01536 lineto
0.8001 0.01549 lineto
0.80134 0.01556 lineto
0.80258 0.01554 lineto
0.80382 0.01545 lineto
0.80506 0.01528 lineto
0.8063 0.01503 lineto
0.80754 0.01472 lineto
0.81002 0.01388 lineto
0.8125 0.0128 lineto
0.81746 0.01015 lineto
0.82242 0.00726 lineto
0.82738 0.00459 lineto
0.83234 0.0025 lineto
0.83482 0.00171 lineto
0.8373 0.00111 lineto
0.83978 0.00067 lineto
0.84102 0.0005 lineto
0.84226 0.00037 lineto
0.8435 0.00026 lineto
0.84474 0.00018 lineto
0.84598 0.00012 lineto
0.84722 7e-05 lineto
0.84846 4e-05 lineto
0.8497 2e-05 lineto
0.85094 1e-05 lineto
0.85218 0 lineto
0.85342 0 lineto
0.85466 0 lineto
0.8559 0 lineto
Mistroke
0.85714 0 lineto
0.85838 0 lineto
0.85962 0 lineto
0.86086 0 lineto
0.8621 0 lineto
0.86334 1e-05 lineto
0.86458 2e-05 lineto
0.86582 3e-05 lineto
0.86706 5e-05 lineto
0.8683 8e-05 lineto
0.86954 0.00012 lineto
0.87078 0.00017 lineto
0.87202 0.00023 lineto
0.87698 0.0006 lineto
0.87946 0.00086 lineto
0.88194 0.00117 lineto
0.8869 0.00185 lineto
0.89187 0.00253 lineto
0.89435 0.00283 lineto
0.89683 0.00308 lineto
0.89931 0.00326 lineto
0.90055 0.00333 lineto
0.90179 0.00338 lineto
0.90303 0.00341 lineto
0.90427 0.00342 lineto
0.90551 0.00342 lineto
0.90675 0.0034 lineto
0.90799 0.00336 lineto
0.90923 0.00331 lineto
0.91171 0.00315 lineto
0.91419 0.00295 lineto
0.91667 0.00272 lineto
0.92659 0.00162 lineto
0.93155 0.00113 lineto
0.93651 0.00073 lineto
0.93899 0.00057 lineto
0.94147 0.00043 lineto
0.94395 0.00032 lineto
0.94643 0.00023 lineto
0.94891 0.00017 lineto
0.95139 0.00011 lineto
0.95387 7e-05 lineto
0.95511 6e-05 lineto
0.95635 5e-05 lineto
0.95759 4e-05 lineto
0.95883 3e-05 lineto
0.96007 2e-05 lineto
0.96131 1e-05 lineto
0.96255 1e-05 lineto
0.96379 1e-05 lineto
Mistroke
0.96503 0 lineto
0.96627 0 lineto
0.96751 0 lineto
0.96875 0 lineto
0.96999 0 lineto
0.97123 0 lineto
0.97247 0 lineto
0.97371 0 lineto
0.97495 0 lineto
0.97619 0 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; endGroup; endGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.238095 1.94614e-17 0.561849 [
[(-2)] 0.02381 0 0 2 Msboxa
[(-1)] 0.2619 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(1)] 0.7381 0 0 2 Msboxa
[(2)] 0.97619 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 8)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.00625 lineto
stroke
grestore
[(-2)] 0.02381 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.2619 0 moveto
0.2619 0.00625 lineto
stroke
grestore
[(-1)] 0.2619 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.7381 0 moveto
0.7381 0.00625 lineto
stroke
grestore
[(1)] 0.7381 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.97619 0 moveto
0.97619 0.00625 lineto
stroke
grestore
[(2)] 0.97619 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.07143 0 moveto
0.07143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.11905 0 moveto
0.11905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.16667 0 moveto
0.16667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.21429 0 moveto
0.21429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.30952 0 moveto
0.30952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.35714 0 moveto
0.35714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.40476 0 moveto
0.40476 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.45238 0 moveto
0.45238 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.54762 0 moveto
0.54762 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.59524 0 moveto
0.59524 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.64286 0 moveto
0.64286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.69048 0 moveto
0.69048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.78571 0 moveto
0.78571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.83333 0 moveto
0.83333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.88095 0 moveto
0.88095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.92857 0 moveto
0.92857 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Phi^|: n = 8)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0 moveto
0.02505 0 lineto
0.02629 0 lineto
0.02753 0 lineto
0.02877 0 lineto
0.03001 0 lineto
0.03125 0 lineto
0.03249 0 lineto
0.03373 0 lineto
0.03497 0 lineto
0.03621 0 lineto
0.03745 0 lineto
0.03869 0 lineto
0.03993 0 lineto
0.04117 0 lineto
0.04241 0 lineto
0.04365 0 lineto
0.04489 0 lineto
0.04613 0 lineto
0.04737 0 lineto
0.04861 0 lineto
0.04985 0 lineto
0.05109 0 lineto
0.05233 0 lineto
0.05357 0 lineto
0.05481 0 lineto
0.05605 0 lineto
0.05729 0 lineto
0.05853 0 lineto
0.06101 0 lineto
0.06225 0 lineto
0.06349 0 lineto
0.06473 0 lineto
0.06597 0 lineto
0.06845 1e-05 lineto
0.06969 1e-05 lineto
0.07093 1e-05 lineto
0.07341 2e-05 lineto
0.07589 3e-05 lineto
0.07837 4e-05 lineto
0.08085 5e-05 lineto
0.08333 7e-05 lineto
0.08581 0.0001 lineto
0.08829 0.00014 lineto
0.09077 0.00018 lineto
0.09325 0.00024 lineto
0.09573 0.00032 lineto
0.09821 0.00041 lineto
0.10069 0.00053 lineto
0.10317 0.00067 lineto
Mistroke
0.10813 0.00105 lineto
0.1131 0.00158 lineto
0.11806 0.00229 lineto
0.12302 0.00322 lineto
0.13294 0.00571 lineto
0.14286 0.00876 lineto
0.14782 0.01025 lineto
0.15278 0.01154 lineto
0.15526 0.01206 lineto
0.15774 0.01248 lineto
0.15898 0.01265 lineto
0.16022 0.01278 lineto
0.16146 0.01288 lineto
0.1627 0.01295 lineto
0.18254 0.00964 lineto
0.19246 0.00615 lineto
0.19742 0.00449 lineto
0.20238 0.00307 lineto
0.20734 0.00195 lineto
0.2123 0.00114 lineto
0.21478 0.00084 lineto
0.21726 0.0006 lineto
0.21974 0.00042 lineto
0.22222 0.00028 lineto
0.22346 0.00023 lineto
0.2247 0.00018 lineto
0.22718 0.00012 lineto
0.22842 9e-05 lineto
0.22966 7e-05 lineto
0.2309 5e-05 lineto
0.23214 4e-05 lineto
0.23338 3e-05 lineto
0.23462 2e-05 lineto
0.23586 1e-05 lineto
0.2371 1e-05 lineto
0.23834 1e-05 lineto
0.23958 0 lineto
0.24082 0 lineto
0.24206 0 lineto
0.2433 0 lineto
0.24454 0 lineto
0.24578 0 lineto
0.24702 0 lineto
0.24826 0 lineto
0.2495 0 lineto
0.25074 0 lineto
0.25198 0 lineto
0.25322 0 lineto
0.25446 0 lineto
0.2557 0 lineto
Mistroke
0.25694 0 lineto
0.25818 0 lineto
0.25942 0 lineto
0.26066 0 lineto
0.2619 0 lineto
0.26314 0 lineto
0.26438 0 lineto
0.26563 0 lineto
0.26687 0 lineto
0.26811 0 lineto
0.26935 0 lineto
0.27059 0 lineto
0.27183 0 lineto
0.27307 0 lineto
0.27431 0 lineto
0.27555 0 lineto
0.27679 0 lineto
0.27803 0 lineto
0.27927 0 lineto
0.28051 0 lineto
0.28175 0 lineto
0.28299 0 lineto
0.28423 1e-05 lineto
0.28547 1e-05 lineto
0.28671 2e-05 lineto
0.28795 3e-05 lineto
0.28919 4e-05 lineto
0.29043 5e-05 lineto
0.29167 7e-05 lineto
0.29291 0.0001 lineto
0.29415 0.00014 lineto
0.29663 0.00024 lineto
0.29787 0.00032 lineto
0.29911 0.00041 lineto
0.30035 0.00053 lineto
0.30159 0.00068 lineto
0.30407 0.00106 lineto
0.30531 0.00132 lineto
0.30655 0.00162 lineto
0.30903 0.00241 lineto
0.31151 0.00349 lineto
0.31399 0.00494 lineto
0.31647 0.00684 lineto
0.31895 0.00929 lineto
0.32143 0.01238 lineto
0.32639 0.02097 lineto
0.32887 0.02667 lineto
0.33135 0.03346 lineto
0.33631 0.05068 lineto
0.34127 0.07326 lineto
Mistroke
0.35119 0.13534 lineto
0.36111 0.2171 lineto
0.37103 0.30897 lineto
0.38095 0.39718 lineto
0.38591 0.43577 lineto
0.39087 0.46908 lineto
0.39583 0.49653 lineto
0.40079 0.51803 lineto
0.40327 0.52667 lineto
0.40575 0.53399 lineto
0.41071 0.54516 lineto
0.41319 0.54924 lineto
0.41567 0.55249 lineto
0.41815 0.55502 lineto
0.42063 0.55697 lineto
0.42312 0.55843 lineto
0.4256 0.5595 lineto
0.42684 0.55992 lineto
0.42808 0.56027 lineto
0.42932 0.56057 lineto
0.43056 0.56082 lineto
0.43304 0.56119 lineto
0.43428 0.56133 lineto
0.43552 0.56144 lineto
0.43676 0.56153 lineto
0.438 0.5616 lineto
0.43924 0.56166 lineto
0.44048 0.5617 lineto
0.44172 0.56174 lineto
0.44296 0.56177 lineto
0.4442 0.56179 lineto
0.44544 0.5618 lineto
0.44668 0.56182 lineto
0.44792 0.56183 lineto
0.44916 0.56183 lineto
0.4504 0.56184 lineto
0.45164 0.56184 lineto
0.45288 0.56184 lineto
0.45412 0.56185 lineto
0.45536 0.56185 lineto
0.4566 0.56185 lineto
0.45784 0.56185 lineto
0.45908 0.56185 lineto
0.46032 0.56185 lineto
0.46156 0.56185 lineto
0.4628 0.56185 lineto
0.46404 0.56185 lineto
0.46528 0.56185 lineto
0.46652 0.56185 lineto
0.46776 0.56185 lineto
Mistroke
0.469 0.56185 lineto
0.47024 0.56185 lineto
0.47148 0.56185 lineto
0.47272 0.56185 lineto
0.47396 0.56185 lineto
0.4752 0.56185 lineto
0.47644 0.56185 lineto
0.47768 0.56185 lineto
0.47892 0.56185 lineto
0.48016 0.56185 lineto
0.4814 0.56185 lineto
0.48264 0.56185 lineto
0.48388 0.56185 lineto
0.48512 0.56185 lineto
0.48636 0.56185 lineto
0.4876 0.56185 lineto
0.48884 0.56185 lineto
0.49008 0.56185 lineto
0.49132 0.56185 lineto
0.49256 0.56185 lineto
0.4938 0.56185 lineto
0.49504 0.56185 lineto
0.49628 0.56185 lineto
0.49752 0.56185 lineto
0.49876 0.56185 lineto
0.5 0.56185 lineto
0.50124 0.56185 lineto
0.50248 0.56185 lineto
0.50372 0.56185 lineto
0.50496 0.56185 lineto
0.5062 0.56185 lineto
0.50744 0.56185 lineto
0.50868 0.56185 lineto
0.50992 0.56185 lineto
0.51116 0.56185 lineto
0.5124 0.56185 lineto
0.51364 0.56185 lineto
0.51488 0.56185 lineto
0.51612 0.56185 lineto
0.51736 0.56185 lineto
0.5186 0.56185 lineto
0.51984 0.56185 lineto
0.52108 0.56185 lineto
0.52232 0.56185 lineto
0.52356 0.56185 lineto
0.5248 0.56185 lineto
0.52604 0.56185 lineto
0.52728 0.56185 lineto
0.52852 0.56185 lineto
0.52976 0.56185 lineto
Mistroke
0.531 0.56185 lineto
0.53224 0.56185 lineto
0.53348 0.56185 lineto
0.53472 0.56185 lineto
0.53596 0.56185 lineto
0.5372 0.56185 lineto
0.53844 0.56185 lineto
0.53968 0.56185 lineto
0.54092 0.56185 lineto
0.54216 0.56185 lineto
0.5434 0.56185 lineto
0.54464 0.56185 lineto
0.54588 0.56185 lineto
0.54712 0.56184 lineto
0.54836 0.56184 lineto
0.5496 0.56184 lineto
0.55084 0.56183 lineto
0.55208 0.56183 lineto
0.55332 0.56182 lineto
0.55456 0.5618 lineto
0.5558 0.56179 lineto
0.55704 0.56177 lineto
0.55828 0.56174 lineto
0.55952 0.5617 lineto
0.562 0.5616 lineto
0.56324 0.56153 lineto
0.56448 0.56144 lineto
0.56572 0.56133 lineto
0.56696 0.56119 lineto
0.56944 0.56082 lineto
0.57068 0.56057 lineto
0.57192 0.56027 lineto
0.5744 0.5595 lineto
0.57688 0.55843 lineto
0.57937 0.55697 lineto
0.58185 0.55502 lineto
0.58433 0.55249 lineto
0.58681 0.54924 lineto
0.58929 0.54516 lineto
0.59177 0.54012 lineto
0.59425 0.53399 lineto
0.59921 0.51803 lineto
0.60417 0.49653 lineto
0.60913 0.46908 lineto
0.61905 0.39718 lineto
0.63889 0.2171 lineto
0.64881 0.13534 lineto
0.65377 0.1015 lineto
0.65873 0.07326 lineto
0.66369 0.05068 lineto
Mistroke
0.66865 0.03346 lineto
0.67113 0.02667 lineto
0.67361 0.02097 lineto
0.67857 0.01238 lineto
0.68105 0.00929 lineto
0.68353 0.00684 lineto
0.68601 0.00494 lineto
0.68849 0.00349 lineto
0.69097 0.00241 lineto
0.69345 0.00162 lineto
0.69469 0.00132 lineto
0.69593 0.00106 lineto
0.69717 0.00085 lineto
0.69841 0.00068 lineto
0.70089 0.00041 lineto
0.70213 0.00032 lineto
0.70337 0.00024 lineto
0.70461 0.00018 lineto
0.70585 0.00014 lineto
0.70709 0.0001 lineto
0.70833 7e-05 lineto
0.70957 5e-05 lineto
0.71081 4e-05 lineto
0.71205 3e-05 lineto
0.71329 2e-05 lineto
0.71453 1e-05 lineto
0.71577 1e-05 lineto
0.71701 0 lineto
0.71825 0 lineto
0.71949 0 lineto
0.72073 0 lineto
0.72197 0 lineto
0.72321 0 lineto
0.72445 0 lineto
0.72569 0 lineto
0.72693 0 lineto
0.72817 0 lineto
0.72941 0 lineto
0.73065 0 lineto
0.73189 0 lineto
0.73313 0 lineto
0.73438 0 lineto
0.73562 0 lineto
0.73686 0 lineto
0.7381 0 lineto
0.73934 0 lineto
0.74058 0 lineto
0.74182 0 lineto
0.74306 0 lineto
0.7443 0 lineto
Mistroke
0.74554 0 lineto
0.74678 0 lineto
0.74802 0 lineto
0.74926 0 lineto
0.7505 0 lineto
0.75174 0 lineto
0.75298 0 lineto
0.75422 0 lineto
0.75546 0 lineto
0.7567 0 lineto
0.75794 0 lineto
0.75918 0 lineto
0.76042 0 lineto
0.76166 1e-05 lineto
0.7629 1e-05 lineto
0.76414 1e-05 lineto
0.76538 2e-05 lineto
0.76662 3e-05 lineto
0.76786 4e-05 lineto
0.7691 5e-05 lineto
0.77034 7e-05 lineto
0.77282 0.00012 lineto
0.77406 0.00015 lineto
0.7753 0.00018 lineto
0.77778 0.00028 lineto
0.78026 0.00042 lineto
0.78274 0.0006 lineto
0.78522 0.00084 lineto
0.7877 0.00114 lineto
0.79266 0.00195 lineto
0.79762 0.00307 lineto
0.80754 0.00615 lineto
0.81746 0.00964 lineto
0.82242 0.01114 lineto
0.8249 0.01175 lineto
0.82738 0.01226 lineto
0.82862 0.01247 lineto
0.82986 0.01264 lineto
0.8311 0.01278 lineto
0.83234 0.01288 lineto
0.83358 0.01295 lineto
0.83482 0.01299 lineto
0.83606 0.01299 lineto
0.8373 0.01295 lineto
0.83854 0.01288 lineto
0.83978 0.01278 lineto
0.84102 0.01265 lineto
0.84226 0.01248 lineto
0.84722 0.01154 lineto
0.85218 0.01025 lineto
Mistroke
0.85714 0.00876 lineto
0.86706 0.00571 lineto
0.87698 0.00322 lineto
0.88194 0.00229 lineto
0.8869 0.00158 lineto
0.89187 0.00105 lineto
0.89435 0.00084 lineto
0.89683 0.00067 lineto
0.89931 0.00053 lineto
0.90179 0.00041 lineto
0.90675 0.00024 lineto
0.90923 0.00018 lineto
0.91171 0.00014 lineto
0.91419 0.0001 lineto
0.91667 7e-05 lineto
0.91915 5e-05 lineto
0.92163 4e-05 lineto
0.92411 3e-05 lineto
0.92659 2e-05 lineto
0.92907 1e-05 lineto
0.93031 1e-05 lineto
0.93155 1e-05 lineto
0.93279 1e-05 lineto
0.93403 0 lineto
0.93651 0 lineto
0.93775 0 lineto
0.93899 0 lineto
0.94023 0 lineto
0.94147 0 lineto
0.94271 0 lineto
0.94395 0 lineto
0.94519 0 lineto
0.94643 0 lineto
0.94767 0 lineto
0.94891 0 lineto
0.95015 0 lineto
0.95139 0 lineto
0.95263 0 lineto
0.95387 0 lineto
0.95511 0 lineto
0.95635 0 lineto
0.95759 0 lineto
0.95883 0 lineto
0.96007 0 lineto
0.96131 0 lineto
0.96255 0 lineto
0.96379 0 lineto
0.96503 0 lineto
0.96627 0 lineto
0.96751 0 lineto
Mistroke
0.96875 0 lineto
0.96999 0 lineto
0.97123 0 lineto
0.97247 0 lineto
0.97371 0 lineto
0.97495 0 lineto
0.97619 0 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = input; preserveAspect; startGroup; ]
Do[
	PlotPsiHat[2^k, 6 - k],
{k, 3}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; startGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.059524 1.946143e-17 0.561849 [
[(-7.5)] 0.05357 0 0 2 Msboxa
[(-5)] 0.20238 0 0 2 Msboxa
[(-2.5)] 0.35119 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(2.5)] 0.64881 0 0 2 Msboxa
[(5)] 0.79762 0 0 2 Msboxa
[(7.5)] 0.94643 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Psi^|: n = 2)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.05357 0 moveto
0.05357 0.00625 lineto
stroke
grestore
[(-7.5)] 0.05357 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.20238 0 moveto
0.20238 0.00625 lineto
stroke
grestore
[(-5)] 0.20238 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.35119 0 moveto
0.35119 0.00625 lineto
stroke
grestore
[(-2.5)] 0.35119 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.64881 0 moveto
0.64881 0.00625 lineto
stroke
grestore
[(2.5)] 0.64881 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.79762 0 moveto
0.79762 0.00625 lineto
stroke
grestore
[(5)] 0.79762 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.94643 0 moveto
0.94643 0.00625 lineto
stroke
grestore
[(7.5)] 0.94643 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.08333 0 moveto
0.08333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.1131 0 moveto
0.1131 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.14286 0 moveto
0.14286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.17262 0 moveto
0.17262 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.23214 0 moveto
0.23214 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.2619 0 moveto
0.2619 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.29167 0 moveto
0.29167 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.32143 0 moveto
0.32143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.38095 0 moveto
0.38095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.41071 0 moveto
0.41071 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.44048 0 moveto
0.44048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.47024 0 moveto
0.47024 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.52976 0 moveto
0.52976 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.55952 0 moveto
0.55952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.58929 0 moveto
0.58929 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.61905 0 moveto
0.61905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.67857 0 moveto
0.67857 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.70833 0 moveto
0.70833 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.7381 0 moveto
0.7381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.76786 0 moveto
0.76786 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.82738 0 moveto
0.82738 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.85714 0 moveto
0.85714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.8869 0 moveto
0.8869 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.91667 0 moveto
0.91667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0 moveto
0.02381 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.97619 0 moveto
0.97619 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Psi^|: n = 2)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0 moveto
0.02505 0 lineto
0.02629 0 lineto
0.02753 0 lineto
0.02877 1e-05 lineto
0.03001 1e-05 lineto
0.03125 3e-05 lineto
0.03249 5e-05 lineto
0.03373 8e-05 lineto
0.03497 0.00013 lineto
0.03621 0.0002 lineto
0.03869 0.0004 lineto
0.03993 0.00054 lineto
0.04117 0.00072 lineto
0.04365 0.00118 lineto
0.04613 0.0018 lineto
0.04861 0.0026 lineto
0.05357 0.00472 lineto
0.06349 0.01045 lineto
0.06845 0.01343 lineto
0.07341 0.01607 lineto
0.07837 0.0182 lineto
0.08085 0.01907 lineto
0.08333 0.01978 lineto
0.08581 0.02034 lineto
0.08705 0.02056 lineto
0.08829 0.02072 lineto
0.08953 0.02083 lineto
0.09077 0.02089 lineto
0.09201 0.02088 lineto
0.09325 0.0208 lineto
0.09449 0.02065 lineto
0.09573 0.02043 lineto
0.09697 0.02012 lineto
0.09821 0.01974 lineto
0.10069 0.01872 lineto
0.10317 0.01738 lineto
0.1131 0.00993 lineto
0.11806 0.00609 lineto
0.12302 0.00305 lineto
0.1255 0.00195 lineto
0.12674 0.00151 lineto
0.12798 0.00114 lineto
0.12922 0.00083 lineto
0.13046 0.00059 lineto
0.1317 0.0004 lineto
0.13294 0.00026 lineto
0.13418 0.00015 lineto
0.13542 8e-05 lineto
0.13666 4e-05 lineto
Mistroke
0.1379 2e-05 lineto
0.13914 1e-05 lineto
0.14038 0 lineto
0.14162 0 lineto
0.14286 0 lineto
0.1441 0 lineto
0.14534 0 lineto
0.14658 1e-05 lineto
0.14782 2e-05 lineto
0.14906 5e-05 lineto
0.1503 9e-05 lineto
0.15154 0.00017 lineto
0.15278 0.00029 lineto
0.15402 0.00046 lineto
0.15526 0.00069 lineto
0.1565 0.001 lineto
0.15774 0.00138 lineto
0.16022 0.00245 lineto
0.1627 0.00396 lineto
0.16518 0.00594 lineto
0.16766 0.00842 lineto
0.17262 0.01463 lineto
0.18254 0.02909 lineto
0.1875 0.03517 lineto
0.18998 0.03756 lineto
0.19246 0.03946 lineto
0.1937 0.04022 lineto
0.19494 0.04086 lineto
0.19618 0.04139 lineto
0.19742 0.04181 lineto
0.19866 0.04211 lineto
0.1999 0.04231 lineto
0.20114 0.04242 lineto
0.20238 0.04242 lineto
0.20362 0.04233 lineto
0.20486 0.04213 lineto
0.2061 0.04184 lineto
0.20734 0.04145 lineto
0.20982 0.04035 lineto
0.2123 0.03882 lineto
0.21478 0.03682 lineto
0.21726 0.03437 lineto
0.22222 0.0283 lineto
0.23214 0.01424 lineto
0.2371 0.00825 lineto
0.23958 0.00586 lineto
0.24206 0.00394 lineto
0.24454 0.00246 lineto
0.24578 0.00188 lineto
0.24702 0.00141 lineto
Mistroke
0.24826 0.00102 lineto
0.2495 0.00071 lineto
0.25074 0.00048 lineto
0.25198 0.0003 lineto
0.25322 0.00018 lineto
0.25446 0.0001 lineto
0.2557 5e-05 lineto
0.25694 2e-05 lineto
0.25818 1e-05 lineto
0.25942 0 lineto
0.26066 0 lineto
0.2619 0 lineto
0.26314 0 lineto
0.26438 0 lineto
0.26563 1e-05 lineto
0.26687 2e-05 lineto
0.26811 5e-05 lineto
0.26935 0.00011 lineto
0.27059 0.0002 lineto
0.27183 0.00034 lineto
0.27307 0.00054 lineto
0.27431 0.00082 lineto
0.27555 0.00118 lineto
0.27679 0.00165 lineto
0.27803 0.00225 lineto
0.27927 0.00297 lineto
0.28175 0.00489 lineto
0.28423 0.00749 lineto
0.28671 0.01083 lineto
0.29167 0.01976 lineto
0.30159 0.04393 lineto
0.31151 0.06763 lineto
0.31647 0.07661 lineto
0.31895 0.08024 lineto
0.32143 0.08326 lineto
0.32267 0.08453 lineto
0.32391 0.08562 lineto
0.32515 0.08653 lineto
0.32639 0.08724 lineto
0.32763 0.08772 lineto
0.32887 0.08797 lineto
0.33011 0.08795 lineto
0.33135 0.08765 lineto
0.33259 0.08705 lineto
0.33383 0.08613 lineto
0.33507 0.08489 lineto
0.33631 0.0833 lineto
0.34127 0.07356 lineto
0.35119 0.04241 lineto
0.35615 0.02619 lineto
Mistroke
0.36111 0.01325 lineto
0.36359 0.00852 lineto
0.36483 0.00661 lineto
0.36607 0.005 lineto
0.36731 0.00367 lineto
0.36855 0.0026 lineto
0.36979 0.00176 lineto
0.37103 0.00114 lineto
0.37227 0.00069 lineto
0.37351 0.00038 lineto
0.37475 0.00019 lineto
0.37599 8e-05 lineto
0.37723 3e-05 lineto
0.37847 1e-05 lineto
0.37971 0 lineto
0.38095 0 lineto
0.38219 0 lineto
0.38343 1e-05 lineto
0.38467 3e-05 lineto
0.38591 9e-05 lineto
0.38715 0.00022 lineto
0.38839 0.00045 lineto
0.38963 0.00083 lineto
0.39087 0.00141 lineto
0.39211 0.00225 lineto
0.39335 0.00341 lineto
0.39583 0.00694 lineto
0.39707 0.00943 lineto
0.39831 0.0125 lineto
0.40079 0.02058 lineto
0.40327 0.03155 lineto
0.40575 0.04565 lineto
0.41071 0.08325 lineto
0.42063 0.18609 lineto
0.44048 0.38471 lineto
0.44544 0.42407 lineto
0.44792 0.44138 lineto
0.4504 0.45615 lineto
0.45164 0.46229 lineto
0.45288 0.46744 lineto
0.45412 0.47146 lineto
0.45536 0.47424 lineto
0.4566 0.47565 lineto
0.45784 0.47561 lineto
0.45908 0.47401 lineto
0.46032 0.47079 lineto
0.46156 0.46588 lineto
0.4628 0.45927 lineto
0.46404 0.45094 lineto
0.46528 0.4409 lineto
Mistroke
0.47024 0.38471 lineto
0.4752 0.30789 lineto
0.48016 0.22056 lineto
0.48512 0.13507 lineto
0.4876 0.09692 lineto
0.49008 0.06369 lineto
0.49256 0.03656 lineto
0.4938 0.02559 lineto
0.49504 0.01648 lineto
0.49628 0.00932 lineto
0.49752 0.00416 lineto
0.49876 0.00104 lineto
0.5 0 lineto
0.50124 0.00104 lineto
0.50248 0.00416 lineto
0.50372 0.00932 lineto
0.50496 0.01648 lineto
0.5062 0.02559 lineto
0.50744 0.03656 lineto
0.50992 0.06369 lineto
0.51488 0.13507 lineto
0.51984 0.22056 lineto
0.5248 0.30789 lineto
0.52976 0.38471 lineto
0.53224 0.41586 lineto
0.53472 0.4409 lineto
0.53596 0.45094 lineto
0.5372 0.45927 lineto
0.53844 0.46588 lineto
0.53968 0.47079 lineto
0.54092 0.47401 lineto
0.54216 0.47561 lineto
0.5434 0.47565 lineto
0.54464 0.47424 lineto
0.54588 0.47146 lineto
0.54712 0.46744 lineto
0.5496 0.45615 lineto
0.55208 0.44138 lineto
0.55456 0.42407 lineto
0.55952 0.38471 lineto
0.57937 0.18609 lineto
0.58433 0.13154 lineto
0.58929 0.08325 lineto
0.59177 0.06293 lineto
0.59425 0.04565 lineto
0.59673 0.03155 lineto
0.59921 0.02058 lineto
0.60045 0.0162 lineto
0.60169 0.0125 lineto
0.60293 0.00943 lineto
Mistroke
0.60417 0.00694 lineto
0.60541 0.00495 lineto
0.60665 0.00341 lineto
0.60789 0.00225 lineto
0.60913 0.00141 lineto
0.61037 0.00083 lineto
0.61161 0.00045 lineto
0.61285 0.00022 lineto
0.61409 9e-05 lineto
0.61533 3e-05 lineto
0.61657 1e-05 lineto
0.61781 0 lineto
0.61905 0 lineto
0.62029 0 lineto
0.62153 1e-05 lineto
0.62277 3e-05 lineto
0.62401 8e-05 lineto
0.62525 0.00019 lineto
0.62649 0.00038 lineto
0.62773 0.00069 lineto
0.62897 0.00114 lineto
0.63021 0.00176 lineto
0.63145 0.0026 lineto
0.63269 0.00367 lineto
0.63393 0.005 lineto
0.63641 0.00852 lineto
0.63889 0.01325 lineto
0.64385 0.02619 lineto
0.64881 0.04241 lineto
0.65377 0.0592 lineto
0.65625 0.06685 lineto
0.65873 0.07356 lineto
0.66121 0.07909 lineto
0.66369 0.0833 lineto
0.66493 0.08489 lineto
0.66617 0.08613 lineto
0.66741 0.08705 lineto
0.66865 0.08765 lineto
0.66989 0.08795 lineto
0.67113 0.08797 lineto
0.67237 0.08772 lineto
0.67361 0.08724 lineto
0.67485 0.08653 lineto
0.67609 0.08562 lineto
0.67857 0.08326 lineto
0.68105 0.08024 lineto
0.68353 0.07661 lineto
0.68849 0.06763 lineto
0.69841 0.04393 lineto
0.70833 0.01976 lineto
Mistroke
0.71081 0.01493 lineto
0.71329 0.01083 lineto
0.71577 0.00749 lineto
0.71825 0.00489 lineto
0.71949 0.00385 lineto
0.72073 0.00297 lineto
0.72321 0.00165 lineto
0.72445 0.00118 lineto
0.72569 0.00082 lineto
0.72693 0.00054 lineto
0.72817 0.00034 lineto
0.72941 0.0002 lineto
0.73065 0.00011 lineto
0.73189 5e-05 lineto
0.73313 2e-05 lineto
0.73438 1e-05 lineto
0.73562 0 lineto
0.73686 0 lineto
0.7381 0 lineto
0.73934 0 lineto
0.74058 0 lineto
0.74182 1e-05 lineto
0.74306 2e-05 lineto
0.7443 5e-05 lineto
0.74554 0.0001 lineto
0.74678 0.00018 lineto
0.74802 0.0003 lineto
0.74926 0.00048 lineto
0.7505 0.00071 lineto
0.75174 0.00102 lineto
0.75298 0.00141 lineto
0.75546 0.00246 lineto
0.75794 0.00394 lineto
0.76042 0.00586 lineto
0.7629 0.00825 lineto
0.76786 0.01424 lineto
0.77778 0.0283 lineto
0.78274 0.03437 lineto
0.78522 0.03682 lineto
0.7877 0.03882 lineto
0.79018 0.04035 lineto
0.79142 0.04096 lineto
0.79266 0.04145 lineto
0.7939 0.04184 lineto
0.79514 0.04213 lineto
0.79638 0.04233 lineto
0.79762 0.04242 lineto
0.81746 0.02909 lineto
0.82738 0.01463 lineto
0.83234 0.00842 lineto
Mistroke
0.83482 0.00594 lineto
0.8373 0.00396 lineto
0.83978 0.00245 lineto
0.84102 0.00186 lineto
0.84226 0.00138 lineto
0.8435 0.001 lineto
0.84474 0.00069 lineto
0.84598 0.00046 lineto
0.84722 0.00029 lineto
0.84846 0.00017 lineto
0.8497 9e-05 lineto
0.85094 5e-05 lineto
0.85218 2e-05 lineto
0.85342 1e-05 lineto
0.85466 0 lineto
0.8559 0 lineto
0.85714 0 lineto
0.85838 0 lineto
0.85962 0 lineto
0.86086 1e-05 lineto
0.8621 2e-05 lineto
0.86334 4e-05 lineto
0.86458 8e-05 lineto
0.86582 0.00015 lineto
0.86706 0.00026 lineto
0.8683 0.0004 lineto
0.86954 0.00059 lineto
0.87078 0.00083 lineto
0.87202 0.00114 lineto
0.8745 0.00195 lineto
0.87698 0.00305 lineto
0.87946 0.00444 lineto
0.88194 0.00609 lineto
0.8869 0.00993 lineto
0.89187 0.01394 lineto
0.89435 0.01577 lineto
0.89683 0.01738 lineto
0.89931 0.01872 lineto
0.90055 0.01927 lineto
0.90179 0.01974 lineto
0.90303 0.02012 lineto
0.90427 0.02043 lineto
0.90551 0.02065 lineto
0.90675 0.0208 lineto
0.90799 0.02088 lineto
0.90923 0.02089 lineto
0.91047 0.02083 lineto
0.91171 0.02072 lineto
0.91419 0.02034 lineto
0.91543 0.02008 lineto
Mistroke
0.91667 0.01978 lineto
0.93651 0.01045 lineto
0.94147 0.00743 lineto
0.94643 0.00472 lineto
0.95139 0.0026 lineto
0.95387 0.0018 lineto
0.95635 0.00118 lineto
0.95759 0.00093 lineto
0.95883 0.00072 lineto
0.96007 0.00054 lineto
0.96131 0.0004 lineto
0.96255 0.00029 lineto
0.96379 0.0002 lineto
0.96503 0.00013 lineto
0.96627 8e-05 lineto
0.96751 5e-05 lineto
0.96875 3e-05 lineto
0.96999 1e-05 lineto
0.97123 1e-05 lineto
0.97247 0 lineto
0.97371 0 lineto
0.97495 0 lineto
0.97619 0 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.119048 1.946143e-17 0.561849 [
[(-4)] 0.02381 0 0 2 Msboxa
[(-2)] 0.2619 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(2)] 0.7381 0 0 2 Msboxa
[(4)] 0.97619 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Psi^|: n = 4)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.00625 lineto
stroke
grestore
[(-4)] 0.02381 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.2619 0 moveto
0.2619 0.00625 lineto
stroke
grestore
[(-2)] 0.2619 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.7381 0 moveto
0.7381 0.00625 lineto
stroke
grestore
[(2)] 0.7381 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.97619 0 moveto
0.97619 0.00625 lineto
stroke
grestore
[(4)] 0.97619 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.07143 0 moveto
0.07143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.11905 0 moveto
0.11905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.16667 0 moveto
0.16667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.21429 0 moveto
0.21429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.30952 0 moveto
0.30952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.35714 0 moveto
0.35714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.40476 0 moveto
0.40476 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.45238 0 moveto
0.45238 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.54762 0 moveto
0.54762 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.59524 0 moveto
0.59524 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.64286 0 moveto
0.64286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.69048 0 moveto
0.69048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.78571 0 moveto
0.78571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.83333 0 moveto
0.83333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.88095 0 moveto
0.88095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.92857 0 moveto
0.92857 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Psi^|: n = 4)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0 moveto
0.02505 0 lineto
0.02629 0 lineto
0.02753 0 lineto
0.02877 0 lineto
0.03001 0 lineto
0.03125 0 lineto
0.03249 0 lineto
0.03373 0 lineto
0.03497 0 lineto
0.03621 0 lineto
0.03745 0 lineto
0.03869 0 lineto
0.03993 0 lineto
0.04117 0 lineto
0.04241 0 lineto
0.04365 0 lineto
0.04489 0 lineto
0.04613 0 lineto
0.04737 0 lineto
0.04861 1e-05 lineto
0.04985 1e-05 lineto
0.05109 1e-05 lineto
0.05233 2e-05 lineto
0.05357 2e-05 lineto
0.05481 3e-05 lineto
0.05605 4e-05 lineto
0.05729 6e-05 lineto
0.05853 8e-05 lineto
0.06101 0.00013 lineto
0.06225 0.00016 lineto
0.06349 0.0002 lineto
0.06597 0.0003 lineto
0.06845 0.00045 lineto
0.07093 0.00064 lineto
0.07341 0.0009 lineto
0.07589 0.00122 lineto
0.07837 0.00163 lineto
0.08333 0.00271 lineto
0.08829 0.0042 lineto
0.09325 0.00612 lineto
0.10317 0.01115 lineto
0.12302 0.02463 lineto
0.13294 0.0321 lineto
0.14286 0.03885 lineto
0.14782 0.04156 lineto
0.15278 0.04364 lineto
0.15526 0.0444 lineto
0.1565 0.0447 lineto
0.15774 0.04495 lineto
Mistroke
0.15898 0.04515 lineto
0.16022 0.04528 lineto
0.16146 0.04536 lineto
0.1627 0.04539 lineto
0.16394 0.04535 lineto
0.16518 0.04525 lineto
0.16642 0.04509 lineto
0.16766 0.04486 lineto
0.1689 0.04457 lineto
0.17014 0.04421 lineto
0.17262 0.04329 lineto
0.1751 0.0421 lineto
0.17758 0.04062 lineto
0.18254 0.03683 lineto
0.19246 0.02654 lineto
0.20238 0.01515 lineto
0.20734 0.01024 lineto
0.2123 0.00634 lineto
0.21478 0.0048 lineto
0.21726 0.00353 lineto
0.21974 0.00252 lineto
0.22222 0.00174 lineto
0.2247 0.00116 lineto
0.22718 0.00074 lineto
0.22842 0.00058 lineto
0.22966 0.00045 lineto
0.2309 0.00034 lineto
0.23214 0.00026 lineto
0.23338 0.00019 lineto
0.23462 0.00014 lineto
0.23586 0.0001 lineto
0.2371 7e-05 lineto
0.23834 5e-05 lineto
0.23958 3e-05 lineto
0.24082 2e-05 lineto
0.24206 1e-05 lineto
0.2433 1e-05 lineto
0.24454 1e-05 lineto
0.24578 0 lineto
0.24702 0 lineto
0.24826 0 lineto
0.2495 0 lineto
0.25074 0 lineto
0.25198 0 lineto
0.25322 0 lineto
0.25446 0 lineto
0.2557 0 lineto
0.25694 0 lineto
0.25818 0 lineto
0.25942 0 lineto
Mistroke
0.26066 0 lineto
0.2619 0 lineto
0.26314 0 lineto
0.26438 0 lineto
0.26563 0 lineto
0.26687 0 lineto
0.26811 0 lineto
0.26935 0 lineto
0.27059 0 lineto
0.27183 0 lineto
0.27307 0 lineto
0.27431 0 lineto
0.27555 0 lineto
0.27679 0 lineto
0.27803 0 lineto
0.27927 1e-05 lineto
0.28051 1e-05 lineto
0.28175 2e-05 lineto
0.28299 3e-05 lineto
0.28423 5e-05 lineto
0.28547 7e-05 lineto
0.28671 0.0001 lineto
0.28795 0.00015 lineto
0.28919 0.00021 lineto
0.29043 0.0003 lineto
0.29167 0.00041 lineto
0.29291 0.00055 lineto
0.29415 0.00073 lineto
0.29663 0.00125 lineto
0.29787 0.0016 lineto
0.29911 0.00204 lineto
0.30159 0.00319 lineto
0.30407 0.0048 lineto
0.30655 0.00701 lineto
0.30903 0.00992 lineto
0.31151 0.01366 lineto
0.31399 0.01834 lineto
0.31647 0.02406 lineto
0.32143 0.03885 lineto
0.32639 0.05823 lineto
0.33135 0.08188 lineto
0.34127 0.13867 lineto
0.38095 0.39506 lineto
0.39087 0.44823 lineto
0.39583 0.47085 lineto
0.40079 0.49047 lineto
0.40575 0.50666 lineto
0.40823 0.51321 lineto
0.41071 0.5185 lineto
0.41195 0.52061 lineto
Mistroke
0.41319 0.52232 lineto
0.41443 0.52359 lineto
0.41567 0.52439 lineto
0.41691 0.52467 lineto
0.41815 0.5244 lineto
0.41939 0.52354 lineto
0.42063 0.52205 lineto
0.42188 0.51989 lineto
0.42312 0.51703 lineto
0.4256 0.50909 lineto
0.42808 0.49801 lineto
0.43056 0.48367 lineto
0.43552 0.44528 lineto
0.44048 0.39506 lineto
0.4504 0.27202 lineto
0.46032 0.1492 lineto
0.46528 0.09874 lineto
0.47024 0.0592 lineto
0.47272 0.04378 lineto
0.4752 0.03119 lineto
0.47768 0.02126 lineto
0.48016 0.01374 lineto
0.4814 0.01078 lineto
0.48264 0.0083 lineto
0.48512 0.0046 lineto
0.48636 0.00328 lineto
0.4876 0.00227 lineto
0.48884 0.0015 lineto
0.49008 0.00095 lineto
0.49132 0.00056 lineto
0.49256 0.0003 lineto
0.4938 0.00015 lineto
0.49504 6e-05 lineto
0.49628 2e-05 lineto
0.49752 0 lineto
0.49876 0 lineto
0.5 0 lineto
0.50124 0 lineto
0.50248 0 lineto
0.50372 2e-05 lineto
0.50496 6e-05 lineto
0.5062 0.00015 lineto
0.50744 0.0003 lineto
0.50868 0.00056 lineto
0.50992 0.00095 lineto
0.51116 0.0015 lineto
0.5124 0.00227 lineto
0.51364 0.00328 lineto
0.51488 0.0046 lineto
0.51736 0.0083 lineto
Mistroke
0.5186 0.01078 lineto
0.51984 0.01374 lineto
0.52232 0.02126 lineto
0.5248 0.03119 lineto
0.52728 0.04378 lineto
0.52976 0.0592 lineto
0.53472 0.09874 lineto
0.53968 0.1492 lineto
0.5496 0.27202 lineto
0.55952 0.39506 lineto
0.56448 0.44528 lineto
0.56944 0.48367 lineto
0.57192 0.49801 lineto
0.5744 0.50909 lineto
0.57688 0.51703 lineto
0.57813 0.51989 lineto
0.57937 0.52205 lineto
0.58061 0.52354 lineto
0.58185 0.5244 lineto
0.58309 0.52467 lineto
0.58433 0.52439 lineto
0.58557 0.52359 lineto
0.58681 0.52232 lineto
0.58929 0.5185 lineto
0.59177 0.51321 lineto
0.59425 0.50666 lineto
0.59921 0.49047 lineto
0.60913 0.44823 lineto
0.61905 0.39506 lineto
0.63889 0.26809 lineto
0.65873 0.13867 lineto
0.66865 0.08188 lineto
0.67361 0.05823 lineto
0.67857 0.03885 lineto
0.68105 0.03088 lineto
0.68353 0.02406 lineto
0.68601 0.01834 lineto
0.68849 0.01366 lineto
0.69097 0.00992 lineto
0.69345 0.00701 lineto
0.69593 0.0048 lineto
0.69841 0.00319 lineto
0.70089 0.00204 lineto
0.70213 0.0016 lineto
0.70337 0.00125 lineto
0.70461 0.00096 lineto
0.70585 0.00073 lineto
0.70709 0.00055 lineto
0.70833 0.00041 lineto
0.70957 0.0003 lineto
Mistroke
0.71081 0.00021 lineto
0.71205 0.00015 lineto
0.71329 0.0001 lineto
0.71453 7e-05 lineto
0.71577 5e-05 lineto
0.71701 3e-05 lineto
0.71825 2e-05 lineto
0.71949 1e-05 lineto
0.72073 1e-05 lineto
0.72197 0 lineto
0.72321 0 lineto
0.72445 0 lineto
0.72569 0 lineto
0.72693 0 lineto
0.72817 0 lineto
0.72941 0 lineto
0.73065 0 lineto
0.73189 0 lineto
0.73313 0 lineto
0.73438 0 lineto
0.73562 0 lineto
0.73686 0 lineto
0.7381 0 lineto
0.73934 0 lineto
0.74058 0 lineto
0.74182 0 lineto
0.74306 0 lineto
0.7443 0 lineto
0.74554 0 lineto
0.74678 0 lineto
0.74802 0 lineto
0.74926 0 lineto
0.7505 0 lineto
0.75174 0 lineto
0.75298 0 lineto
0.75422 0 lineto
0.75546 1e-05 lineto
0.7567 1e-05 lineto
0.75794 1e-05 lineto
0.75918 2e-05 lineto
0.76042 3e-05 lineto
0.76166 5e-05 lineto
0.7629 7e-05 lineto
0.76414 0.0001 lineto
0.76538 0.00014 lineto
0.76662 0.00019 lineto
0.76786 0.00026 lineto
0.7691 0.00034 lineto
0.77034 0.00045 lineto
0.77282 0.00074 lineto
Mistroke
0.77406 0.00093 lineto
0.7753 0.00116 lineto
0.77778 0.00174 lineto
0.78026 0.00252 lineto
0.78274 0.00353 lineto
0.7877 0.00634 lineto
0.79266 0.01024 lineto
0.79762 0.01515 lineto
0.80754 0.02654 lineto
0.81746 0.03683 lineto
0.82242 0.04062 lineto
0.8249 0.0421 lineto
0.82738 0.04329 lineto
0.82986 0.04421 lineto
0.8311 0.04457 lineto
0.83234 0.04486 lineto
0.83358 0.04509 lineto
0.83482 0.04525 lineto
0.83606 0.04535 lineto
0.8373 0.04539 lineto
0.83854 0.04536 lineto
0.83978 0.04528 lineto
0.84102 0.04515 lineto
0.84226 0.04495 lineto
0.84474 0.0444 lineto
0.84722 0.04364 lineto
0.8497 0.04269 lineto
0.85218 0.04156 lineto
0.85714 0.03885 lineto
0.87698 0.02463 lineto
0.8869 0.01745 lineto
0.89683 0.01115 lineto
0.90675 0.00612 lineto
0.91171 0.0042 lineto
0.91667 0.00271 lineto
0.92163 0.00163 lineto
0.92411 0.00122 lineto
0.92659 0.0009 lineto
0.92907 0.00064 lineto
0.93155 0.00045 lineto
0.93403 0.0003 lineto
0.93651 0.0002 lineto
0.93775 0.00016 lineto
0.93899 0.00013 lineto
0.94023 0.0001 lineto
0.94147 8e-05 lineto
0.94271 6e-05 lineto
0.94395 4e-05 lineto
0.94519 3e-05 lineto
0.94643 2e-05 lineto
Mistroke
0.94767 2e-05 lineto
0.94891 1e-05 lineto
0.95015 1e-05 lineto
0.95139 1e-05 lineto
0.95263 0 lineto
0.95387 0 lineto
0.95511 0 lineto
0.95635 0 lineto
0.95759 0 lineto
0.95883 0 lineto
0.96007 0 lineto
0.96131 0 lineto
0.96255 0 lineto
0.96379 0 lineto
0.96503 0 lineto
0.96627 0 lineto
0.96751 0 lineto
0.96875 0 lineto
0.96999 0 lineto
0.97123 0 lineto
0.97247 0 lineto
0.97371 0 lineto
0.97495 0 lineto
0.97619 0 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; endGroup; endGroup; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 12  scalefont  setfont
% Scaling calculations
0.5 0.238095 1.946143e-17 0.561849 [
[(-2)] 0.02381 0 0 2 Msboxa
[(-1)] 0.2619 0 0 2 Msboxa
[(0)] 0.5 0 0 2 Msboxa
[(1)] 0.7381 0 0 2 Msboxa
[(2)] 0.97619 0 0 2 Msboxa
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Psi^|: n = 8)] 0.5 0.61803 0 -2 Msboxa
grestore
[(0.2)] 0.4875 0.11237 1 0 Msboxa
[(0.4)] 0.4875 0.22474 1 0 Msboxa
[(0.6)] 0.4875 0.33711 1 0 Msboxa
[(0.8)] 0.4875 0.44948 1 0 Msboxa
[(1)] 0.4875 0.56185 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.00625 lineto
stroke
grestore
[(-2)] 0.02381 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.2619 0 moveto
0.2619 0.00625 lineto
stroke
grestore
[(-1)] 0.2619 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.00625 lineto
stroke
grestore
[(0)] 0.5 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.7381 0 moveto
0.7381 0.00625 lineto
stroke
grestore
[(1)] 0.7381 0 0 2 Mshowa
gsave
0.002 setlinewidth
0.97619 0 moveto
0.97619 0.00625 lineto
stroke
grestore
[(2)] 0.97619 0 0 2 Mshowa
gsave
0.001 setlinewidth
0.07143 0 moveto
0.07143 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.11905 0 moveto
0.11905 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.16667 0 moveto
0.16667 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.21429 0 moveto
0.21429 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.30952 0 moveto
0.30952 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.35714 0 moveto
0.35714 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.40476 0 moveto
0.40476 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.45238 0 moveto
0.45238 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.54762 0 moveto
0.54762 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.59524 0 moveto
0.59524 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.64286 0 moveto
0.64286 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.69048 0 moveto
0.69048 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.78571 0 moveto
0.78571 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.83333 0 moveto
0.83333 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.88095 0 moveto
0.88095 0.00375 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.92857 0 moveto
0.92857 0.00375 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0 moveto
1 0 lineto
stroke
grestore
gsave
/Helvetica-Bold findfont 16 scalefont setfont
[(Daubechies' |Psi^|: n = 8)] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.5 0.11237 moveto
0.50625 0.11237 lineto
stroke
grestore
[(0.2)] 0.4875 0.11237 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.22474 moveto
0.50625 0.22474 lineto
stroke
grestore
[(0.4)] 0.4875 0.22474 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.33711 moveto
0.50625 0.33711 lineto
stroke
grestore
[(0.6)] 0.4875 0.33711 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.44948 moveto
0.50625 0.44948 lineto
stroke
grestore
[(0.8)] 0.4875 0.44948 1 0 Mshowa
gsave
0.002 setlinewidth
0.5 0.56185 moveto
0.50625 0.56185 lineto
stroke
grestore
[(1)] 0.4875 0.56185 1 0 Mshowa
gsave
0.001 setlinewidth
0.5 0.02247 moveto
0.50375 0.02247 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.04495 moveto
0.50375 0.04495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.06742 moveto
0.50375 0.06742 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.0899 moveto
0.50375 0.0899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.13484 moveto
0.50375 0.13484 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.15732 moveto
0.50375 0.15732 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.17979 moveto
0.50375 0.17979 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.20227 moveto
0.50375 0.20227 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.24721 moveto
0.50375 0.24721 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.26969 moveto
0.50375 0.26969 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.29216 moveto
0.50375 0.29216 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.31464 moveto
0.50375 0.31464 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.35958 moveto
0.50375 0.35958 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.38206 moveto
0.50375 0.38206 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.40453 moveto
0.50375 0.40453 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.42701 moveto
0.50375 0.42701 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.47195 moveto
0.50375 0.47195 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.49443 moveto
0.50375 0.49443 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.5169 moveto
0.50375 0.5169 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.53938 moveto
0.50375 0.53938 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.58432 moveto
0.50375 0.58432 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.5 0.6068 moveto
0.50375 0.6068 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.5 0 moveto
0.5 0.61803 lineto
stroke
grestore
grestore
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
gsave
gsave
0.004 setlinewidth
0.02381 0 moveto
0.02505 0 lineto
0.02629 0 lineto
0.02753 0 lineto
0.02877 0 lineto
0.03001 0 lineto
0.03125 0 lineto
0.03249 0 lineto
0.03373 0 lineto
0.03497 0 lineto
0.03621 0 lineto
0.03745 0 lineto
0.03869 0 lineto
0.03993 0 lineto
0.04117 0 lineto
0.04241 0 lineto
0.04365 0 lineto
0.04489 0 lineto
0.04613 0 lineto
0.04737 0 lineto
0.04861 0 lineto
0.04985 0 lineto
0.05109 0 lineto
0.05233 0 lineto
0.05357 0 lineto
0.05481 0 lineto
0.05605 0 lineto
0.05729 0 lineto
0.05853 0 lineto
0.05977 0 lineto
0.06101 0 lineto
0.06225 0 lineto
0.06349 0 lineto
0.06473 0 lineto
0.06597 0 lineto
0.06721 0 lineto
0.06845 0 lineto
0.06969 0 lineto
0.07093 0 lineto
0.07217 0 lineto
0.07341 0 lineto
0.07465 0 lineto
0.07589 0 lineto
0.07713 0 lineto
0.07837 0 lineto
0.07961 0 lineto
0.08085 0 lineto
0.08209 0 lineto
0.08333 0 lineto
0.08457 0 lineto
Mistroke
0.08581 0 lineto
0.08705 0 lineto
0.08829 1e-05 lineto
0.08953 1e-05 lineto
0.09077 1e-05 lineto
0.09325 1e-05 lineto
0.09449 2e-05 lineto
0.09573 2e-05 lineto
0.09697 3e-05 lineto
0.09821 4e-05 lineto
0.10069 6e-05 lineto
0.10193 7e-05 lineto
0.10317 9e-05 lineto
0.10565 0.00013 lineto
0.10813 0.00019 lineto
0.11062 0.00028 lineto
0.1131 0.00039 lineto
0.11558 0.00055 lineto
0.11806 0.00075 lineto
0.12054 0.00101 lineto
0.12302 0.00135 lineto
0.1255 0.00178 lineto
0.12798 0.00231 lineto
0.13046 0.00297 lineto
0.13294 0.00376 lineto
0.1379 0.00586 lineto
0.14286 0.00876 lineto
0.14782 0.0126 lineto
0.15278 0.01751 lineto
0.1627 0.03085 lineto
0.17262 0.04918 lineto
0.18254 0.07262 lineto
0.20238 0.1353 lineto
0.22222 0.2171 lineto
0.24206 0.30897 lineto
0.2619 0.39718 lineto
0.28175 0.46908 lineto
0.29167 0.49653 lineto
0.30159 0.51803 lineto
0.31151 0.53398 lineto
0.31647 0.54008 lineto
0.32143 0.54502 lineto
0.32639 0.54884 lineto
0.32887 0.55032 lineto
0.33011 0.55094 lineto
0.33135 0.55147 lineto
0.33259 0.55193 lineto
0.33383 0.55229 lineto
0.33507 0.55255 lineto
0.33631 0.55271 lineto
Mistroke
0.33755 0.55275 lineto
0.33879 0.55268 lineto
0.34003 0.55247 lineto
0.34127 0.55213 lineto
0.34251 0.55163 lineto
0.34375 0.55098 lineto
0.34623 0.54912 lineto
0.34747 0.5479 lineto
0.34871 0.54647 lineto
0.35119 0.54289 lineto
0.35367 0.53827 lineto
0.35615 0.5325 lineto
0.36111 0.51709 lineto
0.36607 0.49597 lineto
0.37103 0.46878 lineto
0.38095 0.39718 lineto
0.40079 0.21749 lineto
0.41071 0.13591 lineto
0.41567 0.10213 lineto
0.42063 0.0739 lineto
0.4256 0.05131 lineto
0.43056 0.03403 lineto
0.43304 0.0272 lineto
0.43552 0.02145 lineto
0.44048 0.01276 lineto
0.44296 0.00961 lineto
0.44544 0.00711 lineto
0.44792 0.00516 lineto
0.4504 0.00367 lineto
0.45288 0.00255 lineto
0.45536 0.00173 lineto
0.4566 0.00141 lineto
0.45784 0.00114 lineto
0.45908 0.00092 lineto
0.46032 0.00073 lineto
0.4628 0.00045 lineto
0.46404 0.00035 lineto
0.46528 0.00027 lineto
0.46652 0.00021 lineto
0.46776 0.00015 lineto
0.469 0.00011 lineto
0.47024 8e-05 lineto
0.47148 6e-05 lineto
0.47272 4e-05 lineto
0.47396 3e-05 lineto
0.4752 2e-05 lineto
0.47644 1e-05 lineto
0.47768 1e-05 lineto
0.47892 1e-05 lineto
0.48016 0 lineto
Mistroke
0.4814 0 lineto
0.48264 0 lineto
0.48388 0 lineto
0.48512 0 lineto
0.48636 0 lineto
0.4876 0 lineto
0.48884 0 lineto
0.49008 0 lineto
0.49132 0 lineto
0.49256 0 lineto
0.4938 0 lineto
0.49504 0 lineto
0.49628 0 lineto
0.49752 0 lineto
0.49876 0 lineto
0.5 0 lineto
0.50124 0 lineto
0.50248 0 lineto
0.50372 0 lineto
0.50496 0 lineto
0.5062 0 lineto
0.50744 0 lineto
0.50868 0 lineto
0.50992 0 lineto
0.51116 0 lineto
0.5124 0 lineto
0.51364 0 lineto
0.51488 0 lineto
0.51612 0 lineto
0.51736 0 lineto
0.5186 0 lineto
0.51984 0 lineto
0.52108 1e-05 lineto
0.52232 1e-05 lineto
0.52356 1e-05 lineto
0.5248 2e-05 lineto
0.52604 3e-05 lineto
0.52728 4e-05 lineto
0.52852 6e-05 lineto
0.52976 8e-05 lineto
0.531 0.00011 lineto
0.53224 0.00015 lineto
0.53472 0.00027 lineto
0.53596 0.00035 lineto
0.5372 0.00045 lineto
0.53844 0.00058 lineto
0.53968 0.00073 lineto
0.54216 0.00114 lineto
0.5434 0.00141 lineto
0.54464 0.00173 lineto
Mistroke
0.54712 0.00255 lineto
0.5496 0.00367 lineto
0.55208 0.00516 lineto
0.55456 0.00711 lineto
0.55704 0.00961 lineto
0.55952 0.01276 lineto
0.562 0.01667 lineto
0.56448 0.02145 lineto
0.56944 0.03403 lineto
0.5744 0.05131 lineto
0.57937 0.0739 lineto
0.58929 0.13591 lineto
0.59921 0.21749 lineto
0.60913 0.30917 lineto
0.61905 0.39718 lineto
0.62897 0.46878 lineto
0.63393 0.49597 lineto
0.63889 0.51709 lineto
0.64385 0.5325 lineto
0.64633 0.53827 lineto
0.64881 0.54289 lineto
0.65129 0.54647 lineto
0.65253 0.5479 lineto
0.65377 0.54912 lineto
0.65501 0.55014 lineto
0.65625 0.55098 lineto
0.65749 0.55163 lineto
0.65873 0.55213 lineto
0.65997 0.55247 lineto
0.66121 0.55268 lineto
0.66245 0.55275 lineto
0.66369 0.55271 lineto
0.66493 0.55255 lineto
0.66617 0.55229 lineto
0.66741 0.55193 lineto
0.66865 0.55147 lineto
0.67113 0.55032 lineto
0.67361 0.54884 lineto
0.67857 0.54502 lineto
0.68353 0.54008 lineto
0.68849 0.53398 lineto
0.69841 0.51803 lineto
0.70833 0.49653 lineto
0.71825 0.46908 lineto
0.7381 0.39718 lineto
0.77778 0.2171 lineto
0.79762 0.1353 lineto
0.81746 0.07262 lineto
0.82738 0.04918 lineto
0.8373 0.03085 lineto
Mistroke
0.84722 0.01751 lineto
0.85218 0.0126 lineto
0.85714 0.00876 lineto
0.8621 0.00586 lineto
0.86458 0.00472 lineto
0.86706 0.00376 lineto
0.86954 0.00297 lineto
0.87202 0.00231 lineto
0.87698 0.00135 lineto
0.87946 0.00101 lineto
0.88194 0.00075 lineto
0.88442 0.00055 lineto
0.8869 0.00039 lineto
0.88938 0.00028 lineto
0.89187 0.00019 lineto
0.89435 0.00013 lineto
0.89559 0.00011 lineto
0.89683 9e-05 lineto
0.89931 6e-05 lineto
0.90055 5e-05 lineto
0.90179 4e-05 lineto
0.90303 3e-05 lineto
0.90427 2e-05 lineto
0.90675 1e-05 lineto
0.90799 1e-05 lineto
0.90923 1e-05 lineto
0.91047 1e-05 lineto
0.91171 1e-05 lineto
0.91295 0 lineto
0.91419 0 lineto
0.91543 0 lineto
0.91667 0 lineto
0.91791 0 lineto
0.91915 0 lineto
0.92039 0 lineto
0.92163 0 lineto
0.92287 0 lineto
0.92411 0 lineto
0.92535 0 lineto
0.92659 0 lineto
0.92783 0 lineto
0.92907 0 lineto
0.93031 0 lineto
0.93155 0 lineto
0.93279 0 lineto
0.93403 0 lineto
0.93527 0 lineto
0.93651 0 lineto
0.93775 0 lineto
0.93899 0 lineto
Mistroke
0.94023 0 lineto
0.94147 0 lineto
0.94271 0 lineto
0.94395 0 lineto
0.94519 0 lineto
0.94643 0 lineto
0.94767 0 lineto
0.94891 0 lineto
0.95015 0 lineto
0.95139 0 lineto
0.95263 0 lineto
0.95387 0 lineto
0.95511 0 lineto
0.95635 0 lineto
0.95759 0 lineto
0.95883 0 lineto
0.96007 0 lineto
0.96131 0 lineto
0.96255 0 lineto
0.96379 0 lineto
0.96503 0 lineto
0.96627 0 lineto
0.96751 0 lineto
0.96875 0 lineto
0.96999 0 lineto
0.97123 0 lineto
0.97247 0 lineto
0.97371 0 lineto
0.97495 0 lineto
0.97619 0 lineto
Mfstroke
grestore
grestore
% End of Graphics
MathPictureEnd
:[font = text; inactive; preserveAspect; endGroup; endGroup; ]
LEFT TO DO:  Work out the number of factors needed for some definite accuracy criterion and put the resulting functions into the Daubechies.m package.
:[font = section; inactive; Cclosed; preserveAspect; startGroup; ]
Daubechies Minimum Phase Phi and Psi
:[font = text; inactive; preserveAspect; ]
I'm using the algorithm outlines in Strang: Wavelets and Dilation Equations: A Brief Introduction, SIAM Review, V 31, N 4, pp614-627, Dec 1989.  There is some dancing around between Lists and Subscripted variables--no doubt a wizard could do better.  Also note that the package supplies the h's (Ten Lectures, eq. 5.1.18), and I needed the cn's (first eq. on page 145), which differ by  sqrt(2).  Strang's construction is closely related to the refinement construction on p 202ff of Ten Lectures.  But I understood Strang's version better.

Note:  The Daubechies scaling functions and wavelets are defined recursively, so it's up to you to decide how  densely to compute them.  The variable `jmax' controls this.

LEFT TO DO:  I didn't get around to writing a general refinement function: the n = 2 and n = 4 subsections differ only by the initialization of n and the jmax chosen.  I tried once, but failed, for reasons I don't remember now.
;[s]
3:0,0;540,1;541,2;941,-1;
3:1,11,8,Times,0,12,0,0,0;1,13,10,Times,0,14,0,0,0;1,11,8,Times,0,12,0,0,0;
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup; ]
Function to compute phi on the integers in its support
:[font = input; preserveAspect; endGroup; ]
integerPhi[n_Integer?Positive] :=
Module[
	{m = 2n, sqrt2 = N@Sqrt[2], jlo, jhi, c, e, p},

	hn = dblh[n]; (* Tong's function for the hn *)
	Do[
		c[k-1] = hn[[k]]*sqrt2,
	{k, m}];

	For[i = 1, i < m - 1, ++i,
		jlo = Max[1, 2i - m + 1];
		jhi = Min[2i, m - 2];
		For[j = 1, j < m - 1, ++j,
			If[ jlo <= j <= jhi,
				(* then *) l[i][j] = c[2i - j],
				(* else *) l[i][j] = 0
			]
		]
	];
 
	e = Eigensystem@
		Table[l[i][j], {i, 1, m - 2}, {j, 1, m - 2}];
	p = e[[2]][[1]];
	p /= (Plus @@ p)   (* comps have to sum to one *)
]
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup; ]
n = 2
:[font = text; inactive; preserveAspect; ]
Set number of vanishing moments in the wavelet..
:[font = input; preserveAspect; ]
n = 2;
:[font = text; inactive; preserveAspect; ]
Compute d[n] and psi[n].
:[font = input; preserveAspect; startGroup; ]
jmax = 7;      (* number of levels i/2^j to compute *)
m = 2n;        (* convenience constant *)
imax = 2^jmax; (* convenience constant *)
dx = 1/imax;   (* convenience constant *)

hn = dblh[n]; (* Oops, repeated from integerPhi *)
Do[
	c[k-1] = hn[[k]]*N@Sqrt[2],
{k, m}]

Do[ (* wasteful, but clear *)
	d[k] = (-1)^k c[m-k-1],
{k, 0, m-1}]

p = integerPhi[n]
Do[
	phi[i] = p[[i]],
{i, 1, m-2}]
phi[x_] := 0.0 /; (x <= 0 || x >= m-1)
:[font = output; output; inactive; preserveAspect; endGroup; ]
{1.366025403784439, -0.3660254037844386}
;[o]
{1.36603, -0.366025}
:[font = text; inactive; preserveAspect; ]
Refine using the duplication formula.
:[font = input; preserveAspect; ]
Do[
	Do[
		phi[i/2^j] =
			Sum[c[k] phi[i/2^(j-1) - k],
			{k, 0, m-1}],
	{i, 1, (m-1) imax, 2}],
{j, 1, jmax}]

philist = {};
Do[
	AppendTo[philist, {N[i], phi[i]}],
{i, 0, m-1, dx}]

Clear[psi];
Do[
	Do[
		psi[i/2^j] =
			Sum[d[k] phi[i/2^(j-1) - k],
			{k, 0, m-1}],
	{i, 0, (m-1) imax, 1}], (* redundant? *)
{j, 0, jmax}]

psilist = {};
Do[
	AppendTo[psilist, {N[i], psi[i]}],
{i, 0, m-1, dx}]
:[font = text; inactive; preserveAspect; ]
Plot.s
:[font = input; preserveAspect; startGroup; ]
string =
StringForm[
	"Daubechies' Phi: n = `1` (dx = 1/`2`)", n, imax
];
label = FontForm[string, {"Times-Bold", 16}];

ListPlot[philist,
	PlotJoined -> True,
	PlotRange -> All,
	PlotLabel -> label
]

string =
StringForm[
	"Daubechies' Psi: n = `1` (dx = 1/`2`)", n, imax
];
label = FontForm[string, {"Times-Bold", 16}];

ListPlot[psilist,
	PlotJoined -> True,
	PlotRange -> All,
	PlotLabel -> label
]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.02381 0.31746 0.139102 0.339831 [
[(0.5)] 0.18254 0.1391 0 2 Msboxa
[(1)] 0.34127 0.1391 0 2 Msboxa
[(1.5)] 0.5 0.1391 0 2 Msboxa
[(2)] 0.65873 0.1391 0 2 Msboxa
[(2.5)] 0.81746 0.1391 0 2 Msboxa
[(3)] 0.97619 0.1391 0 2 Msboxa
gsave
/Times-Bold findfont 16 scalefont setfont
[(Daubechies' Phi: n = 2 \(dx = 1/128\))] 0.5 0.61803 0 -2 Msboxa
grestore
[(-0.25)] 0.01131 0.05414 1 0 Msboxa
[(0.25)] 0.01131 0.22406 1 0 Msboxa
[(0.5)] 0.01131 0.30902 1 0 Msboxa
[(0.75)] 0.01131 0.39397 1 0 Msboxa
[(1)] 0.01131 0.47893 1 0 Msboxa
[(1.25)] 0.01131 0.56389 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.18254 0.1391 moveto
0.18254 0.14535 lineto
stroke
grestore
[(0.5)] 0.18254 0.1391 0 2 Mshowa
gsave
0.002 setlinewidth
0.34127 0.1391 moveto
0.34127 0.14535 lineto
stroke
grestore
[(1)] 0.34127 0.1391 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0.1391 moveto
0.5 0.14535 lineto
stroke
grestore
[(1.5)] 0.5 0.1391 0 2 Mshowa
gsave
0.002 setlinewidth
0.65873 0.1391 moveto
0.65873 0.14535 lineto
stroke
grestore
[(2)] 0.65873 0.1391 0 2 Mshowa
gsave
0.002 setlinewidth
0.81746 0.1391 moveto
0.81746 0.14535 lineto
stroke
grestore
[(2.5)] 0.81746 0.1391 0 2 Mshowa
gsave
0.002 setlinewidth
0.97619 0.1391 moveto
0.97619 0.14535 lineto
stroke
grestore
[(3)] 0.97619 0.1391 0 2 Mshowa
gsave
0.001 setlinewidth
0.05556 0.1391 moveto
0.05556 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.0873 0.1391 moveto
0.0873 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.11905 0.1391 moveto
0.11905 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.15079 0.1391 moveto
0.15079 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.21429 0.1391 moveto
0.21429 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.24603 0.1391 moveto
0.24603 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.27778 0.1391 moveto
0.27778 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.30952 0.1391 moveto
0.30952 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.37302 0.1391 moveto
0.37302 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.40476 0.1391 moveto
0.40476 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.43651 0.1391 moveto
0.43651 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.46825 0.1391 moveto
0.46825 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.53175 0.1391 moveto
0.53175 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.56349 0.1391 moveto
0.56349 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.59524 0.1391 moveto
0.59524 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.62698 0.1391 moveto
0.62698 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.69048 0.1391 moveto
0.69048 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.72222 0.1391 moveto
0.72222 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.75397 0.1391 moveto
0.75397 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.78571 0.1391 moveto
0.78571 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.84921 0.1391 moveto
0.84921 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.88095 0.1391 moveto
0.88095 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.9127 0.1391 moveto
0.9127 0.14285 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.94444 0.1391 moveto
0.94444 0.14285 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0.1391 moveto
1 0.1391 lineto
stroke
grestore
gsave
/Times-Bold findfont 16 scalefont setfont
[(Daubechies' Phi: n = 2 \(dx = 1/128\))] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.02381 0.05414 moveto
0.03006 0.05414 lineto
stroke
grestore
[(-0.25)] 0.01131 0.05414 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.22406 moveto
0.03006 0.22406 lineto
stroke
grestore
[(0.25)] 0.01131 0.22406 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.30902 moveto
0.03006 0.30902 lineto
stroke
grestore
[(0.5)] 0.01131 0.30902 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.39397 moveto
0.03006 0.39397 lineto
stroke
grestore
[(0.75)] 0.01131 0.39397 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.47893 moveto
0.03006 0.47893 lineto
stroke
grestore
[(1)] 0.01131 0.47893 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.56389 moveto
0.03006 0.56389 lineto
stroke
grestore
[(1.25)] 0.01131 0.56389 1 0 Mshowa
gsave
0.001 setlinewidth
0.02381 0.07114 moveto
0.02756 0.07114 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.08813 moveto
0.02756 0.08813 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.10512 moveto
0.02756 0.10512 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.12211 moveto
0.02756 0.12211 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.15609 moveto
0.02756 0.15609 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.17308 moveto
0.02756 0.17308 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.19008 moveto
0.02756 0.19008 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.20707 moveto
0.02756 0.20707 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.24105 moveto
0.02756 0.24105 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.25804 moveto
0.02756 0.25804 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.27503 moveto
0.02756 0.27503 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.29203 moveto
0.02756 0.29203 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.32601 moveto
0.02756 0.32601 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.343 moveto
0.02756 0.343 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.35999 moveto
0.02756 0.35999 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.37698 moveto
0.02756 0.37698 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.41097 moveto
0.02756 0.41097 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.42796 moveto
0.02756 0.42796 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.44495 moveto
0.02756 0.44495 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.46194 moveto
0.02756 0.46194 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.49592 moveto
0.02756 0.49592 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.51292 moveto
0.02756 0.51292 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.52991 moveto
0.02756 0.52991 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.5469 moveto
0.02756 0.5469 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.03715 moveto
0.02756 0.03715 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.02016 moveto
0.02756 0.02016 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.00317 moveto
0.02756 0.00317 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.58088 moveto
0.02756 0.58088 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.59787 moveto
0.02756 0.59787 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.61486 moveto
0.02756 0.61486 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
grestore
grestore
0.004 setlinewidth
0.02381 0.1391 moveto
0.02629 0.17129 lineto
0.02877 0.18623 lineto
0.03125 0.19486 lineto
0.03373 0.2081 lineto
0.03621 0.21211 lineto
0.03869 0.22073 lineto
0.04117 0.23105 lineto
0.04365 0.24013 lineto
0.04613 0.24075 lineto
0.04861 0.24599 lineto
0.05109 0.25292 lineto
0.05357 0.25862 lineto
0.05605 0.26679 lineto
0.05853 0.27372 lineto
0.06101 0.2802 lineto
0.06349 0.28702 lineto
0.06597 0.28516 lineto
0.06845 0.28792 lineto
0.07093 0.29238 lineto
0.07341 0.2956 lineto
0.07589 0.30129 lineto
0.07837 0.30575 lineto
0.08085 0.30975 lineto
0.08333 0.31409 lineto
0.08581 0.32069 lineto
0.08829 0.32605 lineto
0.09077 0.33096 lineto
0.09325 0.3362 lineto
0.09573 0.34078 lineto
0.09821 0.34569 lineto
0.10069 0.35072 lineto
0.10317 0.35566 lineto
0.10565 0.35199 lineto
0.10813 0.35294 lineto
0.11062 0.35558 lineto
0.1131 0.35699 lineto
0.11558 0.36087 lineto
0.11806 0.36351 lineto
0.12054 0.3657 lineto
0.12302 0.36823 lineto
0.1255 0.37301 lineto
0.12798 0.37656 lineto
0.13046 0.37966 lineto
0.13294 0.38309 lineto
0.13542 0.38585 lineto
0.1379 0.38895 lineto
0.14038 0.39217 lineto
0.14286 0.3953 lineto
0.14534 0.40075 lineto
Mistroke
0.14782 0.40496 lineto
0.1503 0.40872 lineto
0.15278 0.41281 lineto
0.15526 0.41624 lineto
0.15774 0.42 lineto
0.16022 0.42388 lineto
0.1627 0.42768 lineto
0.16518 0.43086 lineto
0.16766 0.43438 lineto
0.17014 0.43802 lineto
0.17262 0.44157 lineto
0.1751 0.44529 lineto
0.17758 0.44893 lineto
0.18006 0.45254 lineto
0.18254 0.45617 lineto
0.18502 0.45117 lineto
0.1875 0.45079 lineto
0.18998 0.45211 lineto
0.19246 0.45219 lineto
0.19494 0.45474 lineto
0.19742 0.45606 lineto
0.1999 0.45692 lineto
0.20238 0.45811 lineto
0.20486 0.46157 lineto
0.20734 0.46379 lineto
0.20982 0.46556 lineto
0.2123 0.46766 lineto
0.21478 0.4691 lineto
0.21726 0.47087 lineto
0.21974 0.47276 lineto
0.22222 0.47456 lineto
0.2247 0.47869 lineto
0.22718 0.48157 lineto
0.22966 0.484 lineto
0.23214 0.48677 lineto
0.23462 0.48887 lineto
0.2371 0.4913 lineto
0.23958 0.49386 lineto
0.24206 0.49632 lineto
0.24454 0.49818 lineto
0.24702 0.50037 lineto
0.2495 0.50268 lineto
0.25198 0.5049 lineto
0.25446 0.5073 lineto
0.25694 0.50961 lineto
0.25942 0.51189 lineto
0.2619 0.5142 lineto
0.26438 0.51881 lineto
0.26687 0.52218 lineto
0.26935 0.5251 lineto
Mistroke
0.27183 0.52835 lineto
0.27431 0.53093 lineto
0.27679 0.53385 lineto
0.27927 0.53689 lineto
0.28175 0.53984 lineto
0.28423 0.54219 lineto
0.28671 0.54486 lineto
0.28919 0.54766 lineto
0.29167 0.55037 lineto
0.29415 0.55325 lineto
0.29663 0.55605 lineto
0.29911 0.55881 lineto
0.30159 0.5616 lineto
0.30407 0.56377 lineto
0.30655 0.56627 lineto
0.30903 0.56889 lineto
0.31151 0.57142 lineto
0.31399 0.57412 lineto
0.31647 0.57674 lineto
0.31895 0.57933 lineto
0.32143 0.58194 lineto
0.32391 0.58471 lineto
0.32639 0.5874 lineto
0.32887 0.59005 lineto
0.33135 0.59272 lineto
0.33383 0.59535 lineto
0.33631 0.598 lineto
0.33879 0.60066 lineto
0.34127 0.60332 lineto
0.34375 0.54159 lineto
0.34623 0.51437 lineto
0.34871 0.49977 lineto
0.35119 0.47593 lineto
0.35367 0.47058 lineto
0.35615 0.45599 lineto
0.35863 0.43801 lineto
0.36111 0.4225 lineto
0.36359 0.42392 lineto
0.36607 0.41609 lineto
0.36855 0.40488 lineto
0.37103 0.39615 lineto
0.37351 0.38246 lineto
0.37599 0.37125 lineto
0.37847 0.36094 lineto
0.38095 0.34997 lineto
0.38343 0.35634 lineto
0.38591 0.35347 lineto
0.38839 0.34721 lineto
0.39087 0.34343 lineto
0.39335 0.33469 lineto
Mistroke
0.39583 0.32844 lineto
0.39831 0.32309 lineto
0.40079 0.31707 lineto
0.40327 0.30652 lineto
0.40575 0.29845 lineto
0.40823 0.29129 lineto
0.41071 0.28346 lineto
0.41319 0.27696 lineto
0.41567 0.26979 lineto
0.41815 0.26239 lineto
0.42063 0.25516 lineto
0.42312 0.26515 lineto
0.4256 0.26591 lineto
0.42808 0.26327 lineto
0.43056 0.26312 lineto
0.43304 0.25801 lineto
0.43552 0.25538 lineto
0.438 0.25366 lineto
0.44048 0.25127 lineto
0.44296 0.24435 lineto
0.44544 0.2399 lineto
0.44792 0.23637 lineto
0.4504 0.23216 lineto
0.45288 0.22929 lineto
0.45536 0.22575 lineto
0.45784 0.22197 lineto
0.46032 0.21837 lineto
0.4628 0.21012 lineto
0.46528 0.20435 lineto
0.46776 0.19948 lineto
0.47024 0.19395 lineto
0.47272 0.18975 lineto
0.4752 0.18489 lineto
0.47768 0.17978 lineto
0.48016 0.17485 lineto
0.48264 0.17113 lineto
0.48512 0.16675 lineto
0.4876 0.16213 lineto
0.49008 0.15769 lineto
0.49256 0.15289 lineto
0.49504 0.14826 lineto
0.49752 0.14371 lineto
0.5 0.1391 lineto
0.50248 0.15175 lineto
0.50496 0.15516 lineto
0.50744 0.15519 lineto
0.50992 0.15769 lineto
0.5124 0.15523 lineto
0.51488 0.15526 lineto
0.51736 0.15619 lineto
Mistroke
0.51984 0.15645 lineto
0.52232 0.15219 lineto
0.5248 0.1504 lineto
0.52728 0.14952 lineto
0.52976 0.14797 lineto
0.53224 0.14775 lineto
0.53472 0.14687 lineto
0.5372 0.14574 lineto
0.53968 0.14479 lineto
0.54216 0.1392 lineto
0.54464 0.13608 lineto
0.54712 0.13387 lineto
0.5496 0.131 lineto
0.55208 0.12945 lineto
0.55456 0.12724 lineto
0.55704 0.12479 lineto
0.55952 0.12251 lineto
0.562 0.12145 lineto
0.56448 0.11973 lineto
0.56696 0.11776 lineto
0.56944 0.11597 lineto
0.57192 0.11382 lineto
0.5744 0.11186 lineto
0.57688 0.10995 lineto
0.57937 0.10801 lineto
0.58185 0.10144 lineto
0.58433 0.09735 lineto
0.58681 0.09417 lineto
0.58929 0.09032 lineto
0.59177 0.0878 lineto
0.59425 0.08462 lineto
0.59673 0.0812 lineto
0.59921 0.07795 lineto
0.60169 0.07592 lineto
0.60417 0.07322 lineto
0.60665 0.07028 lineto
0.60913 0.06752 lineto
0.61161 0.0644 lineto
0.61409 0.06146 lineto
0.61657 0.05859 lineto
0.61905 0.05567 lineto
0.62153 0.05399 lineto
0.62401 0.05165 lineto
0.62649 0.04907 lineto
0.62897 0.04666 lineto
0.63145 0.0439 lineto
0.63393 0.04132 lineto
0.63641 0.0388 lineto
0.63889 0.03623 lineto
0.64137 0.03334 lineto
Mistroke
0.64385 0.03063 lineto
0.64633 0.02798 lineto
0.64881 0.02528 lineto
0.65129 0.02268 lineto
0.65377 0.02003 lineto
0.65625 0.01737 lineto
0.65873 0.01472 lineto
0.66121 0.04425 lineto
0.66369 0.05653 lineto
0.66617 0.06251 lineto
0.66865 0.0731 lineto
0.67113 0.07445 lineto
0.67361 0.08042 lineto
0.67609 0.08808 lineto
0.67857 0.0945 lineto
0.68105 0.09247 lineto
0.68353 0.09505 lineto
0.68601 0.09933 lineto
0.68849 0.10237 lineto
0.69097 0.10789 lineto
0.69345 0.11217 lineto
0.69593 0.11599 lineto
0.69841 0.12015 lineto
0.70089 0.11564 lineto
0.70337 0.11575 lineto
0.70585 0.11755 lineto
0.70833 0.11811 lineto
0.71081 0.12115 lineto
0.71329 0.12295 lineto
0.71577 0.1243 lineto
0.71825 0.12598 lineto
0.72073 0.12993 lineto
0.72321 0.13264 lineto
0.72569 0.13489 lineto
0.72817 0.13748 lineto
0.73065 0.1394 lineto
0.73313 0.14165 lineto
0.73562 0.14403 lineto
0.7381 0.14632 lineto
0.74058 0.13999 lineto
0.74306 0.13829 lineto
0.74554 0.13828 lineto
0.74802 0.13703 lineto
0.7505 0.13825 lineto
0.75298 0.13824 lineto
0.75546 0.13777 lineto
0.75794 0.13764 lineto
0.76042 0.13977 lineto
0.7629 0.14067 lineto
0.76538 0.14111 lineto
Mistroke
0.76786 0.14188 lineto
0.77034 0.14199 lineto
0.77282 0.14244 lineto
0.7753 0.143 lineto
0.77778 0.14347 lineto
0.78026 0.14627 lineto
0.78274 0.14783 lineto
0.78522 0.14893 lineto
0.7877 0.15037 lineto
0.79018 0.15114 lineto
0.79266 0.15225 lineto
0.79514 0.15347 lineto
0.79762 0.15461 lineto
0.8001 0.15514 lineto
0.80258 0.15601 lineto
0.80506 0.15699 lineto
0.80754 0.15788 lineto
0.81002 0.15896 lineto
0.8125 0.15994 lineto
0.81498 0.16089 lineto
0.81746 0.16187 lineto
0.81994 0.15421 lineto
0.82242 0.15118 lineto
0.8249 0.14984 lineto
0.82738 0.14726 lineto
0.82986 0.14716 lineto
0.83234 0.14582 lineto
0.83482 0.14403 lineto
0.8373 0.14257 lineto
0.83978 0.14338 lineto
0.84226 0.14294 lineto
0.84474 0.14206 lineto
0.84722 0.1415 lineto
0.8497 0.14029 lineto
0.85218 0.1394 lineto
0.85466 0.13863 lineto
0.85714 0.13778 lineto
0.85962 0.13925 lineto
0.8621 0.13948 lineto
0.86458 0.13926 lineto
0.86706 0.13937 lineto
0.86954 0.13881 lineto
0.87202 0.13859 lineto
0.8745 0.13849 lineto
0.87698 0.1383 lineto
0.87946 0.1375 lineto
0.88194 0.13704 lineto
0.88442 0.1367 lineto
0.8869 0.13626 lineto
0.88938 0.13601 lineto
Mistroke
0.89187 0.13566 lineto
0.89435 0.13529 lineto
0.89683 0.13494 lineto
0.89931 0.13689 lineto
0.90179 0.13761 lineto
0.90427 0.13787 lineto
0.90675 0.13847 lineto
0.90923 0.1384 lineto
0.91171 0.13866 lineto
0.91419 0.13905 lineto
0.91667 0.13934 lineto
0.91915 0.13903 lineto
0.92163 0.13905 lineto
0.92411 0.13919 lineto
0.92659 0.13925 lineto
0.92907 0.13948 lineto
0.93155 0.13962 lineto
0.93403 0.13973 lineto
0.93651 0.13986 lineto
0.93899 0.13938 lineto
0.94147 0.13922 lineto
0.94395 0.13918 lineto
0.94643 0.13906 lineto
0.94891 0.13911 lineto
0.95139 0.13907 lineto
0.95387 0.13901 lineto
0.95635 0.13896 lineto
0.95883 0.13908 lineto
0.96131 0.13911 lineto
0.96379 0.13911 lineto
0.96627 0.13913 lineto
0.96875 0.1391 lineto
0.97123 0.1391 lineto
0.97371 0.1391 lineto
0.97619 0.1391 lineto
Mfstroke
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; ]
The Unformatted text for this cell was not generated.
Use options in the Actions Settings dialog box to control
when Unformatted text is generated.
;[o]
-Graphics-
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.02381 0.31746 0.274246 0.18999 [
[(0.5)] 0.18254 0.27425 0 2 Msboxa
[(1)] 0.34127 0.27425 0 2 Msboxa
[(1.5)] 0.5 0.27425 0 2 Msboxa
[(2)] 0.65873 0.27425 0 2 Msboxa
[(2.5)] 0.81746 0.27425 0 2 Msboxa
[(3)] 0.97619 0.27425 0 2 Msboxa
gsave
/Times-Bold findfont 16 scalefont setfont
[(Daubechies' Psi: n = 2 \(dx = 1/128\))] 0.5 0.61803 0 -2 Msboxa
grestore
[(-1)] 0.01131 0.08426 1 0 Msboxa
[(-0.5)] 0.01131 0.17925 1 0 Msboxa
[(0.5)] 0.01131 0.36924 1 0 Msboxa
[(1)] 0.01131 0.46424 1 0 Msboxa
[(1.5)] 0.01131 0.55923 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.18254 0.27425 moveto
0.18254 0.2805 lineto
stroke
grestore
[(0.5)] 0.18254 0.27425 0 2 Mshowa
gsave
0.002 setlinewidth
0.34127 0.27425 moveto
0.34127 0.2805 lineto
stroke
grestore
[(1)] 0.34127 0.27425 0 2 Mshowa
gsave
0.002 setlinewidth
0.5 0.27425 moveto
0.5 0.2805 lineto
stroke
grestore
[(1.5)] 0.5 0.27425 0 2 Mshowa
gsave
0.002 setlinewidth
0.65873 0.27425 moveto
0.65873 0.2805 lineto
stroke
grestore
[(2)] 0.65873 0.27425 0 2 Mshowa
gsave
0.002 setlinewidth
0.81746 0.27425 moveto
0.81746 0.2805 lineto
stroke
grestore
[(2.5)] 0.81746 0.27425 0 2 Mshowa
gsave
0.002 setlinewidth
0.97619 0.27425 moveto
0.97619 0.2805 lineto
stroke
grestore
[(3)] 0.97619 0.27425 0 2 Mshowa
gsave
0.001 setlinewidth
0.05556 0.27425 moveto
0.05556 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.0873 0.27425 moveto
0.0873 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.11905 0.27425 moveto
0.11905 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.15079 0.27425 moveto
0.15079 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.21429 0.27425 moveto
0.21429 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.24603 0.27425 moveto
0.24603 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.27778 0.27425 moveto
0.27778 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.30952 0.27425 moveto
0.30952 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.37302 0.27425 moveto
0.37302 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.40476 0.27425 moveto
0.40476 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.43651 0.27425 moveto
0.43651 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.46825 0.27425 moveto
0.46825 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.53175 0.27425 moveto
0.53175 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.56349 0.27425 moveto
0.56349 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.59524 0.27425 moveto
0.59524 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.62698 0.27425 moveto
0.62698 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.69048 0.27425 moveto
0.69048 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.72222 0.27425 moveto
0.72222 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.75397 0.27425 moveto
0.75397 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.78571 0.27425 moveto
0.78571 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.84921 0.27425 moveto
0.84921 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.88095 0.27425 moveto
0.88095 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.9127 0.27425 moveto
0.9127 0.278 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.94444 0.27425 moveto
0.94444 0.278 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0.27425 moveto
1 0.27425 lineto
stroke
grestore
gsave
/Times-Bold findfont 16 scalefont setfont
[(Daubechies' Psi: n = 2 \(dx = 1/128\))] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.02381 0.08426 moveto
0.03006 0.08426 lineto
stroke
grestore
[(-1)] 0.01131 0.08426 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.17925 moveto
0.03006 0.17925 lineto
stroke
grestore
[(-0.5)] 0.01131 0.17925 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.36924 moveto
0.03006 0.36924 lineto
stroke
grestore
[(0.5)] 0.01131 0.36924 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.46424 moveto
0.03006 0.46424 lineto
stroke
grestore
[(1)] 0.01131 0.46424 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.55923 moveto
0.03006 0.55923 lineto
stroke
grestore
[(1.5)] 0.01131 0.55923 1 0 Mshowa
gsave
0.001 setlinewidth
0.02381 0.10326 moveto
0.02756 0.10326 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.12225 moveto
0.02756 0.12225 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.14125 moveto
0.02756 0.14125 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.16025 moveto
0.02756 0.16025 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.19825 moveto
0.02756 0.19825 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.21725 moveto
0.02756 0.21725 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.23625 moveto
0.02756 0.23625 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.25525 moveto
0.02756 0.25525 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.29325 moveto
0.02756 0.29325 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.31224 moveto
0.02756 0.31224 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.33124 moveto
0.02756 0.33124 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.35024 moveto
0.02756 0.35024 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.38824 moveto
0.02756 0.38824 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.40724 moveto
0.02756 0.40724 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.42624 moveto
0.02756 0.42624 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.44524 moveto
0.02756 0.44524 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.48324 moveto
0.02756 0.48324 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.50223 moveto
0.02756 0.50223 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.52123 moveto
0.02756 0.52123 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.54023 moveto
0.02756 0.54023 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.06526 moveto
0.02756 0.06526 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.04626 moveto
0.02756 0.04626 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.02726 moveto
0.02756 0.02726 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.00826 moveto
0.02756 0.00826 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.57823 moveto
0.02756 0.57823 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.59723 moveto
0.02756 0.59723 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.61623 moveto
0.02756 0.61623 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
grestore
grestore
0.004 setlinewidth
0.02381 0.27425 moveto
0.02629 0.26942 lineto
0.02877 0.26719 lineto
0.03125 0.26589 lineto
0.03373 0.26391 lineto
0.03621 0.26331 lineto
0.03869 0.26202 lineto
0.04117 0.26047 lineto
0.04365 0.25911 lineto
0.04613 0.25902 lineto
0.04861 0.25823 lineto
0.05109 0.2572 lineto
0.05357 0.25634 lineto
0.05605 0.25512 lineto
0.05853 0.25408 lineto
0.06101 0.25311 lineto
0.06349 0.25209 lineto
0.06597 0.25237 lineto
0.06845 0.25195 lineto
0.07093 0.25129 lineto
0.07341 0.2508 lineto
0.07589 0.24995 lineto
0.07837 0.24928 lineto
0.08085 0.24868 lineto
0.08333 0.24803 lineto
0.08581 0.24704 lineto
0.08829 0.24624 lineto
0.09077 0.24551 lineto
0.09325 0.24472 lineto
0.09573 0.24403 lineto
0.09821 0.2433 lineto
0.10069 0.24255 lineto
0.10317 0.2418 lineto
0.10565 0.24235 lineto
0.10813 0.24221 lineto
0.11062 0.24182 lineto
0.1131 0.24161 lineto
0.11558 0.24102 lineto
0.11806 0.24063 lineto
0.12054 0.2403 lineto
0.12302 0.23992 lineto
0.1255 0.23921 lineto
0.12798 0.23867 lineto
0.13046 0.23821 lineto
0.13294 0.2377 lineto
0.13542 0.23728 lineto
0.1379 0.23682 lineto
0.14038 0.23634 lineto
0.14286 0.23587 lineto
0.14534 0.23505 lineto
Mistroke
0.14782 0.23442 lineto
0.1503 0.23386 lineto
0.15278 0.23324 lineto
0.15526 0.23273 lineto
0.15774 0.23217 lineto
0.16022 0.23159 lineto
0.1627 0.23102 lineto
0.16518 0.23054 lineto
0.16766 0.23001 lineto
0.17014 0.22947 lineto
0.17262 0.22894 lineto
0.1751 0.22838 lineto
0.17758 0.22783 lineto
0.18006 0.22729 lineto
0.18254 0.22675 lineto
0.18502 0.2275 lineto
0.1875 0.22755 lineto
0.18998 0.22736 lineto
0.19246 0.22735 lineto
0.19494 0.22696 lineto
0.19742 0.22677 lineto
0.1999 0.22664 lineto
0.20238 0.22646 lineto
0.20486 0.22594 lineto
0.20734 0.22561 lineto
0.20982 0.22534 lineto
0.2123 0.22503 lineto
0.21478 0.22481 lineto
0.21726 0.22455 lineto
0.21974 0.22426 lineto
0.22222 0.22399 lineto
0.2247 0.22338 lineto
0.22718 0.22294 lineto
0.22966 0.22258 lineto
0.23214 0.22216 lineto
0.23462 0.22185 lineto
0.2371 0.22149 lineto
0.23958 0.2211 lineto
0.24206 0.22073 lineto
0.24454 0.22046 lineto
0.24702 0.22013 lineto
0.2495 0.21978 lineto
0.25198 0.21945 lineto
0.25446 0.21909 lineto
0.25694 0.21874 lineto
0.25942 0.2184 lineto
0.2619 0.21806 lineto
0.26438 0.21737 lineto
0.26687 0.21686 lineto
0.26935 0.21642 lineto
Mistroke
0.27183 0.21594 lineto
0.27431 0.21555 lineto
0.27679 0.21511 lineto
0.27927 0.21466 lineto
0.28175 0.21421 lineto
0.28423 0.21386 lineto
0.28671 0.21346 lineto
0.28919 0.21304 lineto
0.29167 0.21264 lineto
0.29415 0.21221 lineto
0.29663 0.21179 lineto
0.29911 0.21137 lineto
0.30159 0.21095 lineto
0.30407 0.21063 lineto
0.30655 0.21026 lineto
0.30903 0.20986 lineto
0.31151 0.20948 lineto
0.31399 0.20908 lineto
0.31647 0.20869 lineto
0.31895 0.2083 lineto
0.32143 0.20791 lineto
0.32391 0.20749 lineto
0.32639 0.20709 lineto
0.32887 0.20669 lineto
0.33135 0.20629 lineto
0.33383 0.2059 lineto
0.33631 0.2055 lineto
0.33879 0.2051 lineto
0.34127 0.20471 lineto
0.34375 0.24736 lineto
0.34623 0.26694 lineto
0.34871 0.27808 lineto
0.35119 0.2954 lineto
0.35367 0.30036 lineto
0.35615 0.3115 lineto
0.35863 0.3249 lineto
0.36111 0.33664 lineto
0.36359 0.33707 lineto
0.36607 0.34369 lineto
0.36855 0.35256 lineto
0.37103 0.35978 lineto
0.37351 0.37031 lineto
0.37599 0.37919 lineto
0.37847 0.38746 lineto
0.38095 0.39617 lineto
0.38343 0.39329 lineto
0.38591 0.39659 lineto
0.38839 0.40215 lineto
0.39087 0.40606 lineto
0.39335 0.41328 lineto
Mistroke
0.39583 0.41884 lineto
0.39831 0.4238 lineto
0.40079 0.4292 lineto
0.40327 0.43763 lineto
0.40575 0.4444 lineto
0.40823 0.45057 lineto
0.41071 0.45718 lineto
0.41319 0.46291 lineto
0.41567 0.46908 lineto
0.41815 0.47541 lineto
0.42063 0.48162 lineto
0.42312 0.47631 lineto
0.4256 0.47719 lineto
0.42808 0.48033 lineto
0.43056 0.48181 lineto
0.43304 0.4866 lineto
0.43552 0.48974 lineto
0.438 0.49227 lineto
0.44048 0.49524 lineto
0.44296 0.50125 lineto
0.44544 0.5056 lineto
0.44792 0.50934 lineto
0.4504 0.51353 lineto
0.45288 0.51683 lineto
0.45536 0.52057 lineto
0.45784 0.52448 lineto
0.46032 0.52827 lineto
0.4628 0.53516 lineto
0.46528 0.5404 lineto
0.46776 0.54503 lineto
0.47024 0.5501 lineto
0.47272 0.55429 lineto
0.4752 0.55892 lineto
0.47768 0.56372 lineto
0.48016 0.56839 lineto
0.48264 0.57225 lineto
0.48512 0.57656 lineto
0.4876 0.58103 lineto
0.49008 0.58538 lineto
0.49256 0.58997 lineto
0.49504 0.59444 lineto
0.49752 0.59886 lineto
0.5 0.60332 lineto
0.50248 0.51908 lineto
0.50496 0.48237 lineto
0.50744 0.46306 lineto
0.50992 0.43101 lineto
0.5124 0.42444 lineto
0.51488 0.40512 lineto
0.51736 0.38115 lineto
Mistroke
0.51984 0.36059 lineto
0.52232 0.36334 lineto
0.5248 0.35335 lineto
0.52728 0.3387 lineto
0.52976 0.32746 lineto
0.53224 0.3094 lineto
0.53472 0.29475 lineto
0.5372 0.28135 lineto
0.53968 0.26703 lineto
0.54216 0.2766 lineto
0.54464 0.27344 lineto
0.54712 0.26561 lineto
0.5496 0.2612 lineto
0.55208 0.24996 lineto
0.55456 0.24214 lineto
0.55704 0.23556 lineto
0.55952 0.22807 lineto
0.562 0.21433 lineto
0.56448 0.20401 lineto
0.56696 0.19494 lineto
0.56944 0.18495 lineto
0.57192 0.17679 lineto
0.5744 0.16771 lineto
0.57688 0.1583 lineto
0.57937 0.14914 lineto
0.58185 0.16371 lineto
0.58433 0.16554 lineto
0.58681 0.16271 lineto
0.58929 0.16329 lineto
0.59177 0.15705 lineto
0.59425 0.15422 lineto
0.59673 0.15264 lineto
0.59921 0.15015 lineto
0.60169 0.14141 lineto
0.60417 0.13608 lineto
0.60665 0.132 lineto
0.60913 0.12701 lineto
0.61161 0.12385 lineto
0.61409 0.11977 lineto
0.61657 0.11535 lineto
0.61905 0.11119 lineto
0.62153 0.10062 lineto
0.62401 0.09346 lineto
0.62649 0.08756 lineto
0.62897 0.08073 lineto
0.63145 0.07574 lineto
0.63393 0.06983 lineto
0.63641 0.06359 lineto
0.63889 0.0576 lineto
0.64137 0.05327 lineto
Mistroke
0.64385 0.04804 lineto
0.64633 0.04246 lineto
0.64881 0.03714 lineto
0.65129 0.03132 lineto
0.65377 0.02575 lineto
0.65625 0.02026 lineto
0.65873 0.01472 lineto
0.66121 0.07634 lineto
0.66369 0.10197 lineto
0.66617 0.11443 lineto
0.66865 0.13653 lineto
0.67113 0.13934 lineto
0.67361 0.1518 lineto
0.67609 0.16779 lineto
0.67857 0.18119 lineto
0.68105 0.17694 lineto
0.68353 0.18234 lineto
0.68601 0.19127 lineto
0.68849 0.19761 lineto
0.69097 0.20912 lineto
0.69345 0.21805 lineto
0.69593 0.22603 lineto
0.69841 0.2347 lineto
0.70089 0.22529 lineto
0.70337 0.22552 lineto
0.70585 0.22927 lineto
0.70833 0.23045 lineto
0.71081 0.23679 lineto
0.71329 0.24055 lineto
0.71577 0.24336 lineto
0.71825 0.24687 lineto
0.72073 0.2551 lineto
0.72321 0.26075 lineto
0.72569 0.26546 lineto
0.72817 0.27086 lineto
0.73065 0.27487 lineto
0.73313 0.27957 lineto
0.73562 0.28453 lineto
0.7381 0.2893 lineto
0.74058 0.2761 lineto
0.74306 0.27255 lineto
0.74554 0.27252 lineto
0.74802 0.26991 lineto
0.7505 0.27247 lineto
0.75298 0.27245 lineto
0.75546 0.27148 lineto
0.75794 0.2712 lineto
0.76042 0.27565 lineto
0.7629 0.27752 lineto
0.76538 0.27844 lineto
Mistroke
0.76786 0.28005 lineto
0.77034 0.28028 lineto
0.77282 0.2812 lineto
0.7753 0.28238 lineto
0.77778 0.28337 lineto
0.78026 0.2892 lineto
0.78274 0.29245 lineto
0.78522 0.29476 lineto
0.7877 0.29776 lineto
0.79018 0.29937 lineto
0.79266 0.30168 lineto
0.79514 0.30424 lineto
0.79762 0.30661 lineto
0.8001 0.30772 lineto
0.80258 0.30952 lineto
0.80506 0.31157 lineto
0.80754 0.31343 lineto
0.81002 0.31567 lineto
0.8125 0.31773 lineto
0.81498 0.31971 lineto
0.81746 0.32174 lineto
0.81994 0.30577 lineto
0.82242 0.29945 lineto
0.8249 0.29666 lineto
0.82738 0.29128 lineto
0.82986 0.29107 lineto
0.83234 0.28827 lineto
0.83482 0.28453 lineto
0.8373 0.28148 lineto
0.83978 0.28316 lineto
0.84226 0.28226 lineto
0.84474 0.28041 lineto
0.84722 0.27926 lineto
0.8497 0.27672 lineto
0.85218 0.27487 lineto
0.85466 0.27327 lineto
0.85714 0.27149 lineto
0.85962 0.27456 lineto
0.8621 0.27504 lineto
0.86458 0.27458 lineto
0.86706 0.2748 lineto
0.86954 0.27365 lineto
0.87202 0.27318 lineto
0.8745 0.27297 lineto
0.87698 0.27258 lineto
0.87946 0.27091 lineto
0.88194 0.26994 lineto
0.88442 0.26923 lineto
0.8869 0.26832 lineto
0.88938 0.26779 lineto
Mistroke
0.89187 0.26707 lineto
0.89435 0.26629 lineto
0.89683 0.26555 lineto
0.89931 0.26963 lineto
0.90179 0.27113 lineto
0.90427 0.27168 lineto
0.90675 0.27292 lineto
0.90923 0.27278 lineto
0.91171 0.27333 lineto
0.91419 0.27413 lineto
0.91667 0.27475 lineto
0.91915 0.2741 lineto
0.92163 0.27414 lineto
0.92411 0.27444 lineto
0.92659 0.27455 lineto
0.92907 0.27503 lineto
0.93155 0.27533 lineto
0.93403 0.27556 lineto
0.93651 0.27584 lineto
0.93899 0.27482 lineto
0.94147 0.27449 lineto
0.94395 0.27441 lineto
0.94643 0.27415 lineto
0.94891 0.27427 lineto
0.95139 0.27419 lineto
0.95387 0.27405 lineto
0.95635 0.27396 lineto
0.95883 0.2742 lineto
0.96131 0.27426 lineto
0.96379 0.27426 lineto
0.96627 0.2743 lineto
0.96875 0.27424 lineto
0.97123 0.27424 lineto
0.97371 0.27425 lineto
0.97619 0.27425 lineto
Mfstroke
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; endGroup; endGroup; ]
The Unformatted text for this cell was not generated.
Use options in the Actions Settings dialog box to control
when Unformatted text is generated.
;[o]
-Graphics-
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup; ]
n = 4
:[font = text; inactive; preserveAspect; ]
Set number of vanishing moments in the wavelet..
:[font = input; preserveAspect; ]
n = 4;
:[font = text; inactive; preserveAspect; ]
Compute d[n] and psi[n].
:[font = input; preserveAspect; startGroup; ]
jmax = 5;      (* number of levels i/2^j to compute *)
m = 2n;        (* convenience constant *)
imax = 2^jmax; (* convenience constant *)
dx = 1/imax;   (* convenience constant *)

hn = dblh[n]; (* Oops, repeated from integerPhi *)
Do[
	c[k-1] = hn[[k]]*N@Sqrt[2],
{k, m}]

Do[ (* wasteful, but clear *)
	d[k] = (-1)^k c[m-k-1],
{k, 0, m-1}]

p = integerPhi[n]
Do[
	phi[i] = p[[i]],
{i, 1, m-2}]
phi[x_] := 0.0 /; (x <= 0 || x >= m-1)
:[font = output; output; inactive; preserveAspect; endGroup; ]
{1.007169977725601, -0.03383695405283359, 
  0.03961046271590284, -0.01176435820572664, 
  -0.001197957596176961, 0.0000188294132335429}
;[o]
{1.00717, -0.033837, 0.0396105, -0.0117644, 
 
  -0.00119796, 0.0000188294}
:[font = text; inactive; preserveAspect; ]
Refine using the duplication formula.
:[font = input; preserveAspect; ]
Do[
	Do[
		phi[i/2^j] =
			Sum[c[k] phi[i/2^(j-1) - k],
			{k, 0, m-1}],
	{i, 1, (m-1) imax, 2}],
{j, 1, jmax}]

philist = {};
Do[
	AppendTo[philist, {N[i], phi[i]}],
{i, 0, m-1, dx}]

Clear[psi]; (* bug *)
Do[
	Do[
		psi[i/2^j] =
			Sum[d[k] phi[i/2^(j-1) - k],
			{k, 0, m-1}],
	{i, 0, (m-1) imax, 1}], (* redundant? *)
{j, 0, jmax}]

psilist = {};
Do[
	AppendTo[psilist, {N[i], psi[i]}],
{i, 0, m-1, dx}]
:[font = text; inactive; preserveAspect; ]
Plot.s
:[font = input; preserveAspect; startGroup; ]
string =
StringForm[
	"Daubechies' Phi: n = `1` (dx = 1/`2`)", n, imax
];
label = FontForm[string, {"Times-Bold", 16}];

ListPlot[philist,
	PlotJoined -> True,
	PlotRange -> All,
	PlotLabel -> label
]

string =
StringForm[
	"Daubechies' Psi: n = `1` (dx = 1/`2`)", n, imax
];
label = FontForm[string, {"Times-Bold", 16}];

ListPlot[psilist,
	PlotJoined -> True,
	PlotRange -> All,
	PlotLabel -> label
]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.02381 0.136054 0.146266 0.407482 [
[(1)] 0.15986 0.14627 0 2 Msboxa
[(2)] 0.29592 0.14627 0 2 Msboxa
[(3)] 0.43197 0.14627 0 2 Msboxa
[(4)] 0.56803 0.14627 0 2 Msboxa
[(5)] 0.70408 0.14627 0 2 Msboxa
[(6)] 0.84014 0.14627 0 2 Msboxa
[(7)] 0.97619 0.14627 0 2 Msboxa
gsave
/Times-Bold findfont 16 scalefont setfont
[(Daubechies' Phi: n = 4 \(dx = 1/32\))] 0.5 0.61803 0 -2 Msboxa
grestore
[(-0.2)] 0.01131 0.06477 1 0 Msboxa
[(0.2)] 0.01131 0.22776 1 0 Msboxa
[(0.4)] 0.01131 0.30926 1 0 Msboxa
[(0.6)] 0.01131 0.39076 1 0 Msboxa
[(0.8)] 0.01131 0.47225 1 0 Msboxa
[(1)] 0.01131 0.55375 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.15986 0.14627 moveto
0.15986 0.15252 lineto
stroke
grestore
[(1)] 0.15986 0.14627 0 2 Mshowa
gsave
0.002 setlinewidth
0.29592 0.14627 moveto
0.29592 0.15252 lineto
stroke
grestore
[(2)] 0.29592 0.14627 0 2 Mshowa
gsave
0.002 setlinewidth
0.43197 0.14627 moveto
0.43197 0.15252 lineto
stroke
grestore
[(3)] 0.43197 0.14627 0 2 Mshowa
gsave
0.002 setlinewidth
0.56803 0.14627 moveto
0.56803 0.15252 lineto
stroke
grestore
[(4)] 0.56803 0.14627 0 2 Mshowa
gsave
0.002 setlinewidth
0.70408 0.14627 moveto
0.70408 0.15252 lineto
stroke
grestore
[(5)] 0.70408 0.14627 0 2 Mshowa
gsave
0.002 setlinewidth
0.84014 0.14627 moveto
0.84014 0.15252 lineto
stroke
grestore
[(6)] 0.84014 0.14627 0 2 Mshowa
gsave
0.002 setlinewidth
0.97619 0.14627 moveto
0.97619 0.15252 lineto
stroke
grestore
[(7)] 0.97619 0.14627 0 2 Mshowa
gsave
0.001 setlinewidth
0.05102 0.14627 moveto
0.05102 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.07823 0.14627 moveto
0.07823 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.10544 0.14627 moveto
0.10544 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.13265 0.14627 moveto
0.13265 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.18707 0.14627 moveto
0.18707 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.21429 0.14627 moveto
0.21429 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.2415 0.14627 moveto
0.2415 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.26871 0.14627 moveto
0.26871 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.32313 0.14627 moveto
0.32313 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.35034 0.14627 moveto
0.35034 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.37755 0.14627 moveto
0.37755 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.40476 0.14627 moveto
0.40476 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.45918 0.14627 moveto
0.45918 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.48639 0.14627 moveto
0.48639 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.51361 0.14627 moveto
0.51361 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.54082 0.14627 moveto
0.54082 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.59524 0.14627 moveto
0.59524 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.62245 0.14627 moveto
0.62245 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.64966 0.14627 moveto
0.64966 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.67687 0.14627 moveto
0.67687 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.73129 0.14627 moveto
0.73129 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.7585 0.14627 moveto
0.7585 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.78571 0.14627 moveto
0.78571 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.81293 0.14627 moveto
0.81293 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.86735 0.14627 moveto
0.86735 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.89456 0.14627 moveto
0.89456 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.92177 0.14627 moveto
0.92177 0.15002 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.94898 0.14627 moveto
0.94898 0.15002 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0.14627 moveto
1 0.14627 lineto
stroke
grestore
gsave
/Times-Bold findfont 16 scalefont setfont
[(Daubechies' Phi: n = 4 \(dx = 1/32\))] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.02381 0.06477 moveto
0.03006 0.06477 lineto
stroke
grestore
[(-0.2)] 0.01131 0.06477 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.22776 moveto
0.03006 0.22776 lineto
stroke
grestore
[(0.2)] 0.01131 0.22776 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.30926 moveto
0.03006 0.30926 lineto
stroke
grestore
[(0.4)] 0.01131 0.30926 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.39076 moveto
0.03006 0.39076 lineto
stroke
grestore
[(0.6)] 0.01131 0.39076 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.47225 moveto
0.03006 0.47225 lineto
stroke
grestore
[(0.8)] 0.01131 0.47225 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.55375 moveto
0.03006 0.55375 lineto
stroke
grestore
[(1)] 0.01131 0.55375 1 0 Mshowa
gsave
0.001 setlinewidth
0.02381 0.08107 moveto
0.02756 0.08107 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.09737 moveto
0.02756 0.09737 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.11367 moveto
0.02756 0.11367 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.12997 moveto
0.02756 0.12997 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.16257 moveto
0.02756 0.16257 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.17886 moveto
0.02756 0.17886 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.19516 moveto
0.02756 0.19516 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.21146 moveto
0.02756 0.21146 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.24406 moveto
0.02756 0.24406 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.26036 moveto
0.02756 0.26036 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.27666 moveto
0.02756 0.27666 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.29296 moveto
0.02756 0.29296 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.32556 moveto
0.02756 0.32556 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.34186 moveto
0.02756 0.34186 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.35816 moveto
0.02756 0.35816 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.37446 moveto
0.02756 0.37446 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.40705 moveto
0.02756 0.40705 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.42335 moveto
0.02756 0.42335 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.43965 moveto
0.02756 0.43965 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.45595 moveto
0.02756 0.45595 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.48855 moveto
0.02756 0.48855 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.50485 moveto
0.02756 0.50485 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.52115 moveto
0.02756 0.52115 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.53745 moveto
0.02756 0.53745 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.04847 moveto
0.02756 0.04847 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.03217 moveto
0.02756 0.03217 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.01587 moveto
0.02756 0.01587 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.57005 moveto
0.02756 0.57005 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.58635 moveto
0.02756 0.58635 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.60265 moveto
0.02756 0.60265 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
grestore
grestore
0.004 setlinewidth
0.02381 0.14627 moveto
0.02806 0.14777 lineto
0.03231 0.15089 lineto
0.03656 0.15497 lineto
0.04082 0.16046 lineto
0.04507 0.16645 lineto
0.04932 0.17298 lineto
0.05357 0.18083 lineto
0.05782 0.18983 lineto
0.06207 0.19894 lineto
0.06633 0.20823 lineto
0.07058 0.21808 lineto
0.07483 0.22825 lineto
0.07908 0.23966 lineto
0.08333 0.25234 lineto
0.08759 0.2657 lineto
0.09184 0.27998 lineto
0.09609 0.29409 lineto
0.10034 0.30796 lineto
0.10459 0.32218 lineto
0.10884 0.33645 lineto
0.1131 0.35128 lineto
0.11735 0.36669 lineto
0.1216 0.38219 lineto
0.12585 0.39791 lineto
0.1301 0.41482 lineto
0.13435 0.43293 lineto
0.13861 0.45186 lineto
0.14286 0.47186 lineto
0.14711 0.49219 lineto
0.15136 0.51286 lineto
0.15561 0.53441 lineto
0.15986 0.55667 lineto
0.16412 0.57386 lineto
0.16837 0.58565 lineto
0.17262 0.59444 lineto
0.17687 0.59851 lineto
0.18112 0.6015 lineto
0.18537 0.60332 lineto
0.18963 0.60086 lineto
0.19388 0.59483 lineto
0.19813 0.58903 lineto
0.20238 0.58325 lineto
0.20663 0.57608 lineto
0.21088 0.56841 lineto
0.21514 0.55684 lineto
0.21939 0.54125 lineto
0.22364 0.52384 lineto
0.22789 0.50375 lineto
0.23214 0.48528 lineto
Mistroke
0.23639 0.46885 lineto
0.24065 0.452 lineto
0.2449 0.43601 lineto
0.24915 0.4188 lineto
0.2534 0.40028 lineto
0.25765 0.38243 lineto
0.2619 0.36478 lineto
0.26616 0.34347 lineto
0.27041 0.31853 lineto
0.27466 0.29144 lineto
0.27891 0.26119 lineto
0.28316 0.23074 lineto
0.28741 0.20009 lineto
0.29167 0.16711 lineto
0.29592 0.13248 lineto
0.30017 0.10421 lineto
0.30442 0.08266 lineto
0.30867 0.06473 lineto
0.31293 0.05276 lineto
0.31718 0.0413 lineto
0.32143 0.0305 lineto
0.32568 0.02482 lineto
0.32993 0.02318 lineto
0.33418 0.02077 lineto
0.33844 0.01791 lineto
0.34269 0.01626 lineto
0.34694 0.01472 lineto
0.35119 0.01775 lineto
0.35544 0.02548 lineto
0.35969 0.03508 lineto
0.36395 0.04765 lineto
0.3682 0.05667 lineto
0.37245 0.06153 lineto
0.3767 0.06584 lineto
0.38095 0.06764 lineto
0.3852 0.07024 lineto
0.38946 0.07371 lineto
0.39371 0.075 lineto
0.39796 0.07482 lineto
0.40221 0.0788 lineto
0.40646 0.0869 lineto
0.41071 0.09693 lineto
0.41497 0.11036 lineto
0.41922 0.12281 lineto
0.42347 0.13424 lineto
0.42772 0.14778 lineto
0.43197 0.16241 lineto
0.43622 0.17366 lineto
0.44048 0.18151 lineto
0.44473 0.18731 lineto
Mistroke
0.44898 0.1898 lineto
0.45323 0.19257 lineto
0.45748 0.1955 lineto
0.46173 0.19588 lineto
0.46599 0.19444 lineto
0.47024 0.19318 lineto
0.47449 0.1919 lineto
0.47874 0.19004 lineto
0.48299 0.18805 lineto
0.48724 0.18376 lineto
0.4915 0.17714 lineto
0.49575 0.16948 lineto
0.5 0.16024 lineto
0.50425 0.15388 lineto
0.5085 0.15075 lineto
0.51276 0.14855 lineto
0.51701 0.14859 lineto
0.52126 0.14847 lineto
0.52551 0.14815 lineto
0.52976 0.1498 lineto
0.53401 0.1529 lineto
0.53827 0.15388 lineto
0.54252 0.15282 lineto
0.54677 0.15106 lineto
0.55102 0.14769 lineto
0.55527 0.14556 lineto
0.55952 0.1447 lineto
0.56378 0.14312 lineto
0.56803 0.14147 lineto
0.57228 0.1402 lineto
0.57653 0.13915 lineto
0.58078 0.13855 lineto
0.58503 0.13846 lineto
0.58929 0.13808 lineto
0.59354 0.13746 lineto
0.59779 0.13706 lineto
0.60204 0.1367 lineto
0.60629 0.13679 lineto
0.61054 0.13738 lineto
0.6148 0.13821 lineto
0.61905 0.13939 lineto
0.6233 0.14084 lineto
0.62755 0.14255 lineto
0.6318 0.14465 lineto
0.63605 0.14714 lineto
0.64031 0.14883 lineto
0.64456 0.14966 lineto
0.64881 0.15016 lineto
0.65306 0.14998 lineto
0.65731 0.14989 lineto
Mistroke
0.66156 0.14988 lineto
0.66582 0.14934 lineto
0.67007 0.14842 lineto
0.67432 0.14788 lineto
0.67857 0.14768 lineto
0.68282 0.14757 lineto
0.68707 0.14774 lineto
0.69133 0.14753 lineto
0.69558 0.14694 lineto
0.69983 0.14641 lineto
0.70408 0.14578 lineto
0.70833 0.14536 lineto
0.71259 0.1452 lineto
0.71684 0.14508 lineto
0.72109 0.14509 lineto
0.72534 0.14518 lineto
0.72959 0.14532 lineto
0.73384 0.14563 lineto
0.7381 0.1461 lineto
0.74235 0.14636 lineto
0.7466 0.14641 lineto
0.75085 0.14641 lineto
0.7551 0.14627 lineto
0.75935 0.14623 lineto
0.76361 0.14631 lineto
0.76786 0.14632 lineto
0.77211 0.14632 lineto
0.77636 0.14632 lineto
0.78061 0.14633 lineto
0.78486 0.14635 lineto
0.78912 0.1464 lineto
0.79337 0.14641 lineto
0.79762 0.14637 lineto
0.80187 0.14632 lineto
0.80612 0.14625 lineto
0.81037 0.14622 lineto
0.81463 0.14622 lineto
0.81888 0.14622 lineto
0.82313 0.14623 lineto
0.82738 0.14624 lineto
0.83163 0.14624 lineto
0.83588 0.14625 lineto
0.84014 0.14627 lineto
0.84439 0.14628 lineto
0.84864 0.14628 lineto
0.85289 0.14628 lineto
0.85714 0.14627 lineto
0.86139 0.14626 lineto
0.86565 0.14627 lineto
0.8699 0.14627 lineto
Mistroke
0.87415 0.14627 lineto
0.8784 0.14626 lineto
0.88265 0.14626 lineto
0.8869 0.14626 lineto
0.89116 0.14627 lineto
0.89541 0.14627 lineto
0.89966 0.14627 lineto
0.90391 0.14627 lineto
0.90816 0.14627 lineto
0.91241 0.14627 lineto
0.91667 0.14627 lineto
0.92092 0.14627 lineto
0.92517 0.14627 lineto
0.92942 0.14627 lineto
0.93367 0.14627 lineto
0.93793 0.14627 lineto
0.94218 0.14627 lineto
0.94643 0.14627 lineto
0.95068 0.14627 lineto
0.95493 0.14627 lineto
0.95918 0.14627 lineto
0.96344 0.14627 lineto
0.96769 0.14627 lineto
0.97194 0.14627 lineto
0.97619 0.14627 lineto
Mfstroke
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; ]
The Unformatted text for this cell was not generated.
Use options in the Actions Settings dialog box to control
when Unformatted text is generated.
;[o]
-Graphics-
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; ]
%!
%%Creator: Mathematica
%%AspectRatio: 0.61803 
MathPictureStart
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.02381 0.136054 0.253031 0.258429 [
[(1)] 0.15986 0.25303 0 2 Msboxa
[(2)] 0.29592 0.25303 0 2 Msboxa
[(3)] 0.43197 0.25303 0 2 Msboxa
[(4)] 0.56803 0.25303 0 2 Msboxa
[(5)] 0.70408 0.25303 0 2 Msboxa
[(6)] 0.84014 0.25303 0 2 Msboxa
[(7)] 0.97619 0.25303 0 2 Msboxa
gsave
/Times-Bold findfont 16 scalefont setfont
[(Daubechies' Psi: n = 4 \(dx = 1/32\))] 0.5 0.61803 0 -2 Msboxa
grestore
[(-0.5)] 0.01131 0.12382 1 0 Msboxa
[(0.5)] 0.01131 0.38225 1 0 Msboxa
[(1)] 0.01131 0.51146 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 0.61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
%%Object: Graphics
[ ] 0 setdash
0 setgray
gsave
gsave
0.002 setlinewidth
0.15986 0.25303 moveto
0.15986 0.25928 lineto
stroke
grestore
[(1)] 0.15986 0.25303 0 2 Mshowa
gsave
0.002 setlinewidth
0.29592 0.25303 moveto
0.29592 0.25928 lineto
stroke
grestore
[(2)] 0.29592 0.25303 0 2 Mshowa
gsave
0.002 setlinewidth
0.43197 0.25303 moveto
0.43197 0.25928 lineto
stroke
grestore
[(3)] 0.43197 0.25303 0 2 Mshowa
gsave
0.002 setlinewidth
0.56803 0.25303 moveto
0.56803 0.25928 lineto
stroke
grestore
[(4)] 0.56803 0.25303 0 2 Mshowa
gsave
0.002 setlinewidth
0.70408 0.25303 moveto
0.70408 0.25928 lineto
stroke
grestore
[(5)] 0.70408 0.25303 0 2 Mshowa
gsave
0.002 setlinewidth
0.84014 0.25303 moveto
0.84014 0.25928 lineto
stroke
grestore
[(6)] 0.84014 0.25303 0 2 Mshowa
gsave
0.002 setlinewidth
0.97619 0.25303 moveto
0.97619 0.25928 lineto
stroke
grestore
[(7)] 0.97619 0.25303 0 2 Mshowa
gsave
0.001 setlinewidth
0.05102 0.25303 moveto
0.05102 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.07823 0.25303 moveto
0.07823 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.10544 0.25303 moveto
0.10544 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.13265 0.25303 moveto
0.13265 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.18707 0.25303 moveto
0.18707 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.21429 0.25303 moveto
0.21429 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.2415 0.25303 moveto
0.2415 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.26871 0.25303 moveto
0.26871 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.32313 0.25303 moveto
0.32313 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.35034 0.25303 moveto
0.35034 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.37755 0.25303 moveto
0.37755 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.40476 0.25303 moveto
0.40476 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.45918 0.25303 moveto
0.45918 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.48639 0.25303 moveto
0.48639 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.51361 0.25303 moveto
0.51361 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.54082 0.25303 moveto
0.54082 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.59524 0.25303 moveto
0.59524 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.62245 0.25303 moveto
0.62245 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.64966 0.25303 moveto
0.64966 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.67687 0.25303 moveto
0.67687 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.73129 0.25303 moveto
0.73129 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.7585 0.25303 moveto
0.7585 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.78571 0.25303 moveto
0.78571 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.81293 0.25303 moveto
0.81293 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.86735 0.25303 moveto
0.86735 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.89456 0.25303 moveto
0.89456 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.92177 0.25303 moveto
0.92177 0.25678 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.94898 0.25303 moveto
0.94898 0.25678 lineto
stroke
grestore
gsave
0.002 setlinewidth
0 0.25303 moveto
1 0.25303 lineto
stroke
grestore
gsave
/Times-Bold findfont 16 scalefont setfont
[(Daubechies' Psi: n = 4 \(dx = 1/32\))] 0.5 0.61803 0 -2 Mshowa
grestore
gsave
0.002 setlinewidth
0.02381 0.12382 moveto
0.03006 0.12382 lineto
stroke
grestore
[(-0.5)] 0.01131 0.12382 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.38225 moveto
0.03006 0.38225 lineto
stroke
grestore
[(0.5)] 0.01131 0.38225 1 0 Mshowa
gsave
0.002 setlinewidth
0.02381 0.51146 moveto
0.03006 0.51146 lineto
stroke
grestore
[(1)] 0.01131 0.51146 1 0 Mshowa
gsave
0.001 setlinewidth
0.02381 0.02045 moveto
0.02756 0.02045 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.04629 moveto
0.02756 0.04629 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.07213 moveto
0.02756 0.07213 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.09797 moveto
0.02756 0.09797 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.14966 moveto
0.02756 0.14966 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.1755 moveto
0.02756 0.1755 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.20135 moveto
0.02756 0.20135 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.22719 moveto
0.02756 0.22719 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.27887 moveto
0.02756 0.27887 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.30472 moveto
0.02756 0.30472 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.33056 moveto
0.02756 0.33056 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.3564 moveto
0.02756 0.3564 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.40809 moveto
0.02756 0.40809 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.43393 moveto
0.02756 0.43393 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.45977 moveto
0.02756 0.45977 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.48562 moveto
0.02756 0.48562 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.5373 moveto
0.02756 0.5373 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.56315 moveto
0.02756 0.56315 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.58899 moveto
0.02756 0.58899 lineto
stroke
grestore
gsave
0.001 setlinewidth
0.02381 0.61483 moveto
0.02756 0.61483 lineto
stroke
grestore
gsave
0.002 setlinewidth
0.02381 0 moveto
0.02381 0.61803 lineto
stroke
grestore
grestore
0.004 setlinewidth
0.02381 0.25303 moveto
0.02806 0.25299 lineto
0.03231 0.2529 lineto
0.03656 0.25278 lineto
0.04082 0.25262 lineto
0.04507 0.25244 lineto
0.04932 0.25225 lineto
0.05357 0.25202 lineto
0.05782 0.25176 lineto
0.06207 0.25149 lineto
0.06633 0.25122 lineto
0.07058 0.25094 lineto
0.07483 0.25064 lineto
0.07908 0.25031 lineto
0.08333 0.24994 lineto
0.08759 0.24955 lineto
0.09184 0.24913 lineto
0.09609 0.24872 lineto
0.10034 0.24831 lineto
0.10459 0.2479 lineto
0.10884 0.24748 lineto
0.1131 0.24705 lineto
0.11735 0.2466 lineto
0.1216 0.24615 lineto
0.12585 0.24569 lineto
0.1301 0.2452 lineto
0.13435 0.24467 lineto
0.13861 0.24412 lineto
0.14286 0.24353 lineto
0.14711 0.24294 lineto
0.15136 0.24234 lineto
0.15561 0.24171 lineto
0.15986 0.24106 lineto
0.16412 0.24081 lineto
0.16837 0.24097 lineto
0.17262 0.24139 lineto
0.17687 0.24218 lineto
0.18112 0.24308 lineto
0.18537 0.2441 lineto
0.18963 0.24546 lineto
0.19388 0.24712 lineto
0.19813 0.2488 lineto
0.20238 0.25049 lineto
0.20663 0.25233 lineto
0.21088 0.25423 lineto
0.21514 0.25644 lineto
0.21939 0.25899 lineto
0.22364 0.2617 lineto
0.22789 0.26464 lineto
0.23214 0.2675 lineto
Mistroke
0.23639 0.27027 lineto
0.24065 0.2731 lineto
0.2449 0.27592 lineto
0.24915 0.27887 lineto
0.2534 0.28194 lineto
0.25765 0.28502 lineto
0.2619 0.28813 lineto
0.26616 0.29153 lineto
0.27041 0.29525 lineto
0.27466 0.29916 lineto
0.27891 0.30333 lineto
0.28316 0.30757 lineto
0.28741 0.31187 lineto
0.29167 0.31639 lineto
0.29592 0.32107 lineto
0.30017 0.32389 lineto
0.30442 0.32474 lineto
0.30867 0.32446 lineto
0.31293 0.32245 lineto
0.31718 0.31997 lineto
0.32143 0.31698 lineto
0.32568 0.31241 lineto
0.32993 0.3065 lineto
0.33418 0.30058 lineto
0.33844 0.29459 lineto
0.34269 0.28801 lineto
0.34694 0.28118 lineto
0.35119 0.27288 lineto
0.35544 0.26309 lineto
0.35969 0.25257 lineto
0.36395 0.24101 lineto
0.3682 0.22991 lineto
0.37245 0.21941 lineto
0.3767 0.20866 lineto
0.38095 0.19809 lineto
0.3852 0.18699 lineto
0.38946 0.17534 lineto
0.39371 0.1638 lineto
0.39796 0.15222 lineto
0.40221 0.13925 lineto
0.40646 0.12491 lineto
0.41071 0.10971 lineto
0.41497 0.09329 lineto
0.41922 0.07668 lineto
0.42347 0.05989 lineto
0.42772 0.04216 lineto
0.43197 0.02374 lineto
0.43622 0.01472 lineto
0.44048 0.0157 lineto
0.44473 0.02249 lineto
Mistroke
0.44898 0.03806 lineto
0.45323 0.05612 lineto
0.45748 0.07685 lineto
0.46173 0.10565 lineto
0.46599 0.14132 lineto
0.47024 0.17714 lineto
0.47449 0.21348 lineto
0.47874 0.25286 lineto
0.48299 0.29369 lineto
0.48724 0.34199 lineto
0.4915 0.39793 lineto
0.49575 0.45768 lineto
0.5 0.52274 lineto
0.50425 0.56768 lineto
0.5085 0.59053 lineto
0.51276 0.60332 lineto
0.51701 0.59845 lineto
0.52126 0.5904 lineto
0.52551 0.57898 lineto
0.52976 0.5513 lineto
0.53401 0.5102 lineto
0.53827 0.47485 lineto
0.54252 0.44456 lineto
0.54677 0.41196 lineto
0.55102 0.38176 lineto
0.55527 0.3379 lineto
0.55952 0.27997 lineto
0.56378 0.21875 lineto
0.56803 0.1503 lineto
0.57228 0.10152 lineto
0.57653 0.075 lineto
0.58078 0.05657 lineto
0.58503 0.05438 lineto
0.58929 0.05486 lineto
0.59354 0.05799 lineto
0.59779 0.07661 lineto
0.60204 0.10802 lineto
0.60629 0.12943 lineto
0.61054 0.14137 lineto
0.6148 0.15289 lineto
0.61905 0.15826 lineto
0.6233 0.17562 lineto
0.62755 0.20541 lineto
0.6318 0.23507 lineto
0.63605 0.26895 lineto
0.64031 0.29283 lineto
0.64456 0.30471 lineto
0.64881 0.31352 lineto
0.65306 0.31477 lineto
0.65731 0.31384 lineto
Mistroke
0.66156 0.31089 lineto
0.66582 0.29989 lineto
0.67007 0.28187 lineto
0.67432 0.27149 lineto
0.67857 0.26866 lineto
0.68282 0.26718 lineto
0.68707 0.27083 lineto
0.69133 0.2687 lineto
0.69558 0.26053 lineto
0.69983 0.25413 lineto
0.70408 0.2469 lineto
0.70833 0.24179 lineto
0.71259 0.23969 lineto
0.71684 0.23775 lineto
0.72109 0.23704 lineto
0.72534 0.23782 lineto
0.72959 0.23999 lineto
0.73384 0.24424 lineto
0.7381 0.25068 lineto
0.74235 0.25425 lineto
0.7466 0.25485 lineto
0.75085 0.2549 lineto
0.7551 0.25305 lineto
0.75935 0.25261 lineto
0.76361 0.2537 lineto
0.76786 0.2538 lineto
0.77211 0.2537 lineto
0.77636 0.25381 lineto
0.78061 0.25389 lineto
0.78486 0.25424 lineto
0.78912 0.2549 lineto
0.79337 0.25496 lineto
0.79762 0.25445 lineto
0.80187 0.25383 lineto
0.80612 0.25288 lineto
0.81037 0.25237 lineto
0.81463 0.25235 lineto
0.81888 0.25235 lineto
0.82313 0.25258 lineto
0.82738 0.25271 lineto
0.83163 0.25271 lineto
0.83588 0.25288 lineto
0.84014 0.25314 lineto
0.84439 0.25326 lineto
0.84864 0.25328 lineto
0.85289 0.25323 lineto
0.85714 0.25307 lineto
0.86139 0.253 lineto
0.86565 0.25303 lineto
0.8699 0.25302 lineto
Mistroke
0.87415 0.25302 lineto
0.8784 0.25302 lineto
0.88265 0.253 lineto
0.8869 0.25301 lineto
0.89116 0.25303 lineto
0.89541 0.25304 lineto
0.89966 0.25304 lineto
0.90391 0.25304 lineto
0.90816 0.25303 lineto
0.91241 0.25303 lineto
0.91667 0.25303 lineto
0.92092 0.25303 lineto
0.92517 0.25303 lineto
0.92942 0.25303 lineto
0.93367 0.25303 lineto
0.93793 0.25303 lineto
0.94218 0.25303 lineto
0.94643 0.25303 lineto
0.95068 0.25303 lineto
0.95493 0.25303 lineto
0.95918 0.25303 lineto
0.96344 0.25303 lineto
0.96769 0.25303 lineto
0.97194 0.25303 lineto
0.97619 0.25303 lineto
Mfstroke
0 0 moveto
1 0 lineto
1 0.61803 lineto
0 0.61803 lineto
closepath
clip
newpath
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; endGroup; endGroup; endGroup; endGroup; ]
The Unformatted text for this cell was not generated.
Use options in the Actions Settings dialog box to control
when Unformatted text is generated.
;[o]
-Graphics-
^*)