# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine
#Set app home folder
ENV APP_HOME /home
#Create base app folder
RUN mkdir -p $APP_HOME
#Create folder with application logs
RUN mkdir -p $APP_HOME/engineer
RUN mkdir -p $APP_HOME/engineer/logs
WORKDIR $APP_HOME
VOLUME $APP_HOME/engineer/logs
# Define the "application" arg and set a default value
ARG application=spring-boot-front-eks

# Create a label "application" and set it to the value of $application
LABEL application=$application
# The application's jar file
ARG JAR_FILE=target/spring-boot-front-eks-1.0-SNAPSHOT.jar
# Add the application's jar to the container
ADD ${JAR_FILE} $APP_HOME/spring-boot-front-eks.jar
# Run the jar file
ENV JAVA_OPTS=""
ENTRYPOINT exec java $JAVA_OPTS -noverify -XX:+AlwaysPreTouch -Djava.security.egd=file:/dev/./urandom -jar spring-boot-front-eks.jar
