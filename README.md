# ScriptCreationTool
A tool for making scripts executable
This is a quick app I wrote for making scripts executable. 

The main script so far contains this simple code written in Bash.
```
#!/bin/bash
echo 'Please enter a valid path to your script(s).'
read path 
echo $path | java -jar ConvertToExecutable.jar
```
ConvertToExecutable is a simple class that does a few things.

 * This java app will run a special command
 * that will change the properties of files
 * in a given directory with specific properties
 * For compactness, all code will be placed within
 * one file.
 * 
 * This is not meant to be run by a normal user.
 * Another scrip will run this app.
 * With that being noted, certain variables will
 * be initialized without asking requesting data
 * from STDOUT.
 * 
 * All files that are to be executable should
 * have the .sh extention. All files must also not
 * contain any empty spaces.

``` 
package bundle;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

public class ConvertToExecutable
{
    static String path;
    static File directory;
    static File[] listOfFiles;
    static Scanner sc;
    static Runtime run;
    
	public static void main(String[] args)
	{
        sc = new Scanner(System.in);
        path = sc.next();       
        directory = new File(path);
        listOfFiles = directory.listFiles();
        run = Runtime.getRuntime();
        
        for (File script: listOfFiles)
        {
            try
	    {
	        run.exec("chmod u+x " + script);
                System.out.println(script + " has been set as executable.");
            } catch (IOException e)
	    {
	        e.printStackTrace();
            }
        }
 }

}

```
Simply open up a terminal, cd to the folder ScriptCreationTool, and type ./
