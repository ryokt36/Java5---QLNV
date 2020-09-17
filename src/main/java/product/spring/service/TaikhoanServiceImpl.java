package product.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.spring.entities.Taikhoan;
import product.spring.repository.TaikhoanRepository;

@Service
public class TaikhoanServiceImpl implements TaikhoanService{
	@Autowired
	TaikhoanRepository tkr;
	@Override
	public List<Taikhoan> findAll() {
		return tkr.findAll();
	}
	@Override
	public Taikhoan findById(String username) {
		Optional<Taikhoan> Id= tkr.findById(username);
		if(Id.isPresent()){
			Taikhoan tk = Id.get();
			return tk;
		}
		else return null;
	}
	@Override
	public void save(Taikhoan tk) {
		tkr.save(tk);
		
	}
	@Override
	public Taikhoan get(String tendangnhap) {
		return tkr.findById(tendangnhap).get();
	}
	@Override
	public void delete(String tendangnhap) {
		tkr.deleteById(tendangnhap);
		
	}
	@Override
	public boolean checkTaiKhoan(String tendangnhap) {
		return tkr.existsById(tendangnhap);
	}
	

}
