package product.spring.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import product.spring.entities.Taikhoan;

@Repository
public interface TaikhoanRepository extends JpaRepository<Taikhoan, String>{
	
}
