# Stage 1 - Build
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2 - Run
FROM tomcat:10.1-jdk17
RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY --from=build /app/target/teamaxcafe.war /usr/local/tomcat/webapps/ROOT.war

ENV PORT 8080
EXPOSE 8080

CMD ["catalina.sh", "run"]