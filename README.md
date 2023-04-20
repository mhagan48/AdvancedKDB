# AdvancedKDB
My solutions to the KX technologies advanced kdb CMTP exam. 

Questions:

# EXERCISE 1

    1.TICKERPLANT

Create a tickerplant which contains the schema for the below tables:
a)	Trade
b)	Quote
c)	Aggregation table which will contain following metrics by symbol
    	Max/min trade prices
    	Traded volume
    	Top of book details
The tickerplant should also log every minute:
i)	number of messages that have been processed by table up until that time
ii)	subscription details of subscribers

    2.RDB

Create 2 RDB which subscribe as follows:
i)	Subscribes only to Trade and Quote tables
ii)	Subscribes to aggregation table

    3.FEEDHANDLER

Create a mock feedhandler that will supply trades and quotes to the above system.

    4.CEP

Create a Complex Event Processer/Calculation Engine which will subscribe to trades and quote from tickerplant and then calculate metrics for the aggregation table and publish the data back to the Ticker Plant.

    5.LOGGING

Write a logging script that can be loaded into the above components and will log:
i)	details of connections opened
ii)	details of connections closed
iii)	all logging statements should include username of calling process where applicable and memory usage details from .Q.w[]
iv)	functions should be available so that can write internal logging statements to write to standard out and error

    6.STARTUP/SHUTDOWN SCRIPTS	

Create a startup script in whichever language you prefer e.g. ksh, bash, perl etc that will work in 3 main modes:
i)	START - give the ability to start up the components in 1-4. You should be able to start all or any specific one
ii)	STOP - give the ability to stop the components in 1-4. You should be able to start all or any specific one
iii)	TEST – test which components are currently running and supply details
iv)	Make the script as configurable as you see fit e.g. how port numbers will be assigned, log locations, db directories 

    7.TICKERPLANT LOG REPLAY

Write a script that reads in a tickerplant log file which contains trade and quote updates and creates a new tickerplant log file which only contains the trade updates for ibm.n.


    8.CSV FILE LOAD

Create a script that will load a csv file and publish the contents to the Ticker plant.

    9.EOD PROCESS

Write a script which will take the Ticker Plant log and create a daily partitioned HDB in which all columns are compressed with the exception of sym and time.

    10.SCHEMA CHANGE

Discuss the effect a schema change to the trade table in the above system e.g. a sequence number column was added to both trade and quote tables. How you would plan a turnover to update the schema.


# EXERCISE 2- DEBUGGING 

Debug the following:

    1.TP/RDB ISSUE	

The below tickerplant log contains and error.
a)	Locate the error
b)	Fix the error
Show how each was performed.
 
    2.SPLAY TABLE ISSUE

The 3 tables in the below zip file contain errors. Try to ascertain the error and recommend a suitable fix for each.
 
    3.BLOCKING CLLS

In your current system you have a historical database and a single hdb kdb+ instance to host user queries. Users are complaining about slowness. What is the probable cause of the slowness and suggest 2 changes that could be made to alleviate the problem. Maintain a single entry point to the system if possible.

    4.QUERY PERFORMANCE

Improve the performance of function 
StringtoDate:{[x]{$[10h~abs type x;x:"D"$x;-14h~ type x;x:x;`date$x]}'[x]} given input: raze 500000#enlist("2010.01.01";2010.01.02). Do not use .Q.fu.


# EXERCISE 3 - API


Create a small script that should read in a csv file and publish each row to a tickerplant in:

    1.PYTHON

Create a small script that should read in a csv file and publish each row to a tickerplant in python

    2.JAVA

Create a small script that should read in a csv file and publish each row to a tickerplant in java

    3.Web Interface – HTML5	

Create a simple web interface using HTML5 that would be able to query a trade table, filtering on symbol input by user into a text box and display the results in table.

