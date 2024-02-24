# ECS Standard/Rolling Deployment using CodePipeline

We create a CodePipeline pipeline to automate the deployment.
The pipeline has three stages. For Source stage we use CodeCommit,
for Build stage we use CodeBuild, For Deploy stage we use ECS.

Wait, where is CodeDeploy ?? Well, CodeDeploy isn't supported for ECS
rolling deployment. ECS directly has capabilites to create new
task revision and update a service based on the revised task definition.

## How to setup everything

-   Go to ECS and create a cluster. For infrastructure choose fargate / EC2 asg
-   Create a task definition. Create a service based on this task definition
-   Select the cluster. Create a service. Specify the number of tasks
-   In the deployment options, select Rolling deployment
-   Create a CodePipeline pipeline. For source select CodeCommit, for build select CodeBuild
-   For deploy, select ECS, specify cluster name and service name

## Deployment Flow

-   Source code is pushed to a CodeCommit repository
-   This push triggers the CodePipeline Source stage
-   At the end of the Source stage, code is stored in SourceArtifact in zipped format
-   In Build stage in CodeBuild, a docker image is created from the source and then pushed to ECR
-   An imagedefintions.json file is created containing newly created docker image info
-   During deploy stage, this imagedefintions.json file is received by ECS
-   ECS first creates a task definition revision with the information provided in the imagedefinions.json file
-   ECS then starts updating the service. It creates new task sets first and then removes the old task sets
