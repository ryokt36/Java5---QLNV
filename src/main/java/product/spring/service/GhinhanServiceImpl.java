package product.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.spring.entities.Ghinhan;
import product.spring.repository.GhinhanRepository;

@Service
public class GhinhanServiceImpl implements GhinhanService{
	@Autowired
	GhinhanRepository gnr;
	@Override
	public List<Ghinhan> findAll() {
		return gnr.findAll();
	}

}
