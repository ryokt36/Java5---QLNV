package product.spring.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Taikhoan {
	@Id
	@NotBlank(message="Username may not be null !")
	@Size(min = 1, max = 300, message = "Username must be between 1 and 300 characters")
	private String tendangnhap;
	
	@NotBlank(message="Password may not be null !")
	@Size(min = 6, max = 100, message = "Password must be between 6 and 100 characters")
	private String matkhau;
	
	@NotBlank(message="Permission may not be null !")
	private String quyen;
	
	@NotBlank(message="Name may not be null !")
	private String hoten;

	public String getTendangnhap() {
		return tendangnhap;
	}

	public void setTendangnhap(String tendangnhap) {
		this.tendangnhap = tendangnhap;
	}

	public String getMatkhau() {
		return matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}

	public String getQuyen() {
		return quyen;
	}

	public void setQuyen(String quyen) {
		this.quyen = quyen;
	}

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public Taikhoan(
			@NotBlank(message = "Username may not be null !") @Size(min = 1, max = 300, message = "Username must be between 1 and 300 characters") String tendangnhap,
			@NotBlank(message = "Password may not be null !") @Size(min = 6, max = 100, message = "Password must be between 6 and 100 characters") String matkhau,
			@NotBlank(message = "Permission may not be null !") String quyen,
			@NotBlank(message = "Name may not be null !") String hoten) {
		super();
		this.tendangnhap = tendangnhap;
		this.matkhau = matkhau;
		this.quyen = quyen;
		this.hoten = hoten;
	}

	public Taikhoan() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Taikhoan [tendangnhap=" + tendangnhap + ", matkhau=" + matkhau + ", quyen=" + quyen + ", hoten=" + hoten
				+ "]";
	}
}
