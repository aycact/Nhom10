USE master
CREATE DATABASE Nhom10
GO
USE Nhom10
GO
CREATE TABLE NhaCungCap(
    MaNhaCungCap INT PRIMARY KEY,
    TenNhaCungCap VARCHAR(250),
    DiaChi TEXT NULL,
    SoDienThoai CHAR(15) DEFAULT NULL
)
GO
CREATE TABLE KhachHang(
    MaKhachHang INT PRIMARY KEY,
    HoKhachHang VARCHAR(50),
    TenKhachHang VARCHAR(50),
    DiaChi TEXT NULL,
    SoDienThoai CHAR(15) DEFAULT NULL
)
GO
CREATE TABLE NhanVien(
    MaNhanVien INT PRIMARY KEY,
    HoNhanVien VARCHAR(50),
    TenNhanVien VARCHAR(50),
    DiaChi TEXT NULL,
    SoDienThoai CHAR(15) DEFAULT NULL,
    ChucVu varchar(20)
)
GO
CREATE TABLE NhacCu(
    MaNhacCu INT PRIMARY KEY,
    MaNhaCungCap INT,
    TenNhacCu VARCHAR(100),
    LoaiNhacCu VARCHAR(100),
    GiaTien INT DEFAULT 0,
    SoLuongTonKho INT DEFAULT 0,
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap)
)
GO
CREATE TABLE HoaDon(
    MaHoaDon INT PRIMARY KEY,
    MaNhanVien INT,
    MaKhachHang INT,
    TongTien INT DEFAULT 0,
    NgayTao DATE
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
)
GO
CREATE TABLE ChiTietHoaDon(
    MaChiTietHoaDon INT PRIMARY KEY,
    MaHoaDon INT,
    MaNhacCu INT,
    SoLuong INT DEFAULT 0,
    DonGia INT DEFAULT 0,
    FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon),
    FOREIGN KEY (MaNhacCu) REFERENCES NhacCu(MaNhacCu)
)
GO
CREATE PROC ThemNhaCungCap(
    @MaNhaCungCap INT,
    @TenNhaCungCap VARCHAR(250),
    @DiaChi TEXT,
    @SoDienThoai CHAR(15)
)
AS
BEGIN
    INSERT INTO NhaCungCap VALUES(@MaNhaCungCap, @TenNhaCungCap, @DiaChi, @SoDienThoai)
END
GO
CREATE PROC ThemKhachHang(
    @MaKhachHang INT,
    @HoKhachHang VARCHAR(50),
    @TenKhachHang VARCHAR(50),
    @DiaChi TEXT,
    @SoDienThoai CHAR(15)
)
AS
BEGIN
    INSERT INTO KhachHang VALUES(@MaKhachHang, @HoKhachHang, @TenKhachHang, @DiaChi, @SoDienThoai)
END
GO
CREATE PROC ThemNhanVien(
    @MaNhanVien INT,
    @HoNhanVien VARCHAR(50),
    @TenNhanVien VARCHAR(50),
    @DiaChi TEXT,
    @SoDienThoai CHAR(15),
    @ChucVu VARCHAR(20)
)
AS
BEGIN
    INSERT INTO NhanVien VALUES(@MaNhanVien, @HoNhanVien, @TenNhanVien, @DiaChi, @SoDienThoai, @ChucVu)
END
GO
CREATE PROC ThemNhacCu(
    @MaNhacCu INT,
    @MaNhaCungCap INT,
    @TenNhacCu VARCHAR(100),
    @LoaiNhacCu VARCHAR(100),
    @GiaTien INT,
    @SoLuongTonKho INT
)
AS
BEGIN
    INSERT INTO NhacCu VALUES(@MaNhacCu, @MaNhaCungCap, @TenNhacCu, @LoaiNhacCu, @GiaTien, @SoLuongTonKho)
END
GO
CREATE PROC ThemHoaDon(
    @MaHoaDon INT,
    @MaNhanVien INT,
    @MaKhachHang INT,
    @TongTien INT,
    @NgayTao DATE
)
AS
BEGIN
    INSERT INTO HoaDon VALUES(@MaHoaDon, @MaNhanVien, @MaKhachHang, @TongTien, @NgayTao)
END
GO
CREATE PROC ThemChiTietHoaDon(
    @MaChiTietHoaDon INT,
    @MaHoaDon INT,
    @MaNhacCu INT,
    @SoLuong INT,
    @DonGia INT
)
AS
BEGIN
    INSERT INTO ChiTietHoaDon VALUES(@MaChiTietHoaDon, @MaHoaDon, @MaNhacCu, @SoLuong, @DonGia)
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
    @TenNhaCungCap VARCHAR(250),
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
    @HoKhachHang VARCHAR(50),
    @TenKhachHang VARCHAR(50),
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
    @HoNhanVien VARCHAR(50),
    @TenNhanVien VARCHAR(50),
    @DiaChi TEXT,
    @SoDienThoai CHAR(15),
    @ChucVu VARCHAR(20)
)
AS
BEGIN
    UPDATE NhanVien SET HoNhanVien = @HoNhanVien, TenNhanVien = @TenNhanVien, DiaChi = @DiaChi, SoDienThoai = @SoDienThoai, ChucVu = @ChucVu WHERE MaNhanVien = @MaNhanVien
END
GO
CREATE PROC SuaNhacCu(
    @MaNhacCu INT,
    @MaNhaCungCap INT,
    @TenNhacCu VARCHAR(100),
    @LoaiNhacCu VARCHAR(100),
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
    @TenNhaCungCap VARCHAR(250)
)
AS
BEGIN
    SELECT * FROM NhaCungCap WHERE TenNhaCungCap LIKE '%' + @TenNhaCungCap + '%'
END
GO
CREATE PROC TimKhachHangTheoTen(
    @TenKhachHang VARCHAR(50)
)
AS
BEGIN
    SELECT * FROM KhachHang WHERE TenKhachHang LIKE '%' + @TenKhachHang + '%'
END
GO
CREATE PROC TimNhanVienTheoTen(
    @TenNhanVien VARCHAR(50)
)
AS
BEGIN
    SELECT * FROM NhanVien WHERE TenNhanVien LIKE '%' + @TenNhanVien + '%'
END
GO
CREATE PROC TimNhacCuTheoTen(
    @TenNhacCu VARCHAR(100)
)
AS
BEGIN
    SELECT * FROM NhacCu WHERE TenNhacCu LIKE '%' + @TenNhacCu + '%'
END
GO
CREATE PROC TimHoaDonTheoTen(
    @TenKhachHang VARCHAR(50)
)
AS
BEGIN
    SELECT * FROM HoaDon WHERE MaKhachHang IN (SELECT MaKhachHang FROM KhachHang WHERE TenKhachHang LIKE '%' + @TenKhachHang + '%')
END
GO
CREATE PROC TimChiTietHoaDonTheoTen(
    @TenNhacCu VARCHAR(100)
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
