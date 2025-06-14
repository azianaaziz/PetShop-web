FROM tomcat:8.5.96-jdk8-temurin

# Remove the default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your built WAR or app into the ROOT folder
COPY ./build/web /usr/local/tomcat/webapps/ROOT
