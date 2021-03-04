/* ** FUNCTION:		tCrit** Given a value for degrees of freedom (dof) this function will return the * t-value corresponding to p<.005**/int muCrit[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 105, 110, 115, 120, 125, 130, 135, 140, 145, 150, 160, 170, 180, 190, 200, 250, 300, 350, 400, 450, 500, 600, 700, 800, 900, 1000, 1000000};float t005[] = {63.657, 9.925, 5.841, 4.604, 4.032, 3.707, 3.499, 3.355, 3.25,   3.169, 3.106, 3.055, 3.012, 2.977, 2.947, 2.921, 2.898, 2.878, 2.845, 2.845,   2.831, 2.819, 2.807, 2.797, 2.787, 2.779, 2.771, 2.763, 2.756, 2.75, 2.744,   2.738, 2.733, 2.728, 2.724, 2.719, 2.715, 2.712, 2.708, 2.704, 2.701, 2.698,   2.695, 2.692, 2.69, 2.687, 2.685, 2.682, 2.68, 2.678, 2.674, 2.67, 2.667,   2.663, 2.66, 2.657, 2.655, 2.652, 2.65, 2.648, 2.646, 2.644, 2.642, 2.64,   2.639, 2.637, 2.636, 2.634, 2.633, 2.632, 2.63, 2.629, 2.628, 2.627, 2.626,   2.623, 2.621, 2.619, 2.617, 2.616, 2.614, 2.613, 2.611, 2.61, 2.609, 2.607,   2.605, 2.603, 2.602, 2.601, 2.596, 2.592, 2.59, 2.588, 2.587, 2.586, 2.584,   2.583, 2.582, 2.581, 2.581, 2.5758};// index of critical t-valuefloat tCrit(int dof) {		int index =0;					for(int i=0; muCrit[i]<1000000; i++) 			{			if( muCrit[i] <= dof && muCrit[i+1] >= dof) index= i+1;			};		return	t005[index];}