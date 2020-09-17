package product.spring.service;

import java.util.List;

import product.spring.entities.Phongban;

public interface PhongbanService {
	List<Phongban> findAll();
	void savePhongban(Phongban pb);
	Phongban getById(Integer id);
	void deletePhongban(Integer id);
}
