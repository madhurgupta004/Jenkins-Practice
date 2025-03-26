pipeline {
    agent any
    parameters {
        file(name: 'CODEOWNER', description: 'Upload codeowner file')
    }
    stages {
        stage('Run Python Script') {
            steps {
                script {
                    
                    withFileParameter('CODEOWNER') {
                        sh"""
                        
                        echo $CODEOWNER
                        """
                    }
                }
            }
        }
    }
}
