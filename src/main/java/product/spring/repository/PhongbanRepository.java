package product.spring.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import product.spring.entities.Phongban;

@Repository
public interface PhongbanRepository extends JpaRepository<Phongban, Integer>{
	@Transactional
	@Modifying
	@Query("delete Nhanvien where maphongban like ?1")
	public void deleteNhanvienWithMPB(Integer id);
}
