# Hệ Thống Quản Lý Người Dùng

Dự án này là một hệ thống quản lý người dùng hoàn chỉnh với các tính năng quản lý quyền truy cập, xác thực 2FA, và quản lý dữ liệu người dùng đầy đủ.

## Cấu Trúc Dự Án

Dự án được chia thành hai phần chính:

- **Frontend**: Giao diện người dùng được xây dựng với React, TypeScript và Tailwind CSS
- **Backend**: API được xây dựng với Flask, SQLAlchemy và hệ thống xác thực JWT

## Yêu Cầu Hệ Thống

- **Node.js**: v18.x hoặc cao hơn
- **Python**: v3.9 hoặc cao hơn
- **PostgreSQL**: v14.x hoặc cao hơn (Có thể dùng SQLite cho môi trường phát triển)
- **MacOS** hoặc **Linux** (Khuyến nghị)
- **npm** hoặc **yarn** để quản lý phụ thuộc frontend

## Cài Đặt và Khởi Động

### Cài Đặt

1. **Clone repository**:
   ```bash
   git clone <repository-url>
   cd project
   ```

2. **Cài đặt backend**:
   ```bash
   cd backend
   python -m venv venv
   source venv/bin/activate
   pip install -r requirements.txt
   ```

3. **Cài đặt frontend**:
   ```bash
   cd ../frontend
   npm install
   ```

4. **Cấu hình cơ sở dữ liệu**:
   - Chạy script thiết lập PostgreSQL:
     ```bash
     cd ../backend
     ./setup_postgres.sh
     ```
   - Hoặc sử dụng SQLite cho môi trường phát triển:
     ```bash
     ./setup_sqlite.sh
     ```

5. **Khởi tạo cơ sở dữ liệu**:
   ```bash
   python init_db.py
   ```

### Khởi Động

Sử dụng script khởi động tự động để chạy cả frontend và backend:

```bash
./start_project.sh
```

Hoặc khởi động riêng từng phần:

1. **Backend**:
   ```bash
   cd backend
   source venv/bin/activate
   python run.py
   ```

2. **Frontend**:
   ```bash
   cd frontend
   npm start
   ```

## Tài Liệu

Chi tiết về các tính năng và hướng dẫn sử dụng có thể được tìm thấy trong thư mục `docs`:

- [Hướng Dẫn Triển Khai](docs/guides/DEPLOYMENT_GUIDE.md)
- [Xử Lý Sự Cố Cơ Sở Dữ Liệu](docs/troubleshooting/DATABASE_TROUBLESHOOTING.md)
- [Xử Lý Sự Cố JWT Token](docs/troubleshooting/JWT_TOKEN_TROUBLESHOOTING.md)
- [Hướng Dẫn Nhập Người Dùng](docs/USER_IMPORT_GUIDE.md)
- [Hướng Dẫn Xuất Người Dùng](docs/guides/USER_EXPORT_GUIDE.md)

## Tính Năng Chính

1. **Quản lý người dùng**:
   - Đăng ký, đăng nhập, quản lý thông tin cá nhân
   - Phân quyền: root, admin, mentor, brosis

2. **Xác thực hai yếu tố (2FA)**:
   - Bắt buộc cho tài khoản root
   - Tùy chọn cho các tài khoản khác

3. **Quản lý Area và House**:
   - Tổ chức người dùng theo cấu trúc phân cấp

4. **Nhập/Xuất dữ liệu hàng loạt**:
   - Nhập người dùng từ file Excel
   - Xuất dữ liệu người dùng ra Excel hoặc CSV

5. **Thao tác hàng loạt**:
   - Kích hoạt, vô hiệu hóa, xóa nhiều người dùng cùng lúc

## Bảo Mật

Dự án có các tính năng bảo mật cao cấp:
- Xác thực JWT
- Mã hóa mật khẩu
- Xác thực hai yếu tố (2FA)
- Khóa tài khoản sau nhiều lần đăng nhập sai

## Dọn Dẹp và Triển Khai cho Production

Để dọn dẹp dự án và chuẩn bị cho môi trường production, thực hiện các bước sau:

1. **Dọn dẹp dự án** - Loại bỏ các file test, debug và không cần thiết:
   ```bash
   ./cleanup_production.sh
   ```

2. **Khởi động trong môi trường production**:
   ```bash
   ./start_production.sh
   ```

Để biết thêm chi tiết, vui lòng tham khảo:
- [Hướng Dẫn Triển Khai Production](docs/PRODUCTION_DEPLOYMENT_GUIDE.md)

## Giấy Phép

Dự án này được phát hành dưới giấy phép MIT.