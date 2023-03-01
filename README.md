# AzureDevOps-ServerlessSQLPool-HomemadeDBProject

Example of a homemade database project that you can use create a dacpac file and deploy it to an Azure Synapse serverless SQL Pool using Azure DevOps. Based on a blog post I wrote called '[Homemade serverless SQL Pool Database Project](https://www.kevinrchant.com/2023/02/28/homemade-serverless-sql-pool-database-project/)'

You can find the YAML file which you can use as a template to perform CI/CD using Azure pipelines in the AzureDevOpsTemplates folder.

First the pipeline creates a dacpac based on the database project. It then deploys the contents of the dacpac to a database in the same  serverless SQL Pool.

**Note** that at this moment in time it appears that **creating external File Formats** using T-SQL are **not** supported. However, creating data sources is fine. So, you can still create views. Which is what I show in this example.

One workaround you might want to consider is creating external File Formats and Tables in a Post installation script.

I recommend using self-hosted agent with the latest versions of SQLPackage and the .NET SDK installed.

Please note that you need the below variables created for this to work
I recommend doing this by creating at least one variable group
  * agentpool - The name of the pool your local Azure DevOps Agent has been setup in
  * BuildConfiguration - Configuration you want the build to be (e.g. Release)
  * SQLPoolartifactname - Name you want to five the created artifact
  * AzureSubscription - The Azure subscription you use, either it's full name or a service connection. However, if using the full name for the variable it cannot be secret. You will also need to give your pipeline permission when you first run it. I recommend creating a service connection in Project settings with an anonymous name instead of using full account details.
  * SQLPoolEndPoint - Your serverless SQL Pool endpoint
  * DestinationDB - The database you want the update deployed to in the serverless SQL Pool
  * SQLPooluser - User name to connect to the dedicated SQL Pool endpoint, try and keep this secret
  * SQLPoolpw - Password of above user, definitely keep this one secret
  * DacpacFile - Name of the dacpac file, typicall the same name as the sqlproj file (e.g. ServerlessSQLPool-HomemadeProject.dacpac )

Note that you can extend this however you see fit. For example, you can experiment with other objects that you can deploy.
