package product.spring.service;

import java.util.List;

import product.spring.entities.Nhanvien;

public interface NhanvienService {
	List<Nhanvien> findAll();
	void save(Nhanvien nv);
	Nhanvien get(Integer id);
	void delete(Integer id);
	List<String[]> get10NhanVien();
}
