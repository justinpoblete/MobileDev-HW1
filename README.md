# MobileDev-HW1
HW Assignment #1

In this assignment, you are asked to implement a REST server which will manage the following Claim entity in its SQLite3 database:  

Property Name	Description	Data Type
id	Unique claim id, randomly generated UUID	UUID
title	Claim tile, brief description about the claim	String
date	The data (format “yyyy MM-dd”) when the claim happens	String 
isSolved	This indicates if the claim is closed 	boolean

Like the server we implemented in the class, the server exposed two services for clients to call whose specification is defined in the following table.  

Service Name	HTTP Request	HTTP Response
	Method	Parameters	Format	Data
		Format	Data		
/ClaimService/add	POST	JSON	Claim object without id and isSolved (encoded string)	Plain Text	Same as the server we implemented
/ClaimService/getAll	GET	N/A	N/A	JSON	List of Claim objects (encoded string)

Please note that id and isSolved of the input Claim object will be initialized by the server before inserting the Claim object into its database. You need to use Swift UUID class to generate a random UUID object and assign it to the id of the Claim object. On the other hand, the isSolved property should be initialized as false. 

Since SQLite3 database does not support UUID type, you will use a Text column to store the string representation of UUID. Because of this, you need to do a type conversion between UUID and Text to insert/retrieve a Claim record into/from the database (pls refer to Apple UUID Documentation). For boolean property, you can store it as an SQLite3 integer. 

You can follow the development steps that we use in the class for your implementation. 
