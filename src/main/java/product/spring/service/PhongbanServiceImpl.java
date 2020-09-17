package product.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.spring.entities.Phongban;
import product.spring.repository.PhongbanRepository;

@Service
public class PhongbanServiceImpl implements PhongbanService{
	
	@Autowired
	PhongbanRepository pbr;
	@Override
	public List<Phongban> findAll() {
		return pbr.findAll();
	}
	@Override
	public void savePhongban(Phongban pb) {
		pbr.save(pb);
	}
	@Override
	public void deletePhongban(Integer id) {
		pbr.deleteNhanvienWithMPB(id);
		pbr.deleteById(id);
		
	}
	@Override
	public Phongban getById(Integer id) {
		return pbr.findById(id).get();
	}

}
