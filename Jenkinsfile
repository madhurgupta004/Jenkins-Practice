pipeline {
    agent any
    parameters {
        base64File(name: 'CODEOWNER', description: 'Upload codeowner file')
    }
    stages {
        stage('Run Python Script') {
            steps {
                script {
                    
                    withFileParameter('CODEOWNER') {
                        sh 'cat $CODEOWNER > temp.txt'
                        // def content = readFile(file: temp.txt)
                        
                        // Use the content
                        // echo "File content: ${content}"
                    }
                    sh 'cat temp.txt'
                    // def base64Content = env.CONFIG_FILE_BASE64
                    // def content = new String(base64Content.decodeBase64())
                }
            }
        }
    }
}
