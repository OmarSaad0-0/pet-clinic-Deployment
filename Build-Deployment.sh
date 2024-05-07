#!/bin/bash

# Clone the repository
cd /home/saad/DummyApp
git clone https://github.com/spring-projects/spring-petclinic
cd spring-petclinic

# Update pom.xml to change packaging to 'war' and exclude embedded container
sed -i '/<\/parent>/a \    <packaging>war<\/packaging>' pom.xml
sed -i '/<\/dependencies>/i \
    <dependency> \
        <groupId>org.springframework.boot</groupId> \
        <artifactId>spring-boot-starter-tomcat</artifactId> \
        <scope>provided</scope> \
    </dependency>' pom.xml
cd /home/saad/DummyApp/spring-petclinic/src/main/java/org/springframework/samples/petclinic
sed -i '/import org.springframework.web.servlet.i18n.SessionLocaleResolver;/a import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;' PetClinicApplication.java
sed -i '/public class PetClinicApplication/a extends SpringBootServletInitializer' PetClinicApplication.java
cd -
pwd
# Build the WAR file
mvn clean package

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "Build successful. WAR file generated."
    WAR_FILE=$(find target -name "*.war" | head -1)
    cp "$WAR_FILE" /home/saad/webapps/
    echo "WAR file deployed to Tomcat."
else
    echo "Build failed. Please check the logs."
fi

