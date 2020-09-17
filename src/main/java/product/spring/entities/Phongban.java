package product.spring.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Phongban {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer maphongban;
	
	@NotBlank(message="Department name may not be null !")
	private String tenphongban;
	@OneToMany(mappedBy = "phongban")
	List<Nhanvien> nhanvien;
	public Integer getMaphongban() {
		return maphongban;
	}
	public void setMaphongban(Integer maphongban) {
		this.maphongban = maphongban;
	}
	public String getTenphongban() {
		return tenphongban;
	}
	public void setTenphongban(String tenphongban) {
		this.tenphongban = tenphongban;
	}
	public List<Nhanvien> getNhanvien() {
		return nhanvien;
	}
	public void setNhanvien(List<Nhanvien> nhanvien) {
		this.nhanvien = nhanvien;
	}
	public Phongban(Integer maphongban, @NotBlank(message = "Department name may not be null !") String tenphongban,
			List<Nhanvien> nhanvien) {
		super();
		this.maphongban = maphongban;
		this.tenphongban = tenphongban;
		this.nhanvien = nhanvien;
	}
	public Phongban() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Phongban [maphongban=" + maphongban + ", tenphongban=" + tenphongban + ", nhanvien=" + nhanvien + "]";
	}
}
