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
sleep 2
username=$(curl -s -X GET "https://api.github.com/repos/${TRAVIS_REPO_SLUG}/pulls/${TRAVIS_PULL_REQUEST}" | jq -r '.user.login')
#Check files exist
#	{username}.rdf
if [ ! -f "$username.rdf" ]
then
    echo "RDF file missing. Make sure it has the correct format" $username.rdf
	missingrdf=true
	errors=$((errors+1))
fi

#	{username}.ttl
if [ ! -f "$username.ttl" ]
then
    echo "TTL file missing. Make sure it has the correct format" $username.ttl
	missingttl=true
	errors=$((errors+1))
fi
#	{username}.png
if [ ! -f "$username.png" ]
then
    echo "PNG file missing. Make sure it has the correct format" $username.png
	errors=$((errors+1))
fi

#Validate rdf and ttl
if [ "$missingrdf" != true ] && [ "$missingttl" != true ]
then
	java -cp ./test/jena-1.jar Test $username
	if [[ $? -ne 0 ]]
	then
		errors=$((errors+1))
	fi
fi

#Add name to report file if it doesnt exist with field of correct or incorrect build


exit $errors
