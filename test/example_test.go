package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformExample(t *testing.T) {
	// Arrange
	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/linux/.",
		Vars: map[string]interface{}{
			"resource-group-name": "tfmodulevalidation-test-group",
			"appName": "linuxWebAppSample",
			"environment": "test",
			"location": "westus2",
			"shortName": "blah",
			"emailName": "TestEmail",
			"emailAddress": "test@alaskaair.com",
			"kind": "Linux",
			"autoScaleNotifyEmails": ["test@alaskaair.com"],
			"appType": "site",
			"runtime": "NODE|12.9",
		},
	}
	defer terraform.Destroy(t, terraformOptions)

	// Act
	terraform.InitAndApply(t, terraformOptions)

	// Assert
	assert := assert.New(t)

	outputValue := terraform.Output(t, terraformOptions, "appserviceid")
	assert.NotNil(outputValue)
	assert.contains("linuxWebAppSample", outputValue)
}
