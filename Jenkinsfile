podTemplate(yaml: '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: docker
    image: docker:19.03.1-dind
    securityContext:
      privileged: true
    env:
      - name: DOCKER_TLS_CERTDIR
        value: ""
''') {
    node(POD_LABEL) {
        container('docker') {
            stage(" Checkout"){
                checkout([$class: 'GitSCM', branches: [[name: '*/dev']],
                userRemoteConfigs: [[url: 'https://github.com/TiestoVarn/diplom.git']]])
            }
//             stage("Compile"){
//                 sh "pwd & ls -la"
//                 sleep 13
//             }
            stage("Build && Push images") {
                  docker.withRegistry('https://registry.hub.docker.com', 'DockerHubCreeds') {
                  def newApp = docker.build "tiestovarn/docker:${env.BUILD_TAG}"
                  newApp.push()
                 }
            }
//             stage("Deploy"){
//                 sleep 62 
//             }
        }
    }
}
