# Import the SqlServer module
Import-Module SqlServer;

# Define the SQL Server instance, database, and query
SqlServerInstance="DESKTOP-UAJPTN1";
DatabaseName="Test";
QueryToExecute="SELECT * FROM Persons";

# Define the connection string
ConnectionString="Server=$SqlServerInstance;Database=$DatabaseName;Integrated Security=True";

# Execute the query using Invoke-Sqlcmd
results=Invoke-Sqlcmd -Query $QueryToExecute -ConnectionString $ConnectionString;

# Display the results
$results
