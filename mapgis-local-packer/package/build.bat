@echo off
rem �ļ�����Ϊgbk��utf-8ʱmaven����̨����
rem chcp 65001
echo.
echo [��Ϣ] ��ʼ������������Ʒ
echo.

cd /d %~dp0
cd ../

setlocal

set CURRENT_DIR=%cd%
set BOOT_DIR=%CURRENT_DIR%/../mapgis-boot

set MVN_PROFILE=local
if "%~1" neq "" set MVN_PROFILE=%~1
echo "MVN_PROFILE:%MVN_PROFILE%"

set OUT_DIR=%CURRENT_DIR%/output
if "%~2" neq "" set "OUT_DIR=%CURRENT_DIR%/%~2"

if exist "%OUT_DIR%" rmdir /s/q "%OUT_DIR%"

set COMPILE_FRONT=true
if "%~3" == "SKIL_FRONT" set COMPILE_FRONT=false

if "%COMPILE_FRONT%" == "true" (
    echo. | call %CURRENT_DIR%/package/build-manager-front.bat
    if %errorlevel% NEQ 0 (
        echo "ִ�г����쳣%errorlevel%�����˳�"
        pause
        exit /b %errorlevel%
    )
) else (
    echo ������ǰ�˱���
)

cd %BOOT_DIR%

call mvn clean package -pl "mapgis-server" -am -Dmaven.test.skip=true -P %MVN_PROFILE%

mkdir "%OUT_DIR%"
mkdir "%OUT_DIR%/config"
mkdir "%OUT_DIR%/lib"
mkdir "%OUT_DIR%/bin"

xcopy /y "%BOOT_DIR%\mapgis-server\target\mapgis-server-*.jar" "%OUT_DIR%\lib\"
xcopy /y "%BOOT_DIR%\local-script\config\application.example.properties" "%OUT_DIR%\config\"
xcopy /y /e "%CURRENT_DIR%\package\bin" "%OUT_DIR%\bin\"

endlocal

echo.
echo [��Ϣ] ��ɹ�����������Ʒ
echo.

cd /d %~dp0