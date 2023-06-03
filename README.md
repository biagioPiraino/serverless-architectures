# Serverless Architectures
<h3>Description</h3>
Develop AWS <strong>Serverless Architectures</strong> using <strong>Terraform</strong>.

<h3>Architectures Developed</h3>
<table>
<thead>
  <tr>
    <th>Architecture</th>
    <th>Integrations</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>API Gateway</td>
    <td>AWS Lambda Function, AWS DynamoDB</td>
  </tr>
</tbody>
</table>

<hr>
<h3>How to use</h3>
<table>
<thead>
  <tr>
    <th>Architecture</th>
    <th>Instructions</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>api-requests</td>
    <td>
      <ol>
        <li>
            Create the <a href="https://developer.hashicorp.com/terraform/cli/config/environment-variables">environment variables</a>
            specifying the <em>region_deployment</em> 
            and an AWS account's <em>access_key</em> and <em>secret_key</em>.
        </li>
        <li>
            Modify the Lambda deployment package according to your needs.
        </li>
        <li>
          Create a Lambda package by running the <code>deploy_lambda_package.sh</code> script.
        </li>
        <li>
            Run <em>terraform init</em> -> <em>terraform plan</em> -> <em>terraform apply</em> from your terminal.
        </li>
        <li>
            Create a .venv folder in the projects' root folder and create a virtual environment by running the command <code>$ virtualenv .venv</code>.
        </li>
        <li>
          Activate the virtual environment using <code>$ source .venv/bin/activate</code>.
        </li>
        <li>
Install the <a href="https://flask.palletsprojects.com/en/2.3.x/installation/" target="_blank"><em>Flask</em></a> and <a href="https://pypi.org/project/python-dotenv/" target="_blank"><em>dotenv</em></a> packages.
        </li>
        <li> 
          Modify the HTTP GET and POST requests in the Flask App to meet your needs.
        </li>
      </ol>
    </td>
  </tr>
</tbody>
</table>

<hr>
<h3>References</h3>
<table>
<thead>
  <tr>
    <th>References</th>
  </tr>
</thead>
<tbody>
<tr>
    <td>
      <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html" target="_blank" rel="noopener noreferrer">Define Lambda function's role</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function" target="_blank" rel="noopener noreferrer">Define a Lambda function using Terraform</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission" target="_blank" rel="noopener noreferrer">Define Lambda function's permissions using Terraform</a>
    </td>
  </tr>
    <tr>
    <td>
      <a href="https://docs.aws.amazon.com/lambda/latest/dg/API_CreateFunction.html#SSS-CreateFunction-request-Runtime" target="_blank" rel="noopener noreferrer">Working with Lambda functions, developer reference</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html" target="_blank" rel="noopener noreferrer">Define API Gateway permissions</a>
    </td>
  </tr>
    <tr>
    <td>
      <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-stages.html" target="_blank" rel="noopener noreferrer">Setting a stage for an API Gateway</a>
    </td>
  </tr>
   <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api">Create an API Gateway in Terraform</a>
    </td>
  </tr>
  
   <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_route">Create API Gateway routes in Terraform</a>
    </td>
  </tr>
  
  <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_integration">Create API Gateway integrations in Terraform</a>
    </td>
  </tr>
  
  <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage">Create API Gateway stage in Terraform</a>
    </td>
  </tr>
  
  <tr>
    <td>
      <a href="https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_AttributeDefinition.html">Define DynamoDB attributes</a>
    </td>
  </tr>
  
   <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table">Create a DynamoDB table in Terraform</a>
    </td>
  </tr>
  
</tbody>
</table>
