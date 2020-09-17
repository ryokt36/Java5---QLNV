package product.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import product.spring.entities.Ghinhan;

@Repository
public interface GhinhanRepository extends JpaRepository<Ghinhan, Integer> {

}
