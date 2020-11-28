0. Interactive - Help Table of Contents
________________________________________________________________________________

Page Number

[1]	Entering interactive mode

[2]	Help commands (for help text and accessing B4P documentation)

[3]	Executing B4P statements and expressions by hand

[4]	Basic commands (incl. leaving interactive mode)

[5]	Operating system commands

[6]	Inspecting tables

[7]	Inspecting variables


_______________________________________________________________________________
Page [0]..[7], [N]ext / [P]revious page [C]lear screen on/off  [Q]uit:






1. Interactive - How to enter interactive mode
________________________________________________________________________________

a)	Start "interactive.b4p"
	This file contains just one statement: 'interactive;'

b)	The statement (procedure call) 'interactive;' is executed

c)	Start B4P with command line option -i

d)	Start B4P directly and it does not find the file "Main.b4p".
	in the presently configured starting directory.

e)	B4P asserts an exception (e.g. syntax error)


Good debugging hint: add 'interactive;' in your program code in order to pause
and go into interactive mode.  Type 'return' to continue running your code.

_______________________________________________________________________________
Page [0]..[7], [N]ext / [P]revious page [C]lear screen on/off  [Q]uit:




2. Interactive - Help Commands
________________________________________________________________________________

help				Display this interactive help information

docs				Opens the online B4P manual

docs search		        Opens online B4P docs with search feature
docs search ( for )		Opens online-docu for function 'for'
docs search ( 'for*' )		Opens online-docu for all keywords starting with
				'for'. A menu lets you to narrow the search.

list functions			Lists all procedures and functions
list functions( '*if*' )	Lists all of them containing 'if

explain functions		Lists all procedures and functions with
				details on parameters

explain functions( 'c*')	Explain all of them starting with c
explain functions( for )	Explain the 'for' procedure


dump functions( [table name] )	Dumps all known functions with details on
				parameters into a table.
Example:
dump functions( table ); view( table, excel )

_______________________________________________________________________________
Page [0]..[7], [N]ext / [P]revious page [C]lear screen on/off  [Q]uit:





3. Interactive - Executing B4P Statements and Expressions by Hand
________________________________________________________________________________

Interactive mode allows executing B4P statements, expressions and function
calls by hand.  Good idea for trying out simple algorithms.

a) Running B4P statements: Type the B4P statements.
   Use semicolons to separate 2 or more statements put into one line

   Syntax:	[1 or more B4P statements]
   Examples:	echo( Hello world ); echo( " It's ", date(now) )
		table load( table name, test.csv )
		[a] = 2 * 3

b) Calculating B4P expressions and view result and its data type

   Syntax:	= [B4P expression]
   Examples:	= average( 1, 2, 3, 4 )
		= a[] + b[] + 1

These commands are useful to inspect variables, tables, etc. while debugging
your B4P code.


_______________________________________________________________________________
Page [0]..[7], [N]ext / [P]revious page [C]lear screen on/off  [Q]uit:





4. Interactive - Useful Basic Commands
________________________________________________________________________________

return				Return and continue programe execution

exit				Exit B4P

start ( [B4P file name] )	Starts a B4P application script
start ( Hello_World.b4p )

prompt( " [expression] " )	Specify expression in quotation marks to change
				the prompt used in interactive mode.

Examples:	prompt( "working directory()" )
		prompt( "system info[user name] + ' ' + literal(date(now))" )

		prompt( "" )	Reset the prompt to factory settings '>> '

set locale ( [lang_country] )	Change locale settings, will be memorized
set locale ( en_US )		Example for English / USA

= local settings[locale]	Returns locale settings

_______________________________________________________________________________
Page [0]..[7], [N]ext / [P]revious page [C]lear screen on/off  [Q]uit:





5. Interactive - Operating System Commands
________________________________________________________________________________

Start with a dollar sign '$' and type the OS commands to interact
with the operating system command-line shell.

Syntax:		$ [command]

Examples:	Under Windows:
		$ dir			$ cd subirectory_name
		$ cd			$ start abc.pdf

		Under LINUX / MACOS:
		$ ls			$ cd subdirectory_name
		$ pwd			$ open abc.pdf

Note:	Since 'cd' and 'chdir' are executed in child processes,
	B4P will detect these commands and also change the
	working directory inside B4P.

Note:	System commands are also possible from B4P application scripts
	using the 'system' function call. Like all other B4P functions,
	system( [command] ) can also be executed interactively.

Example: system( dir ) or system( ls )

_______________________________________________________________________________
Page [0]..[7], [N]ext / [P]revious page [C]lear screen on/off  [Q]uit:





6. Interactive - Inspecting Tables
________________________________________________________________________________


list table( [table name], [max rows], [max columns] )

		lists a table in very simple way.
		Limiting number of rows and columns is optional.

view ([table name],[browser])	Views a B4P table with specified browser
view ([table name])		View with browser defined last time


Supported browsers (OS specific restrictions may apply):

here		Table will be displayed on this screen directly.
		Various push-key navigation features are available.

excel		B4P generates CSV file and opens it with Excel
execel html	B4P generates HTML file and opens it with Excel
excel xml	B4P generates XML file and opens it with Excel

explorer / chrome / firefox / safari / brave
		B4P generates HTML file and opens it with a browser

[browser_name] datatables
		Opens the table in the chosen brower and uses 'datatables'
		viewing tool from SpryMedia Ltd.

Examples:	view ( my table, excel )
		view ( my table, chrome datatables )
		view ( my table, here )
		view ( my table )

view reset	Deletes all temporary files created in the working
		directory for viewing in browsers or Excel.

Operating-system specific limitations may apply.

_______________________________________________________________________________
Page [0]..[7], [N]ext / [P]revious page [C]lear screen on/off  [Q]uit:







7. Interactive - Inspecting Variables
________________________________________________________________________________

= [variable name]		Display the value of the specified
Examples: 	= a[]		variable, but without values of member
		= a[1]		elements if applicable

inspect( [variable name] )	Inspect contents of variabe including
inspect( a[] )			all members (arrays, structures)


list variables			List all variables with all contents
list system variables		List all system variables ...
list global variables		List all global variables ...
list local variables		List all local variables ...

list variables ( 'v*' )		List all variables beginning with 'v'.
list local variables ('*a*')	List all local variables containing 'a'

_______________________________________________________________________________
Page [0]..[7], [N]ext / [P]revious page [C]lear screen on/off  [Q]uit:











