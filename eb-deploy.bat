@echo off
echo ========================================
echo Deploying to AWS Elastic Beanstalk
echo ========================================

echo.
echo [1/3] Building application...
call mvn clean package -DskipTests

echo.
echo [2/3] Creating deployment package...
if exist "deploy" rmdir /s /q "deploy"
mkdir "deploy"
copy "target\cloud-employee-management-0.0.1-SNAPSHOT.jar" "deploy\application.jar"

echo.
echo [3/3] Creating ZIP file for Elastic Beanstalk...
cd deploy
powershell Compress-Archive -Path "application.jar" -DestinationPath "..\aws-deployment.zip"
cd ..

echo.
echo ========================================
echo Deployment package created!
echo ========================================
echo.
echo File: aws-deployment.zip
echo.
echo Next steps:
echo 1. Go to AWS Elastic Beanstalk Console
echo 2. Create new application or update existing
echo 3. Upload aws-deployment.zip
echo 4. Configure environment variables if needed
echo.
pause
