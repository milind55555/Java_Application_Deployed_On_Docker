aws s3 cp s3://codepipeline-us-east-1-831652875528/tomcat/ROOT.war /tmp
sudo mv /tmp/ROOT.war /usr/share/tomcat/webapps/ROOT.war
sudo service tomcat restart
