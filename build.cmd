set JAVA_HOME=D:\java\jdk-21.0.3
set PATH=%JAVA_HOME%\bin;%PATH%
java -version
mvn -DskipTests=true clean package -P prod
