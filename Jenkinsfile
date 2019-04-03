node{
	stage('SCM Checkout'){
	git credentialsId: '704e8946-62cb-463c-b0ad-c03bf5b21039', url: 'https://github.com/Crustacean/tryWebDeploy.git'
	}
	stage('mvn package'){
	def mvnHome = tool name: 'M3', type: 'maven'
	def mvnCMD = "${mvnHome}/bin/mvn"
	bat "${mvnCMD} clean install"
	bat "${mvnCMD} clean package"
	}
	stage('Build Docker image'){
	bat "docker build -t em22435/webapp:1.0.${BUILD_NUMBER} ."
	}
	stage('Push Docker image'){
	withCredentials([string(credentialsId: 'dockerLogin', variable: 'dockerPwd')]) {
	bat "docker login --username em22435 --password ${dockerPwd}"
	}
	bat "docker push em22435/webapp:1.0.${BUILD_NUMBER}"
	}
	stage('Run Container on Dev Env'){
	bat "docker container run -p 9180:8080 -d em22435/webapp:1.0.${BUILD_NUMBER}"
	}
}
