@echo off
echo.
echo [��Ϣ] ʹ��Jar��������Web���̡�
echo.

cd %~dp0
cd ../../mapgis-server/target

for %%i in (mapgis-server-*.jar) do set MAPGIS_SERVER_JAR_NAME=%%~ni

set JAVA_OPTS=-Xms256m -Xmx1024m -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m

java -jar %JAVA_OPTS% %MAPGIS_SERVER_JAR_NAME%.jar

cd bin
pause