USE master
CREATE DATABASE Nhom10
GO
USE Nhom10
GO
CREATE TABLE NhaCungCap(
    MaNhaCungCap INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    TenNhaCungCap NVARCHAR(250) NOT NULL,
    DiaChi TEXT NULL,
    SoDienThoai CHAR(15) DEFAULT NULL
)
GO
CREATE TABLE KhachHang(
    MaKhachHang INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    HoKhachHang NVARCHAR(50) NULL,
    TenKhachHang NVARCHAR(50) NOT NULL DEFAULT 'Khách vãng lai',
    DiaChi TEXT NULL,
    SoDienThoai CHAR(15) DEFAULT NULL
)
GO
CREATE TABLE NhanVien(
    MaNhanVien INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    HoNhanVien NVARCHAR(50) NOT NULL,
    TenNhanVien NVARCHAR(50) NOT NULL,
    DiaChi TEXT NULL,
    SoDienThoai CHAR(15) DEFAULT NULL,
    ChucVu NVARCHAR(20) NOT NULL
)
GO
CREATE TABLE NhacCu(
    MaNhacCu INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    MaNhaCungCap INT,
    TenNhacCu NVARCHAR(100) NOT NULL,
    LoaiNhacCu NVARCHAR(100) NOT NULL,
    GiaTien INT DEFAULT 0 NOT NULL,
    SoLuongTonKho INT DEFAULT 0,
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap)
)
GO
CREATE TABLE HoaDon(
    MaHoaDon INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    MaNhanVien INT,
    MaKhachHang INT,
    TongTien INT DEFAULT 0,
    NgayTao DATE
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
)
GO
CREATE TABLE ChiTietHoaDon(
    MaChiTietHoaDon INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    MaHoaDon INT,
    MaNhacCu INT,
    SoLuong INT DEFAULT 0,
    DonGia INT DEFAULT 0,
    FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon),
    FOREIGN KEY (MaNhacCu) REFERENCES NhacCu(MaNhacCu)
)
GO
CREATE PROC ThemNhaCungCap(
    @TenNhaCungCap NVARCHAR(250),
    @DiaChi TEXT,
    @SoDienThoai CHAR(15)
)
AS
BEGIN
    INSERT INTO NhaCungCap(TenNhaCungCap, DiaChi, SoDienThoai) VALUES(@TenNhaCungCap, @DiaChi, @SoDienThoai)
END
GO
CREATE PROC ThemKhachHang(
    @HoKhachHang NVARCHAR(50),
    @TenKhachHang NVARCHAR(50),
    @DiaChi TEXT,
    @SoDienThoai CHAR(15)
)
AS
BEGIN
    INSERT INTO KhachHang(HoKhachHang, TenKhachHang, DiaChi, SoDienThoai) VALUES(@HoKhachHang, @TenKhachHang, @DiaChi, @SoDienThoai)
END
GO
CREATE PROC ThemNhanVien(
    @HoNhanVien NVARCHAR(50),
    @TenNhanVien NVARCHAR(50),
    @DiaChi TEXT,
    @SoDienThoai CHAR(15),
    @ChucVu NVARCHAR(20)
)
AS
BEGIN
    INSERT INTO NhanVien(HoNhanVien, TenNhanVien, DiaChi, SoDienThoai, ChucVu) VALUES(@HoNhanVien, @TenNhanVien, @DiaChi, @SoDienThoai, @ChucVu)
END
GO
CREATE PROC ThemNhacCu(
    @TenNhacCu NVARCHAR(100),
    @MaNhaCungCap INT,
    @LoaiNhacCu NVARCHAR(100),
    @GiaTien INT,
    @SoLuongTonKho INT
)
AS
BEGIN
    INSERT INTO NhacCu(TenNhacCu, MaNhaCungCap, LoaiNhacCu, GiaTien, SoLuongTonKho) VALUES(@TenNhacCu, @MaNhaCungCap, @LoaiNhacCu, @GiaTien, @SoLuongTonKho)
END
GO
CREATE PROC ThemHoaDon(
    @MaNhanVien INT,
    @MaKhachHang INT,
    @TongTien INT,
    @NgayTao DATE
)
AS
BEGIN
    INSERT INTO HoaDon(MaNhanVien, MaKhachHang, TongTien, NgayTao) VALUES(@MaNhanVien, @MaKhachHang, @TongTien, @NgayTao)
END
GO
CREATE PROC ThemChiTietHoaDon(
    @MaHoaDon INT,
    @MaNhacCu INT,
    @SoLuong INT,
    @DonGia INT
)
AS
BEGIN
    INSERT INTO ChiTietHoaDon(MaHoaDon, MaNhacCu, SoLuong, DonGia) VALUES(@MaHoaDon, @MaNhacCu, @SoLuong, @DonGia)
END
GO
CREATE PROC XoaNhaCungCap(
    @MaNhaCungCap INT
)
AS
BEGIN
    DELETE FROM NhaCungCap WHERE MaNhaCungCap = @MaNhaCungCap
END
GO
CREATE PROC XoaKhachHang(
    @MaKhachHang INT
)
AS
BEGIN
    DELETE FROM KhachHang WHERE MaKhachHang = @MaKhachHang
END
GO
CREATE PROC XoaNhanVien(
    @MaNhanVien INT
)
AS
BEGIN
    DELETE FROM NhanVien WHERE MaNhanVien = @MaNhanVien
END
GO
CREATE PROC XoaNhacCu(
    @MaNhacCu INT
)
AS
BEGIN
    DELETE FROM NhacCu WHERE MaNhacCu = @MaNhacCu
END
GO
CREATE PROC XoaHoaDon(
    @MaHoaDon INT
)
AS
BEGIN
    DELETE FROM HoaDon WHERE MaHoaDon = @MaHoaDon
END
GO
CREATE PROC XoaChiTietHoaDon(
    @MaChiTietHoaDon INT
)
AS
BEGIN
    DELETE FROM ChiTietHoaDon WHERE MaChiTietHoaDon = @MaChiTietHoaDon
END
GO
CREATE PROC SuaNhaCungCap(
    @MaNhaCungCap INT,
    @TenNhaCungCap NVARCHAR(250),
    @DiaChi TEXT,
    @SoDienThoai CHAR(15)
)
AS
BEGIN
    UPDATE NhaCungCap SET TenNhaCungCap = @TenNhaCungCap, DiaChi = @DiaChi, SoDienThoai = @SoDienThoai WHERE MaNhaCungCap = @MaNhaCungCap
END
GO
CREATE PROC SuaKhachHang(
    @MaKhachHang INT,
    @HoKhachHang NVARCHAR(50),
    @TenKhachHang NVARCHAR(50),
    @DiaChi TEXT,
    @SoDienThoai CHAR(15)
)
AS
BEGIN
    UPDATE KhachHang SET HoKhachHang = @HoKhachHang, TenKhachHang = @TenKhachHang, DiaChi = @DiaChi, SoDienThoai = @SoDienThoai WHERE MaKhachHang = @MaKhachHang
END
GO
CREATE PROC SuaNhanVien(
    @MaNhanVien INT,
    @HoNhanVien NVARCHAR(50),
    @TenNhanVien NVARCHAR(50),
    @DiaChi TEXT,
    @SoDienThoai CHAR(15),
    @ChucVu NVARCHAR(20)
)
AS
BEGIN
    UPDATE NhanVien SET HoNhanVien = @HoNhanVien, TenNhanVien = @TenNhanVien, DiaChi = @DiaChi, SoDienThoai = @SoDienThoai, ChucVu = @ChucVu WHERE MaNhanVien = @MaNhanVien
END
GO
CREATE PROC SuaNhacCu(
    @MaNhacCu INT,
    @MaNhaCungCap INT,
    @TenNhacCu NVARCHAR(100),
    @LoaiNhacCu NVARCHAR(100),
    @GiaTien INT,
    @SoLuongTonKho INT
)
AS
BEGIN
    UPDATE NhacCu SET MaNhaCungCap = @MaNhaCungCap, TenNhacCu = @TenNhacCu, LoaiNhacCu = @LoaiNhacCu, GiaTien = @GiaTien, SoLuongTonKho = @SoLuongTonKho WHERE MaNhacCu = @MaNhacCu
END
GO
CREATE PROC SuaHoaDon(
    @MaHoaDon INT,
    @MaNhanVien INT,
    @MaKhachHang INT,
    @TongTien INT,
    @NgayTao DATE
)
AS
BEGIN
    UPDATE HoaDon SET MaNhanVien = @MaNhanVien, MaKhachHang = @MaKhachHang, TongTien = @TongTien, NgayTao = @NgayTao WHERE MaHoaDon = @MaHoaDon
END
GO
CREATE PROC SuaChiTietHoaDon(
    @MaChiTietHoaDon INT,
    @MaHoaDon INT,
    @MaNhacCu INT,
    @SoLuong INT,
    @DonGia INT
)
AS
BEGIN
    UPDATE ChiTietHoaDon SET MaHoaDon = @MaHoaDon, MaNhacCu = @MaNhacCu, SoLuong = @SoLuong, DonGia = @DonGia WHERE MaChiTietHoaDon = @MaChiTietHoaDon
END
GO
CREATE PROC TimNhaCungCapTheoMa(
    @MaNhaCungCap INT
)
AS
BEGIN
    SELECT * FROM NhaCungCap WHERE MaNhaCungCap = @MaNhaCungCap
END
GO
CREATE PROC TimKhachHangTheoMa(
    @MaKhachHang INT
)
AS
BEGIN
    SELECT * FROM KhachHang WHERE MaKhachHang = @MaKhachHang
END
GO
CREATE PROC TimNhanVienTheoMa(
    @MaNhanVien INT
)
AS
BEGIN
    SELECT * FROM NhanVien WHERE MaNhanVien = @MaNhanVien
END
GO
CREATE PROC TimNhacCuTheoMa(
    @MaNhacCu INT
)
AS
BEGIN
    SELECT * FROM NhacCu WHERE MaNhacCu = @MaNhacCu
END
GO
CREATE PROC TimHoaDonTheoMa(
    @MaHoaDon INT
)
AS
BEGIN
    SELECT * FROM HoaDon WHERE MaHoaDon = @MaHoaDon
END
GO
CREATE PROC TimChiTietHoaDonTheoMa(
    @MaChiTietHoaDon INT
)
AS
BEGIN
    SELECT * FROM ChiTietHoaDon WHERE MaChiTietHoaDon = @MaChiTietHoaDon
END
GO
CREATE PROC TimNhaCungCapTheoTen(
    @TenNhaCungCap NVARCHAR(250)
)
AS
BEGIN
    SELECT * FROM NhaCungCap WHERE TenNhaCungCap LIKE '%' + @TenNhaCungCap + '%'
END
GO
CREATE PROC TimKhachHangTheoTen(
    @TenKhachHang NVARCHAR(50)
)
AS
BEGIN
    SELECT * FROM KhachHang WHERE TenKhachHang LIKE '%' + @TenKhachHang + '%'
END
GO
CREATE PROC TimNhanVienTheoTen(
    @TenNhanVien NVARCHAR(50)
)
AS
BEGIN
    SELECT * FROM NhanVien WHERE TenNhanVien LIKE '%' + @TenNhanVien + '%'
END
GO
CREATE PROC TimNhacCuTheoTen(
    @TenNhacCu NVARCHAR(100)
)
AS
BEGIN
    SELECT * FROM NhacCu WHERE TenNhacCu LIKE '%' + @TenNhacCu + '%'
END
GO
CREATE PROC TimHoaDonTheoTen(
    @TenKhachHang NVARCHAR(50)
)
AS
BEGIN
    SELECT * FROM HoaDon WHERE MaKhachHang IN (SELECT MaKhachHang FROM KhachHang WHERE TenKhachHang LIKE '%' + @TenKhachHang + '%')
END
GO
CREATE PROC TimChiTietHoaDonTheoTen(
    @TenNhacCu NVARCHAR(100)
)
AS
BEGIN
    SELECT * FROM ChiTietHoaDon WHERE MaNhacCu IN (SELECT MaNhacCu FROM NhacCu WHERE TenNhacCu LIKE '%' + @TenNhacCu + '%')
END
GO
CREATE PROC TimNhaCungCapTheoSDT(
    @SoDienThoai CHAR(15)
)
AS
BEGIN
    SELECT * FROM NhaCungCap WHERE SoDienThoai LIKE '%' + @SoDienThoai + '%'
END
GO
CREATE PROC TimKhachHangTheoSDT(
    @SoDienThoai CHAR(15)
)
AS
BEGIN
    SELECT * FROM KhachHang WHERE SoDienThoai LIKE '%' + @SoDienThoai + '%'
END
GO
CREATE PROC TimNhanVienTheoSDT(
    @SoDienThoai CHAR(15)
)
AS
BEGIN
    SELECT * FROM NhanVien WHERE SoDienThoai LIKE '%' + @SoDienThoai + '%'
END
GO
CREATE PROC TonKho
AS
BEGIN
    SELECT * FROM NhacCu WHERE SoLuongTonKho > 0
END
GO

CREATE FUNCTION TongTienHoaDon(@MaHoaDon INT)
RETURNS INT
AS
BEGIN
    DECLARE @TongTien INT
    SELECT @TongTien = SUM(SoLuong * DonGia) FROM ChiTietHoaDon WHERE MaHoaDon = @MaHoaDon
    RETURN @TongTien
END
GO
CREATE FUNCTION DoanhThuTheoNgay(@NgayTao DATE)
RETURNS INT
AS
BEGIN
    DECLARE @TongTien INT
    SELECT @TongTien = SUM(SoLuong * DonGia) FROM ChiTietHoaDon WHERE MaHoaDon IN (SELECT MaHoaDon FROM HoaDon WHERE NgayTao = @NgayTao)
    RETURN @TongTien
END
GO
CREATE FUNCTION DoanhThuTheoThang(@Thang INT, @Nam INT)
RETURNS INT
AS
BEGIN
    DECLARE @TongTien INT
    SELECT @TongTien = SUM(SoLuong * DonGia) FROM ChiTietHoaDon WHERE MaHoaDon IN (SELECT MaHoaDon FROM HoaDon WHERE MONTH(NgayTao) = @Thang AND YEAR(NgayTao) = @Nam)
    RETURN @TongTien
END
GO
CREATE FUNCTION DoanhThuTheoNam(@Nam INT)
RETURNS INT
AS
BEGIN
    DECLARE @TongTien INT
    SELECT @TongTien = SUM(SoLuong * DonGia) FROM ChiTietHoaDon WHERE MaHoaDon IN (SELECT MaHoaDon FROM HoaDon WHERE YEAR(NgayTao) = @Nam)
    RETURN @TongTien
END
GO
CREATE FUNCTION DoanhThuTheoNhanVien(@MaNhanVien INT)
RETURNS INT
AS
BEGIN
    DECLARE @TongTien INT
    SELECT @TongTien = SUM(SoLuong * DonGia) FROM ChiTietHoaDon WHERE MaHoaDon IN (SELECT MaHoaDon FROM HoaDon WHERE MaNhanVien = @MaNhanVien)
    RETURN @TongTien
END
GO
CREATE PROC DonHangDaMua(
    @MaKhachHang INT
)
AS
BEGIN
    SELECT MaHoaDon, MaKhachHang, NgayTao, TongTien FROM HoaDon WHERE MaKhachHang = @MaKhachHang
END
GO
CREATE TRIGGER GiamTonKho ON ChiTietHoaDon
FOR INSERT
AS
    DECLARE @D INT
    SELECT @D = COUNT(*) FROM NhacCu JOIN INSERTED ON NhacCu.MaNhacCu = INSERTED.MaNhacCu WHERE SoLuongTonKho < SoLuong
    IF @D > 0
    BEGIN
        PRINT('Số lượng tồn kho không đủ')
        ROLLBACK TRANSACTION
        RETURN
    END
    UPDATE NhacCu SET SoLuongTonKho -= SoLuong FROM INSERTED WHERE INSERTED.MaNhacCu = NhacCu.MaNhacCu
GO
CREATE TRIGGER TangTonKho ON ChiTietHoaDon
FOR DELETE
AS
    UPDATE NhacCu SET SoLuongTonKho = SoLuongTonKho + SoLuong FROM DELETED WHERE DELETED.MaNhacCu = NhacCu.MaNhacCu
GO
CREATE TRIGGER SuaTonKho ON ChiTietHoaDon
FOR UPDATE
AS
    DECLARE @D INT
    SELECT @D = COUNT(*) FROM NhacCu JOIN INSERTED ON NhacCu.MaNhacCu = INSERTED.MaNhacCu WHERE SoLuongTonKho < SoLuong
    IF @D > 0
    BEGIN
        PRINT('Số lượng tồn kho không đủ')
        ROLLBACK TRANSACTION
        RETURN
    END
    UPDATE NhacCu SET SoLuongTonKho = SoLuongTonKho + (SELECT SoLuong FROM DELETED WHERE DELETED.MaNhacCu = NhacCu.MaNhacCu) - SoLuong FROM INSERTED WHERE INSERTED.MaNhacCu = NhacCu.MaNhacCu
GO
CREATE VIEW DSNhaCungCap
AS
    SELECT TenNhaCungCap AS [Tên nhà cung cấp], DiaChi AS [Địa chỉ], SoDienThoai AS [Số điện thoại] FROM NhaCungCap
GO
CREATE VIEW DSThanhVien
AS
    SELECT concat_ws(' ', HoKhachHang, TenKhachHang) AS [Họ và tên], DiaChi AS [Địa chỉ], SoDienThoai AS [SoDienThoai] FROM KhachHang
    WHERE SoDienThoai IS NOT NULL OR DiaChi IS NOT NULL
    WITH CHECK OPTION
GO
CREATE VIEW DSNhanVien
AS
    SELECT concat_ws(' ', HoNhanVien, TenNhanVien) AS [Họ và tên], DiaChi AS [Địa chỉ], SoDienThoai AS [Số điện thoại], ChucVu AS [Chức vụ] FROM NhanVien
GO
CREATE VIEW DSNhacCu
AS
    SELECT NhacCu.TenNhacCu AS [Tên nhạc cụ], NhaCungCap.TenNhaCungCap AS [Tên nhà cung cấp], NhacCu.LoaiNhacCu AS [Loại nhạc cụ], NhacCu.GiaTien AS [Giá tiền], NhacCu.SoLuongTonKho AS [Số lượng tồn kho]
    FROM NhacCu INNER JOIN NhaCungCap ON NhacCu.MaNhaCungCap = NhaCungCap.MaNhaCungCap
GO
USE Nhom10
GO
CREATE ROLE HR AUTHORIZATION db_datawriter
GO
CREATE ROLE BanHang AUTHORIZATION db_datawriter
GO
CREATE ROLE Kho AUTHORIZATION db_datawriter
GO
GRANT SELECT, INSERT, UPDATE ON NhanVien TO HR
GO
GRANT INSERT, UPDATE ON KhachHang TO BanHang
GO
GRANT SELECT ON DSThanhVien TO BanHang
GO
GRANT SELECT ON DSNhacCu TO BanHang
GO
GRANT SELECT, INSERT, UPDATE ON HoaDon TO BanHang
GO
GRANT SELECT, INSERT, UPDATE ON ChiTietHoaDon TO BanHang
GO
GRANT SELECT, INSERT, UPDATE ON NhacCu TO Kho
GO
GRANT SELECT, INSERT, UPDATE ON NhaCungCap TO Kho
GO
GRANT SELECT ON DSNhaCungCap TO Kho
GO
USE master
GO
CREATE LOGIN hr1 WITH PASSWORD=N'123', DEFAULT_DATABASE=[Nhom10], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN hr2 WITH PASSWORD=N'123', DEFAULT_DATABASE=[Nhom10], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN nv1 WITH PASSWORD=N'123', DEFAULT_DATABASE=[Nhom10], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN nv2 WITH PASSWORD=N'123', DEFAULT_DATABASE=[Nhom10], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN kho1 WITH PASSWORD=N'123', DEFAULT_DATABASE=[Nhom10], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN kho2 WITH PASSWORD=N'123', DEFAULT_DATABASE=[Nhom10], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE Nhom10
GO
CREATE USER hr1 FOR LOGIN hr1
GO
CREATE USER hr2 FOR LOGIN hr2
GO
CREATE USER nv1 FOR LOGIN nv1
GO
CREATE USER nv2 FOR LOGIN nv2
GO
CREATE USER kho1 FOR LOGIN kho1
GO
CREATE USER kho2 FOR LOGIN kho2
GO
ALTER ROLE HR ADD MEMBER hr1
GO
ALTER ROLE HR ADD MEMBER hr2
GO
ALTER ROLE BanHang ADD MEMBER nv1
GO
ALTER ROLE BanHang ADD MEMBER nv2
GO
ALTER ROLE Kho ADD MEMBER kho1
GO
ALTER ROLE Kho ADD MEMBER kho2
GO
EXEC ThemNhanVien
    @HoNhanVien = N'Nguyễn Văn',
    @TenNhanVien = N'An',
    @DiaChi = N'Quận 1, TP.HCM',
    @SoDienThoai = '0213424123',
    @ChucVu = N'Nhân viên bán hàng'
GO
EXEC ThemNhanVien
    @HoNhanVien = N'Nguyễn Thị',
    @TenNhanVien = N'Bình',
    @DiaChi = N'Quận 2, TP.HCM',
    @SoDienThoai = '0912837462',
    @ChucVu = N'Nhân viên kho'
GO
EXEC ThemNhanVien
    @HoNhanVien = N'Trần Thị',
    @TenNhanVien = N'Chung',
    @DiaChi = N'Quận 3, TP.HCM',
    @SoDienThoai = '0274937462',
    @ChucVu = N'Nhân viên tuyển dụng'
GO
EXEC ThemKhachHang
    @HoKhachHang = N'Lâm Minh',
    @TenKhachHang = N'Hiếu',
    @DiaChi = N'Quận 4, TP.HCM',
    @SoDienThoai = '0462839471'
GO
EXEC ThemKhachHang
    @HoKhachHang = N'Nguyễn Thị',
    @TenKhachHang = N'Anh',
    @DiaChi = N'Quận 5, TP.HCM',
    @SoDienThoai = '023148273'
GO
EXEC ThemNhaCungCap
    @TenNhaCungCap = N'Việt Thương',
    @DiaChi = N'Quận 3, TP.HCM',
    @SoDienThoai = '18006715'
GO
EXEC ThemNhaCungCap
    @TenNhaCungCap = N'Tiến Đạt',
    @DiaChi = N'Quận Bình Thạnh, TP.HCM',
    @SoDienThoai = '0909015886'
GO
EXEC ThemNhacCu
    @TenNhacCu = N'Suzuki SDG-6NL',
    @MaNhaCungCap = 1,
    @LoaiNhacCu = N'Đàn Guitar',
    @GiaTien = 2500000,
    @SoLuongTonKho = 10
GO
EXEC ThemNhacCu
    @TenNhacCu = N'Yamaha YFL-222',
    @MaNhaCungCap = 1,
    @LoaiNhacCu = N'Kèn sáo',
    @GiaTien = 3000000,
    @SoLuongTonKho = 10
GO
EXEC ThemNhacCu
    @TenNhacCu = N'Casio AP-470',
    @MaNhaCungCap = 2,
    @LoaiNhacCu = N'Piano',
    @GiaTien = 30980000,
    @SoLuongTonKho = 10
GO
EXEC ThemHoaDon
    @MaNhanVien = 1,
    @MaKhachHang = 1,
    @TongTien = 5500000,
    @NgayTao = '2021-05-01'
GO
EXEC ThemHoaDon
    @MaNhanVien = 1,
    @MaKhachHang = 2,
    @TongTien = 30980000,
    @NgayTao = '2021-05-02'
GO
EXEC ThemChiTietHoaDon
    @MaHoaDon = 1,
    @MaNhacCu = 1,
    @SoLuong = 1,
    @DonGia = 2500000
GO
EXEC ThemChiTietHoaDon
    @MaHoaDon = 1,
    @MaNhacCu = 2,
    @SoLuong = 1,
    @DonGia = 3000000
GO
EXEC ThemChiTietHoaDon
    @MaHoaDon = 2,
    @MaNhacCu = 3,
    @SoLuong = 1,
    @DonGia = 30980000
GO
USE Nhom10
GO
ALTER DATABASE Nhom10 SET AUDITING ON
USE master
GO
CREATE SERVER AUDIT AuditNhom10
TO FILE (FILEPATH = 'C:\Audit\')
WITH (ON_FAILURE = CONTINUE)
USE Nhom10
GO
CREATE DATABASE AUDIT SPECIFICATION AuditNhom10spec
FOR SERVER AUDIT AuditNhom10
ADD (SELECT, INSERT, UPDATE, DELETE, EXECUTE ON DATABASE::Nhom10 BY [db_datawriter])
WITH (STATE = ON)