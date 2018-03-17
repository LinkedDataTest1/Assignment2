#!/bin/bash

#Name: testAssignment2.sh
#Description: Validates that the assignment files exist and are correct
#Parameters: None
#Output: Descriptions of errors found
#Exit Value: Number of errors found, 0 if the files were correct

#Check username of pull-request
errors=0
missingrdf=false
missingttl=false
username=LuisFernando100
#Check files exist
#	{username}.rdf
if [ ! -f $username.rdf ]
then
    echo "RDF file missing. Make sure it has the correct format" $username.rdf
	missingrdf=true
	errors=$((errors+1))
fi

#	{username}.ttl
if [ ! -f $username.ttl ]
then
    echo "TTL file missing. Make sure it has the correct format" $username.ttl
	missingttl=true
	errors=$((errors+1))
fi
#	{username}.png
if [ ! -f $username.png ]
then
    echo "PNG file missing. Make sure it has the correct format" $username.png
	errors=$((errors+1))
fi

#Validate rdf
if [ "$missingrdf" != true ]
then
	curl
fi
#Validate ttl
if [ "$missingttl" != true ]
then
	curl
fi

#Add name to report file if it doesnt exist with field of correct or incorrect build

exit $errors

curl -H "Authorization: token ${TOKEN}" -X POST -d "{\"body\": \" $msg \"}" "https://api.github.com/repos/LinkedDataTest1/Assignment1/commits/a67737fc8ec63252a0e5ef1782065e119c15d153/comments"

ontology="<?xml+version=\"1.0\"+encoding=\"UTF-8\"?><rdf:RDF++xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"++xml:base=\"http://upm.fi/wsld/ass2.rdf\"><rdf:Description+rdf:about=\"ass2.rdf#Class01\">	<rdf:includes+rdf:resource=\"ass2.rdf#Sensor029\"/>	<rdf:includes+rdf:resource=\"ass2.rdf#Computer101\"/></rdf:Description><rdf:Description+rdf:about=\"ass2.rdf#Sensor029\">	<rdf:hasMeasurement+rdf:resource=\"ass2.rdf#Measurement8401\"/></rdf:Description><rdf:Description+rdf:about=\"ass2.rdf#Measurement8401\">	<rdf:hasTemperature+rdf:datatype=\"xsd:int\">29</rdf:hasTemperature>	<rdf:atTime+rdf:datatype=\"xsd:dateTime\">2010-06-12T12:00:12</rdf:atTime></rdf:Description><rdf:Description+rdf:about=\"ass2.rdf#Computer101\">	<rdf:hasOwner+rdf:resource=\"ass2.rdf#User10A\"/></rdf:Description><rdf:Description+rdf:about=\"ass2.rdf#User10A\">	<rdf:hasName+rdf:datatype=\"xsd:string\">Pedro</rdf:hasName></rdf:Description></rdf:RDF>"

profile="OWL2"
reportsyntax="Manchester"

url="http://visualdataweb.de/validator/validate"

curl -v --cookie="JSESSIONID=516DC425950DEF41F97B5CC6D7621165" "USER_TOKEN=Yes" -X POST -d "{\"ontology\": \"$ontology\" \"profile\": \"$profile\" \"reportsyntax\": \"$reportsyntax\"}" $url




