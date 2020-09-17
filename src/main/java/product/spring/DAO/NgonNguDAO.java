package product.spring.DAO;

import java.util.HashMap;
import java.util.Map;

public class NgonNguDAO {
	
	public Map<String, String> EnglishLanguage(){
		Map<String, String> map = new HashMap<>();
		map.put("Home.TieuDe", "Excellent employees");
		map.put("Home.Diem", "Score");
		map.put("Header.TrangChu", "Home");
		map.put("Header.QuanLy", "Manager");
		map.put("Header.TaiKhoan", "Account");
		map.put("Header.TaiKhoan.DangXuat", "Logout");
		map.put("Header.TaiKhoan.DoiMK", "Change Password");
		map.put("Header.NgonNgu", "Language");
		map.put("Header.NgonNguE", "English");
		map.put("Header.NgonNguV", "VietNamese");
		return map;
	}
	public Map<String, String> VietnameseLanguage(){
		Map<String, String> map = new HashMap<>();
		map.put("Home.TieuDe", "Nhân viên xuất sắc");
		map.put("Home.Diem", "Điểm");
		map.put("Header.TrangChu", "Trang Chủ");
		map.put("Header.QuanLy", "Quản Lý");
		map.put("Header.TaiKhoan", "Tài Khoản");
		map.put("Header.TaiKhoan.DangXuat", "Đăng Xuất");
		map.put("Header.TaiKhoan.DoiMK", "Đổi Mật Khẩu");
		map.put("Header.NgonNgu", "Ngôn ngữ");
		map.put("Header.NgonNguE", "Tiếng Anh");
		map.put("Header.NgonNguV", "Tiếng Việt");
		return map;
	}
}
