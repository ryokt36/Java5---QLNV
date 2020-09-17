package product.spring.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Nhanvien {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer manhanvien;
	
	@NotBlank(message="Name may not be null !")
	@Size(min = 1, max = 100, message = "Name must be between 1 and 100 characters")
	private String hoten;
	
	@NotBlank(message="Gender may not be null !")
	private String gioitinh;
	private String hinhanh;
	
	private transient MultipartFile hinhfile;
	
	@Temporal(TemporalType.DATE)
	private Date ngaysinh;
	
	private transient String datestring;
	
	@NotNull(message="Salary may not be null !")
	private Integer luong;
	
	@NotNull(message="Level may not be null !")
	@Min(0)
	private Integer capdo;
	
	@NotBlank(message="Email may not be null !")
	@Email
	private String email;
	
	@NotBlank(message="Phone Number may not be null !")
	private String sdt;
	private String ghichu;
	@ManyToOne
	@JoinColumn(name = "maphongban")
	private Phongban phongban;
	@OneToMany(mappedBy = "nhanvien")
	List<Ghinhan> ghinhan;
	public Integer getManhanvien() {
		return manhanvien;
	}
	public void setManhanvien(Integer manhanvien) {
		this.manhanvien = manhanvien;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getGioitinh() {
		return gioitinh;
	}
	public void setGioitinh(String gioitinh) {
		this.gioitinh = gioitinh;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	public MultipartFile getHinhfile() {
		return hinhfile;
	}
	public void setHinhfile(MultipartFile hinhfile) {
		this.hinhfile = hinhfile;
	}
	public Date getNgaysinh() {
		return ngaysinh;
	}
	public void setNgaysinh(Date ngaysinh) {
		this.ngaysinh = ngaysinh;
	}
	public String getDatestring() {
		return datestring;
	}
	public void setDatestring(String datestring) {
		this.datestring = datestring;
	}
	public Integer getLuong() {
		return luong;
	}
	public void setLuong(Integer luong) {
		this.luong = luong;
	}
	public Integer getCapdo() {
		return capdo;
	}
	public void setCapdo(Integer capdo) {
		this.capdo = capdo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getGhichu() {
		return ghichu;
	}
	public void setGhichu(String ghichu) {
		this.ghichu = ghichu;
	}
	public Phongban getPhongban() {
		return phongban;
	}
	public void setPhongban(Phongban phongban) {
		this.phongban = phongban;
	}
	public List<Ghinhan> getGhinhan() {
		return ghinhan;
	}
	public void setGhinhan(List<Ghinhan> ghinhan) {
		this.ghinhan = ghinhan;
	}
	public Nhanvien(Integer manhanvien,
			@NotBlank(message = "Name may not be null !") @Size(min = 1, max = 100, message = "Name must be between 1 and 100 characters") String hoten,
			@NotBlank(message = "Gender may not be null !") String gioitinh, String hinhanh, MultipartFile hinhfile,
			Date ngaysinh, String datestring, @NotNull(message = "Salary may not be null !") Integer luong,
			@NotNull(message = "Level may not be null !") @Min(0) Integer capdo,
			@NotBlank(message = "Email may not be null !") @Email String email,
			@NotBlank(message = "Phone Number may not be null !") String sdt, String ghichu, Phongban phongban,
			List<Ghinhan> ghinhan) {
		super();
		this.manhanvien = manhanvien;
		this.hoten = hoten;
		this.gioitinh = gioitinh;
		this.hinhanh = hinhanh;
		this.hinhfile = hinhfile;
		this.ngaysinh = ngaysinh;
		this.datestring = datestring;
		this.luong = luong;
		this.capdo = capdo;
		this.email = email;
		this.sdt = sdt;
		this.ghichu = ghichu;
		this.phongban = phongban;
		this.ghinhan = ghinhan;
	}
	public Nhanvien() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Nhanvien [manhanvien=" + manhanvien + ", hoten=" + hoten + ", gioitinh=" + gioitinh + ", hinhanh="
				+ hinhanh + ", ngaysinh=" + ngaysinh + ", luong=" + luong + ", capdo=" + capdo + ", email=" + email
				+ ", sdt=" + sdt + ", ghichu=" + ghichu + ", phongban=" + phongban + ", ghinhan=" + ghinhan + "]";
	}
	
}
