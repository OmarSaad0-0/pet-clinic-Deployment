#!/bin/bash

# Clone the repository
cd /home/saad/DummyApp
git clone https://github.com/spring-projects/spring-petclinic
#cd spring-petclinic


# edit PetClinicApplication
sed -i '/import org.springframework.web.servlet.i18n.SessionLocaleResolver;/a import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;' spring-petclinic/src/main/java/org/springframework/samples/petclinic/PetClinicApplication.java
sed -i 's/public class PetClinicApplication {/public class PetClinicApplication extends SpringBootServletInitializer {/' spring-petclinic/src/main/java/org/springframework/samples/petclinic/PetClinicApplication.java

# edit pom.xml
sed -i '/<\/parent>/a <packaging>war<\/packaging>' spring-petclinic/pom.xml
sed -i '0,/<\/dependencies>/s#</dependencies>#<dependency>\n    <groupId>org.springframework.boot</groupId>\n    <artifactId>spring-boot-starter-tomcat</artifactId>\n    <scope>provided</scope>\n</dependency></dependencies>#' spring-petclinic/pom.xml
cd spring-petclinic

# Build the WAR file
./mvnw clean package


# Check if build was successful
if [ $? -eq 0 ]; then
    echo "Build successful. WAR file generated."
    WAR_FILE=$(find target -name "*.war" | head -1)
    cp "$WAR_FILE" /home/saad/tomcat/webapps/
    echo "WAR file deployed to Tomcat."
else
    echo "Build failed. Please check the logs."
fi

