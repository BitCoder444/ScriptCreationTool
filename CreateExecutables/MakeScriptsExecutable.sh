#!/bin/bash
echo 'Please enter a valid path to your script(s).'
read path
echo $path | java -jar ConvertToExecutable.jar
