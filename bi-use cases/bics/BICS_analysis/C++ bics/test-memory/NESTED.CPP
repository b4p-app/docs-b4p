#include <iostream.h>
#include <string.h>

class date {
  public: 
    date(int month, int day, int year);		//constructor fun
    void show_date(void);					//member fun
  private:
    int month;
    int day;
    int year;
};

class employee {
  public:
    employee(char *name, int age, 
    		int month, int day, int year); 	//constructor fun
    ~employee(void);						//destructor fun
    void show_employee(void);				//member fun
  private:
    char name[64];
    int age;
    date *hire_date; // Nested class - pointer to class of date
};

date::date(int month, int day, int year)	
 {
   date::month = month;
   date::day = day;
   date::year = year;
 }

void date::show_date(void)					
 {
   cout << month << '/' << day << '/' << year << endl;
 }

employee::employee(char *name, int age, int month, int day, int year)
 {
   strcpy(employee::name, name);
   employee::age = age;
   hire_date = new date(month, day, year);
 }

employee::~employee(void)
 {
   delete hire_date;
 }

void employee::show_employee(void)
 {
   cout << "Name: " << name << endl;
   cout << "Age: " << age << endl;
   cout << "Hire date: ";
   hire_date->show_date();			//or (*hire_date).show_date()
 }

void main(void)
 {
   employee manager("Joe Smith", 33, 12, 25, 1994);

   manager.show_employee();
 }

