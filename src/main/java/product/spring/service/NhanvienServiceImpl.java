package product.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.spring.entities.Nhanvien;
import product.spring.repository.NhanvienRepository;

@Service
public class NhanvienServiceImpl implements NhanvienService{
	
	@Autowired
	NhanvienRepository nvr;
	@Override
	public List<Nhanvien> findAll() {
		return nvr.findAll();
	}
	@Override
	public void save(Nhanvien nv) {
		nvr.save(nv);
		
	}
	@Override
	public Nhanvien get(Integer id) {
		return nvr.findById(id).get();
	}
	@Override
	public void delete(Integer id) {
		nvr.deleteById(id);
	}
	@Override
	public List<String[]> get10NhanVien() {
		List<String[]> nv = (List<String[]>) nvr.get10NhanVien();
		return nv;
	}

}
