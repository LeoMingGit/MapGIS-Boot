@echo off
echo.
echo [��Ϣ] ��ʼ������������Ʒǰ��
echo.

cd /d %~dp0

setlocal

set CURRENT_DIR=%cd%
set MANAGER_FRONT_DIR=%CURRENT_DIR%/../../mapgis-manager

cd %MANAGER_FRONT_DIR%

call yarn build

endlocal

echo.
echo [��Ϣ] ��ɹ�����������Ʒǰ��
echo.