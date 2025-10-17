# Cloud Employee Management System

Ứng dụng quản lý nhân viên được xây dựng với Spring Boot và triển khai trên AWS.

## 🚀 Tính năng

- Quản lý thông tin nhân viên
- API REST cho CRUD operations
- Kết nối với AWS RDS MySQL
- Health check endpoint
- JWT Authentication (cấu hình sẵn)
- Audit logging

## 🛠️ Công nghệ sử dụng

- **Backend**: Spring Boot 3.5.3, Java 17
- **Database**: MySQL (AWS RDS)
- **Build Tool**: Maven
- **Migration**: Flyway
- **Security**: Spring Security + JWT

## 📦 Cài đặt và chạy

### Yêu cầu hệ thống
- Java 17+
- Maven 3.6+
- MySQL 8.0+

### Cách chạy

1. **Clone repository**
```bash
git clone <repository-url>
cd cloud-employee-management
```

2. **Cấu hình database**
- Cập nhật thông tin kết nối trong `src/main/resources/application.yml`
- Tạo database `lab6db` trên AWS RDS
- Chạy migration SQL từ `src/main/resources/db/migration/V1__init.sql`

3. **Build và chạy**
```bash
# Build ứng dụng
mvn clean package

# Chạy ứng dụng
java -jar target/cloud-employee-management-0.0.1-SNAPSHOT.jar
```

4. **Kiểm tra ứng dụng**
- Health check: `http://localhost:8080/health`
- API docs: `http://localhost:8080/actuator`

## 🗄️ Cấu trúc Database

### Bảng `employees`
- `id`: Primary key
- `full_name`: Tên đầy đủ
- `email`: Email (unique)
- `phone`: Số điện thoại
- `department`: Phòng ban
- `title`: Chức vụ
- `hire_date`: Ngày tuyển dụng
- `status`: Trạng thái
- `salary`: Lương

### Bảng `users`
- `id`: Primary key
- `email`: Email (unique)
- `password_hash`: Mật khẩu đã hash
- `role`: Vai trò

### Bảng `audit_logs`
- `id`: Primary key
- `employee_id`: Foreign key đến employees
- `action`: Hành động
- `actor`: Người thực hiện
- `details`: Chi tiết
- `created_at`: Thời gian tạo

## 🔧 Cấu hình

### Environment Variables
- `SERVER_PORT`: Cổng chạy ứng dụng (mặc định: 8080)
- `DB_URL`: URL kết nối database
- `DB_USERNAME`: Username database
- `DB_PASSWORD`: Password database
- `JWT_SECRET`: Secret key cho JWT
- `JWT_EXPIRATION_SECONDS`: Thời gian hết hạn JWT

### AWS RDS Configuration
```yaml
spring:
  datasource:
    url: jdbc:mysql://your-rds-endpoint:3306/lab6db?useSSL=true&serverTimezone=Asia/Ho_Chi_Minh
    username: your-username
    password: your-password
```

## 📁 Cấu trúc Project

```
backend/
├── src/main/java/com/company/employees/
│   ├── EmployeeApp.java              # Main application class
│   └── web/
│       └── HealthController.java     # Health check controller
├── src/main/resources/
│   ├── application.yml               # Application configuration
│   └── db/migration/
│       └── V1__init.sql             # Database migration
├── releases/                        # JAR files for deployment
├── pom.xml                         # Maven configuration
├── build.bat                       # Windows build script
├── build.sh                        # Linux/Mac build script
└── eb-deploy.bat                   # AWS Elastic Beanstalk deployment
```

## 🚀 Deployment

### AWS Elastic Beanstalk
1. Build ứng dụng: `mvn clean package`
2. Tạo deployment package: `eb-deploy.bat`
3. Upload `aws-deployment.zip` lên Elastic Beanstalk

### Manual Deployment
1. Build: `mvn clean package`
2. Copy JAR file từ `target/` hoặc `releases/`
3. Chạy: `java -jar cloud-employee-management-0.0.1-SNAPSHOT.jar`

## 📝 API Endpoints

- `GET /health` - Health check
- `GET /actuator/health` - Detailed health info
- `GET /actuator/info` - Application info
- `GET /actuator/metrics` - Application metrics

## 🔒 Bảo mật

- Spring Security được cấu hình sẵn
- JWT authentication
- CORS configuration
- SQL injection protection

## 📞 Liên hệ

Tác giả: Nguyễn Duy Đức
Email: nguyenduyduc@example.com

## 📄 License

MIT License
