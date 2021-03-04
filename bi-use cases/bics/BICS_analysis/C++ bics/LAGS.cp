#include <math.h>#include <iostream.h>				// cin,cout#include <stdio.h>					// NR headers#include <stddef.h>#include <stdlib.h>#include <strstream.h>				//string streams#include <fstream.h>				//stream manager#include <ctype.h>					//isalpha#define  NRANSI#include "nr.h"						//RMR-NR.h#include "nr_util.h"				//RMR-NRUTIL#include "nr_util.cp"				//RMR-NRUTIL#include "raf_util.cp"#include "raf_util.h"#include "regressData.cp"#include "colMinMax.cp"void main(void){	char			word[20];		//character array	char			var[100][20];	//character array of 50 words	char			ansQ;			//single char answer to Y/N question	int				ansN;			//single integer answer		float			ansF;			//single float answer	char			ans[40];		//1 word = 40-character array		char 			line[1024];		//line buffer, holds 1024 chars									//but grabs up to nullterm (\0) only	char			filename[40];	//file name, max length 40 chars	long int		i,j,k;			//counters	long int		skiprow;		//printing rows skipped	float			value=0;		//data value	long int		ROWS=0L;		//num rows	long int		COLS=0L;		//columns in row1	long int		COLS1=0L;		//columns in row2		long int		DIM=0L;			//num data points	long int		start=0L;		//unsigned long int - for pointers in fstream	int				headerQ=1;		//header exists?	long int		colMD[40]={0L};	//missing data count of input cols	int 			colSel[40]={0};	//data column selection vector	int				nColSel;		//number of cols selected for output	float			rSqrMin;		//minimum R^2 significance threshold		//ToWord vars:	char*			rest;			//leftover(Non-numerical) from strtod lib call	char** 			wordArray;		//define pointer to word pointers	wordArray = matrixChar(1,100,1,20);//allocate memory for 100 words (20 char)	char**			varName;	varName   = matrixChar(1,100,1,20); 	int 			wordcount=0;	//word counter					int				colons=0;		//colon count	int				colonLoc[4];	//colon locations, in words	//startup messagecout<<pageUp<<"   *****************************************************************"<<endl<<"   *                                                               *"<<endl	<<"   *                  DISTRIBUTED LAGS ANALYSIS                    *"<<endl<<"   *                                                               *"<<endl	<<"   *                                                               *"<<endl	<<"   *          Input file format:                                   *"<<endl<<"   *          � File:              DOS state: NL&CR                *"<<endl<<"   *          � Data:              FLOAT                           *"<<endl<<"   *          � Delimiters:        TAB                             *"<<endl<<"   *          � Missing:           -999                            *"<<endl<<"   *          � 1st  row:          row, col numbers                *"<<endl<<"   *          � 2nd  row:          var names                       *"<<endl<<"   *          � last row:          no NL/CR at end of line         *"<<endl<<"   *                                                               *"<<endl	<<"   *                                                               *"<<endl	<<"   *                                                               *"<<endl	<<"   *                    Copyright 1996                             *"<<endl	<<"   *                Rafael M. Richards, M.S.                       *"<<endl	<<"   *                George I. Chovanes, M.D.                       *"<<endl	<<"   *****************************************************************"<<endl<<"\n\n";		//enter file name	cout<< "Enter data file name ==>";	cin >> filename;		//"dir:subdir:filename"//display first three lines	ifstream	INFILE;						INFILE.open (filename, ios::in);	if 	( INFILE.fail() )  nrerror("error opening file");	else		{		cout	<<"first three rows:"<<endl<<lineSeparator<<endl;		for (i=0 ;i<3; i++)			{			INFILE.getline( line, sizeof(line) );	//be sure is DOS \n format			cout	<<line<<endl<<lineSeparator<<endl;			}		}//rewind input stream to zero offset from beginning.	INFILE.seekg(0, ios::beg);	//get and process first data line			INFILE.getline(line, sizeof(line) );	ToWords(line, wordArray,wordcount,colons, colonLoc);		if(wordcount ==2){		//file contains header information		headerQ=1;					ROWS  = (long)atof(wordArray[1]);		COLS  = (long)atof(wordArray[2]);	}	else {					//must manually enter num rows,cols		headerQ=0;		cout<<"No header information."<<endl			<<"Enter number of COLS ==>";		cin>>COLS;				cout<<"Counting number of rows..."<<endl;		while ( ! INFILE.eof()  ){			ROWS++;			INFILE.getline( line, sizeof(line) );		}	}		//get and process second line of data	INFILE.seekg(0, ios::beg);				//rewind to beg	INFILE.getline(line,sizeof(line) );		//get first line	INFILE.getline(line,sizeof(line) );		//get second line		ToWords(line, varName, wordcount,colons, colonLoc);		COLS1 = wordcount;	if( COLS != COLS1) { 		cout<<"Taking lesser of the column counts of header ("			<<COLS<<") and row2 ("<<COLS1<<")."<<endl;				if(COLS1 < COLS) COLS=COLS1;		}						//adjust number of float rows in data	cout<<"Does first row contain variable names?(Y/N):";	cin >> ansQ ;	ansQ = toupper(ansQ);	if ( ansQ == 'Y')	ROWS = ROWS - 1;	//print file specs	DIM = ROWS * COLS;		cout<<"Total COLS:\t"<<COLS<<endl;	cout<<"Total ROWS:\t"<<ROWS<<endl;		//cout<<"Total points:\t"<<DIM<<endl;	//cout<<"Variables:"<<endl;	//for( j=1; j<=COLS; j++)  {	//	cout<<"["<< j <<"]"<<varName[j]<<"\t";	//	if(  ( j % 8)== 0 ) cout<<endl;	//}							// create float data array of appropriate size		float **data;		data = matrix(1, ROWS, 1 , COLS);//read in array of data		skiprow=100;			for (i=1; i<=ROWS; i++)			{			INFILE.getline(line,sizeof(line) );				istrstream	STRING(line);			if ( STRING.fail() ) 					nrerror("string stream2 failed");			for (j=1; j<=COLS; j++)				{				STRING >> value;				if( value == -999) colMD[j]++;				data[i][j] = value;				}			if(  ( i % skiprow )== 0 ) cout<<".";				//	{				//	cout<<lineSeparator<<endl				//		<<"ROW: "<<i<<endl;				//	for(j=1; j<=COLS; j++) cout<<data[i][j]<<"\t";				//	cout<<endl;				//	}			}		INFILE.close();	//display file stats	cout<<endl<<lineSeparator<<endl		<<"Number of missing values in each column, out of total "		<<ROWS<<" :\n\n";		for(j=1; j<=COLS; j++){		cout<<"["<<j<<"]"<<varName[j]<<": "<<colMD[j]<<"\t\t";		if(  ( j % 3 )== 0 ) cout<<endl;			}	cout<<endl<<lineSeparator<<endl;//enter columns to process: not time column	cout<<"List columns to process        ==>";	cin>>ans;					ToWords(ans, wordArray, wordcount,colons, colonLoc);	nColSel=wordcount;	for(i=1;i<=nColSel;i++)		{		colSel[i]= atoi( wordArray[i] );	//string to int lib function		cout<<"["<<varName[ colSel[i] ]<<"]"<<"\t";		}	cout<<endl;							//permutations of selected columns	i=1;	k=1;	int xperm[200], yperm[200], nPerms;		//max nPerms = 200	while( i != nColSel) 	{		for(j =i+1; j <=nColSel; j++) 		{		xperm[k] = colSel[i];		yperm[k] = colSel[j];		k++;		}	i++;	} 	nPerms = k-1;	cout<<"number of permutations: "<< nPerms <<endl;	for(i=1; i<=nPerms; i++) cout<<"["<<xperm[i]<<","<<yperm[i]<<"]\t";	cout<<endl;//open output stream	char ofilename[40];						//output file name 40 char	cout<<endl<<"Enter output file name         ==>";	cin>>ofilename;	ofstream	OUTFILE( ofilename, ios::out);	if 	( OUTFILE.fail() )  nrerror("error opening output file");		//scratch vectors and variables to pass to regressData function	int	lag=0;	cout<<"Enter distributed lag value    ==>"; 	cin>>lag; 	int absLag = abs(lag);		float b,sigb,rSqr,rSqrCrit,tval,tcrit;	float *vec1, *vec2;	vec1 =vector(1,ROWS);	vec2= vector(1,ROWS);//write header: nRows, nCols,nCases, nVars		//OUTFILE<<"nRows\tnCols\tnCases\tnVars"<<endl;	OUTFILE<<nPerms*(1+absLag*2)<<"\t"<< 5 <<"\t"<<nPerms<<"\t"<<COLS<<"\n";	for(i=1; i<=COLS; i++) 		OUTFILE<< varName[i]<<"\t";	OUTFILE<<"\n";	//main loop		cout<<"REGRESSION PROGRESS"<<endl;			for( i=1; i<= nPerms; i++)			//number of perms	{		cout<<"["<<xperm[i]<<","<<yperm[i]<<"]\t";		for( lag= -absLag; lag<=absLag; lag++)		//number of lags		{		//cout<<".";		regressData(data,vec1,vec2,					xperm[i], yperm[i],1 ,ROWS-absLag,lag, 					&b,&sigb,&rSqr,&tval,&tcrit);					//CHECK CRITICAL T-VALUE: significant R2 if p>.005		// if p>.005,  rSqrCrit ->  -999 		rSqrCrit = rSqr; 		if(tval < tcrit )  rSqrCrit = -999;								//cout.precision(5);		OUTFILE<<i<<"\t"<<xperm[i]<<"\t"<<yperm[i]<<"\t"				<<lag<<"\t"<<rSqrCrit<<"\n";		}			}	cout<<endl;	OUTFILE.close();// delete data matrix before exitingcout<<"do you wish to exit Y/N: ";cin>>ansQ;if( toupper(ansQ) == 'Y')	{	free_vector( vec1, 1, ROWS);	free_vector( vec2, 1, ROWS);	free_matrix(data,1, ROWS, 1 , COLS);	nrerror("released memory");	}return;	}