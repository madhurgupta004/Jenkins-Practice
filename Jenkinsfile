import hudson.model.FileParameterDefinition

// Define the file parameter with the correct constructor
properties([
    parameters([
        new FileParameterDefinition(
            'INPUT_FILE',           // Parameter name (also the default file name in workspace)
            'Upload your input file here'  // Description
        )
    ])
])

node {
    def pythonCmd = 'python'  // Adjust to 'python3' if needed

    stage('Setup Environment') {
        try {
            sh "${pythonCmd} --version"
        } catch (Exception e) {
            echo "Python not found: ${e.message}"
            error "Install Python on the agent (e.g., 'sudo apt install python3')"
        }
    }

    stage('Prepare File') {
        // The uploaded file is named 'INPUT_FILE' in the workspace
        // Move it to 'input.txt' for consistency with the Python script
        def fileName = 'temp.txt'
        sh """
        pwd; 
        ls;
        """
        if (fileExists(fileName)) {
            sh "mv ${fileName} input.txt"
        } else {
            error "Uploaded file 'INPUT_FILE' not found in workspace."
        }
    }

    stage('Run Python Script') {
        try {
            if (!fileExists('process_file.py')) {
                error "Python script 'process_file.py' not found."
            }
            def result = sh(script: "${pythonCmd} process_file.py --file input.txt", returnStatus: true)
            if (result != 0) {
                echo "Python script failed (e.g., empty file)."
                currentBuild.result = 'FAILURE'
                error "Build failed with exit code: ${result}"
            } else {
                echo "Python script executed successfully."
            }
        } catch (Exception e) {
            echo "Error: ${e.message}"
            currentBuild.result = 'FAILURE'
            throw e
        }
    }
}