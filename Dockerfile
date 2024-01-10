FROM azul/zulu-openjdk-alpine:17-jre-headless-latest
RUN apk add --no-cache tzdata
ENV TZ Asia/Kuala_Lumpur
VOLUME /tmp
#Open telemetry
ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar /opentelemetry-javaagent.jar
ENV JAVA_TOOL_OPTIONS="-javaagent:/opentelemetry-javaagent.jar"
COPY target/rd.baas.jenkins.deployment.sample-0.0.1-SNAPSHOT.jar /app.jar
ENTRYPOINT exec java -server -Xmx256m -Xss1024k -Djava.security.egd=file:/dev/./urandom -jar /app.jar