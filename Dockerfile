FROM gcr.io/distroless/java:11

LABEL name="Java File Upload Application" \
     maintainer="Kamran Majeed <kamran.majeed@gmail.com>" \
     summary="A Java Spring Boot application"

WORKDIR /app

EXPOSE 8080

COPY target/*.jar artifacts/app.jar

CMD ["artifacts/app.jar"]