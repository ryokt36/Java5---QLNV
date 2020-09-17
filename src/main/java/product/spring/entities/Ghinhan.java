package product.spring.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ghinhan {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer maghinhan;
	private Integer loai;
	private String lydo;
	@Temporal(TemporalType.DATE)
	private Date ngayghinhan;
	@ManyToOne
	@JoinColumn(name = "manhanvien")
	private Nhanvien nhanvien;
}
