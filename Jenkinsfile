pipeline {
    agent any

    environment {
        IMAGE_NAME = 'nyssanbekova-laura-student-api'
        IMAGE_TAG = 'v1.0-laura'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Student: Laura Nyssanbekova'
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'gradle --no-daemon clean bootJar'
            }
        }
        stage('Test') {
            steps {
                sh 'gradle --no-daemon test'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
            }
        }
        stage('Verify') {
            steps {
                sh 'docker image inspect ${IMAGE_NAME}:${IMAGE_TAG} >/dev/null'
                sh 'docker image ls ${IMAGE_NAME}:${IMAGE_TAG}'
                echo 'Docker image verification passed for Laura Nyssanbekova.'
            }
        }
    }

    post {
        success {
            echo 'CI pipeline completed successfully for Laura Nyssanbekova.'
        }
        failure {
            echo 'CI pipeline failed. Check the stage and console output above.'
        }
    }
}
