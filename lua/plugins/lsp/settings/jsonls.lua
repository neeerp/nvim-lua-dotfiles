local schemas = {
	{
		description = "NPM configuration file",
		fileMatch = {
			"package.json",
		},
		url = "https://json.schemastore.org/package.json",
	},
	{
		description = "Typescript Compiler",
		fileMatch = {
			"tsconfig.json",
			"tsconfig.*.json",
		},
		url = "https://json.schemastore.org/tsconfig.json",
	},
	{
		description = "Prettier config",
		fileMatch = {
			".prettierrc",
			".prettierrc.json",
			"prettier.config.json",
		},
		url = "https://json.schemastore.org/prettierrc",
	},
	{
		description = "AWS CloudFormation provides a common language for you to describe and provision all the infrastructure resources in your cloud environment.",
		fileMatch = {
			"*.cf.json",
			"cloudformation.json",
		},
		url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/cloudformation.schema.json",
	},
	{
		description = "The AWS Serverless Application Model (AWS SAM, previously known as Project Flourish) extends AWS CloudFormation to provide a simplified way of defining the Amazon API Gateway APIs, AWS Lambda functions, and Amazon DynamoDB tables needed by your serverless application.",
		fileMatch = {
			"serverless.template",
			"*.sam.json",
			"sam.json",
		},
		url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/sam.schema.json",
	},
}

local opts = {
	settings = {
		json = {
			schemas = schemas,
		},
	},
}
return opts
