package product.spring.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import product.spring.entities.Nhanvien;

@Repository
public interface NhanvienRepository extends JpaRepository<Nhanvien, Integer>{
	@Transactional
	@Modifying
	@Query(value = "select TOP 10 Nhanvien.MaNhanVien, HoTen, HinhAnh, TenPhongBan, (SUM(case Loai when 1 then 1 else 0 end) - SUM(case Loai when 0 then 1 else 0 end)) as 'Diem'\r\n" + 
			"from NhanVien left outer join GhiNhan on GhiNhan.MaNhanVien = NhanVien.MaNhanVien left outer join PhongBan on NhanVien.MaPhongBan = PhongBan.MaPhongBan\r\n" + 
			"Group by Nhanvien.MaNhanVien,HoTen, HinhAnh,TenPhongBan\r\n" + 
			"order by Diem DESC", nativeQuery = true)
	public List<String[]> get10NhanVien();
}
