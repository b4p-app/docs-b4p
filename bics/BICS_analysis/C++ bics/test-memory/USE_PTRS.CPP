#include <iostream.h>

#define NULL	0

void main(void)
 {
   int *int_pointer;
   float *float_pointer;

   if ((int_pointer = new int) == NULL)
     cerr << "Error allocating memory for int" << endl;
   else
     {
       *int_pointer = 1001;
       cout << "The value assigned to memory location " 
       		<< int_pointer << " is " << *int_pointer << endl;
     }

   if ((float_pointer = new float) == NULL)
     cerr << "Error allocating memory for float" << endl;
   else
     {
       *float_pointer = 11.22;
       cout << "The value assigned to memory location " 
       		<< float_pointer << " is " << *float_pointer << endl;
     }
 }

