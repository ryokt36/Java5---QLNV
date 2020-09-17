package product.spring.service;

import java.util.List;

import product.spring.entities.Taikhoan;

public interface TaikhoanService {
	List<Taikhoan> findAll();
	Taikhoan findById(String username);
	void save(Taikhoan tk);
	void delete(String tendangnhap);
	Taikhoan get(String tendangnhap);
	boolean checkTaiKhoan(String tendangnhap);
}
