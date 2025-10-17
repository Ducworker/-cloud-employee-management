@echo off
echo ========================================
echo Building Spring Boot Application for AWS
echo ========================================

echo.
echo [1/4] Cleaning previous build...
call mvn clean

echo.
echo [2/4] Compiling application...
call mvn compile

echo.
echo [3/4] Running tests...
call mvn test

echo.
echo [4/4] Packaging application...
call mvn package -DskipTests

echo.
echo ========================================
echo Build completed successfully!
echo ========================================
echo.
echo JAR file location: target\cloud-employee-management-0.0.1-SNAPSHOT.jar
echo.
echo To run the application:
echo java -jar target\cloud-employee-management-0.0.1-SNAPSHOT.jar
echo.
pause
