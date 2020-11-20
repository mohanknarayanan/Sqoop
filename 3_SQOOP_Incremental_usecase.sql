Check whether the below import works?

sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customer -m 2;
[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customerlm -m 2;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/13 23:40:01 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/13 23:40:01 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/13 23:40:01 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/13 23:40:01 INFO tool.CodeGenTool: Beginning code generation
20/09/13 23:40:02 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/13 23:40:02 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/13 23:40:02 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/e75ad3ab67cf312e2843ff424eca0d60/customerlm.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/13 23:40:04 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/e75ad3ab67cf312e2843ff424eca0d60/customerlm.jar
20/09/13 23:40:05 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/09/13 23:40:05 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/09/13 23:40:05 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/09/13 23:40:05 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/09/13 23:40:05 ERROR tool.ImportTool: Error during import: No primary key could be found for table customerlm. Please specify one with --split-by or perform a sequential import with '-m 1'.
[hduser@Inceptez ~]$ 

Ans: Above sqoop command won't work beacause, we specified mappers has 2(declared more than 1 mapper) then split-by or primary key column is required.

[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://127.0.0.1/custdb --username root -P -table customer -m 3 \
> --split-by custid --target-dir sqoop_import --delete-target-dir --direct; 
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/13 22:57:56 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
Enter password: 
20/09/13 22:58:00 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/13 22:58:00 INFO tool.CodeGenTool: Beginning code generation
20/09/13 22:58:00 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/13 22:58:00 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/13 22:58:00 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/f9a3c391eb1733bee1e464198c7edeec/customer.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/13 22:58:02 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/f9a3c391eb1733bee1e464198c7edeec/customer.jar
20/09/13 22:58:02 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/13 22:58:03 INFO tool.ImportTool: Destination directory sqoop_import deleted.
20/09/13 22:58:03 INFO manager.DirectMySQLManager: Beginning mysqldump fast path import
20/09/13 22:58:03 INFO mapreduce.ImportJobBase: Beginning import of customer
20/09/13 22:58:03 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/13 22:58:03 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/13 22:58:03 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/13 22:58:05 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/13 22:58:05 INFO db.DataDrivenDBInputFormat: BoundingValsQuery: SELECT MIN(`custid`), MAX(`custid`) FROM customer
20/09/13 22:58:05 INFO mapreduce.JobSubmitter: number of splits:3
20/09/13 22:58:05 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1600057250582_0006
20/09/13 22:58:06 INFO impl.YarnClientImpl: Submitted application application_1600057250582_0006
20/09/13 22:58:06 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1600057250582_0006/
20/09/13 22:58:06 INFO mapreduce.Job: Running job: job_1600057250582_0006
20/09/13 22:58:14 INFO mapreduce.Job: Job job_1600057250582_0006 running in uber mode : false
20/09/13 22:58:14 INFO mapreduce.Job:  map 0% reduce 0%
20/09/13 22:58:33 INFO mapreduce.Job:  map 33% reduce 0%
20/09/13 22:58:34 INFO mapreduce.Job:  map 100% reduce 0%
20/09/13 22:58:35 INFO mapreduce.Job: Job job_1600057250582_0006 completed successfully
20/09/13 22:58:36 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=402006
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=319
		HDFS: Number of bytes written=379
		HDFS: Number of read operations=12
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=6
	Job Counters 
		Launched map tasks=3
		Other local map tasks=3
		Total time spent by all maps in occupied slots (ms)=50188
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=50188
		Total vcore-seconds taken by all map tasks=50188
		Total megabyte-seconds taken by all map tasks=51392512
	Map-Reduce Framework
		Map input records=3
		Map output records=9
		Input split bytes=319
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=5069
		CPU time spent (ms)=5380
		Physical memory (bytes) snapshot=516857856
		Virtual memory (bytes) snapshot=6264250368
		Total committed heap usage (bytes)=324534272
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=379
20/09/13 22:58:36 INFO mapreduce.ImportJobBase: Transferred 379 bytes in 32.8603 seconds (11.5337 bytes/sec)
20/09/13 22:58:36 INFO mapreduce.ImportJobBase: Retrieved 9 records.
[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ hadoop fs -cat sqoop_import/*
20/09/13 23:01:52 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1,Arun,Kumar,chennai,33,2017-09-20,100000
2,srini,vasan,chennai,33,2017-09-21,10000
3,vasu,devan,banglore,39,2017-09-23,90000
4,mohamed,imran,hyderabad,33,2017-09-24,1000
5,arun,basker,chennai,23,2017-09-20,200000
6,ramesh,babu,manglore,39,2017-09-21,100000
7,inceptez,tech,Chennai,3,2017-09-28,10000
8,Iz,tech,pune,4,2017-09-28,10000
9,mohan,kumar,banglore,35,2017-09-29,500000
[hduser@Inceptez ~]$ 


[hduser@Inceptez ~]$ jps
3280 ResourceManager
3393 NodeManager
3107 SecondaryNameNode
17126 Jps
2908 DataNode
2797 NameNode
[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root -P -table customerlm -m 3 \
> --split-by custid --target-dir sqoop_import --delete-target-dir --direct;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/13 23:32:44 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
Enter password: 
20/09/13 23:32:48 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/13 23:32:48 INFO tool.CodeGenTool: Beginning code generation
20/09/13 23:32:51 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/13 23:32:54 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/13 23:32:54 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/633ee998a542bd75e7cb7e086c30244c/customerlm.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/13 23:33:19 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/633ee998a542bd75e7cb7e086c30244c/customerlm.jar
20/09/13 23:33:20 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/13 23:33:35 INFO tool.ImportTool: Destination directory sqoop_import deleted.
20/09/13 23:33:35 INFO manager.DirectMySQLManager: Beginning mysqldump fast path import
20/09/13 23:33:35 INFO mapreduce.ImportJobBase: Beginning import of customerlm
20/09/13 23:33:36 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/13 23:33:36 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/13 23:33:38 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/13 23:34:18 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/13 23:34:18 INFO db.DataDrivenDBInputFormat: BoundingValsQuery: SELECT MIN(`custid`), MAX(`custid`) FROM customerlm
20/09/13 23:34:19 INFO mapreduce.JobSubmitter: number of splits:3
20/09/13 23:34:20 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1600057250582_0008
20/09/13 23:34:24 INFO impl.YarnClientImpl: Submitted application application_1600057250582_0008
20/09/13 23:34:24 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1600057250582_0008/
20/09/13 23:34:24 INFO mapreduce.Job: Running job: job_1600057250582_0008
20/09/13 23:35:49 INFO mapreduce.Job: Job job_1600057250582_0008 running in uber mode : false
20/09/13 23:35:49 INFO mapreduce.Job:  map 0% reduce 0%
20/09/13 23:37:05 INFO mapreduce.Job:  map 33% reduce 0%
20/09/13 23:37:06 INFO mapreduce.Job:  map 67% reduce 0%
20/09/13 23:37:08 INFO mapreduce.Job:  map 100% reduce 0%
20/09/13 23:37:13 INFO mapreduce.Job: Job job_1600057250582_0008 completed successfully
20/09/13 23:37:14 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=402063
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=320
		HDFS: Number of bytes written=692
		HDFS: Number of read operations=12
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=6
	Job Counters 
		Launched map tasks=3
		Other local map tasks=3
		Total time spent by all maps in occupied slots (ms)=210423
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=210423
		Total vcore-seconds taken by all map tasks=210423
		Total megabyte-seconds taken by all map tasks=215473152
	Map-Reduce Framework
		Map input records=3
		Map output records=11
		Input split bytes=320
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=8847
		CPU time spent (ms)=12050
		Physical memory (bytes) snapshot=507359232
		Virtual memory (bytes) snapshot=6249545728
		Total committed heap usage (bytes)=326107136
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=692
20/09/13 23:37:14 INFO mapreduce.ImportJobBase: Transferred 692 bytes in 217.8508 seconds (3.1765 bytes/sec)
20/09/13 23:37:14 INFO mapreduce.ImportJobBase: Retrieved 11 records.
[hduser@Inceptez ~]$ date
Sun Sep 13 23:37:36 PDT 2020
[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$  hadoop fs -cat sqoop_import/*
20/09/13 23:38:34 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1,Arun,Kumar,chennai,33,2017-09-20,100000,2020-09-01 07:00:01
2,srini,vasan,chennai,33,2017-09-21,10000,2020-09-01 07:00:01
3,vasu,devan,banglore,39,2017-09-23,90000,2020-09-01 07:00:01
4,mohamed,imran,hyderabad,33,2017-09-24,1000,2020-09-01 07:00:01
5,arun,basker,chennai,23,2017-09-20,200000,2020-09-01 07:00:01
6,ramesh,babu,manglore,39,2017-09-21,100000,2020-09-01 07:00:01
7,inceptez,tech,Chennai,3,2017-09-28,10000,2020-09-01 07:00:01
8,Iz,tech,pune,4,2017-09-28,10000,2020-09-01 07:00:01
9,mohan,kumar,banglore,35,2017-09-29,500000,2020-09-01 07:00:01
10,mrithyun,mohan,banglore,5,2017-09-30,20000,2020-09-01 07:00:01
11,priyanga,mohan,banglore,30,2017-09-25,30000,2020-09-01 07:00:01
[hduser@Inceptez ~]$ 


[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://127.0.0.1/custdb --username root --password root –table customer -m 3 --split-by city --append --fetch-size 100;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/13 23:03:33 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/13 23:03:33 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/13 23:03:33 ERROR tool.BaseSqoopTool: Error parsing arguments for import:
20/09/13 23:03:33 ERROR tool.BaseSqoopTool: Unrecognized argument: –table
20/09/13 23:03:33 ERROR tool.BaseSqoopTool: Unrecognized argument: customer
20/09/13 23:03:33 ERROR tool.BaseSqoopTool: Unrecognized argument: -m
20/09/13 23:03:33 ERROR tool.BaseSqoopTool: Unrecognized argument: 3
20/09/13 23:03:33 ERROR tool.BaseSqoopTool: Unrecognized argument: --split-by
20/09/13 23:03:33 ERROR tool.BaseSqoopTool: Unrecognized argument: city
20/09/13 23:03:33 ERROR tool.BaseSqoopTool: Unrecognized argument: --append
20/09/13 23:03:33 ERROR tool.BaseSqoopTool: Unrecognized argument: --fetch-size
20/09/13 23:03:33 ERROR tool.BaseSqoopTool: Unrecognized argument: 100

Try --help for usage instructions.
[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://127.0.0.1/custdb --username root --password root -table customer -m 3 --split-by city --append --fetch-size 100;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/13 23:04:03 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/13 23:04:03 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/13 23:04:03 INFO manager.MySQLManager: Argument '--fetch-size 100' will probably get ignored by MySQL JDBC driver.
20/09/13 23:04:03 INFO tool.CodeGenTool: Beginning code generation
20/09/13 23:04:04 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/13 23:04:04 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/13 23:04:04 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/b00a010a4f30afc62627eaedb8a1cf27/customer.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/13 23:04:06 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/b00a010a4f30afc62627eaedb8a1cf27/customer.jar
20/09/13 23:04:06 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/09/13 23:04:06 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/09/13 23:04:06 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/09/13 23:04:06 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/09/13 23:04:06 INFO mapreduce.ImportJobBase: Beginning import of customer
20/09/13 23:04:06 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/13 23:04:06 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/13 23:04:07 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/13 23:04:07 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/13 23:04:10 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/13 23:04:10 INFO db.DataDrivenDBInputFormat: BoundingValsQuery: SELECT MIN(`city`), MAX(`city`) FROM `customer`
20/09/13 23:04:10 WARN db.TextSplitter: Generating splits for a textual index column.
20/09/13 23:04:10 WARN db.TextSplitter: If your database sorts in a case-insensitive order, this may result in a partial import or duplicate records.
20/09/13 23:04:10 WARN db.TextSplitter: You are strongly encouraged to choose an integral split column.
20/09/13 23:04:10 INFO mapreduce.JobSubmitter: number of splits:3
20/09/13 23:04:10 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1600057250582_0007
20/09/13 23:04:11 INFO impl.YarnClientImpl: Submitted application application_1600057250582_0007
20/09/13 23:04:11 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1600057250582_0007/
20/09/13 23:04:11 INFO mapreduce.Job: Running job: job_1600057250582_0007
20/09/13 23:04:19 INFO mapreduce.Job: Job job_1600057250582_0007 running in uber mode : false
20/09/13 23:04:19 INFO mapreduce.Job:  map 0% reduce 0%
20/09/13 23:04:31 INFO mapreduce.Job:  map 33% reduce 0%
20/09/13 23:04:32 INFO mapreduce.Job:  map 67% reduce 0%
20/09/13 23:04:33 INFO mapreduce.Job:  map 100% reduce 0%
20/09/13 23:04:34 INFO mapreduce.Job: Job job_1600057250582_0007 completed successfully
20/09/13 23:04:34 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=401010
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=413
		HDFS: Number of bytes written=379
		HDFS: Number of read operations=12
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=6
	Job Counters 
		Launched map tasks=3
		Other local map tasks=3
		Total time spent by all maps in occupied slots (ms)=30551
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=30551
		Total vcore-seconds taken by all map tasks=30551
		Total megabyte-seconds taken by all map tasks=31284224
	Map-Reduce Framework
		Map input records=9
		Map output records=9
		Input split bytes=413
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=521
		CPU time spent (ms)=4230
		Physical memory (bytes) snapshot=488521728
		Virtual memory (bytes) snapshot=6256205824
		Total committed heap usage (bytes)=305659904
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=379
20/09/13 23:04:34 INFO mapreduce.ImportJobBase: Transferred 379 bytes in 27.7397 seconds (13.6627 bytes/sec)
20/09/13 23:04:34 INFO mapreduce.ImportJobBase: Retrieved 9 records.
20/09/13 23:04:34 INFO util.AppendUtils: Appending to directory customer
20/09/13 23:04:34 INFO util.AppendUtils: Using found partition 7
[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ hadoop fs -cat customer/*
20/09/13 23:06:17 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1,Arun,Kumar,chennai,33,2017-09-20,100000
2,srini,vasan,chennai,33,2017-09-21,10000
3,vasu,devan,banglore,39,2017-09-23,90000
4,mohamed,imran,hyderabad,33,2017-09-24,1000
5,arun,basker,chennai,23,2017-09-20,200000
6,ramesh,babu,manglore,39,2017-09-21,100000
1,Arun,Kumar,chennai,33,2017-09-20,100000
2,srini,vasan,chennai,33,2017-09-21,10000
3,vasu,devan,banglore,39,2017-09-23,90000
5,arun,basker,chennai,23,2017-09-20,200000
4,mohamed,imran,hyderabad,33,2017-09-24,1000
6,ramesh,babu,manglore,39,2017-09-21,100000
1,Arun,Kumar,chennai,33,2017-09-20,100000
2,srini,vasan,chennai,33,2017-09-21,10000
3,vasu,devan,banglore,39,2017-09-23,90000
5,arun,basker,chennai,23,2017-09-20,200000
7,inceptez,tech,Chennai,3,2017-09-28,10000
9,mohan,kumar,banglore,35,2017-09-29,500000
4,mohamed,imran,hyderabad,33,2017-09-24,1000
6,ramesh,babu,manglore,39,2017-09-21,100000
8,Iz,tech,pune,4,2017-09-28,10000
1,Arun,Kumar,chennai,33,2017-09-20,100000
2,srini,vasan,chennai,33,2017-09-21,10000
3,vasu,devan,banglore,39,2017-09-23,90000
5,arun,basker,chennai,23,2017-09-20,200000
7,inceptez,tech,Chennai,3,2017-09-28,10000
9,mohan,kumar,banglore,35,2017-09-29,500000
4,mohamed,imran,hyderabad,33,2017-09-24,1000
6,ramesh,babu,manglore,39,2017-09-21,100000
8,Iz,tech,pune,4,2017-09-28,10000
[hduser@Inceptez ~]$ 

---
--##Fields terminated by & Lines terminated by
sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customer -m 1 --target-dir imp_del --fields-terminated-by '~' --lines-terminated-by '\n' --delete-target-dir;

sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customerlm -m 1 --target-dir imp_del_lm --fields-terminated-by '~' --lines-terminated-by  '\n' --delete-target-dir;

mysql> select * from customerlm;
+--------+-----------+----------+-----------+------+------------+-------------+---------------------+
| custid | firstname | lastname | city      | age  | createdt   | transactamt | create_updts        |
+--------+-----------+----------+-----------+------+------------+-------------+---------------------+
|      1 | Arun      | Kumar    | chennai   |   33 | 2017-09-20 |      100000 | 2020-09-01 00:00:01 |
|      2 | srini     | vasan    | chennai   |   33 | 2017-09-21 |       10000 | 2020-09-01 00:00:01 |
|      3 | vasu      | devan    | banglore  |   39 | 2017-09-23 |       90000 | 2020-09-01 00:00:01 |
|      4 | mohamed   | imran    | hyderabad |   33 | 2017-09-24 |        1000 | 2020-09-01 00:00:01 |
|      5 | arun      | basker   | chennai   |   23 | 2017-09-20 |      200000 | 2020-09-01 00:00:01 |
|      6 | ramesh    | babu     | manglore  |   39 | 2017-09-21 |      100000 | 2020-09-01 00:00:01 |
|      7 | inceptez  | tech     | Chennai   |    3 | 2017-09-28 |       10000 | 2020-09-01 00:00:01 |
|      8 | Iz        | tech     | pune      |    4 | 2017-09-28 |       10000 | 2020-09-01 00:00:01 |
|      9 | mohan     | kumar    | banglore  |   35 | 2017-09-29 |      500000 | 2020-09-01 00:00:01 |
|     10 | mrithyun  | mohan    | banglore  |    5 | 2017-09-30 |       20000 | 2020-09-01 00:00:01 |
|     11 | priyanga  | mohan    | banglore  |   30 | 2017-09-25 |       30000 | 2020-09-01 00:00:01 |
+--------+-----------+----------+-----------+------+------------+-------------+---------------------+
11 rows in set (0.00 sec)

mysql> 

[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customerlm -m 1 --target-dir imp_del_lm --fields-terminated-by '~' --lines-terminated-by  '\n' --delete-target-dir;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/17 13:37:16 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/17 13:37:16 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/17 13:37:16 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/17 13:37:16 INFO tool.CodeGenTool: Beginning code generation
20/09/17 13:37:16 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/17 13:37:16 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/17 13:37:16 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/3185de4ea38248de24ae1c4a176c8724/customerlm.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/17 13:37:20 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/3185de4ea38248de24ae1c4a176c8724/customerlm.jar
20/09/17 13:37:21 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/17 13:37:23 INFO tool.ImportTool: Destination directory imp_del_lm is not present, hence not deleting.
20/09/17 13:37:23 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/09/17 13:37:23 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/09/17 13:37:23 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/09/17 13:37:23 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/09/17 13:37:23 INFO mapreduce.ImportJobBase: Beginning import of customerlm
20/09/17 13:37:23 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/17 13:37:23 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/17 13:37:23 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/17 13:37:35 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/17 13:37:35 INFO mapreduce.JobSubmitter: number of splits:1
20/09/17 13:37:36 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1600268300009_0022
20/09/17 13:37:46 INFO impl.YarnClientImpl: Submitted application application_1600268300009_0022
20/09/17 13:37:46 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1600268300009_0022/
20/09/17 13:37:46 INFO mapreduce.Job: Running job: job_1600268300009_0022
20/09/17 13:38:43 INFO mapreduce.Job: Job job_1600268300009_0022 running in uber mode : false
20/09/17 13:38:43 INFO mapreduce.Job:  map 0% reduce 0%
20/09/17 13:39:05 INFO mapreduce.Job:  map 100% reduce 0%
20/09/17 13:39:06 INFO mapreduce.Job: Job job_1600268300009_0022 completed successfully
20/09/17 13:39:06 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=133517
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=714
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=18226
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=18226
		Total vcore-seconds taken by all map tasks=18226
		Total megabyte-seconds taken by all map tasks=18663424
	Map-Reduce Framework
		Map input records=11
		Map output records=11
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=2510
		CPU time spent (ms)=2640
		Physical memory (bytes) snapshot=168968192
		Virtual memory (bytes) snapshot=2087276544
		Total committed heap usage (bytes)=112721920
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=714
20/09/17 13:39:06 INFO mapreduce.ImportJobBase: Transferred 714 bytes in 103.0173 seconds (6.9309 bytes/sec)
20/09/17 13:39:06 INFO mapreduce.ImportJobBase: Retrieved 11 records.
[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ hadoop fs -cat imp_del_lm/*
20/09/17 13:39:53 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1~Arun~Kumar~chennai~33~2017-09-20~100000~2020-09-01 00:00:01.0
2~srini~vasan~chennai~33~2017-09-21~10000~2020-09-01 00:00:01.0
3~vasu~devan~banglore~39~2017-09-23~90000~2020-09-01 00:00:01.0
4~mohamed~imran~hyderabad~33~2017-09-24~1000~2020-09-01 00:00:01.0
5~arun~basker~chennai~23~2017-09-20~200000~2020-09-01 00:00:01.0
6~ramesh~babu~manglore~39~2017-09-21~100000~2020-09-01 00:00:01.0
7~inceptez~tech~Chennai~3~2017-09-28~10000~2020-09-01 00:00:01.0
8~Iz~tech~pune~4~2017-09-28~10000~2020-09-01 00:00:01.0
9~mohan~kumar~banglore~35~2017-09-29~500000~2020-09-01 00:00:01.0
10~mrithyun~mohan~banglore~5~2017-09-30~20000~2020-09-01 00:00:01.0
11~priyanga~mohan~banglore~30~2017-09-25~30000~2020-09-01 00:00:01.0
[hduser@Inceptez ~]$


---
--Import Table from SQL to HDFS with 1 mapper:
sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customerlm -m 1 --delete-target-dir ;

--Import Table from SQL to HDFS with multiple mappers:
sqoop import --connect jdbc:mysql://localhost/custdb --username root -P -table customerlm -m 3 \
--split-by custid --target-dir sqoop_import_lm --delete-target-dir --direct;

sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customerlm -m 3 \
--split-by city --append --fetch-size 100;

[hduser@Inceptez ~]$ hadoop fs -cat customerlm/*
20/09/22 09:11:40 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
cat: `customerlm/*': No such file or directory
[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customerlm -m 1 --delete-target-dir ;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/22 09:12:58 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/22 09:12:58 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/22 09:12:58 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/22 09:12:58 INFO tool.CodeGenTool: Beginning code generation
20/09/22 09:12:59 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/22 09:12:59 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/22 09:12:59 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/355bbd71fcfcf62fb91731b356811c1e/customerlm.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/22 09:13:02 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/355bbd71fcfcf62fb91731b356811c1e/customerlm.jar
20/09/22 09:13:03 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/22 09:13:05 INFO tool.ImportTool: Destination directory customerlm deleted.
20/09/22 09:13:05 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/09/22 09:13:05 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/09/22 09:13:05 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/09/22 09:13:05 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/09/22 09:13:05 INFO mapreduce.ImportJobBase: Beginning import of customerlm
20/09/22 09:13:05 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/22 09:13:05 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/22 09:13:05 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/22 09:13:12 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/22 09:13:12 INFO mapreduce.JobSubmitter: number of splits:1
20/09/22 09:13:13 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1600268300009_0023
20/09/22 09:13:14 INFO impl.YarnClientImpl: Submitted application application_1600268300009_0023
20/09/22 09:13:14 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1600268300009_0023/
20/09/22 09:13:14 INFO mapreduce.Job: Running job: job_1600268300009_0023
20/09/22 09:14:22 INFO mapreduce.Job: Job job_1600268300009_0023 running in uber mode : false
20/09/22 09:14:22 INFO mapreduce.Job:  map 0% reduce 0%
20/09/22 09:14:49 INFO mapreduce.Job:  map 100% reduce 0%
20/09/22 09:14:50 INFO mapreduce.Job: Job job_1600268300009_0023 completed successfully
20/09/22 09:14:50 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=133517
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=714
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=21273
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=21273
		Total vcore-seconds taken by all map tasks=21273
		Total megabyte-seconds taken by all map tasks=21783552
	Map-Reduce Framework
		Map input records=11
		Map output records=11
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=2540
		CPU time spent (ms)=4230
		Physical memory (bytes) snapshot=167972864
		Virtual memory (bytes) snapshot=2087174144
		Total committed heap usage (bytes)=106954752
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=714
20/09/22 09:14:50 INFO mapreduce.ImportJobBase: Transferred 714 bytes in 105.0823 seconds (6.7947 bytes/sec)
20/09/22 09:14:50 INFO mapreduce.ImportJobBase: Retrieved 11 records.
[hduser@Inceptez ~]$ hadoop fs -cat customerlm/*
20/09/22 09:15:17 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1,Arun,Kumar,chennai,33,2017-09-20,100000,2020-09-01 00:00:01.0
2,srini,vasan,chennai,33,2017-09-21,10000,2020-09-01 00:00:01.0
3,vasu,devan,banglore,39,2017-09-23,90000,2020-09-01 00:00:01.0
4,mohamed,imran,hyderabad,33,2017-09-24,1000,2020-09-01 00:00:01.0
5,arun,basker,chennai,23,2017-09-20,200000,2020-09-01 00:00:01.0
6,ramesh,babu,manglore,39,2017-09-21,100000,2020-09-01 00:00:01.0
7,inceptez,tech,Chennai,3,2017-09-28,10000,2020-09-01 00:00:01.0
8,Iz,tech,pune,4,2017-09-28,10000,2020-09-01 00:00:01.0
9,mohan,kumar,banglore,35,2017-09-29,500000,2020-09-01 00:00:01.0
10,mrithyun,mohan,banglore,5,2017-09-30,20000,2020-09-01 00:00:01.0
11,priyanga,mohan,banglore,30,2017-09-25,30000,2020-09-01 00:00:01.0
[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root -P -table customerlm -m 3 \
> --split-by custid --target-dir sqoop_import_lm --delete-target-dir --direct;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/22 11:43:47 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
Enter password: 
20/09/22 11:43:50 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/22 11:43:50 INFO tool.CodeGenTool: Beginning code generation
20/09/22 11:43:50 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/22 11:43:50 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/22 11:43:50 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/4ff941680ad603b1f987fb1adb2ec9e7/customerlm.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/22 11:43:52 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/4ff941680ad603b1f987fb1adb2ec9e7/customerlm.jar
20/09/22 11:43:53 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/22 11:43:54 INFO tool.ImportTool: Destination directory sqoop_import_lm is not present, hence not deleting.
20/09/22 11:43:54 INFO manager.DirectMySQLManager: Beginning mysqldump fast path import
20/09/22 11:43:54 INFO mapreduce.ImportJobBase: Beginning import of customerlm
20/09/22 11:43:54 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/22 11:43:54 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/22 11:43:54 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/22 11:44:00 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/22 11:44:00 INFO db.DataDrivenDBInputFormat: BoundingValsQuery: SELECT MIN(`custid`), MAX(`custid`) FROM customerlm
20/09/22 11:44:00 INFO mapreduce.JobSubmitter: number of splits:3
20/09/22 11:44:00 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1600268300009_0024
20/09/22 11:44:01 INFO impl.YarnClientImpl: Submitted application application_1600268300009_0024
20/09/22 11:44:01 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1600268300009_0024/
20/09/22 11:44:01 INFO mapreduce.Job: Running job: job_1600268300009_0024
20/09/22 11:44:17 INFO mapreduce.Job: Job job_1600268300009_0024 running in uber mode : false
20/09/22 11:44:17 INFO mapreduce.Job:  map 0% reduce 0%
20/09/22 11:46:03 INFO mapreduce.Job:  map 33% reduce 0%
20/09/22 11:46:06 INFO mapreduce.Job:  map 67% reduce 0%
20/09/22 11:46:07 INFO mapreduce.Job:  map 100% reduce 0%
20/09/22 11:46:07 INFO mapreduce.Job: Job job_1600268300009_0024 completed successfully
20/09/22 11:46:07 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=402072
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=320
		HDFS: Number of bytes written=692
		HDFS: Number of read operations=12
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=6
	Job Counters 
		Launched map tasks=3
		Other local map tasks=3
		Total time spent by all maps in occupied slots (ms)=314598
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=314598
		Total vcore-seconds taken by all map tasks=314598
		Total megabyte-seconds taken by all map tasks=322148352
	Map-Reduce Framework
		Map input records=3
		Map output records=11
		Input split bytes=320
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=81725
		CPU time spent (ms)=22050
		Physical memory (bytes) snapshot=502255616
		Virtual memory (bytes) snapshot=6257643520
		Total committed heap usage (bytes)=311951360
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=692
20/09/22 11:46:07 INFO mapreduce.ImportJobBase: Transferred 692 bytes in 132.8511 seconds (5.2088 bytes/sec)
20/09/22 11:46:07 INFO mapreduce.ImportJobBase: Retrieved 11 records.
[hduser@Inceptez ~]$ hadoop fs -cat customerlm/*
20/09/22 11:49:35 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1,Arun,Kumar,chennai,33,2017-09-20,100000,2020-09-01 00:00:01.0
2,srini,vasan,chennai,33,2017-09-21,10000,2020-09-01 00:00:01.0
3,vasu,devan,banglore,39,2017-09-23,90000,2020-09-01 00:00:01.0
4,mohamed,imran,hyderabad,33,2017-09-24,1000,2020-09-01 00:00:01.0
5,arun,basker,chennai,23,2017-09-20,200000,2020-09-01 00:00:01.0
6,ramesh,babu,manglore,39,2017-09-21,100000,2020-09-01 00:00:01.0
7,inceptez,tech,Chennai,3,2017-09-28,10000,2020-09-01 00:00:01.0
8,Iz,tech,pune,4,2017-09-28,10000,2020-09-01 00:00:01.0
9,mohan,kumar,banglore,35,2017-09-29,500000,2020-09-01 00:00:01.0
10,mrithyun,mohan,banglore,5,2017-09-30,20000,2020-09-01 00:00:01.0
11,priyanga,mohan,banglore,30,2017-09-25,30000,2020-09-01 00:00:01.0
[hduser@Inceptez ~]$ hadoop fs -cat sqoop_import_lm/*
20/09/22 11:55:20 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1,Arun,Kumar,chennai,33,2017-09-20,100000,2020-09-01 07:00:01
2,srini,vasan,chennai,33,2017-09-21,10000,2020-09-01 07:00:01
3,vasu,devan,banglore,39,2017-09-23,90000,2020-09-01 07:00:01
4,mohamed,imran,hyderabad,33,2017-09-24,1000,2020-09-01 07:00:01
5,arun,basker,chennai,23,2017-09-20,200000,2020-09-01 07:00:01
6,ramesh,babu,manglore,39,2017-09-21,100000,2020-09-01 07:00:01
7,inceptez,tech,Chennai,3,2017-09-28,10000,2020-09-01 07:00:01
8,Iz,tech,pune,4,2017-09-28,10000,2020-09-01 07:00:01
9,mohan,kumar,banglore,35,2017-09-29,500000,2020-09-01 07:00:01
10,mrithyun,mohan,banglore,5,2017-09-30,20000,2020-09-01 07:00:01
11,priyanga,mohan,banglore,30,2017-09-25,30000,2020-09-01 07:00:01
[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customer -m 3 \
> --
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/22 11:57:55 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/22 11:57:55 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/22 11:57:55 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/22 11:57:55 INFO tool.CodeGenTool: Beginning code generation
20/09/22 11:57:56 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/22 11:57:56 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/22 11:57:56 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/4bd08a42563fb8072b7dbb193b7b084c/customer.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/22 11:57:58 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/4bd08a42563fb8072b7dbb193b7b084c/customer.jar
20/09/22 11:57:58 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/09/22 11:57:58 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/09/22 11:57:58 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/09/22 11:57:58 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/09/22 11:57:58 ERROR tool.ImportTool: Error during import: No primary key could be found for table customer. Please specify one with --split-by or perform a sequential import with '-m 1'.
[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customerlm -m 3 \
> --split-by city --append --fetch-size 100;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/22 11:58:26 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/22 11:58:26 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/22 11:58:27 INFO manager.MySQLManager: Argument '--fetch-size 100' will probably get ignored by MySQL JDBC driver.
20/09/22 11:58:27 INFO tool.CodeGenTool: Beginning code generation
20/09/22 11:58:27 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/22 11:58:27 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/22 11:58:27 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/c646071bb267255b23d88f601f833a5a/customerlm.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/22 11:58:29 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/c646071bb267255b23d88f601f833a5a/customerlm.jar
20/09/22 11:58:29 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/09/22 11:58:29 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/09/22 11:58:29 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/09/22 11:58:29 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/09/22 11:58:29 INFO mapreduce.ImportJobBase: Beginning import of customerlm
20/09/22 11:58:29 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/22 11:58:29 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/22 11:58:31 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/22 11:58:31 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/22 11:58:34 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/22 11:58:34 INFO db.DataDrivenDBInputFormat: BoundingValsQuery: SELECT MIN(`city`), MAX(`city`) FROM `customerlm`
20/09/22 11:58:34 WARN db.TextSplitter: Generating splits for a textual index column.
20/09/22 11:58:34 WARN db.TextSplitter: If your database sorts in a case-insensitive order, this may result in a partial import or duplicate records.
20/09/22 11:58:34 WARN db.TextSplitter: You are strongly encouraged to choose an integral split column.
20/09/22 11:58:34 INFO mapreduce.JobSubmitter: number of splits:3
20/09/22 11:58:35 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1600268300009_0025
20/09/22 11:58:35 INFO impl.YarnClientImpl: Submitted application application_1600268300009_0025
20/09/22 11:58:36 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1600268300009_0025/
20/09/22 11:58:36 INFO mapreduce.Job: Running job: job_1600268300009_0025
20/09/22 11:58:44 INFO mapreduce.Job: Job job_1600268300009_0025 running in uber mode : false
20/09/22 11:58:44 INFO mapreduce.Job:  map 0% reduce 0%
20/09/22 11:59:20 INFO mapreduce.Job:  map 33% reduce 0%
20/09/22 11:59:23 INFO mapreduce.Job:  map 67% reduce 0%
20/09/22 11:59:25 INFO mapreduce.Job:  map 100% reduce 0%
20/09/22 11:59:26 INFO mapreduce.Job: Job job_1600268300009_0025 completed successfully
20/09/22 11:59:26 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=401079
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=413
		HDFS: Number of bytes written=714
		HDFS: Number of read operations=12
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=6
	Job Counters 
		Launched map tasks=3
		Other local map tasks=3
		Total time spent by all maps in occupied slots (ms)=104755
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=104755
		Total vcore-seconds taken by all map tasks=104755
		Total megabyte-seconds taken by all map tasks=107269120
	Map-Reduce Framework
		Map input records=11
		Map output records=11
		Input split bytes=413
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=37146
		CPU time spent (ms)=13350
		Physical memory (bytes) snapshot=488222720
		Virtual memory (bytes) snapshot=6256783360
		Total committed heap usage (bytes)=315621376
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=714
20/09/22 11:59:26 INFO mapreduce.ImportJobBase: Transferred 714 bytes in 55.7319 seconds (12.8113 bytes/sec)
20/09/22 11:59:26 INFO mapreduce.ImportJobBase: Retrieved 11 records.
20/09/22 11:59:26 INFO util.AppendUtils: Appending to directory customerlm
20/09/22 11:59:26 INFO util.AppendUtils: Using found partition 1
[hduser@Inceptez ~]$ hadoop fs -cat customerlm/*
20/09/22 11:59:47 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1,Arun,Kumar,chennai,33,2017-09-20,100000,2020-09-01 00:00:01.0
2,srini,vasan,chennai,33,2017-09-21,10000,2020-09-01 00:00:01.0
3,vasu,devan,banglore,39,2017-09-23,90000,2020-09-01 00:00:01.0
4,mohamed,imran,hyderabad,33,2017-09-24,1000,2020-09-01 00:00:01.0
5,arun,basker,chennai,23,2017-09-20,200000,2020-09-01 00:00:01.0
6,ramesh,babu,manglore,39,2017-09-21,100000,2020-09-01 00:00:01.0
7,inceptez,tech,Chennai,3,2017-09-28,10000,2020-09-01 00:00:01.0
8,Iz,tech,pune,4,2017-09-28,10000,2020-09-01 00:00:01.0
9,mohan,kumar,banglore,35,2017-09-29,500000,2020-09-01 00:00:01.0
10,mrithyun,mohan,banglore,5,2017-09-30,20000,2020-09-01 00:00:01.0
11,priyanga,mohan,banglore,30,2017-09-25,30000,2020-09-01 00:00:01.0
1,Arun,Kumar,chennai,33,2017-09-20,100000,2020-09-01 00:00:01.0
2,srini,vasan,chennai,33,2017-09-21,10000,2020-09-01 00:00:01.0
3,vasu,devan,banglore,39,2017-09-23,90000,2020-09-01 00:00:01.0
5,arun,basker,chennai,23,2017-09-20,200000,2020-09-01 00:00:01.0
7,inceptez,tech,Chennai,3,2017-09-28,10000,2020-09-01 00:00:01.0
9,mohan,kumar,banglore,35,2017-09-29,500000,2020-09-01 00:00:01.0
10,mrithyun,mohan,banglore,5,2017-09-30,20000,2020-09-01 00:00:01.0
11,priyanga,mohan,banglore,30,2017-09-25,30000,2020-09-01 00:00:01.0
4,mohamed,imran,hyderabad,33,2017-09-24,1000,2020-09-01 00:00:01.0
6,ramesh,babu,manglore,39,2017-09-21,100000,2020-09-01 00:00:01.0
8,Iz,tech,pune,4,2017-09-28,10000,2020-09-01 00:00:01.0

--## Now append existing data with current data against city.

[hduser@Inceptez ~]$ hadoop fs -cat sqoop_import_lm/*
20/09/22 12:00:23 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1,Arun,Kumar,chennai,33,2017-09-20,100000,2020-09-01 07:00:01
2,srini,vasan,chennai,33,2017-09-21,10000,2020-09-01 07:00:01
3,vasu,devan,banglore,39,2017-09-23,90000,2020-09-01 07:00:01
4,mohamed,imran,hyderabad,33,2017-09-24,1000,2020-09-01 07:00:01
5,arun,basker,chennai,23,2017-09-20,200000,2020-09-01 07:00:01
6,ramesh,babu,manglore,39,2017-09-21,100000,2020-09-01 07:00:01
7,inceptez,tech,Chennai,3,2017-09-28,10000,2020-09-01 07:00:01
8,Iz,tech,pune,4,2017-09-28,10000,2020-09-01 07:00:01
9,mohan,kumar,banglore,35,2017-09-29,500000,2020-09-01 07:00:01
10,mrithyun,mohan,banglore,5,2017-09-30,20000,2020-09-01 07:00:01
11,priyanga,mohan,banglore,30,2017-09-25,30000,2020-09-01 07:00:01
[hduser@Inceptez ~]$ 






--
--##Controlling Import:
--##Using Where condition:
sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root --table customer -m 1 --where "city ='banglore' or age>33" --target-dir filtered --delete-target-dir;

sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root --table customerlm -m 1 -- where "city ='banglore' or age > 33" \
--target-dir filtered_lm --delete-target-dir;

[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root --table customerlm -m 1 -- where "city ='banglore' or age > 33" \
> --target-dir filtered_lm --delete-target-dir;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/22 12:11:24 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/22 12:11:24 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/22 12:11:24 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/22 12:11:24 INFO tool.CodeGenTool: Beginning code generation
20/09/22 12:11:24 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/22 12:11:24 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/22 12:11:25 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/f2be68658f63594f36e579376b753501/customerlm.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/22 12:11:26 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/f2be68658f63594f36e579376b753501/customerlm.jar
20/09/22 12:11:27 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/09/22 12:11:27 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/09/22 12:11:27 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/09/22 12:11:27 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/09/22 12:11:27 INFO mapreduce.ImportJobBase: Beginning import of customerlm
20/09/22 12:11:27 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/22 12:11:27 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/22 12:11:28 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/22 12:11:28 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/22 12:11:28 ERROR tool.ImportTool: Encountered IOException running import job: org.apache.hadoop.mapred.FileAlreadyExistsException: Output directory hdfs://localhost:54310/user/hduser/customerlm already exists
	at org.apache.hadoop.mapreduce.lib.output.FileOutputFormat.checkOutputSpecs(FileOutputFormat.java:146)
	at org.apache.hadoop.mapreduce.JobSubmitter.checkSpecs(JobSubmitter.java:266)
	at org.apache.hadoop.mapreduce.JobSubmitter.submitJobInternal(JobSubmitter.java:139)
	at org.apache.hadoop.mapreduce.Job$10.run(Job.java:1290)
	at org.apache.hadoop.mapreduce.Job$10.run(Job.java:1287)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.mapreduce.Job.submit(Job.java:1287)
	at org.apache.hadoop.mapreduce.Job.waitForCompletion(Job.java:1308)
	at org.apache.sqoop.mapreduce.ImportJobBase.doSubmitJob(ImportJobBase.java:196)
	at org.apache.sqoop.mapreduce.ImportJobBase.runJob(ImportJobBase.java:169)
	at org.apache.sqoop.mapreduce.ImportJobBase.runImport(ImportJobBase.java:266)
	at org.apache.sqoop.manager.SqlManager.importTable(SqlManager.java:673)
	at org.apache.sqoop.manager.MySQLManager.importTable(MySQLManager.java:118)
	at org.apache.sqoop.tool.ImportTool.importTable(ImportTool.java:497)
	at org.apache.sqoop.tool.ImportTool.run(ImportTool.java:605)
	at org.apache.sqoop.Sqoop.run(Sqoop.java:143)
	at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:70)
	at org.apache.sqoop.Sqoop.runSqoop(Sqoop.java:179)
	at org.apache.sqoop.Sqoop.runTool(Sqoop.java:218)
	at org.apache.sqoop.Sqoop.runTool(Sqoop.java:227)
	at org.apache.sqoop.Sqoop.main(Sqoop.java:236)

[hduser@Inceptez ~]$

--Created new table customerlm1 and running where clause on top of the data and store to hdfs location as filtered_lm

sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root --table customerlm1 -m 1 --where "city ='banglore' or age > 33" --target-dir filtered_lm --delete-target-dir;


mysql> create table customerlm1 as select * from customerlm;
Query OK, 11 rows affected (0.23 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> select * from customerlm1;
+--------+-----------+----------+-----------+------+------------+-------------+---------------------+
| custid | firstname | lastname | city      | age  | createdt   | transactamt | create_updts        |
+--------+-----------+----------+-----------+------+------------+-------------+---------------------+
|      1 | Arun      | Kumar    | chennai   |   33 | 2017-09-20 |      100000 | 2020-09-01 00:00:01 |
|      2 | srini     | vasan    | chennai   |   33 | 2017-09-21 |       10000 | 2020-09-01 00:00:01 |
|      3 | vasu      | devan    | banglore  |   39 | 2017-09-23 |       90000 | 2020-09-01 00:00:01 |
|      4 | mohamed   | imran    | hyderabad |   33 | 2017-09-24 |        1000 | 2020-09-01 00:00:01 |
|      5 | arun      | basker   | chennai   |   23 | 2017-09-20 |      200000 | 2020-09-01 00:00:01 |
|      6 | ramesh    | babu     | manglore  |   39 | 2017-09-21 |      100000 | 2020-09-01 00:00:01 |
|      7 | inceptez  | tech     | Chennai   |    3 | 2017-09-28 |       10000 | 2020-09-01 00:00:01 |
|      8 | Iz        | tech     | pune      |    4 | 2017-09-28 |       10000 | 2020-09-01 00:00:01 |
|      9 | mohan     | kumar    | banglore  |   35 | 2017-09-29 |      500000 | 2020-09-01 00:00:01 |
|     10 | mrithyun  | mohan    | banglore  |    5 | 2017-09-30 |       20000 | 2020-09-01 00:00:01 |
|     11 | priyanga  | mohan    | banglore  |   30 | 2017-09-25 |       30000 | 2020-09-01 00:00:01 |
+--------+-----------+----------+-----------+------+------------+-------------+---------------------+
11 rows in set (0.00 sec)

mysql>

[hduser@Inceptez ~]$ hadoop fs -rmr  customerlm1
rmr: DEPRECATED: Please use 'rm -r' instead.
20/09/22 12:38:48 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/22 12:38:49 INFO fs.TrashPolicyDefault: Namenode trash configuration: Deletion interval = 0 minutes, Emptier interval = 0 minutes.
Deleted customerlm1

[hduser@Inceptez ~]$ hadoop fs -rmr  filtered_lm
rmr: DEPRECATED: Please use 'rm -r' instead.
20/09/22 12:39:47 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/22 12:39:48 INFO fs.TrashPolicyDefault: Namenode trash configuration: Deletion interval = 0 minutes, Emptier interval = 0 minutes.
Deleted filtered_lm
[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root --table customerlm1 -m 1 --where "city ='banglore' or age > 33" --target-dir filtered_lm --delete-target-dir;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/22 12:43:04 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/22 12:43:04 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/22 12:43:04 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/22 12:43:04 INFO tool.CodeGenTool: Beginning code generation
20/09/22 12:43:04 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm1` AS t LIMIT 1
20/09/22 12:43:04 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm1` AS t LIMIT 1
20/09/22 12:43:05 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/ab8d54a183a6bd0abb33b5e5f26d9351/customerlm1.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/22 12:43:07 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/ab8d54a183a6bd0abb33b5e5f26d9351/customerlm1.jar
20/09/22 12:43:07 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/22 12:43:08 INFO tool.ImportTool: Destination directory filtered_lm is not present, hence not deleting.
20/09/22 12:43:08 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/09/22 12:43:08 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/09/22 12:43:08 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/09/22 12:43:08 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/09/22 12:43:08 INFO mapreduce.ImportJobBase: Beginning import of customerlm1
20/09/22 12:43:08 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/22 12:43:08 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/22 12:43:08 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/22 12:43:14 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/22 12:43:14 INFO mapreduce.JobSubmitter: number of splits:1
20/09/22 12:43:14 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1600803765037_0001
20/09/22 12:43:16 INFO impl.YarnClientImpl: Submitted application application_1600803765037_0001
20/09/22 12:43:16 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1600803765037_0001/
20/09/22 12:43:16 INFO mapreduce.Job: Running job: job_1600803765037_0001
20/09/22 12:43:59 INFO mapreduce.Job: Job job_1600803765037_0001 running in uber mode : false
20/09/22 12:43:59 INFO mapreduce.Job:  map 0% reduce 0%
20/09/22 12:44:41 INFO mapreduce.Job:  map 100% reduce 0%
20/09/22 12:44:41 INFO mapreduce.Job: Job job_1600803765037_0001 completed successfully
20/09/22 12:44:41 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=133693
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=333
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=21902
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=21902
		Total vcore-seconds taken by all map tasks=21902
		Total megabyte-seconds taken by all map tasks=22427648
	Map-Reduce Framework
		Map input records=5
		Map output records=5
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=166
		CPU time spent (ms)=1590
		Physical memory (bytes) snapshot=158650368
		Virtual memory (bytes) snapshot=2079719424
		Total committed heap usage (bytes)=94896128
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=333
20/09/22 12:44:41 INFO mapreduce.ImportJobBase: Transferred 333 bytes in 92.689 seconds (3.5927 bytes/sec)
20/09/22 12:44:41 INFO mapreduce.ImportJobBase: Retrieved 5 records.
[hduser@Inceptez ~]$ hadoop fs -cat filtered_lm/*
20/09/22 12:47:01 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
3,vasu,devan,banglore,39,2017-09-23,90000,2020-09-01 00:00:01.0
6,ramesh,babu,manglore,39,2017-09-21,100000,2020-09-01 00:00:01.0
9,mohan,kumar,banglore,35,2017-09-29,500000,2020-09-01 00:00:01.0
10,mrithyun,mohan,banglore,5,2017-09-30,20000,2020-09-01 00:00:01.0
11,priyanga,mohan,banglore,30,2017-09-25,30000,2020-09-01 00:00:01.0
[hduser@Inceptez ~]$ hadoop fs -cat customerlm1/*
20/09/22 12:47:19 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
cat: `customerlm1/*': No such file or directory
[hduser@Inceptez ~]$


--##Using free form query:
sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root --query " select custid,age,transactamt from customer where (city ='banglore' or age>33) and \$CONDITIONS " --target-dir filtered --delete-target-dir -m 2 --split-by custid;

sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root --query " select custid, age, transactamt from customerlm where (city='banglore' or age>33) and \$CONDITIONS " --target-dir filtered_ff --delete-target-dir -m 2 --split-by custid;

[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root --query " select custid, age, transactamt from customerlm where (city='banglore' or age>33) and \$CONDITIONS " --target-dir filtered_ff --delete-target-dir -m 2 --split-by custid;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/22 12:54:22 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/22 12:54:22 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/22 12:54:22 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/22 12:54:22 INFO tool.CodeGenTool: Beginning code generation
20/09/22 12:54:22 INFO manager.SqlManager: Executing SQL statement:  select custid, age, transactamt from customerlm where (city='banglore' or age>33) and  (1 = 0)  
20/09/22 12:54:22 INFO manager.SqlManager: Executing SQL statement:  select custid, age, transactamt from customerlm where (city='banglore' or age>33) and  (1 = 0)  
20/09/22 12:54:22 INFO manager.SqlManager: Executing SQL statement:  select custid, age, transactamt from customerlm where (city='banglore' or age>33) and  (1 = 0)  
20/09/22 12:54:22 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/0297c8f0fb9a5ad00be238bca3590866/QueryResult.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/22 12:54:24 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/0297c8f0fb9a5ad00be238bca3590866/QueryResult.jar
20/09/22 12:54:25 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/22 12:54:26 INFO tool.ImportTool: Destination directory filtered_ff is not present, hence not deleting.
20/09/22 12:54:26 INFO mapreduce.ImportJobBase: Beginning query import.
20/09/22 12:54:26 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/22 12:54:26 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/22 12:54:26 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/22 12:54:28 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/22 12:54:28 INFO db.DataDrivenDBInputFormat: BoundingValsQuery: SELECT MIN(custid), MAX(custid) FROM ( select custid, age, transactamt from customerlm where (city='banglore' or age>33) and  (1 = 1)  ) AS t1
20/09/22 12:54:28 INFO mapreduce.JobSubmitter: number of splits:2
20/09/22 12:54:29 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1600803765037_0002
20/09/22 12:54:29 INFO impl.YarnClientImpl: Submitted application application_1600803765037_0002
20/09/22 12:54:29 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1600803765037_0002/
20/09/22 12:54:29 INFO mapreduce.Job: Running job: job_1600803765037_0002
20/09/22 12:54:39 INFO mapreduce.Job: Job job_1600803765037_0002 running in uber mode : false
20/09/22 12:54:39 INFO mapreduce.Job:  map 0% reduce 0%
20/09/22 12:54:50 INFO mapreduce.Job:  map 50% reduce 0%
20/09/22 12:54:52 INFO mapreduce.Job:  map 100% reduce 0%
20/09/22 12:54:52 INFO mapreduce.Job: Job job_1600803765037_0002 completed successfully
20/09/22 12:54:52 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=267550
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=206
		HDFS: Number of bytes written=58
		HDFS: Number of read operations=8
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=4
	Job Counters 
		Launched map tasks=2
		Other local map tasks=2
		Total time spent by all maps in occupied slots (ms)=18673
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=18673
		Total vcore-seconds taken by all map tasks=18673
		Total megabyte-seconds taken by all map tasks=19121152
	Map-Reduce Framework
		Map input records=5
		Map output records=5
		Input split bytes=206
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=1134
		CPU time spent (ms)=2460
		Physical memory (bytes) snapshot=332763136
		Virtual memory (bytes) snapshot=4172697600
		Total committed heap usage (bytes)=218103808
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=58
20/09/22 12:54:52 INFO mapreduce.ImportJobBase: Transferred 58 bytes in 26.4279 seconds (2.1946 bytes/sec)
20/09/22 12:54:52 INFO mapreduce.ImportJobBase: Retrieved 5 records.
[hduser@Inceptez ~]$ hadoop fs -cat filtered_ff/*
20/09/22 12:56:30 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
3,39,90000
6,39,100000
9,35,500000
10,5,20000
11,30,30000
[hduser@Inceptez ~]$ 


---
mysql> select * from customer;
+--------+-----------+----------+-----------+------+------------+-------------+
| custid | firstname | lastname | city      | age  | createdt   | transactamt |
+--------+-----------+----------+-----------+------+------------+-------------+
|      1 | Arun      | Kumar    | chennai   |   33 | 2017-09-20 |      100000 |
|      2 | srini     | vasan    | chennai   |   33 | 2017-09-21 |       10000 |
|      3 | vasu      | devan    | banglore  |   39 | 2017-09-23 |       90000 |
|      4 | mohamed   | imran    | hyderabad |   33 | 2017-09-24 |        1000 |
|      5 | arun      | basker   | chennai   |   23 | 2017-09-20 |      200000 |
|      6 | ramesh    | babu     | manglore  |   39 | 2017-09-21 |      100000 |
|      7 | inceptez  | tech     | Chennai   |    3 | 2017-09-28 |       10000 |
|      8 | Iz        | tech     | pune      |    4 | 2017-09-28 |       10000 |
|      9 | mohan     | kumar    | banglore  |   35 | 2017-09-29 |      500000 |
+--------+-----------+----------+-----------+------+------------+-------------+
9 rows in set (0.00 sec)

mysql> 


--##Incremental import:
--##Execute the below insert in mysql
insert into customer values(10,'Mrityunjay','Mohankumar','Skhalli',3,'2015-05-25',10000);

mysql> insert into customer values(10,'Mrityunjay','Mohankumar','Skhalli',3,'2015-05-25',10000);
Query OK, 1 row affected (0.06 sec)

mysql> select * from customer;
+--------+------------+------------+-----------+------+------------+-------------+
| custid | firstname  | lastname   | city      | age  | createdt   | transactamt |
+--------+------------+------------+-----------+------+------------+-------------+
|      1 | Arun       | Kumar      | chennai   |   33 | 2017-09-20 |      100000 |
|      2 | srini      | vasan      | chennai   |   33 | 2017-09-21 |       10000 |
|      3 | vasu       | devan      | banglore  |   39 | 2017-09-23 |       90000 |
|      4 | mohamed    | imran      | hyderabad |   33 | 2017-09-24 |        1000 |
|      5 | arun       | basker     | chennai   |   23 | 2017-09-20 |      200000 |
|      6 | ramesh     | babu       | manglore  |   39 | 2017-09-21 |      100000 |
|      7 | inceptez   | tech       | Chennai   |    3 | 2017-09-28 |       10000 |
|      8 | Iz         | tech       | pune      |    4 | 2017-09-28 |       10000 |
|      9 | mohan      | kumar      | banglore  |   35 | 2017-09-29 |      500000 |
|     10 | Mrityunjay | Mohankumar | Skhalli   |    3 | 2015-05-25 |       10000 |
+--------+------------+------------+-----------+------+------------+-------------+
10 rows in set (0.00 sec)

mysql>

--##sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customer -m 1 --target-dir incrimport --incremental append --check-column custid --last-value 6;

sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customer -m 1 --target-dir increment_import --incremental append --check-column custid --last-value 9; 

[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customer -m 1 --target-dir increment_import --incremental append --check-column custid --last-value 9; 
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/22 13:12:08 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/22 13:12:08 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/22 13:12:08 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/22 13:12:08 INFO tool.CodeGenTool: Beginning code generation
20/09/22 13:12:09 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/22 13:12:09 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/22 13:12:09 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/75fab6b73727648af6cc03147ba47800/customer.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/22 13:12:11 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/75fab6b73727648af6cc03147ba47800/customer.jar
20/09/22 13:12:11 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/22 13:12:12 INFO tool.ImportTool: Maximal id query for free form incremental import: SELECT MAX(`custid`) FROM `customer`
20/09/22 13:12:12 INFO tool.ImportTool: Incremental import based on column `custid`
20/09/22 13:12:12 INFO tool.ImportTool: Lower bound value: 9
20/09/22 13:12:12 INFO tool.ImportTool: Upper bound value: 10
20/09/22 13:12:12 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/09/22 13:12:12 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/09/22 13:12:12 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/09/22 13:12:12 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/09/22 13:12:12 INFO mapreduce.ImportJobBase: Beginning import of customer
20/09/22 13:12:12 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/22 13:12:12 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/22 13:12:12 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/22 13:12:15 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/22 13:12:15 INFO mapreduce.JobSubmitter: number of splits:1
20/09/22 13:12:15 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1600803765037_0003
20/09/22 13:12:16 INFO impl.YarnClientImpl: Submitted application application_1600803765037_0003
20/09/22 13:12:16 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1600803765037_0003/
20/09/22 13:12:16 INFO mapreduce.Job: Running job: job_1600803765037_0003
20/09/22 13:12:24 INFO mapreduce.Job: Job job_1600803765037_0003 running in uber mode : false
20/09/22 13:12:24 INFO mapreduce.Job:  map 0% reduce 0%
20/09/22 13:12:33 INFO mapreduce.Job:  map 100% reduce 0%
20/09/22 13:12:33 INFO mapreduce.Job: Job job_1600803765037_0003 completed successfully
20/09/22 13:12:33 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=133712
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=52
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=5210
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=5210
		Total vcore-seconds taken by all map tasks=5210
		Total megabyte-seconds taken by all map tasks=5335040
	Map-Reduce Framework
		Map input records=1
		Map output records=1
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=364
		CPU time spent (ms)=1870
		Physical memory (bytes) snapshot=171831296
		Virtual memory (bytes) snapshot=2085699584
		Total committed heap usage (bytes)=111673344
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=52
20/09/22 13:12:33 INFO mapreduce.ImportJobBase: Transferred 52 bytes in 20.9324 seconds (2.4842 bytes/sec)
20/09/22 13:12:33 INFO mapreduce.ImportJobBase: Retrieved 1 records.
20/09/22 13:12:33 INFO util.AppendUtils: Creating missing output directory - increment_import
20/09/22 13:12:33 INFO tool.ImportTool: Incremental import complete! To run another incremental import of all data following this import, supply the following arguments:
20/09/22 13:12:33 INFO tool.ImportTool:  --incremental append
20/09/22 13:12:33 INFO tool.ImportTool:   --check-column custid
20/09/22 13:12:33 INFO tool.ImportTool:   --last-value 10
20/09/22 13:12:33 INFO tool.ImportTool: (Consider saving this with 'sqoop job --create')
[hduser@Inceptez ~]$ hadoop fs -cat increment_import/*
20/09/22 13:13:08 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
10,Mrityunjay,Mohankumar,Skhalli,3,2015-05-25,10000
[hduser@Inceptez ~]$

--##Whether the below import works?
sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customer -m 1 \
 --target-dir incrimport --incremental append --check-column city --last-value 'pune';

sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customer -m 1 --target-dir increment_import \
--incremental append --check-column city --last-value 'pune';

[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root -table customer -m 1 --target-dir increment_import \
> --incremental append --check-column city --last-value 'pune';
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/22 13:20:48 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/22 13:20:48 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/22 13:20:49 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/22 13:20:49 INFO tool.CodeGenTool: Beginning code generation
20/09/22 13:20:49 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/22 13:20:49 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/22 13:20:49 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/0f68f87f168e730faa8a4a8b390bd933/customer.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/22 13:20:51 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/0f68f87f168e730faa8a4a8b390bd933/customer.jar
20/09/22 13:20:51 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/22 13:20:52 INFO tool.ImportTool: Maximal id query for free form incremental import: SELECT MAX(`city`) FROM `customer`
20/09/22 13:20:52 ERROR tool.ImportTool: Error during import: Character column (city) can not be used to determine which rows to incrementally import.
[hduser@Inceptez ~]$


--##Working with Saved Jobs:
sqoop job --create myjob1 -- import --connect jdbc:mysql://localhost/custdb --username root --password root --table customer --target-dir savedjob --delete-target-dir -m 1

sqoop job --create myjob3 --import --connect jdbc:mysql://localhost/custdb --username root --password root --table customerlm --target-dir savedjob3 --delete-target-dir -m 1;

[hduser@Inceptez ~]$ sqoop job --create myjob3 -- import --connect jdbc:mysql://localhost/custdb --username root --password root --table customerlm --target-dir savedjob3 --delete-target-dir -m 1;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/23 10:02:22 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/23 10:02:23 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
[hduser@Inceptez ~]$ 



--##list saved jobs:
sqoop job -list
sqoop job --exec myjob3
password:root

[hduser@Inceptez ~]$ sqoop job --exec myjob3
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/23 10:09:00 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
Enter password: 
20/09/23 10:09:04 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/23 10:09:04 INFO tool.CodeGenTool: Beginning code generation
20/09/23 10:09:04 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/23 10:09:04 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/23 10:09:04 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/7e9dc5a945b8e81536172a033fdc90c2/customerlm.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/23 10:09:06 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/7e9dc5a945b8e81536172a033fdc90c2/customerlm.jar
20/09/23 10:09:06 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/23 10:09:07 INFO tool.ImportTool: Destination directory savedjob3 is not present, hence not deleting.
20/09/23 10:09:07 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/09/23 10:09:07 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/09/23 10:09:07 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/09/23 10:09:07 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/09/23 10:09:07 INFO mapreduce.ImportJobBase: Beginning import of customerlm
20/09/23 10:09:07 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/23 10:09:07 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/23 10:09:07 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/23 10:09:09 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/23 10:09:10 INFO mapreduce.JobSubmitter: number of splits:1
20/09/23 10:09:10 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1600877101297_0002
20/09/23 10:09:11 INFO impl.YarnClientImpl: Submitted application application_1600877101297_0002
20/09/23 10:09:11 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1600877101297_0002/
20/09/23 10:09:11 INFO mapreduce.Job: Running job: job_1600877101297_0002
20/09/23 10:09:25 INFO mapreduce.Job: Job job_1600877101297_0002 running in uber mode : false
20/09/23 10:09:25 INFO mapreduce.Job:  map 0% reduce 0%
20/09/23 10:09:34 INFO mapreduce.Job:  map 100% reduce 0%
20/09/23 10:09:34 INFO mapreduce.Job: Job job_1600877101297_0002 completed successfully
20/09/23 10:09:34 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=133772
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=714
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=6159
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=6159
		Total vcore-seconds taken by all map tasks=6159
		Total megabyte-seconds taken by all map tasks=6306816
	Map-Reduce Framework
		Map input records=11
		Map output records=11
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=662
		CPU time spent (ms)=1500
		Physical memory (bytes) snapshot=170483712
		Virtual memory (bytes) snapshot=2085740544
		Total committed heap usage (bytes)=109576192
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=714
20/09/23 10:09:34 INFO mapreduce.ImportJobBase: Transferred 714 bytes in 26.7903 seconds (26.6514 bytes/sec)
20/09/23 10:09:34 INFO mapreduce.ImportJobBase: Retrieved 11 records.
[hduser@Inceptez ~]$ hadoop fs -cat savedjob3/*
20/09/23 10:12:28 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1,Arun,Kumar,chennai,33,2017-09-20,100000,2020-09-01 00:00:01.0
2,srini,vasan,chennai,33,2017-09-21,10000,2020-09-01 00:00:01.0
3,vasu,devan,banglore,39,2017-09-23,90000,2020-09-01 00:00:01.0
4,mohamed,imran,hyderabad,33,2017-09-24,1000,2020-09-01 00:00:01.0
5,arun,basker,chennai,23,2017-09-20,200000,2020-09-01 00:00:01.0
6,ramesh,babu,manglore,39,2017-09-21,100000,2020-09-01 00:00:01.0
7,inceptez,tech,Chennai,3,2017-09-28,10000,2020-09-01 00:00:01.0
8,Iz,tech,pune,4,2017-09-28,10000,2020-09-01 00:00:01.0
9,mohan,kumar,banglore,35,2017-09-29,500000,2020-09-01 00:00:01.0
10,mrithyun,mohan,banglore,5,2017-09-30,20000,2020-09-01 00:00:01.0
11,priyanga,mohan,banglore,30,2017-09-25,30000,2020-09-01 00:00:01.0
[hduser@Inceptez ~]$

[hduser@Inceptez ~]$ sqoop job -list
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/23 10:15:59 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
Available jobs:
  myjob1
  myjob2
  myjob3
[hduser@Inceptez ~]$ sqoop job -show myjob3
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/23 10:16:34 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
Enter password: 
Job: myjob3
Tool: import
Options:
----------------------------
verbose = false
db.connect.string = jdbc:mysql://localhost/custdb
codegen.output.delimiters.escape = 0
codegen.output.delimiters.enclose.required = false
codegen.input.delimiters.field = 0
hbase.create.table = false
db.require.password = true
hdfs.append.dir = false
db.table = customerlm
codegen.input.delimiters.escape = 0
import.fetch.size = null
accumulo.create.table = false
codegen.input.delimiters.enclose.required = false
db.username = root
reset.onemapper = false
codegen.output.delimiters.record = 10
import.max.inline.lob.size = 16777216
hbase.bulk.load.enabled = false
hcatalog.create.table = false
db.clear.staging.table = false
codegen.input.delimiters.record = 0
enable.compression = false
hive.overwrite.table = false
hive.import = false
codegen.input.delimiters.enclose = 0
accumulo.batch.size = 10240000
hive.drop.delims = false
codegen.output.delimiters.enclose = 0
hdfs.delete-target.dir = true
codegen.output.dir = .
codegen.auto.compile.dir = true
relaxed.isolation = false
mapreduce.num.mappers = 1
accumulo.max.latency = 5000
import.direct.split.size = 0
codegen.output.delimiters.field = 44
export.new.update = UpdateOnly
incremental.mode = None
hdfs.file.format = TextFile
codegen.compile.dir = /tmp/sqoop-hduser/compile/9beb55b0c952599e27eed16028e876c8
direct.import = false
hdfs.target.dir = savedjob3
hive.fail.table.exists = false
db.batch = false
[hduser@Inceptez ~]$ 


--##Incremental Saved Jobs:
sqoop job --create myjob2 -- import --connect jdbc:mysql://localhost/custdb --username root --password root --table customer --target-dir savedjob1 --m 1 --incremental append --check-column custid --last-value 0

sqoop job --exec myjob2
Passwod : root

sqoop job --create myjob4 --import --connect jdbc:mysql://localhost/custdb --username root --password root --table customerlm --target-dir savedjob4 \
-m 1 --incremental append --check-column custid --last-value 11;

[hduser@Inceptez ~]$ sqoop job --create myjob4 --import --connect jdbc:mysql://localhost/custdb --username root --password root --table customerlm --target-dir savedjob4 \
> -m 1 --incremental append --check-column custid --last-value 0;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/23 10:35:46 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Error parsing arguments for job:
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: --import
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: --connect
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: jdbc:mysql://localhost/custdb
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: --username
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: root
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: --password
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: root
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: --table
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: customerlm
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: --target-dir
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: savedjob4
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: -m
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: 1
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: --incremental
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: append
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: --check-column
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: custid
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: --last-value
20/09/23 10:35:46 ERROR tool.BaseSqoopTool: Unrecognized argument: 0

Try --help for usage instructions.
[hduser@Inceptez ~]$ 

--##Insert the below row into mysql:
insert into customer values (12,'Welcome','Inceptez','pune',4,'2017-09-28',10000);
--##Execute once again the same job, now only newly added custid 8 will be imported:
sqoop job --exec myjob2
sqoop job --delete myjob2
--##Update the job:
sqoop job --create myjob4 -- import --connect jdbc:mysql://localhost/custdb --username root --password root --table customerlm --target-dir savedjob4 --m 1 --incremental append --check-column custid --last-value 11;

[hduser@Inceptez ~]$ sqoop job --create myjob4 -- import --connect jdbc:mysql://localhost/custdb --username root --password root --table customerlm --target-dir savedjob4 --m 1 --incremental append --check-column custid --last-value 11;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/23 11:08:19 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/23 11:08:20 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
[hduser@Inceptez ~]$

mysql> select * from customerlm;
+--------+-----------+----------+-----------+------+------------+-------------+---------------------+
| custid | firstname | lastname | city      | age  | createdt   | transactamt | create_updts        |
+--------+-----------+----------+-----------+------+------------+-------------+---------------------+
|      1 | Arun      | Kumar    | chennai   |   33 | 2017-09-20 |      100000 | 2020-09-01 00:00:01 |
|      2 | srini     | vasan    | chennai   |   33 | 2017-09-21 |       10000 | 2020-09-01 00:00:01 |
|      3 | vasu      | devan    | banglore  |   39 | 2017-09-23 |       90000 | 2020-09-01 00:00:01 |
|      4 | mohamed   | imran    | hyderabad |   33 | 2017-09-24 |        1000 | 2020-09-01 00:00:01 |
|      5 | arun      | basker   | chennai   |   23 | 2017-09-20 |      200000 | 2020-09-01 00:00:01 |
|      6 | ramesh    | babu     | manglore  |   39 | 2017-09-21 |      100000 | 2020-09-01 00:00:01 |
|      7 | inceptez  | tech     | Chennai   |    3 | 2017-09-28 |       10000 | 2020-09-01 00:00:01 |
|      8 | Iz        | tech     | pune      |    4 | 2017-09-28 |       10000 | 2020-09-01 00:00:01 |
|      9 | mohan     | kumar    | banglore  |   35 | 2017-09-29 |      500000 | 2020-09-01 00:00:01 |
|     10 | mrithyun  | mohan    | banglore  |    5 | 2017-09-30 |       20000 | 2020-09-01 00:00:01 |
|     11 | priyanga  | mohan    | banglore  |   30 | 2017-09-25 |       30000 | 2020-09-01 00:00:01 |
+--------+-----------+----------+-----------+------+------------+-------------+---------------------+
11 rows in set (0.00 sec)

mysql> 

mysql> insert into customerlm values (12,'Welcome','Inceptez','banglore',4,'2017-09-28',10000,'2020-09-01 00:00:01');
Query OK, 1 row affected (0.00 sec)

mysql>

[hduser@Inceptez .sqoop]$ sqoop job --show myjob4
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/23 11:13:33 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
Enter password: 
Job: myjob4
Tool: import
Options:
----------------------------
verbose = false
incremental.last.value = 11
db.connect.string = jdbc:mysql://localhost/custdb
codegen.output.delimiters.escape = 0
codegen.output.delimiters.enclose.required = false
codegen.input.delimiters.field = 0
hbase.create.table = false
db.require.password = true
hdfs.append.dir = true
db.table = customerlm
codegen.input.delimiters.escape = 0
import.fetch.size = null
accumulo.create.table = false
codegen.input.delimiters.enclose.required = false
db.username = root
reset.onemapper = false
codegen.output.delimiters.record = 10
import.max.inline.lob.size = 16777216
hbase.bulk.load.enabled = false
hcatalog.create.table = false
db.clear.staging.table = false
incremental.col = custid
codegen.input.delimiters.record = 0
enable.compression = false
hive.overwrite.table = false
hive.import = false
codegen.input.delimiters.enclose = 0
accumulo.batch.size = 10240000
hive.drop.delims = false
codegen.output.delimiters.enclose = 0
hdfs.delete-target.dir = false
codegen.output.dir = .
codegen.auto.compile.dir = true
relaxed.isolation = false
mapreduce.num.mappers = 1
accumulo.max.latency = 5000
import.direct.split.size = 0
codegen.output.delimiters.field = 44
export.new.update = UpdateOnly
incremental.mode = AppendRows
hdfs.file.format = TextFile
codegen.compile.dir = /tmp/sqoop-hduser/compile/8bfdb5d92ba8d786c1502a31f0634318
direct.import = false
hdfs.target.dir = savedjob4
hive.fail.table.exists = false
db.batch = false
[hduser@Inceptez .sqoop]$

--##Execute once again the job, now custid from 12 will be imported:
sqoop job --exec myjob4

[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ sqoop job --exec myjob4
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/23 11:14:55 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
Enter password: 
20/09/23 11:14:59 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/23 11:14:59 INFO tool.CodeGenTool: Beginning code generation
20/09/23 11:14:59 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/23 11:15:00 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm` AS t LIMIT 1
20/09/23 11:15:00 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/a9e25f49ac69bd1fc86f1007c343fc2b/customerlm.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/23 11:15:01 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/a9e25f49ac69bd1fc86f1007c343fc2b/customerlm.jar
20/09/23 11:15:02 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/23 11:15:02 INFO tool.ImportTool: Maximal id query for free form incremental import: SELECT MAX(`custid`) FROM `customerlm`
20/09/23 11:15:02 INFO tool.ImportTool: Incremental import based on column `custid`
20/09/23 11:15:02 INFO tool.ImportTool: Lower bound value: 11
20/09/23 11:15:02 INFO tool.ImportTool: Upper bound value: 12
20/09/23 11:15:02 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/09/23 11:15:02 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/09/23 11:15:02 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/09/23 11:15:02 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/09/23 11:15:02 INFO mapreduce.ImportJobBase: Beginning import of customerlm
20/09/23 11:15:02 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/23 11:15:02 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/23 11:15:03 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/23 11:15:06 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/23 11:15:06 INFO mapreduce.JobSubmitter: number of splits:1
20/09/23 11:15:06 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1600877101297_0005
20/09/23 11:15:07 INFO impl.YarnClientImpl: Submitted application application_1600877101297_0005
20/09/23 11:15:07 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1600877101297_0005/
20/09/23 11:15:07 INFO mapreduce.Job: Running job: job_1600877101297_0005
20/09/23 11:15:20 INFO mapreduce.Job: Job job_1600877101297_0005 running in uber mode : false
20/09/23 11:15:20 INFO mapreduce.Job:  map 0% reduce 0%
20/09/23 11:15:30 INFO mapreduce.Job:  map 100% reduce 0%
20/09/23 11:15:31 INFO mapreduce.Job: Job job_1600877101297_0005 completed successfully
20/09/23 11:15:31 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=133988
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=70
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=7705
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=7705
		Total vcore-seconds taken by all map tasks=7705
		Total megabyte-seconds taken by all map tasks=7889920
	Map-Reduce Framework
		Map input records=1
		Map output records=1
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=689
		CPU time spent (ms)=2230
		Physical memory (bytes) snapshot=171855872
		Virtual memory (bytes) snapshot=2086543360
		Total committed heap usage (bytes)=109576192
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=70
20/09/23 11:15:31 INFO mapreduce.ImportJobBase: Transferred 70 bytes in 28.5846 seconds (2.4489 bytes/sec)
20/09/23 11:15:31 INFO mapreduce.ImportJobBase: Retrieved 1 records.
20/09/23 11:15:31 INFO util.AppendUtils: Creating missing output directory - savedjob4
20/09/23 11:15:31 INFO tool.ImportTool: Saving incremental import state to the metastore
20/09/23 11:15:31 INFO tool.ImportTool: Updated data for job: myjob4
[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ hadoop fs -cat savedjob4/*
20/09/23 11:16:28 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
12,Welcome,Inceptez,banglore,4,2017-09-28,10000,2020-09-01 00:00:01.0
[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ sqoop job --show myjob4
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/23 11:16:58 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
Enter password: 
Job: myjob4
Tool: import
Options:
----------------------------
verbose = false
incremental.last.value = 12
db.connect.string = jdbc:mysql://localhost/custdb

--##Export from HDFS to SQL:
--##Create table in MYSQL before running this command
--##CREATE TABLE customer_hdfs (custid INT,firstname VARCHAR(20),lastname VARCHAR(20),city varchar(50),age int,createdt date,transactamt int );
mysql> 
mysql> CREATE TABLE customer_hdfs1 (custid INT,firstname VARCHAR(20),lastname VARCHAR(20),city varchar(50),age int,createdt date,transactamt int );
Query OK, 0 rows affected (0.01 sec)

mysql> select * from customer_hdfs1;
Empty set (0.00 sec)

mysql>

--##sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs1 --export-dir savedjob2;

[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs1 --export-dir savedjob2;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/27 14:24:21 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/27 14:24:21 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/27 14:24:21 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/27 14:24:21 INFO tool.CodeGenTool: Beginning code generation
20/09/27 14:24:22 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_hdfs1` AS t LIMIT 1
20/09/27 14:24:22 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_hdfs1` AS t LIMIT 1
20/09/27 14:24:22 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/148f3b1ef26133262eb1daff8f13b95f/customer_hdfs1.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 14:24:23 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/148f3b1ef26133262eb1daff8f13b95f/customer_hdfs1.jar
20/09/27 14:24:23 INFO mapreduce.ExportJobBase: Beginning export of customer_hdfs1
20/09/27 14:24:24 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/27 14:24:24 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/27 14:24:25 WARN mapreduce.ExportJobBase: Input path hdfs://localhost:54310/user/hduser/savedjob2 contains no files
20/09/27 14:24:25 INFO Configuration.deprecation: mapred.reduce.tasks.speculative.execution is deprecated. Instead, use mapreduce.reduce.speculative
20/09/27 14:24:25 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 14:24:25 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/27 14:24:25 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 14:24:29 INFO input.FileInputFormat: Total input paths to process : 0
20/09/27 14:24:29 INFO Configuration.deprecation: mapred.max.split.size is deprecated. Instead, use mapreduce.input.fileinputformat.split.maxsize
20/09/27 14:24:29 INFO input.FileInputFormat: Total input paths to process : 0
20/09/27 14:24:29 INFO mapreduce.JobSubmitter: number of splits:0
20/09/27 14:24:29 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 14:24:29 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601240743098_0002
20/09/27 14:24:30 INFO impl.YarnClientImpl: Submitted application application_1601240743098_0002
20/09/27 14:24:30 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601240743098_0002/
20/09/27 14:24:30 INFO mapreduce.Job: Running job: job_1601240743098_0002
20/09/27 14:24:49 INFO mapreduce.Job: Job job_1601240743098_0002 running in uber mode : false
20/09/27 14:24:49 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 14:24:51 INFO mapreduce.Job: Job job_1601240743098_0002 completed successfully
20/09/27 14:24:51 INFO mapreduce.Job: Counters: 2
	Job Counters 
		Total time spent by all maps in occupied slots (ms)=0
		Total time spent by all reduces in occupied slots (ms)=0
20/09/27 14:24:51 WARN mapreduce.Counters: Group FileSystemCounters is deprecated. Use org.apache.hadoop.mapreduce.FileSystemCounter instead
20/09/27 14:24:51 INFO mapreduce.ExportJobBase: Transferred 0 bytes in 26.1474 seconds (0 bytes/sec)
20/09/27 14:24:51 WARN mapreduce.Counters: Group org.apache.hadoop.mapred.Task$Counter is deprecated. Use org.apache.hadoop.mapreduce.TaskCounter instead
20/09/27 14:24:51 INFO mapreduce.ExportJobBase: Exported 0 records.
[hduser@Inceptez ~]$

--## Since there is no records on customer_hdfs1 table and it exported 0 records.

----------------------------
--## Which one of the below export works?
--## sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs --export-dir imp_del;
--## sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs --export-dir imp_del --fields-terminated-by '~' --lines-terminated-by '\n';

--sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs --export-dir imp_del_t1;

[hduser@Inceptez ~]$ hadoop fs -cat /user/hduser/imp_del_1/*
20/09/27 14:31:57 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
7~inceptez~tech~Chennai~3~2017-09-28~10000
8~iz~tech~Calcutta~5~2015-09-28~10000
9~a~srini~chennai~38~2016-08-08~13000
8~iz~tech~Mumbai~33~2017-09-28~10000
10~inceptez~technologies~chennai~33~2017-09-28~13000
[hduser@Inceptez ~]$ hadoop fs -ls /user/hduser/imp_del_1/*
20/09/27 14:32:09 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
-rw-r--r--   1 hduser hadoop        119 2020-09-04 08:22 /user/hduser/imp_del_1/part-m-00000
-rw-r--r--   1 hduser hadoop         90 2020-09-04 08:33 /user/hduser/imp_del_1/part-m-00001
[hduser@Inceptez ~]$ sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs --export-dir imp_del_1;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/27 14:32:20 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/27 14:32:20 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/27 14:32:21 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/27 14:32:21 INFO tool.CodeGenTool: Beginning code generation
20/09/27 14:32:21 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_hdfs` AS t LIMIT 1
20/09/27 14:32:21 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_hdfs` AS t LIMIT 1
20/09/27 14:32:21 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/c0705e8174a98283b33cf9be5ec67976/customer_hdfs.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 14:32:23 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/c0705e8174a98283b33cf9be5ec67976/customer_hdfs.jar
20/09/27 14:32:23 INFO mapreduce.ExportJobBase: Beginning export of customer_hdfs
20/09/27 14:32:23 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/27 14:32:23 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/27 14:32:24 INFO Configuration.deprecation: mapred.reduce.tasks.speculative.execution is deprecated. Instead, use mapreduce.reduce.speculative
20/09/27 14:32:24 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 14:32:24 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/27 14:32:24 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 14:32:27 INFO input.FileInputFormat: Total input paths to process : 2
20/09/27 14:32:27 INFO input.FileInputFormat: Total input paths to process : 2
20/09/27 14:32:27 INFO mapreduce.JobSubmitter: number of splits:3
20/09/27 14:32:27 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 14:32:27 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601240743098_0004
20/09/27 14:32:28 INFO impl.YarnClientImpl: Submitted application application_1601240743098_0004
20/09/27 14:32:28 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601240743098_0004/
20/09/27 14:32:28 INFO mapreduce.Job: Running job: job_1601240743098_0004
20/09/27 14:32:39 INFO mapreduce.Job: Job job_1601240743098_0004 running in uber mode : false
20/09/27 14:32:39 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 14:32:58 INFO mapreduce.Job: Task Id : attempt_1601240743098_0004_m_000001_0, Status : FAILED
Error: java.io.IOException: Can't export data, please check failed map task logs
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:112)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:39)
	at org.apache.hadoop.mapreduce.Mapper.run(Mapper.java:146)
	at org.apache.sqoop.mapreduce.AutoProgressMapper.run(AutoProgressMapper.java:64)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:787)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:341)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:164)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:158)
Caused by: java.lang.RuntimeException: Can't parse input data: '9~a~srini~chennai~38~2016-08-08~13000'
	at customer_hdfs.__loadFromFields(customer_hdfs.java:464)
	at customer_hdfs.parse(customer_hdfs.java:382)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:83)
	... 10 more
Caused by: java.lang.NumberFormatException: For input string: "9~a~srini~chennai~38~2016-08-08~13000"
	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
	at java.lang.Integer.parseInt(Integer.java:580)
	at java.lang.Integer.valueOf(Integer.java:766)
	at customer_hdfs.__loadFromFields(customer_hdfs.java:431)
	... 12 more

20/09/27 14:32:58 INFO mapreduce.Job: Task Id : attempt_1601240743098_0004_m_000000_0, Status : FAILED
Error: java.io.IOException: Can't export data, please check failed map task logs
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:112)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:39)
	at org.apache.hadoop.mapreduce.Mapper.run(Mapper.java:146)
	at org.apache.sqoop.mapreduce.AutoProgressMapper.run(AutoProgressMapper.java:64)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:787)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:341)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:164)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:158)
Caused by: java.lang.RuntimeException: Can't parse input data: '8~iz~tech~Mumbai~33~2017-09-28~10000'
	at customer_hdfs.__loadFromFields(customer_hdfs.java:464)
	at customer_hdfs.parse(customer_hdfs.java:382)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:83)
	... 10 more
Caused by: java.lang.NumberFormatException: For input string: "8~iz~tech~Mumbai~33~2017-09-28~10000"
	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
	at java.lang.Integer.parseInt(Integer.java:580)
	at java.lang.Integer.valueOf(Integer.java:766)
	at customer_hdfs.__loadFromFields(customer_hdfs.java:431)
	... 12 more

20/09/27 14:32:59 INFO mapreduce.Job: Task Id : attempt_1601240743098_0004_m_000002_0, Status : FAILED
Error: java.io.IOException: Can't export data, please check failed map task logs
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:112)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:39)
	at org.apache.hadoop.mapreduce.Mapper.run(Mapper.java:146)
	at org.apache.sqoop.mapreduce.AutoProgressMapper.run(AutoProgressMapper.java:64)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:787)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:341)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:164)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:158)
Caused by: java.lang.RuntimeException: Can't parse input data: '7~inceptez~tech~Chennai~3~2017-09-28~10000'
	at customer_hdfs.__loadFromFields(customer_hdfs.java:464)
	at customer_hdfs.parse(customer_hdfs.java:382)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:83)
	... 10 more
Caused by: java.lang.NumberFormatException: For input string: "7~inceptez~tech~Chennai~3~2017-09-28~10000"
	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
	at java.lang.Integer.parseInt(Integer.java:580)
	at java.lang.Integer.valueOf(Integer.java:766)
	at customer_hdfs.__loadFromFields(customer_hdfs.java:431)
	... 12 more

20/09/27 14:33:11 INFO mapreduce.Job: Task Id : attempt_1601240743098_0004_m_000001_1, Status : FAILED
Error: java.io.IOException: Can't export data, please check failed map task logs
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:112)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:39)
	at org.apache.hadoop.mapreduce.Mapper.run(Mapper.java:146)
	at org.apache.sqoop.mapreduce.AutoProgressMapper.run(AutoProgressMapper.java:64)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:787)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:341)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:164)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:158)
Caused by: java.lang.RuntimeException: Can't parse input data: '9~a~srini~chennai~38~2016-08-08~13000'
	at customer_hdfs.__loadFromFields(customer_hdfs.java:464)
	at customer_hdfs.parse(customer_hdfs.java:382)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:83)
	... 10 more
Caused by: java.lang.NumberFormatException: For input string: "9~a~srini~chennai~38~2016-08-08~13000"
	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
	at java.lang.Integer.parseInt(Integer.java:580)
	at java.lang.Integer.valueOf(Integer.java:766)
	at customer_hdfs.__loadFromFields(customer_hdfs.java:431)
	... 12 more

20/09/27 14:33:14 INFO mapreduce.Job: Task Id : attempt_1601240743098_0004_m_000000_1, Status : FAILED
Error: java.io.IOException: Can't export data, please check failed map task logs
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:112)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:39)
	at org.apache.hadoop.mapreduce.Mapper.run(Mapper.java:146)
	at org.apache.sqoop.mapreduce.AutoProgressMapper.run(AutoProgressMapper.java:64)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:787)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:341)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:164)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:158)
Caused by: java.lang.RuntimeException: Can't parse input data: '8~iz~tech~Mumbai~33~2017-09-28~10000'
	at customer_hdfs.__loadFromFields(customer_hdfs.java:464)
	at customer_hdfs.parse(customer_hdfs.java:382)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:83)
	... 10 more
Caused by: java.lang.NumberFormatException: For input string: "8~iz~tech~Mumbai~33~2017-09-28~10000"
	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
	at java.lang.Integer.parseInt(Integer.java:580)
	at java.lang.Integer.valueOf(Integer.java:766)
	at customer_hdfs.__loadFromFields(customer_hdfs.java:431)
	... 12 more

20/09/27 14:33:14 INFO mapreduce.Job: Task Id : attempt_1601240743098_0004_m_000002_1, Status : FAILED
Error: java.io.IOException: Can't export data, please check failed map task logs
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:112)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:39)
	at org.apache.hadoop.mapreduce.Mapper.run(Mapper.java:146)
	at org.apache.sqoop.mapreduce.AutoProgressMapper.run(AutoProgressMapper.java:64)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:787)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:341)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:164)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:158)
Caused by: java.lang.RuntimeException: Can't parse input data: '7~inceptez~tech~Chennai~3~2017-09-28~10000'
	at customer_hdfs.__loadFromFields(customer_hdfs.java:464)
	at customer_hdfs.parse(customer_hdfs.java:382)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:83)
	... 10 more
Caused by: java.lang.NumberFormatException: For input string: "7~inceptez~tech~Chennai~3~2017-09-28~10000"
	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
	at java.lang.Integer.parseInt(Integer.java:580)
	at java.lang.Integer.valueOf(Integer.java:766)
	at customer_hdfs.__loadFromFields(customer_hdfs.java:431)
	... 12 more

20/09/27 14:33:20 INFO mapreduce.Job: Task Id : attempt_1601240743098_0004_m_000001_2, Status : FAILED
Error: java.io.IOException: Can't export data, please check failed map task logs
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:112)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:39)
	at org.apache.hadoop.mapreduce.Mapper.run(Mapper.java:146)
	at org.apache.sqoop.mapreduce.AutoProgressMapper.run(AutoProgressMapper.java:64)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:787)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:341)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:164)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:158)
Caused by: java.lang.RuntimeException: Can't parse input data: '9~a~srini~chennai~38~2016-08-08~13000'
	at customer_hdfs.__loadFromFields(customer_hdfs.java:464)
	at customer_hdfs.parse(customer_hdfs.java:382)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:83)
	... 10 more
Caused by: java.lang.NumberFormatException: For input string: "9~a~srini~chennai~38~2016-08-08~13000"
	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
	at java.lang.Integer.parseInt(Integer.java:580)
	at java.lang.Integer.valueOf(Integer.java:766)
	at customer_hdfs.__loadFromFields(customer_hdfs.java:431)
	... 12 more

20/09/27 14:33:24 INFO mapreduce.Job: Task Id : attempt_1601240743098_0004_m_000000_2, Status : FAILED
Error: java.io.IOException: Can't export data, please check failed map task logs
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:112)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:39)
	at org.apache.hadoop.mapreduce.Mapper.run(Mapper.java:146)
	at org.apache.sqoop.mapreduce.AutoProgressMapper.run(AutoProgressMapper.java:64)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:787)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:341)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:164)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:158)
Caused by: java.lang.RuntimeException: Can't parse input data: '8~iz~tech~Mumbai~33~2017-09-28~10000'
	at customer_hdfs.__loadFromFields(customer_hdfs.java:464)
	at customer_hdfs.parse(customer_hdfs.java:382)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:83)
	... 10 more
Caused by: java.lang.NumberFormatException: For input string: "8~iz~tech~Mumbai~33~2017-09-28~10000"
	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
	at java.lang.Integer.parseInt(Integer.java:580)
	at java.lang.Integer.valueOf(Integer.java:766)
	at customer_hdfs.__loadFromFields(customer_hdfs.java:431)
	... 12 more

20/09/27 14:33:25 INFO mapreduce.Job: Task Id : attempt_1601240743098_0004_m_000002_2, Status : FAILED
Error: java.io.IOException: Can't export data, please check failed map task logs
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:112)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:39)
	at org.apache.hadoop.mapreduce.Mapper.run(Mapper.java:146)
	at org.apache.sqoop.mapreduce.AutoProgressMapper.run(AutoProgressMapper.java:64)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:787)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:341)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:164)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:158)
Caused by: java.lang.RuntimeException: Can't parse input data: '7~inceptez~tech~Chennai~3~2017-09-28~10000'
	at customer_hdfs.__loadFromFields(customer_hdfs.java:464)
	at customer_hdfs.parse(customer_hdfs.java:382)
	at org.apache.sqoop.mapreduce.TextExportMapper.map(TextExportMapper.java:83)
	... 10 more
Caused by: java.lang.NumberFormatException: For input string: "7~inceptez~tech~Chennai~3~2017-09-28~10000"
	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
	at java.lang.Integer.parseInt(Integer.java:580)
	at java.lang.Integer.valueOf(Integer.java:766)
	at customer_hdfs.__loadFromFields(customer_hdfs.java:431)
	... 12 more

20/09/27 14:33:32 INFO mapreduce.Job:  map 100% reduce 0%
20/09/27 14:33:33 INFO mapreduce.Job: Job job_1601240743098_0004 failed with state FAILED due to: Task failed task_1601240743098_0004_m_000001
Job failed as tasks failed. failedMaps:1 failedReduces:0

20/09/27 14:33:33 INFO mapreduce.Job: Counters: 13
	Job Counters 
		Failed map tasks=10
		Killed map tasks=2
		Launched map tasks=12
		Other local map tasks=9
		Data-local map tasks=3
		Total time spent by all maps in occupied slots (ms)=130638
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=130638
		Total vcore-seconds taken by all map tasks=130638
		Total megabyte-seconds taken by all map tasks=133773312
	Map-Reduce Framework
		CPU time spent (ms)=0
		Physical memory (bytes) snapshot=0
		Virtual memory (bytes) snapshot=0
20/09/27 14:33:33 WARN mapreduce.Counters: Group FileSystemCounters is deprecated. Use org.apache.hadoop.mapreduce.FileSystemCounter instead
20/09/27 14:33:33 INFO mapreduce.ExportJobBase: Transferred 0 bytes in 68.8051 seconds (0 bytes/sec)
20/09/27 14:33:33 INFO mapreduce.ExportJobBase: Exported 0 records.
20/09/27 14:33:33 ERROR tool.ExportTool: Error during export: Export job failed!
[hduser@Inceptez ~]$

--## Export job has failed because field terminated by '~' but by default sqoop delimiter as ',' and it will consider enitre data set as single column('7~inceptez~tech~Chennai~3~2017-09-28~10000').

mysql> select * from customer_hdfs1;
Empty set (0.00 sec)

[hduser@Inceptez ~]$ hadoop fs -cat /user/hduser/imp_del_1/*
20/09/27 14:48:59 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
7~inceptez~tech~Chennai~3~2017-09-28~10000
8~iz~tech~Calcutta~5~2015-09-28~10000
9~a~srini~chennai~38~2016-08-08~13000
8~iz~tech~Mumbai~33~2017-09-28~10000
10~inceptez~technologies~chennai~33~2017-09-28~13000
[hduser@Inceptez ~]$ 

--## sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs1 --export-dir imp_del_1 --fields-terminated-by '~' --lines-terminated-by '\n';


mysql> select * from customer_hdfs1;
Empty set (0.00 sec)

[hduser@Inceptez ~]$ sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs1 --export-dir imp_del_1 --fields-terminated-by '~' --lines-terminated-by '\n';
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/27 14:58:19 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/27 14:58:19 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/27 14:58:19 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/27 14:58:19 INFO tool.CodeGenTool: Beginning code generation
20/09/27 14:58:20 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_hdfs1` AS t LIMIT 1
20/09/27 14:58:20 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_hdfs1` AS t LIMIT 1
20/09/27 14:58:20 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/9852bd67a45821bcbc36fcaf3657f334/customer_hdfs1.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 14:58:22 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/9852bd67a45821bcbc36fcaf3657f334/customer_hdfs1.jar
20/09/27 14:58:23 INFO mapreduce.ExportJobBase: Beginning export of customer_hdfs1
20/09/27 14:58:23 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/27 14:58:23 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/27 14:58:25 INFO Configuration.deprecation: mapred.reduce.tasks.speculative.execution is deprecated. Instead, use mapreduce.reduce.speculative
20/09/27 14:58:25 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 14:58:25 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/27 14:58:25 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 14:58:30 INFO input.FileInputFormat: Total input paths to process : 2
20/09/27 14:58:30 INFO input.FileInputFormat: Total input paths to process : 2
20/09/27 14:58:30 INFO mapreduce.JobSubmitter: number of splits:3
20/09/27 14:58:30 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 14:58:30 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601240743098_0006
20/09/27 14:58:31 INFO impl.YarnClientImpl: Submitted application application_1601240743098_0006
20/09/27 14:58:32 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601240743098_0006/
20/09/27 14:58:32 INFO mapreduce.Job: Running job: job_1601240743098_0006
20/09/27 14:59:04 INFO mapreduce.Job: Job job_1601240743098_0006 running in uber mode : false
20/09/27 14:59:04 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 14:59:45 INFO mapreduce.Job:  map 33% reduce 0%
20/09/27 14:59:48 INFO mapreduce.Job:  map 100% reduce 0%
20/09/27 14:59:48 INFO mapreduce.Job: Job job_1601240743098_0006 completed successfully
20/09/27 14:59:49 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=399996
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=932
		HDFS: Number of bytes written=0
		HDFS: Number of read operations=18
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=0
	Job Counters 
		Launched map tasks=3
		Data-local map tasks=3
		Total time spent by all maps in occupied slots (ms)=119074
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=119074
		Total vcore-seconds taken by all map tasks=119074
		Total megabyte-seconds taken by all map tasks=121931776
	Map-Reduce Framework
		Map input records=5
		Map output records=5
		Input split bytes=562
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=3941
		CPU time spent (ms)=7280
		Physical memory (bytes) snapshot=507301888
		Virtual memory (bytes) snapshot=6252240896
		Total committed heap usage (bytes)=322961408
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=0
20/09/27 14:59:49 INFO mapreduce.ExportJobBase: Transferred 932 bytes in 83.7747 seconds (11.1251 bytes/sec)
20/09/27 14:59:49 INFO mapreduce.ExportJobBase: Exported 5 records.
[hduser@Inceptez ~]$ 


mysql> select * from customer_hdfs1;
+--------+-----------+--------------+----------+------+------------+-------------+
| custid | firstname | lastname     | city     | age  | createdt   | transactamt |
+--------+-----------+--------------+----------+------+------------+-------------+
|      9 | a         | srini        | chennai  |   38 | 2016-08-08 |       13000 |
|      8 | iz        | tech         | Mumbai   |   33 | 2017-09-28 |       10000 |
|     10 | inceptez  | technologies | chennai  |   33 | 2017-09-28 |       13000 |
|      7 | inceptez  | tech         | Chennai  |    3 | 2017-09-28 |       10000 |
|      8 | iz        | tech         | Calcutta |    5 | 2015-09-28 |       10000 |
+--------+-----------+--------------+----------+------+------------+-------------+
5 rows in set (0.00 sec)

mysql> 

--## Data loaded from hdfs file location (imp_del_1) into customer_hdfs1 tables.

--## Incremental export
--## Update only mode:
--## delete from customer_hdfs1;
--## insert into customer_hdfs1 select * from customer;

vi ~/part-m-00000
7~inceptez~tech~Chennai~3~2017-09-28~10000
8~iz~tech~Calcutta~5~2015-09-28~10000
9~a~srini~chennai~38~2016-08-08~13000
11~Narayan~Nirmala~SKhalli~55~2020-02-15~25000

mysql> delete from customer_hdfs1;
Query OK, 5 rows affected (0.00 sec)

mysql> select * from customer_hdfs1;
Empty set (0.00 sec)

mysql> insert into customer_hdfs1 select * from customer;
Query OK, 12 rows affected (0.00 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> select * from customer_hdfs1;
+--------+------------+------------+-----------+------+------------+-------------+
| custid | firstname  | lastname   | city      | age  | createdt   | transactamt |
+--------+------------+------------+-----------+------+------------+-------------+
|      1 | Arun       | Kumar      | chennai   |   33 | 2017-09-20 |      100000 |
|      2 | srini      | vasan      | chennai   |   33 | 2017-09-21 |       10000 |
|      3 | vasu       | devan      | banglore  |   39 | 2017-09-23 |       90000 |
|      4 | mohamed    | imran      | hyderabad |   33 | 2017-09-24 |        1000 |
|      5 | arun       | basker     | chennai   |   23 | 2017-09-20 |      200000 |
|      6 | ramesh     | babu       | manglore  |   39 | 2017-09-21 |      100000 |
|      7 | inceptez   | tech       | Chennai   |    3 | 2017-09-28 |       10000 |
|      8 | Iz         | tech       | pune      |    4 | 2017-09-28 |       10000 |
|      9 | mohan      | kumar      | banglore  |   35 | 2017-09-29 |      500000 |
|     10 | Mrityunjay | Mohankumar | Skhalli   |    3 | 2015-05-25 |       10000 |
|     12 | Welcome    | Inceptez   | pune      |    4 | 2017-09-28 |       10000 |
|     13 | test       | comp       | chennai   |   10 | 2017-09-30 |       50000 |
+--------+------------+------------+-----------+------+------------+-------------+
12 rows in set (0.00 sec)

mysql>

--## Insert new records on linux file
 [hduser@Inceptez ~]$ cat part-m-00002
7~inceptez~tech~Chennai~3~2017-09-28~10000
8~iz~tech~Calcutta~5~2015-09-28~10000
9~a~srini~chennai~38~2016-08-08~13000
11~Narayan~Nirmala~SKhalli~55~2020-02-15~25000
[hduser@Inceptez ~]$

hadoop fs -put -f part-m-00002 imp_del_1/
sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs1 --export-dir imp_del_1 --fields-terminated-by '~' --lines-terminated-by '\n' --update-key custid --update-mode updateonly;

[hduser@Inceptez ~]$ sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs1 --export-dir imp_del_1 --fields-terminated-by '~' --lines-terminated-by '\n' --update-key custid --update-mode updateonly;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/27 15:22:14 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/27 15:22:14 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/27 15:22:14 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/27 15:22:14 INFO tool.CodeGenTool: Beginning code generation
20/09/27 15:22:14 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_hdfs1` AS t LIMIT 1
20/09/27 15:22:15 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_hdfs1` AS t LIMIT 1
20/09/27 15:22:15 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/34f61e00477e6fe8b6b244b63b60556b/customer_hdfs1.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 15:22:17 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/34f61e00477e6fe8b6b244b63b60556b/customer_hdfs1.jar
20/09/27 15:22:17 INFO mapreduce.ExportJobBase: Beginning export of customer_hdfs1
20/09/27 15:22:17 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/27 15:22:17 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/27 15:22:18 INFO Configuration.deprecation: mapred.reduce.tasks.speculative.execution is deprecated. Instead, use mapreduce.reduce.speculative
20/09/27 15:22:18 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 15:22:18 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/27 15:22:18 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 15:22:25 INFO input.FileInputFormat: Total input paths to process : 3
20/09/27 15:22:25 INFO input.FileInputFormat: Total input paths to process : 3
20/09/27 15:22:26 INFO mapreduce.JobSubmitter: number of splits:3
20/09/27 15:22:26 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 15:22:26 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601240743098_0008
20/09/27 15:22:27 INFO impl.YarnClientImpl: Submitted application application_1601240743098_0008
20/09/27 15:22:28 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601240743098_0008/
20/09/27 15:22:28 INFO mapreduce.Job: Running job: job_1601240743098_0008
20/09/27 15:22:49 INFO mapreduce.Job: Job job_1601240743098_0008 running in uber mode : false
20/09/27 15:22:49 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 15:23:11 INFO mapreduce.Job:  map 33% reduce 0%
20/09/27 15:23:14 INFO mapreduce.Job:  map 100% reduce 0%
20/09/27 15:23:15 INFO mapreduce.Job: Job job_1601240743098_0008 completed successfully
20/09/27 15:23:15 INFO mapreduce.Job: Counters: 31
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=400416
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=1095
		HDFS: Number of bytes written=0
		HDFS: Number of read operations=18
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=0
	Job Counters 
		Launched map tasks=3
		Other local map tasks=1
		Data-local map tasks=2
		Total time spent by all maps in occupied slots (ms)=62780
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=62780
		Total vcore-seconds taken by all map tasks=62780
		Total megabyte-seconds taken by all map tasks=64286720
	Map-Reduce Framework
		Map input records=9
		Map output records=9
		Input split bytes=562
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=6182
		CPU time spent (ms)=4080
		Physical memory (bytes) snapshot=501760000
		Virtual memory (bytes) snapshot=6252269568
		Total committed heap usage (bytes)=337117184
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=0
20/09/27 15:23:15 INFO mapreduce.ExportJobBase: Transferred 1.0693 KB in 56.5978 seconds (19.347 bytes/sec)
20/09/27 15:23:15 INFO mapreduce.ExportJobBase: Exported 9 records.
[hduser@Inceptez ~]$


mysql> select * from customer_hdfs1; [ Before Export]
+--------+------------+------------+-----------+------+------------+-------------+
| custid | firstname  | lastname   | city      | age  | createdt   | transactamt |
+--------+------------+------------+-----------+------+------------+-------------+
|      1 | Arun       | Kumar      | chennai   |   33 | 2017-09-20 |      100000 |
|      2 | srini      | vasan      | chennai   |   33 | 2017-09-21 |       10000 |
|      3 | vasu       | devan      | banglore  |   39 | 2017-09-23 |       90000 |
|      4 | mohamed    | imran      | hyderabad |   33 | 2017-09-24 |        1000 |
|      5 | arun       | basker     | chennai   |   23 | 2017-09-20 |      200000 |
|      6 | ramesh     | babu       | manglore  |   39 | 2017-09-21 |      100000 |
|      7 | inceptez   | tech       | Chennai   |    3 | 2017-09-28 |       10000 |
|      8 | Iz         | tech       | pune      |    4 | 2017-09-28 |       10000 |
|      9 | mohan      | kumar      | banglore  |   35 | 2017-09-29 |      500000 |
|     10 | Mrityunjay | Mohankumar | Skhalli   |    3 | 2015-05-25 |       10000 |
|     12 | Welcome    | Inceptez   | pune      |    4 | 2017-09-28 |       10000 |
|     13 | test       | comp       | chennai   |   10 | 2017-09-30 |       50000 |
+--------+------------+------------+-----------+------+------------+-------------+
12 rows in set (0.00 sec)

mysql> select * from customer_hdfs1; [ After Export]
+--------+-----------+--------------+-----------+------+------------+-------------+
| custid | firstname | lastname     | city      | age  | createdt   | transactamt |
+--------+-----------+--------------+-----------+------+------------+-------------+
|      1 | Arun      | Kumar        | chennai   |   33 | 2017-09-20 |      100000 |
|      2 | srini     | vasan        | chennai   |   33 | 2017-09-21 |       10000 |
|      3 | vasu      | devan        | banglore  |   39 | 2017-09-23 |       90000 |
|      4 | mohamed   | imran        | hyderabad |   33 | 2017-09-24 |        1000 |
|      5 | arun      | basker       | chennai   |   23 | 2017-09-20 |      200000 |
|      6 | ramesh    | babu         | manglore  |   39 | 2017-09-21 |      100000 |
|      7 | inceptez  | tech         | Chennai   |    3 | 2017-09-28 |       10000 |
|      8 | iz        | tech         | Calcutta  |    5 | 2015-09-28 |       10000 |
|      9 | a         | srini        | chennai   |   38 | 2016-08-08 |       13000 |
|     10 | inceptez  | technologies | chennai   |   33 | 2017-09-28 |       13000 |
|     12 | Welcome   | Inceptez     | pune      |    4 | 2017-09-28 |       10000 |
|     13 | test      | comp         | chennai   |   10 | 2017-09-30 |       50000 |
+--------+-----------+--------------+-----------+------+------------+-------------+
12 rows in set (0.00 sec)

mysql> 

--## Allow insert mode:
--## ALTER TABLE customer_hdfs ADD PRIMARY KEY (custid);

ALTER TABLE customer_hdfs1 ADD PRIMARY KEY (custid);

mysql> desc customer_hdfs1;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| custid      | int(11)     | NO   | PRI | 0       |       |
| firstname   | varchar(20) | YES  |     | NULL    |       |
| lastname    | varchar(20) | YES  |     | NULL    |       |
| city        | varchar(50) | YES  |     | NULL    |       |
| age         | int(11)     | YES  |     | NULL    |       |
| createdt    | date        | YES  |     | NULL    |       |
| transactamt | int(11)     | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

/* ----------
vi ~/part-m-00002
8~iz~tech~Mumbai~33~2017-09-28~10000
10~inceptez~technologies~chennai~33~2017-09-28~13000
Note: Delete the last blank line in the above file

hadoop fs -put -f part-m-00000 imp_del/
sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs --export-dir imp_del --fields-terminated-by '~' --lines-terminated-by '\n' --update-key custid --update-mode allowinsert;
---------- */
[hduser@Inceptez ~]$ hadoop fs -cat imp_del_1/part-m-00002
20/09/27 15:25:59 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
7~inceptez~tech~Chennai~3~2017-09-28~10000
8~iz~tech~Calcutta~5~2015-09-28~10000
9~a~srini~chennai~38~2016-08-08~13000
11~Narayan~Nirmala~SKhalli~55~2020-02-15~25000
[hduser@Inceptez ~]$
[hduser@Inceptez ~]$ sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs1 --export-dir imp_del_1 --fields-terminated-by '~' --lines-terminated-by '\n' --update-key custid --update-mode allowinsert;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/27 15:29:18 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/27 15:29:18 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/27 15:29:18 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/27 15:29:18 INFO tool.CodeGenTool: Beginning code generation
20/09/27 15:29:18 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_hdfs1` AS t LIMIT 1
20/09/27 15:29:18 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_hdfs1` AS t LIMIT 1
20/09/27 15:29:18 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/6265b897e7bed91b6824752fb7917141/customer_hdfs1.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 15:29:20 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/6265b897e7bed91b6824752fb7917141/customer_hdfs1.jar
20/09/27 15:29:20 WARN manager.MySQLManager: MySQL Connector upsert functionality is using INSERT ON
20/09/27 15:29:20 WARN manager.MySQLManager: DUPLICATE KEY UPDATE clause that relies on table's unique key.
20/09/27 15:29:20 WARN manager.MySQLManager: Insert/update distinction is therefore independent on column
20/09/27 15:29:20 WARN manager.MySQLManager: names specified in --update-key parameter. Please see MySQL
20/09/27 15:29:20 WARN manager.MySQLManager: documentation for additional limitations.
20/09/27 15:29:20 INFO mapreduce.ExportJobBase: Beginning export of customer_hdfs1
20/09/27 15:29:20 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/27 15:29:20 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/27 15:29:21 INFO Configuration.deprecation: mapred.reduce.tasks.speculative.execution is deprecated. Instead, use mapreduce.reduce.speculative
20/09/27 15:29:21 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 15:29:21 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/27 15:29:21 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 15:29:26 INFO input.FileInputFormat: Total input paths to process : 3
20/09/27 15:29:26 INFO input.FileInputFormat: Total input paths to process : 3
20/09/27 15:29:27 INFO mapreduce.JobSubmitter: number of splits:3
20/09/27 15:29:27 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 15:29:27 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601240743098_0009
20/09/27 15:29:27 INFO impl.YarnClientImpl: Submitted application application_1601240743098_0009
20/09/27 15:29:28 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601240743098_0009/
20/09/27 15:29:28 INFO mapreduce.Job: Running job: job_1601240743098_0009
20/09/27 15:29:38 INFO mapreduce.Job: Job job_1601240743098_0009 running in uber mode : false
20/09/27 15:29:38 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 15:29:59 INFO mapreduce.Job:  map 33% reduce 0%
20/09/27 15:30:00 INFO mapreduce.Job:  map 100% reduce 0%
20/09/27 15:30:01 INFO mapreduce.Job: Job job_1601240743098_0009 completed successfully
20/09/27 15:30:01 INFO mapreduce.Job: Counters: 31
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=400470
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=1095
		HDFS: Number of bytes written=0
		HDFS: Number of read operations=18
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=0
	Job Counters 
		Launched map tasks=3
		Other local map tasks=1
		Data-local map tasks=2
		Total time spent by all maps in occupied slots (ms)=54433
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=54433
		Total vcore-seconds taken by all map tasks=54433
		Total megabyte-seconds taken by all map tasks=55739392
	Map-Reduce Framework
		Map input records=9
		Map output records=9
		Input split bytes=562
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=1399
		CPU time spent (ms)=5750
		Physical memory (bytes) snapshot=458567680
		Virtual memory (bytes) snapshot=6250082304
		Total committed heap usage (bytes)=288358400
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=0
20/09/27 15:30:01 INFO mapreduce.ExportJobBase: Transferred 1.0693 KB in 39.9436 seconds (27.4137 bytes/sec)
20/09/27 15:30:01 INFO mapreduce.ExportJobBase: Exported 9 records.
[hduser@Inceptez ~]$


mysql> select * from customer_hdfs1;
+--------+-----------+--------------+-----------+------+------------+-------------+
| custid | firstname | lastname     | city      | age  | createdt   | transactamt |
+--------+-----------+--------------+-----------+------+------------+-------------+
|      1 | Arun      | Kumar        | chennai   |   33 | 2017-09-20 |      100000 |
|      2 | srini     | vasan        | chennai   |   33 | 2017-09-21 |       10000 |
|      3 | vasu      | devan        | banglore  |   39 | 2017-09-23 |       90000 |
|      4 | mohamed   | imran        | hyderabad |   33 | 2017-09-24 |        1000 |
|      5 | arun      | basker       | chennai   |   23 | 2017-09-20 |      200000 |
|      6 | ramesh    | babu         | manglore  |   39 | 2017-09-21 |      100000 |
|      7 | inceptez  | tech         | Chennai   |    3 | 2017-09-28 |       10000 |
|      8 | iz        | tech         | Calcutta  |    5 | 2015-09-28 |       10000 |
|      9 | a         | srini        | chennai   |   38 | 2016-08-08 |       13000 |
|     10 | inceptez  | technologies | chennai   |   33 | 2017-09-28 |       13000 |
|     12 | Welcome   | Inceptez     | pune      |    4 | 2017-09-28 |       10000 |
|     13 | test      | comp         | chennai   |   10 | 2017-09-30 |       50000 |
|     11 | Narayan   | Nirmala      | SKhalli   |   55 | 2020-02-15 |       25000 |
+--------+-----------+--------------+-----------+------+------------+-------------+
13 rows in set (0.00 sec)

mysql> 

--## Records newly insert and update on customer_hdfs1 table

------------------------------------------------------------ ## IMPORT ## ---------------------

mysql> select * from customer_hdfs1 where city ='banglore' or age >30;
+--------+-----------+--------------+-----------+------+------------+-------------+
| custid | firstname | lastname     | city      | age  | createdt   | transactamt |
+--------+-----------+--------------+-----------+------+------------+-------------+
|      1 | Arun      | Kumar        | chennai   |   33 | 2017-09-20 |      100000 |
|      2 | srini     | vasan        | chennai   |   33 | 2017-09-21 |       10000 |
|      3 | vasu      | devan        | banglore  |   39 | 2017-09-23 |       90000 |
|      4 | mohamed   | imran        | hyderabad |   33 | 2017-09-24 |        1000 |
|      6 | ramesh    | babu         | manglore  |   39 | 2017-09-21 |      100000 |
|      9 | a         | srini        | chennai   |   38 | 2016-08-08 |       13000 |
|     10 | inceptez  | technologies | chennai   |   33 | 2017-09-28 |       13000 |
|     11 | Narayan   | Nirmala      | SKhalli   |   55 | 2020-02-15 |       25000 |
+--------+-----------+--------------+-----------+------+------------+-------------+
8 rows in set (0.00 sec)

mysql> 


sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs1 -m 1 --where "city ='banglore' or age>30" --target-dir filtered1 --delete-target-dir;

[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_hdfs1 -m 1 --where "city ='banglore' or age>30" --target-dir filtered1 --delete-target-dir;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/27 15:48:34 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/27 15:48:34 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/27 15:48:34 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/27 15:48:34 INFO tool.CodeGenTool: Beginning code generation
20/09/27 15:48:35 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_hdfs1` AS t LIMIT 1
20/09/27 15:48:35 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_hdfs1` AS t LIMIT 1
20/09/27 15:48:35 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/36a9b7909ba187654ef1aa3d6db47165/customer_hdfs1.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 15:48:37 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/36a9b7909ba187654ef1aa3d6db47165/customer_hdfs1.jar
20/09/27 15:48:37 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/27 15:48:38 INFO tool.ImportTool: Destination directory filtered1 is not present, hence not deleting.
20/09/27 15:48:38 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/09/27 15:48:38 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/09/27 15:48:38 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/09/27 15:48:38 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/09/27 15:48:38 INFO mapreduce.ImportJobBase: Beginning import of customer_hdfs1
20/09/27 15:48:38 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/27 15:48:38 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/27 15:48:38 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 15:48:42 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/27 15:48:43 INFO mapreduce.JobSubmitter: number of splits:1
20/09/27 15:48:43 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601240743098_0010
20/09/27 15:48:43 INFO impl.YarnClientImpl: Submitted application application_1601240743098_0010
20/09/27 15:48:43 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601240743098_0010/
20/09/27 15:48:43 INFO mapreduce.Job: Running job: job_1601240743098_0010
20/09/27 15:48:53 INFO mapreduce.Job: Job job_1601240743098_0010 running in uber mode : false
20/09/27 15:48:53 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 15:48:59 INFO mapreduce.Job:  map 100% reduce 0%
20/09/27 15:48:59 INFO mapreduce.Job: Job job_1601240743098_0010 completed successfully
20/09/27 15:48:59 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=133825
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=353
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=3913
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=3913
		Total vcore-seconds taken by all map tasks=3913
		Total megabyte-seconds taken by all map tasks=4006912
	Map-Reduce Framework
		Map input records=8
		Map output records=8
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=117
		CPU time spent (ms)=1250
		Physical memory (bytes) snapshot=171913216
		Virtual memory (bytes) snapshot=2084655104
		Total committed heap usage (bytes)=112721920
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=353
20/09/27 15:48:59 INFO mapreduce.ImportJobBase: Transferred 353 bytes in 21.473 seconds (16.4392 bytes/sec)
20/09/27 15:48:59 INFO mapreduce.ImportJobBase: Retrieved 8 records.
[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ hadoop fs -ls filtered1/*
20/09/27 15:50:51 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
-rw-r--r--   1 hduser hadoop          0 2020-09-27 15:48 filtered1/_SUCCESS
-rw-r--r--   1 hduser hadoop        353 2020-09-27 15:48 filtered1/part-m-00000
[hduser@Inceptez ~]$
[hduser@Inceptez ~]$ hadoop fs -cat filtered1/*
20/09/27 15:49:36 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1,Arun,Kumar,chennai,33,2017-09-20,100000
2,srini,vasan,chennai,33,2017-09-21,10000
3,vasu,devan,banglore,39,2017-09-23,90000
4,mohamed,imran,hyderabad,33,2017-09-24,1000
6,ramesh,babu,manglore,39,2017-09-21,100000
9,a,srini,chennai,38,2016-08-08,13000
10,inceptez,technologies,chennai,33,2017-09-28,13000
11,Narayan,Nirmala,SKhalli,55,2020-02-15,25000
[hduser@Inceptez ~]$

--## Sqoop Import: Records selected from customer_hdfs1 table and import to hadoop filtered1 location through sqoop

----------------------------------------------------------------------------------------------------------
----------------------------------------------------## Sqoop Additional commands and Use Cases
--## Common Usecase 1:
--## Import All tables from a DB :
sqoop import-all-tables --connect jdbc:mysql://localhost/custdb --username root --password root --warehouse-dir '/user/hduser/sqoop/testtables1' -m 1

--## Import All tables other than excluded tables from a DB :
sqoop import-all-tables --connect jdbc:mysql://localhost/custdb --username root --password root --warehouse-dir '/user/hduser/sqoop/testtables1' --exclude-tables customer_bkp1 -m 1

20/09/27 16:08:07 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Found 15 items
drwxr-xr-x   - hduser hadoop          0 2020-09-27 15:58 /user/hduser/sqoop/testtables1/customer
drwxr-xr-x   - hduser hadoop          0 2020-09-27 15:58 /user/hduser/sqoop/testtables1/customer_bkp
drwxr-xr-x   - hduser hadoop          0 2020-09-27 15:59 /user/hduser/sqoop/testtables1/customer_bkp1
drwxr-xr-x   - hduser hadoop          0 2020-09-27 15:59 /user/hduser/sqoop/testtables1/customer_details
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:00 /user/hduser/sqoop/testtables1/customer_exp
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:00 /user/hduser/sqoop/testtables1/customer_hdfs
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:00 /user/hduser/sqoop/testtables1/customer_hdfs1
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:01 /user/hduser/sqoop/testtables1/customer_stage
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:01 /user/hduser/sqoop/testtables1/customer_tmp
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:02 /user/hduser/sqoop/testtables1/customer_tmp_bkp
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:02 /user/hduser/sqoop/testtables1/customer_tmp_bkp1
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:02 /user/hduser/sqoop/testtables1/customerins
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:03 /user/hduser/sqoop/testtables1/customerlm
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:03 /user/hduser/sqoop/testtables1/customerlm1
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:04 /user/hduser/sqoop/testtables1/customers
[hduser@Inceptez ~]$



sqoop import-all-tables --connect jdbc:mysql://localhost/custdb --username root --password root --warehouse-dir '/user/hduser/sqoop/testtables2' \
 --exclude-tables "customer_bkp,customer_bkp1,customer_details,customer_exp,customer_hdfs,customer_hdfs1,customer_stage,customer_tmp,customer_tmp_bkp,customer_tmp_bkp1,customerins,customerlm"  -m 1;

[hduser@Inceptez ~]$ sqoop import-all-tables --connect jdbc:mysql://localhost/custdb --username root --password root --warehouse-dir '/user/hduser/sqoop/testtables2' \
>  --exclude-tables "customer_bkp,customer_bkp1,customer_details,customer_exp,customer_hdfs,customer_hdfs1,customer_stage,customer_tmp,customer_tmp_bkp,customer_tmp_bkp1,customerins,customerlm"  -m 1;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/27 16:14:07 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/27 16:14:07 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/27 16:14:07 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/27 16:14:08 INFO tool.CodeGenTool: Beginning code generation
20/09/27 16:14:08 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/27 16:14:08 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/27 16:14:08 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/251dc4098ba4a8a57d924dcecdf47fec/customer.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 16:14:10 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/251dc4098ba4a8a57d924dcecdf47fec/customer.jar
20/09/27 16:14:10 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/09/27 16:14:10 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/09/27 16:14:10 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/09/27 16:14:10 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/09/27 16:14:10 INFO mapreduce.ImportJobBase: Beginning import of customer
20/09/27 16:14:10 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/27 16:14:10 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/27 16:14:12 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/27 16:14:12 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 16:14:16 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/27 16:14:16 INFO mapreduce.JobSubmitter: number of splits:1
20/09/27 16:14:16 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601240743098_0026
20/09/27 16:14:17 INFO impl.YarnClientImpl: Submitted application application_1601240743098_0026
20/09/27 16:14:17 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601240743098_0026/
20/09/27 16:14:17 INFO mapreduce.Job: Running job: job_1601240743098_0026
20/09/27 16:14:27 INFO mapreduce.Job: Job job_1601240743098_0026 running in uber mode : false
20/09/27 16:14:27 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 16:14:36 INFO mapreduce.Job:  map 100% reduce 0%
20/09/27 16:14:36 INFO mapreduce.Job: Job job_1601240743098_0026 completed successfully
20/09/27 16:14:36 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=133512
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=516
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=6644
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=6644
		Total vcore-seconds taken by all map tasks=6644
		Total megabyte-seconds taken by all map tasks=6803456
	Map-Reduce Framework
		Map input records=12
		Map output records=12
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=807
		CPU time spent (ms)=1790
		Physical memory (bytes) snapshot=171532288
		Virtual memory (bytes) snapshot=2087264256
		Total committed heap usage (bytes)=110624768
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=516
20/09/27 16:14:36 INFO mapreduce.ImportJobBase: Transferred 516 bytes in 24.5834 seconds (20.9898 bytes/sec)
20/09/27 16:14:36 INFO mapreduce.ImportJobBase: Retrieved 12 records.
Skipping table: customer_bkp
Skipping table: customer_bkp1
Skipping table: customer_details
Skipping table: customer_exp
Skipping table: customer_hdfs
Skipping table: customer_hdfs1
Skipping table: customer_stage
Skipping table: customer_tmp
Skipping table: customer_tmp_bkp
Skipping table: customer_tmp_bkp1
Skipping table: customerins
Skipping table: customerlm
20/09/27 16:14:36 INFO tool.CodeGenTool: Beginning code generation
20/09/27 16:14:36 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customerlm1` AS t LIMIT 1
20/09/27 16:14:36 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/251dc4098ba4a8a57d924dcecdf47fec/customerlm1.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 16:14:37 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/251dc4098ba4a8a57d924dcecdf47fec/customerlm1.jar
20/09/27 16:14:37 INFO mapreduce.ImportJobBase: Beginning import of customerlm1
20/09/27 16:14:37 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 16:14:39 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/27 16:14:39 INFO mapreduce.JobSubmitter: number of splits:1
20/09/27 16:14:39 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601240743098_0027
20/09/27 16:14:39 INFO impl.YarnClientImpl: Submitted application application_1601240743098_0027
20/09/27 16:14:39 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601240743098_0027/
20/09/27 16:14:39 INFO mapreduce.Job: Running job: job_1601240743098_0027
20/09/27 16:14:51 INFO mapreduce.Job: Job job_1601240743098_0027 running in uber mode : false
20/09/27 16:14:51 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 16:14:59 INFO mapreduce.Job:  map 100% reduce 0%
20/09/27 16:15:00 INFO mapreduce.Job: Job job_1601240743098_0027 completed successfully
20/09/27 16:15:00 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=133539
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=714
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=4877
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=4877
		Total vcore-seconds taken by all map tasks=4877
		Total megabyte-seconds taken by all map tasks=4994048
	Map-Reduce Framework
		Map input records=11
		Map output records=11
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=83
		CPU time spent (ms)=1210
		Physical memory (bytes) snapshot=160460800
		Virtual memory (bytes) snapshot=2079703040
		Total committed heap usage (bytes)=108527616
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=714
20/09/27 16:15:00 INFO mapreduce.ImportJobBase: Transferred 714 bytes in 22.8923 seconds (31.1895 bytes/sec)
20/09/27 16:15:00 INFO mapreduce.ImportJobBase: Retrieved 11 records.
20/09/27 16:15:00 INFO tool.CodeGenTool: Beginning code generation
20/09/27 16:15:00 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customers` AS t LIMIT 1
20/09/27 16:15:00 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/251dc4098ba4a8a57d924dcecdf47fec/customers.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 16:15:00 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/251dc4098ba4a8a57d924dcecdf47fec/customers.jar
20/09/27 16:15:00 INFO mapreduce.ImportJobBase: Beginning import of customers
20/09/27 16:15:00 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 16:15:02 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/27 16:15:02 INFO mapreduce.JobSubmitter: number of splits:1
20/09/27 16:15:02 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601240743098_0028
20/09/27 16:15:03 INFO impl.YarnClientImpl: Submitted application application_1601240743098_0028
20/09/27 16:15:03 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601240743098_0028/
20/09/27 16:15:03 INFO mapreduce.Job: Running job: job_1601240743098_0028
20/09/27 16:15:15 INFO mapreduce.Job: Job job_1601240743098_0028 running in uber mode : false
20/09/27 16:15:15 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 16:15:22 INFO mapreduce.Job:  map 100% reduce 0%
20/09/27 16:15:22 INFO mapreduce.Job: Job job_1601240743098_0028 completed successfully
20/09/27 16:15:23 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=133644
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=150
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=4573
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=4573
		Total vcore-seconds taken by all map tasks=4573
		Total megabyte-seconds taken by all map tasks=4682752
	Map-Reduce Framework
		Map input records=4
		Map output records=4
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=107
		CPU time spent (ms)=1320
		Physical memory (bytes) snapshot=171601920
		Virtual memory (bytes) snapshot=2084438016
		Total committed heap usage (bytes)=117440512
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=150
20/09/27 16:15:23 INFO mapreduce.ImportJobBase: Transferred 150 bytes in 22.3443 seconds (6.7131 bytes/sec)
20/09/27 16:15:23 INFO mapreduce.ImportJobBase: Retrieved 4 records.
[hduser@Inceptez ~]$
[hduser@Inceptez ~]$ hadoop fs -ls /user/hduser/sqoop/testtables2
20/09/27 16:18:13 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Found 3 items
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:14 /user/hduser/sqoop/testtables2/customer
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:14 /user/hduser/sqoop/testtables2/customerlm1
drwxr-xr-x   - hduser hadoop          0 2020-09-27 16:15 /user/hduser/sqoop/testtables2/customers
[hduser@Inceptez ~]$

--## Exports customer, customerlm1, customers tables and rest all other tables are skipped as mentioned in sqoop command

--## Sqoop evaluation:

--## sqoop eval --connect jdbc:mysql://localhost/custdb --username root --password root --query "select * from customer ";

[hduser@Inceptez ~]$ sqoop eval --connect jdbc:mysql://localhost/custdb --username root --password root --query "select * from customer ";
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/27 16:15:10 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/27 16:15:10 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/27 16:15:10 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
-----------------------------------------------------------------------------------------------------------------------------
| custid      | firstname            | lastname             | city                 | age         | createdt   | transactamt | 
-----------------------------------------------------------------------------------------------------------------------------
| 1           | Arun                 | Kumar                | chennai              | 33          | 2017-09-20 | 100000      | 
| 2           | srini                | vasan                | chennai              | 33          | 2017-09-21 | 10000       | 
| 3           | vasu                 | devan                | banglore             | 39          | 2017-09-23 | 90000       | 
| 4           | mohamed              | imran                | hyderabad            | 33          | 2017-09-24 | 1000        | 
| 5           | arun                 | basker               | chennai              | 23          | 2017-09-20 | 200000      | 
| 6           | ramesh               | babu                 | manglore             | 39          | 2017-09-21 | 100000      | 
| 7           | inceptez             | tech                 | Chennai              | 3           | 2017-09-28 | 10000       | 
| 8           | Iz                   | tech                 | pune                 | 4           | 2017-09-28 | 10000       | 
| 9           | mohan                | kumar                | banglore             | 35          | 2017-09-29 | 500000      | 
| 10          | Mrityunjay           | Mohankumar           | Skhalli              | 3           | 2015-05-25 | 10000       | 
| 12          | Welcome              | Inceptez             | pune                 | 4           | 2017-09-28 | 10000       | 
| 13          | test                 | comp                 | chennai              | 10          | 2017-09-30 | 50000       | 
-----------------------------------------------------------------------------------------------------------------------------
[hduser@Inceptez ~]$ 

--## Batch export:
--## sqoop export -Dsqoop.export.statements.per.transaction=10 --connect jdbc:mysql://localhost/custdb --username root --password root --table customer --export-dir savedjob1 --batch

mysql> select * from customer;
+--------+------------+------------+-----------+------+------------+-------------+
| custid | firstname  | lastname   | city      | age  | createdt   | transactamt |
+--------+------------+------------+-----------+------+------------+-------------+
|      1 | Arun       | Kumar      | chennai   |   33 | 2017-09-20 |      100000 |
|      2 | srini      | vasan      | chennai   |   33 | 2017-09-21 |       10000 |
|      3 | vasu       | devan      | banglore  |   39 | 2017-09-23 |       90000 |
|      4 | mohamed    | imran      | hyderabad |   33 | 2017-09-24 |        1000 |
|      5 | arun       | basker     | chennai   |   23 | 2017-09-20 |      200000 |
|      6 | ramesh     | babu       | manglore  |   39 | 2017-09-21 |      100000 |
|      7 | inceptez   | tech       | Chennai   |    3 | 2017-09-28 |       10000 |
|      8 | Iz         | tech       | pune      |    4 | 2017-09-28 |       10000 |
|      9 | mohan      | kumar      | banglore  |   35 | 2017-09-29 |      500000 |
|     10 | Mrityunjay | Mohankumar | Skhalli   |    3 | 2015-05-25 |       10000 |
|     12 | Welcome    | Inceptez   | pune      |    4 | 2017-09-28 |       10000 |
|     13 | test       | comp       | chennai   |   10 | 2017-09-30 |       50000 |
+--------+------------+------------+-----------+------+------------+-------------+
12 rows in set (0.06 sec)

[hduser@Inceptez ~]$ hadoop fs -cat savedjob1/*
20/09/27 16:23:54 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
10,Mrityunjay,Mohankumar,Skhalli,3,2015-05-25,10000
[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ sqoop export -Dsqoop.export.statements.per.transaction=10 --connect jdbc:mysql://localhost/custdb --username root --password root --table customer --export-dir savedjob1 --batch
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/27 16:24:37 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/27 16:24:37 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/27 16:24:37 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/27 16:24:37 INFO tool.CodeGenTool: Beginning code generation
20/09/27 16:24:37 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/27 16:24:37 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer` AS t LIMIT 1
20/09/27 16:24:38 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/903c5c6677903c02aee84286c801d18f/customer.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 16:24:39 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/903c5c6677903c02aee84286c801d18f/customer.jar
20/09/27 16:24:39 INFO mapreduce.ExportJobBase: Beginning export of customer
20/09/27 16:24:40 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/27 16:24:40 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/27 16:24:41 INFO Configuration.deprecation: mapred.reduce.tasks.speculative.execution is deprecated. Instead, use mapreduce.reduce.speculative
20/09/27 16:24:41 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 16:24:41 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/27 16:24:41 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 16:24:45 INFO input.FileInputFormat: Total input paths to process : 1
20/09/27 16:24:45 INFO input.FileInputFormat: Total input paths to process : 1
20/09/27 16:24:45 INFO mapreduce.JobSubmitter: number of splits:4
20/09/27 16:24:45 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 16:24:46 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601240743098_0030
20/09/27 16:24:46 INFO impl.YarnClientImpl: Submitted application application_1601240743098_0030
20/09/27 16:24:46 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601240743098_0030/
20/09/27 16:24:46 INFO mapreduce.Job: Running job: job_1601240743098_0030
20/09/27 16:24:58 INFO mapreduce.Job: Job job_1601240743098_0030 running in uber mode : false
20/09/27 16:24:58 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 16:25:52 INFO mapreduce.Job:  map 50% reduce 0%
20/09/27 16:25:53 INFO mapreduce.Job:  map 75% reduce 0%
20/09/27 16:25:54 INFO mapreduce.Job:  map 100% reduce 0%
20/09/27 16:25:54 INFO mapreduce.Job: Job job_1601240743098_0030 completed successfully
20/09/27 16:25:54 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=533872
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=694
		HDFS: Number of bytes written=0
		HDFS: Number of read operations=16
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=0
	Job Counters 
		Launched map tasks=4
		Data-local map tasks=4
		Total time spent by all maps in occupied slots (ms)=206885
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=206885
		Total vcore-seconds taken by all map tasks=206885
		Total megabyte-seconds taken by all map tasks=211850240
	Map-Reduce Framework
		Map input records=1
		Map output records=1
		Input split bytes=552
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=12984
		CPU time spent (ms)=8690
		Physical memory (bytes) snapshot=670416896
		Virtual memory (bytes) snapshot=8339451904
		Total committed heap usage (bytes)=435683328
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=0
20/09/27 16:25:54 INFO mapreduce.ExportJobBase: Transferred 694 bytes in 73.445 seconds (9.4492 bytes/sec)
20/09/27 16:25:54 INFO mapreduce.ExportJobBase: Exported 1 records.
[hduser@Inceptez ~]$ 


mysql> select * from customer;
+--------+------------+------------+-----------+------+------------+-------------+
| custid | firstname  | lastname   | city      | age  | createdt   | transactamt |
+--------+------------+------------+-----------+------+------------+-------------+
|      1 | Arun       | Kumar      | chennai   |   33 | 2017-09-20 |      100000 |
|      2 | srini      | vasan      | chennai   |   33 | 2017-09-21 |       10000 |
|      3 | vasu       | devan      | banglore  |   39 | 2017-09-23 |       90000 |
|      4 | mohamed    | imran      | hyderabad |   33 | 2017-09-24 |        1000 |
|      5 | arun       | basker     | chennai   |   23 | 2017-09-20 |      200000 |
|      6 | ramesh     | babu       | manglore  |   39 | 2017-09-21 |      100000 |
|      7 | inceptez   | tech       | Chennai   |    3 | 2017-09-28 |       10000 |
|      8 | Iz         | tech       | pune      |    4 | 2017-09-28 |       10000 |
|      9 | mohan      | kumar      | banglore  |   35 | 2017-09-29 |      500000 |
|     10 | Mrityunjay | Mohankumar | Skhalli   |    3 | 2015-05-25 |       10000 |
|     12 | Welcome    | Inceptez   | pune      |    4 | 2017-09-28 |       10000 |
|     13 | test       | comp       | chennai   |   10 | 2017-09-30 |       50000 |
|     10 | Mrityunjay | Mohankumar | Skhalli   |    3 | 2015-05-25 |       10000 |
+--------+------------+------------+-----------+------+------------+-------------+
13 rows in set (0.00 sec)

mysql>

----------------------------------------------------------------------------------------------------------
--## Common Usecase 2:

Create the below Tables MYSQL for Import:
use custdb;
CREATE TABLE customers (custid INT,firstname VARCHAR(20),lastname VARCHAR(20),city varchar(50),age
int,createdt date );
CREATE TABLE customer_details (custid INT,firstname VARCHAR(20),fulladdress VARCHAR(200),category
varchar(50),transactiondt date,transactamt int,createdt date);
ALTER TABLE customers ADD PRIMARY KEY(custid);
insert into customers values(1,'karthik','vijay','chennai',5,'2018-02-01');
insert into customers values(2,'arun','kumar','chennai',25,'2018-01-30');
insert into customers values(3,'vishwa','ajit','hyderabad',null,'2018-02-03');
insert into customers values(4,'bala','palani','bangalore',30,'2018-02-02');
insert into customer_details values(1,'karthik','3/2, jeyaram street, chrompet,Chennai','household','2018-02-
01',4000,'2018-02-01');
insert into customer_details values(1,'karthik','3/2, jeyaram street, chrompet,Chennai 44','Automobile','2018-
02-02',6000,'2018-02-02');
insert into customer_details values(1,'karthik','3/2, jeyaram street, chrompet,Chennai 44','Foods','2018-02-
02',3000,'2018-02-02');
insert into customer_details values(1,'karthik','3/2, jeyaram street, chrompet,Chennai 44',null,'2018-02-
02',1000,'2018-02-03');
insert into customer_details values(2,'arun','11, palayam blvd, broadway,Chennai 01','tools','2018-02-
02',11000,'2018-02-03');
insert into customer_details values(2,'arun','11, palayam blvd, broadway,Chennai 01','electronics','2018-02-
02',15000,'2018-02-04');
insert into customer_details values(3,'vishwa','1A, Elango nagar, Vadapalani,Chennai 33','clothes','2018-02-
02',15000,'2018-02-04');

Select a.custid master_custid,a.firstname,b.custid detail_custid,a.createdt,a.age,category,transactamt 
  from customers a join customer_details b
    on a.custid=b.custid;

mysql> Select a.custid master_custid,a.firstname,b.custid detail_custid,a.createdt,a.age,category,transactamt
    -> from customers a join customer_details b
    -> on a.custid=b.custid;
+---------------+-----------+---------------+------------+------+-------------+-------------+
| master_custid | firstname | detail_custid | createdt   | age  | category    | transactamt |
+---------------+-----------+---------------+------------+------+-------------+-------------+
|             1 | karthik   |             1 | 2018-02-01 |    5 | household   |        4000 |
|             1 | karthik   |             1 | 2018-02-01 |    5 | Automobile  |        6000 |
|             1 | karthik   |             1 | 2018-02-01 |    5 | Foods       |        3000 |
|             1 | karthik   |             1 | 2018-02-01 |    5 | NULL        |        1000 |
|             2 | arun      |             2 | 2018-01-30 |   25 | tools       |       11000 |
|             2 | arun      |             2 | 2018-01-30 |   25 | electronics |       15000 |
|             3 | vishwa    |             3 | 2018-02-03 | NULL | clothes     |       15000 |
+---------------+-----------+---------------+------------+------+-------------+-------------+
7 rows in set (0.05 sec)

mysql> 

mysql> update customers set city =NULL WHERE custid=2;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customers;
+--------+-----------+----------+-----------+------+------------+
| custid | firstname | lastname | city      | age  | createdt   |
+--------+-----------+----------+-----------+------+------------+
|      1 | karthik   | vijay    | chennai   |    5 | 2018-02-01 |
|      2 | arun      | kumar    | NULL      |   25 | 2018-01-30 |
|      3 | vishwa    | ajit     | hyderabad | NULL | 2018-02-03 |
|      4 | bala      | palani   | bangalore |   30 | 2018-02-02 |
+--------+-----------+----------+-----------+------+------------+

mysql> Select a.custid master_custid,a.firstname,a.city,b.custid detail_custid,a.createdt,a.age,category,transactamt from customers a join customer_details b on a.custid=b.custid;
+---------------+-----------+-----------+---------------+------------+------+-------------+-------------+
| master_custid | firstname | city      | detail_custid | createdt   | age  | category    | transactamt |
+---------------+-----------+-----------+---------------+------------+------+-------------+-------------+
|             1 | karthik   | chennai   |             1 | 2018-02-01 |    5 | household   |        4000 |
|             1 | karthik   | chennai   |             1 | 2018-02-01 |    5 | Automobile  |        6000 |
|             1 | karthik   | chennai   |             1 | 2018-02-01 |    5 | Foods       |        3000 |
|             1 | karthik   | chennai   |             1 | 2018-02-01 |    5 | NULL        |        1000 |
|             2 | arun      | NULL      |             2 | 2018-01-30 |   25 | tools       |       11000 |
|             2 | arun      | NULL      |             2 | 2018-01-30 |   25 | electronics |       15000 |
|             3 | vishwa    | hyderabad |             3 | 2018-02-03 | NULL | clothes     |       15000 |
+---------------+-----------+-----------+---------------+------------+------+-------------+-------------+
7 rows in set (0.00 sec)

mysql>

--hadoop fs -text cust_details/part-m-0000*.gz  ( to view compress file records through text command)

--##Import Solution Command:
sqoop import --connect jdbc:mysql://localhost/custdb?zeroDateTimeBehavior=convertToNull --username root -P  \
--boundary-query "select min(custid), max(custid) from customers"  \
--query "Select a.custid master_custid,a.firstname,a.age,a.city,b.custid detail_custid,a.createdt,b.fulladdress,category,transactiondt,transactamt from customers a join customer_details b on a.custid=b.custid WHERE \$CONDITIONS" \
--split-by a.custid --target-dir cust_details --null-non-string '0' --null-string 'NA' --compress --direct --num-mappers 3 --fetch-size 100 --delete-target-dir;

[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb?zeroDateTimeBehavior=convertToNull --username root -P  \
> --boundary-query "select min(custid), max(custid) from customers"  \
> --query "Select a.custid master_custid,a.firstname,a.age,a.city,b.custid detail_custid,a.createdt,b.fulladdress,category,transactiondt,transactamt from customers a join customer_details b on a.custid=b.custid WHERE \$CONDITIONS" \
> --split-by a.custid --target-dir cust_details --null-non-string '0' --null-string 'NA' --compress --direct --num-mappers 3 --fetch-size 100 --delete-target-dir;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/27 17:13:02 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
Enter password: 
20/09/27 17:13:04 INFO manager.MySQLManager: Argument '--fetch-size 100' will probably get ignored by MySQL JDBC driver.
20/09/27 17:13:04 INFO tool.CodeGenTool: Beginning code generation
20/09/27 17:13:05 INFO manager.SqlManager: Executing SQL statement: Select a.custid master_custid,a.firstname,a.age,a.city,b.custid detail_custid,a.createdt,b.fulladdress,category,transactiondt,transactamt from customers a join customer_details b on a.custid=b.custid WHERE  (1 = 0) 
20/09/27 17:13:05 INFO manager.SqlManager: Executing SQL statement: Select a.custid master_custid,a.firstname,a.age,a.city,b.custid detail_custid,a.createdt,b.fulladdress,category,transactiondt,transactamt from customers a join customer_details b on a.custid=b.custid WHERE  (1 = 0) 
20/09/27 17:13:05 INFO manager.SqlManager: Executing SQL statement: Select a.custid master_custid,a.firstname,a.age,a.city,b.custid detail_custid,a.createdt,b.fulladdress,category,transactiondt,transactamt from customers a join customer_details b on a.custid=b.custid WHERE  (1 = 0) 
20/09/27 17:13:05 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/ab6e276d97ea1d2b859feee5c7f901f8/QueryResult.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 17:13:10 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/ab6e276d97ea1d2b859feee5c7f901f8/QueryResult.jar
20/09/27 17:13:10 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/27 17:13:13 INFO tool.ImportTool: Destination directory cust_details deleted.
20/09/27 17:13:13 INFO mapreduce.ImportJobBase: Beginning query import.
20/09/27 17:13:13 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/27 17:13:13 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/27 17:13:13 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 17:13:20 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/27 17:13:20 INFO db.DataDrivenDBInputFormat: BoundingValsQuery: select min(custid), max(custid) from customers
20/09/27 17:13:21 INFO mapreduce.JobSubmitter: number of splits:4
20/09/27 17:13:21 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601240743098_0034
20/09/27 17:13:23 INFO impl.YarnClientImpl: Submitted application application_1601240743098_0034
20/09/27 17:13:23 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601240743098_0034/
20/09/27 17:13:23 INFO mapreduce.Job: Running job: job_1601240743098_0034
20/09/27 17:13:40 INFO mapreduce.Job: Job job_1601240743098_0034 running in uber mode : false
20/09/27 17:13:40 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 17:15:10 INFO mapreduce.Job:  map 25% reduce 0%
20/09/27 17:15:13 INFO mapreduce.Job:  map 50% reduce 0%
20/09/27 17:15:15 INFO mapreduce.Job:  map 100% reduce 0%
20/09/27 17:15:16 INFO mapreduce.Job: Job job_1601240743098_0034 completed successfully
20/09/27 17:15:16 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=535244
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=425
		HDFS: Number of bytes written=372
		HDFS: Number of read operations=16
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=8
	Job Counters 
		Launched map tasks=4
		Other local map tasks=4
		Total time spent by all maps in occupied slots (ms)=357565
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=357565
		Total vcore-seconds taken by all map tasks=357565
		Total megabyte-seconds taken by all map tasks=366146560
	Map-Reduce Framework
		Map input records=7
		Map output records=7
		Input split bytes=425
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=63270
		CPU time spent (ms)=36330
		Physical memory (bytes) snapshot=676454400
		Virtual memory (bytes) snapshot=8339521536
		Total committed heap usage (bytes)=447741952
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=372
20/09/27 17:15:16 INFO mapreduce.ImportJobBase: Transferred 372 bytes in 123.4606 seconds (3.0131 bytes/sec)
20/09/27 17:15:16 INFO mapreduce.ImportJobBase: Retrieved 7 records.
[hduser@Inceptez ~]$
[hduser@Inceptez ~]$ hadoop fs -ls cust_details/*
20/09/27 17:17:07 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
-rw-r--r--   1 hduser hadoop          0 2020-09-27 17:15 cust_details/_SUCCESS
-rw-r--r--   1 hduser hadoop        137 2020-09-27 17:15 cust_details/part-m-00000.gz
-rw-r--r--   1 hduser hadoop        111 2020-09-27 17:15 cust_details/part-m-00001.gz
-rw-r--r--   1 hduser hadoop        104 2020-09-27 17:15 cust_details/part-m-00002.gz
-rw-r--r--   1 hduser hadoop         20 2020-09-27 17:15 cust_details/part-m-00003.gz
[hduser@Inceptez ~]$ hadoop fs -text cust_details/*
20/09/27 17:17:25 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1,karthik,5,chennai,1,2018-02-01,3/2, jeyaram street, chrompet,Chennai,household,0,4000
1,karthik,5,chennai,1,2018-02-01,3/2, jeyaram street, chrompet,Chennai 44,Automobile,0,6000
1,karthik,5,chennai,1,2018-02-01,3/2, jeyaram street, chrompet,Chennai 44,Foods,0,3000
1,karthik,5,chennai,1,2018-02-01,3/2, jeyaram street, chrompet,Chennai 44,NA,0,1000
2,arun,25,NA,2,2018-01-30,11, palayam blvd, broadway,Chennai 01,tools,0,11000
2,arun,25,NA,2,2018-01-30,11, palayam blvd, broadway,Chennai 01,electronics,0,15000
3,vishwa,0,hyderabad,3,2018-02-03,1A, Elango nagar, Vadapalani,Chennai 33,clothes,0,15000
[hduser@Inceptez ~]$


-----------------------------------------------------------------------------------------
--## Export Approach:
1. Import only the subset of columns from the customer table to the HDFS (custid, concatenation of firstname and lastname,age).
2. Export only subset of the above imported columns to the customer_exp table specifying only these 3 columns.
3. Use batch mode for fast export with the sqoop.export.records.per.statement=5.
4. Use staging table to provide consistent load with the clear staging table option to clean the table before each load.

--## Export Solution Command:
sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root --query " select custid,concat(firstname,' ',lastname),age from customers where \$CONDITIONS " --target-dir cust_exp --delete-target-dir -m 1;

[hduser@Inceptez ~]$ sqoop import --connect jdbc:mysql://localhost/custdb --username root --password root --query " select custid,concat(firstname,' ',lastname),age from customers where \$CONDITIONS " --target-dir cust_exp --delete-target-dir -m 1;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/27 18:16:59 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/27 18:16:59 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/27 18:17:00 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/27 18:17:00 INFO tool.CodeGenTool: Beginning code generation
20/09/27 18:17:00 INFO manager.SqlManager: Executing SQL statement:  select custid,concat(firstname,' ',lastname),age from customers where  (1 = 0)  
20/09/27 18:17:00 INFO manager.SqlManager: Executing SQL statement:  select custid,concat(firstname,' ',lastname),age from customers where  (1 = 0)  
20/09/27 18:17:00 INFO manager.SqlManager: Executing SQL statement:  select custid,concat(firstname,' ',lastname),age from customers where  (1 = 0)  
20/09/27 18:17:00 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/c31f6a3fa5213304a80b89d68b54680b/QueryResult.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 18:17:06 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/c31f6a3fa5213304a80b89d68b54680b/QueryResult.jar
20/09/27 18:17:06 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/27 18:17:08 INFO tool.ImportTool: Destination directory cust_exp deleted.
20/09/27 18:17:08 INFO mapreduce.ImportJobBase: Beginning query import.
20/09/27 18:17:08 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/27 18:17:08 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/27 18:17:08 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 18:17:20 INFO ipc.Client: Retrying connect to server: 0.0.0.0/0.0.0.0:8032. Already tried 0 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=10, sleepTime=1000 MILLISECONDS)
20/09/27 18:17:21 INFO ipc.Client: Retrying connect to server: 0.0.0.0/0.0.0.0:8032. Already tried 1 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=10, sleepTime=1000 MILLISECONDS)
20/09/27 18:17:22 INFO ipc.Client: Retrying connect to server: 0.0.0.0/0.0.0.0:8032. Already tried 2 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=10, sleepTime=1000 MILLISECONDS)
20/09/27 18:17:23 INFO ipc.Client: Retrying connect to server: 0.0.0.0/0.0.0.0:8032. Already tried 3 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=10, sleepTime=1000 MILLISECONDS)
20/09/27 18:17:24 INFO ipc.Client: Retrying connect to server: 0.0.0.0/0.0.0.0:8032. Already tried 4 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=10, sleepTime=1000 MILLISECONDS)
20/09/27 18:17:25 INFO ipc.Client: Retrying connect to server: 0.0.0.0/0.0.0.0:8032. Already tried 5 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=10, sleepTime=1000 MILLISECONDS)
20/09/27 18:17:26 INFO ipc.Client: Retrying connect to server: 0.0.0.0/0.0.0.0:8032. Already tried 6 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=10, sleepTime=1000 MILLISECONDS)
20/09/27 18:17:27 INFO ipc.Client: Retrying connect to server: 0.0.0.0/0.0.0.0:8032. Already tried 7 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=10, sleepTime=1000 MILLISECONDS)
20/09/27 18:17:28 INFO ipc.Client: Retrying connect to server: 0.0.0.0/0.0.0.0:8032. Already tried 8 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=10, sleepTime=1000 MILLISECONDS)
20/09/27 18:17:29 INFO ipc.Client: Retrying connect to server: 0.0.0.0/0.0.0.0:8032. Already tried 9 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=10, sleepTime=1000 MILLISECONDS)
20/09/27 18:17:36 INFO db.DBInputFormat: Using read commited transaction isolation
20/09/27 18:17:36 INFO mapreduce.JobSubmitter: number of splits:1
20/09/27 18:17:37 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601255818433_0001
20/09/27 18:17:38 INFO impl.YarnClientImpl: Submitted application application_1601255818433_0001
20/09/27 18:17:38 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601255818433_0001/
20/09/27 18:17:38 INFO mapreduce.Job: Running job: job_1601255818433_0001
20/09/27 18:17:52 INFO mapreduce.Job: Job job_1601255818433_0001 running in uber mode : false
20/09/27 18:17:52 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 18:18:00 INFO mapreduce.Job:  map 100% reduce 0%
20/09/27 18:18:00 INFO mapreduce.Job: Job job_1601255818433_0001 completed successfully
20/09/27 18:18:01 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=133326
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=70
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=5634
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=5634
		Total vcore-seconds taken by all map tasks=5634
		Total megabyte-seconds taken by all map tasks=5769216
	Map-Reduce Framework
		Map input records=4
		Map output records=4
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=215
		CPU time spent (ms)=1400
		Physical memory (bytes) snapshot=171520000
		Virtual memory (bytes) snapshot=2079723520
		Total committed heap usage (bytes)=110100480
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=70
20/09/27 18:18:01 INFO mapreduce.ImportJobBase: Transferred 70 bytes in 52.7298 seconds (1.3275 bytes/sec)
20/09/27 18:18:01 INFO mapreduce.ImportJobBase: Retrieved 4 records.
[hduser@Inceptez ~]$ 
[hduser@Inceptez ~]$ hadoop fs -ls cust_exp*
20/09/27 18:19:12 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Found 2 items
-rw-r--r--   1 hduser hadoop          0 2020-09-27 18:17 cust_exp/_SUCCESS
-rw-r--r--   1 hduser hadoop         70 2020-09-27 18:17 cust_exp/part-m-00000
[hduser@Inceptez ~]$ hadoop fs -cat cust_exp/*
20/09/27 18:19:27 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1,karthik vijay,5
2,arun kumar,25
3,vishwa ajit,null
4,bala palani,30
[hduser@Inceptez ~]$

sqoop export -Dsqoop.export.records.per.statement=5 --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_exp --export-dir cust_exp --batch --staging-table customer_stage --clear-staging-table --columns custid,fullname,age

[hduser@Inceptez ~]$ sqoop export -Dsqoop.export.records.per.statement=5 --connect jdbc:mysql://localhost/custdb --username root --password root --table customer_exp --export-dir cust_exp --batch --staging-table customer_stage --clear-staging-table --columns custid,fullname,age;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/27 18:22:47 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/27 18:22:47 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/27 18:22:48 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/27 18:22:48 INFO tool.CodeGenTool: Beginning code generation
20/09/27 18:22:48 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_exp` AS t LIMIT 1
20/09/27 18:22:48 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `customer_exp` AS t LIMIT 1
20/09/27 18:22:48 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/a5990fc9041e7dd9322ada7038601baf/customer_exp.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 18:22:50 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/a5990fc9041e7dd9322ada7038601baf/customer_exp.jar
20/09/27 18:22:50 INFO mapreduce.ExportJobBase: Data will be staged in the table: customer_stage
20/09/27 18:22:50 INFO mapreduce.ExportJobBase: Beginning export of customer_exp
20/09/27 18:22:50 INFO manager.SqlManager: Deleted 0 records from `customer_stage`
20/09/27 18:22:50 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/27 18:22:50 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/27 18:22:51 INFO Configuration.deprecation: mapred.reduce.tasks.speculative.execution is deprecated. Instead, use mapreduce.reduce.speculative
20/09/27 18:22:51 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 18:22:51 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/27 18:22:51 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 18:22:54 INFO input.FileInputFormat: Total input paths to process : 1
20/09/27 18:22:54 INFO input.FileInputFormat: Total input paths to process : 1
20/09/27 18:22:54 INFO mapreduce.JobSubmitter: number of splits:4
20/09/27 18:22:54 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 18:22:54 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601255818433_0002
20/09/27 18:22:55 INFO impl.YarnClientImpl: Submitted application application_1601255818433_0002
20/09/27 18:22:55 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601255818433_0002/
20/09/27 18:22:55 INFO mapreduce.Job: Running job: job_1601255818433_0002
20/09/27 18:23:02 INFO mapreduce.Job: Job job_1601255818433_0002 running in uber mode : false
20/09/27 18:23:02 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 18:23:23 INFO mapreduce.Job:  map 75% reduce 0%
20/09/27 18:23:24 INFO mapreduce.Job:  map 100% reduce 0%
20/09/27 18:23:24 INFO mapreduce.Job: Job job_1601255818433_0002 completed successfully
20/09/27 18:23:25 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=533756
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=824
		HDFS: Number of bytes written=0
		HDFS: Number of read operations=19
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=0
	Job Counters 
		Launched map tasks=4
		Data-local map tasks=4
		Total time spent by all maps in occupied slots (ms)=74269
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=74269
		Total vcore-seconds taken by all map tasks=74269
		Total megabyte-seconds taken by all map tasks=76051456
	Map-Reduce Framework
		Map input records=4
		Map output records=4
		Input split bytes=621
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=2847
		CPU time spent (ms)=4830
		Physical memory (bytes) snapshot=670781440
		Virtual memory (bytes) snapshot=8338456576
		Total committed heap usage (bytes)=444596224
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=0
20/09/27 18:23:25 INFO mapreduce.ExportJobBase: Transferred 824 bytes in 33.8011 seconds (24.3779 bytes/sec)
20/09/27 18:23:25 INFO mapreduce.ExportJobBase: Exported 4 records.
20/09/27 18:23:25 INFO mapreduce.ExportJobBase: Starting to migrate data from staging table to destination.
20/09/27 18:23:25 INFO manager.SqlManager: Migrated 4 records from `customer_stage` to `customer_exp`
[hduser@Inceptez ~]$ hadoop fs -cat cust_exp/*
20/09/27 18:25:22 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
1,karthik vijay,5
2,arun kumar,25
3,vishwa ajit,null
4,bala palani,30
[hduser@Inceptez ~]$

mysql> select * from customer_exp;
+--------+---------------+------+------+----------+
| custid | fullname      | city | age  | createdt |
+--------+---------------+------+------+----------+
|      4 | bala palani   | NULL |   30 | NULL     |
|      1 | karthik vijay | NULL |    5 | NULL     |
|      2 | arun kumar    | NULL |   25 | NULL     |
|      3 | vishwa ajit   | NULL | NULL | NULL     |
+--------+---------------+------+------+----------+
4 rows in set (0.00 sec)

mysql>

-----------------------------------------------------------------------------------------------------------
--## Usecase 3 : Exporting multiple tables using stored procedure
--## 1) Create file and type data into it
vi empinfo
101,raja,dept1,Accounts
102,vinay,dept2,Finanace
103,karthik,dept3,IT
104,bala,dept4,Marketing
Note: Delete the last blank line in the above file
--## 2) Create folder and copy file into hadoop
hadoop fs -mkdir -p /user/sqoop/spexport
hadoop fs -copyFromLocal -f empinfo /user/sqoop/spexport
--## 3) In MySQL create tables and stored procedure
mysql -u root -p
password: root
use custdb;
create table empinfo(empid int, empname varchar(20));
create table deptinfo(deptid varchar(10),deptname varchar(20));
delimiter //
create procedure sp_insert_empdeptinfo (IN pid int, IN pname varchar(20), IN pdeptid varchar(10), IN
pdeptname varchar(20))

---
[hduser@Inceptez ~]$ hadoop fs -mkdir -p  /user/sqoop/spexport
20/09/27 18:30:33 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
[hduser@Inceptez ~]$ hadoop fs -copyFromLocal -f empinfo /user/sqoop/spexport
20/09/27 18:31:48 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
[hduser@Inceptez ~]$ hadoop fs -cat /user/sqoop/spexport
20/09/27 18:32:02 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
cat: `/user/sqoop/spexport': Is a directory
[hduser@Inceptez ~]$ hadoop fs -cat /user/sqoop/spexport/*
20/09/27 18:32:10 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
101,raja,dept1,Accounts
102,vinay,dept2,Finanace
103,karthik,dept3,IT
104,bala,dept4,Marketing
[hduser@Inceptez ~]$

mysql> create table empinfo(empid int, empname varchar(20));
Query OK, 0 rows affected (0.00 sec)

mysql> create table deptinfo(deptid varchar(10),deptname varchar(20));
Query OK, 0 rows affected (0.01 sec)

mysql> delimiter //
mysql> create procedure sp_insert_empdeptinfo (IN pid int, IN pname varchar(20), IN pdeptid varchar(10), IN
    -> pdeptname varchar(20))
    -> BEGIN
    -> INSERT INTO empinfo(empid, empname) VALUES(pid, pname);
    -> INSERT INTO deptinfo(deptid,deptname) values(pdeptid, pdeptname);
    -> END //
Query OK, 0 rows affected (0.08 sec)

mysql> delimiter ;
mysql>

BEGIN
INSERT INTO empinfo(empid, empname) VALUES(pid, pname);
INSERT INTO deptinfo(deptid,deptname) values(pdeptid, pdeptname);
END //
delimiter ;



--## 4) Export the data from the file to the mysql stored procedure to load data into two tables using SQOOP
sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --call sp_insert_empdeptinfo --export-dir /user/sqoop/spexport -m 1;

[hduser@Inceptez ~]$ sqoop export --connect jdbc:mysql://localhost/custdb --username root --password root --call sp_insert_empdeptinfo --export-dir /user/sqoop/spexport -m 1;
Warning: /usr/local/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/local/sqoop/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /usr/local/sqoop/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /usr/local/sqoop/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/09/27 18:38:16 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6
20/09/27 18:38:16 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/09/27 18:38:16 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/09/27 18:38:16 INFO tool.CodeGenTool: Beginning code generation
20/09/27 18:38:17 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/local/hadoop
Note: /tmp/sqoop-hduser/compile/8352bab987732f43ae5bf78c1068164f/QueryResult.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/09/27 18:38:18 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-hduser/compile/8352bab987732f43ae5bf78c1068164f/QueryResult.jar
20/09/27 18:38:19 INFO mapreduce.ExportJobBase: Beginning export of null
20/09/27 18:38:19 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/09/27 18:38:19 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/09/27 18:38:20 INFO Configuration.deprecation: mapred.reduce.tasks.speculative.execution is deprecated. Instead, use mapreduce.reduce.speculative
20/09/27 18:38:20 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 18:38:20 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/09/27 18:38:20 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/09/27 18:38:22 INFO input.FileInputFormat: Total input paths to process : 1
20/09/27 18:38:22 INFO input.FileInputFormat: Total input paths to process : 1
20/09/27 18:38:23 INFO mapreduce.JobSubmitter: number of splits:1
20/09/27 18:38:23 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/09/27 18:38:23 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1601255818433_0003
20/09/27 18:38:23 INFO impl.YarnClientImpl: Submitted application application_1601255818433_0003
20/09/27 18:38:23 INFO mapreduce.Job: The url to track the job: http://Inceptez:8088/proxy/application_1601255818433_0003/
20/09/27 18:38:23 INFO mapreduce.Job: Running job: job_1601255818433_0003
20/09/27 18:38:33 INFO mapreduce.Job: Job job_1601255818433_0003 running in uber mode : false
20/09/27 18:38:33 INFO mapreduce.Job:  map 0% reduce 0%
20/09/27 18:38:39 INFO mapreduce.Job:  map 100% reduce 0%
20/09/27 18:38:39 INFO mapreduce.Job: Job job_1601255818433_0003 completed successfully
20/09/27 18:38:39 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=133453
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=229
		HDFS: Number of bytes written=0
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=0
	Job Counters 
		Launched map tasks=1
		Data-local map tasks=1
		Total time spent by all maps in occupied slots (ms)=3580
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=3580
		Total vcore-seconds taken by all map tasks=3580
		Total megabyte-seconds taken by all map tasks=3665920
	Map-Reduce Framework
		Map input records=4
		Map output records=4
		Input split bytes=131
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=88
		CPU time spent (ms)=920
		Physical memory (bytes) snapshot=167952384
		Virtual memory (bytes) snapshot=2082996224
		Total committed heap usage (bytes)=112721920
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=0
20/09/27 18:38:39 INFO mapreduce.ExportJobBase: Transferred 229 bytes in 19.0499 seconds (12.021 bytes/sec)
20/09/27 18:38:39 INFO mapreduce.ExportJobBase: Exported 4 records.
[hduser@Inceptez ~]$ 


--## 5) In mysql,select both the table empinfo and deptinfo to see the records
--## select * from empinfo;
--## select * from deptinfo;

mysql> select * from empinfo;
+-------+---------+
| empid | empname |
+-------+---------+
|   101 | raja    |
|   102 | vinay   |
|   103 | karthik |
|   104 | bala    |
+-------+---------+
4 rows in set (0.00 sec)

mysql> select * from deptinfo;
+--------+-----------+
| deptid | deptname  |
+--------+-----------+
| dept1  | Accounts  |
| dept2  | Finanace  |
| dept3  | IT        |
| dept4  | Marketing |
+--------+-----------+
4 rows in set (0.00 sec)

mysql>
