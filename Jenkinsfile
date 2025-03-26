import hudson.model.FileParameterDefinition

// Define the file parameter programmatically
properties([
    parameters([
        new FileParameterDefinition(
            'INPUT_FILE',           // Parameter name
            'input.txt',            // File location in the workspace
            'Upload your input file here'  // Description
        )
    ])
])

node {
    // Define Python command (adjust if needed, e.g., 'python3')
    def pythonCmd = 'python'
    def pythonFileName = 'run.py'

    stage('Setup Environment') {
        try {
            // Verify Python is available
            sh "${pythonCmd} --version"
        } catch (Exception e) {
            echo "Python not found or misconfigured: ${e.message}"
            error "Please ensure Python is installed on the agent (e.g., 'sudo apt install python3')"
        }
    }

    stage('Run Python Script') {
        try {
            // Ensure the Python script exists (assumes it's in the repo)
            if (!fileExists(pythonFileName)) {
                error "Python script ${pythonFileName} not found in workspace. Please add it to your repository."
            }

            // Run the Python script with the file path
            def result = sh(script: "${pythonCmd} ${pythonFileName} --file input.txt", returnStatus: true)
            
            // Check the script's exit code
            if (result != 0) {
                echo "Python script indicated a failure (e.g., empty file)."
                currentBuild.result = 'FAILURE'
                error "Build failed due to Python script exit code: ${result}"
            } else {
                echo "Python script executed successfully."
            }
        } catch (Exception e) {
            echo "Error during execution: ${e.message}"
            currentBuild.result = 'FAILURE'
            throw e
        }
    }
}