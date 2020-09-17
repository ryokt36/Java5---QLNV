package product.spring.controller.web;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import product.spring.entities.Nhanvien;
import product.spring.entities.Phongban;
import product.spring.service.NhanvienService;
import product.spring.service.PhongbanService;

@Controller
public class StaffController {
	
	Logger log = org.slf4j.LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	PhongbanService pbs;
	@Autowired
	NhanvienService nvs;
	@RequestMapping("staff")
	public String staff( HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		List<Phongban> pb = pbs.findAll();
		session.setAttribute("Phongban", pb);
		List<Nhanvien> nv = nvs.findAll();
		session.setAttribute("Nhanvien", nv);
		session.setAttribute("page", "staff.jsp");
		return "layout/layout";
	}
	
	
	@Value("${upload.path}")
	private String pathFolder;

	@RequestMapping(value = "save_staff", method = RequestMethod.POST)
	public String save_staff(ModelMap model, HttpServletRequest request,
			@RequestParam(required=false, name="gioitinh") String gioitinh,
			final @RequestParam(required=false, name="hinhfile") MultipartFile hinhfile ,
			@Valid @ModelAttribute("nhanvien") Nhanvien nhanvien, 
			BindingResult errors) {
		HttpSession session = request.getSession(true);
		SimpleDateFormat dfm = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if(errors.hasErrors()){
				model.addAttribute("error", "Oops!");
				model.addAttribute("message", "Something went wrong !");
//				model.addAttribute("message", "Error! An error occurred!");
				log.info("Lỗi:.....  "+errors.toString());
				return "layout/layout";
			}
			else{
				nhanvien.setNgaysinh(dfm.parse(nhanvien.getDatestring()));
				nhanvien.setGioitinh(gioitinh);
				if (!hinhfile.isEmpty()) {
					byte[] bytes = hinhfile.getBytes();
					Path path = Paths.get(pathFolder + hinhfile.getOriginalFilename());
					Files.write(path, bytes);
					nhanvien.setHinhanh("images/upload/" + hinhfile.getOriginalFilename());
				}
				else {
					nhanvien.setHinhanh("");
				}
				nvs.save(nhanvien);
				List<Phongban> pb = pbs.findAll();
				session.setAttribute("Phongban", pb);
				List<Nhanvien> nv = nvs.findAll();
				session.setAttribute("Nhanvien", nv);
				session.setAttribute("page", "staff.jsp");
				session.setAttribute("success", "Success!");
				session.setAttribute("message", "Save '" + nhanvien.getHoten() + "' succesful !");
				return "redirect:staff";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Oops!");
			model.addAttribute("message", "Something went wrong !");
			return "layout/layout";
		}
			
	}
	@RequestMapping("edit_staff")
	public String edit_staff(ModelMap model, HttpServletRequest request, @RequestParam("manhanvien") Integer manhanvien) {
		HttpSession session = request.getSession(true);
		model.addAttribute("nhanvien", new Nhanvien());
		Nhanvien nv = nvs.get(manhanvien);
		session.setAttribute("nhanvien", nv);
		session.setAttribute("page", "edit_staff.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("delete_staff")
	public String delete_department(HttpServletRequest request, @RequestParam("manhanvien") Integer manhanvien) {
		HttpSession session = request.getSession(true);
		Nhanvien nv = nvs.get(manhanvien);
		String ten = (String) nv.getHoten();
		nvs.delete(manhanvien);
		session.setAttribute("success", "Success!");
		session.setAttribute("message", "Delete '"+ten+"' succesful !");
		return "redirect:staff";
	}
	@RequestMapping("add_staff")
	public String add_staff(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		model.addAttribute("ngay", java.time.LocalDate.now());
		model.addAttribute("nhanvien", new Nhanvien());
		session.setAttribute("page", "add_staff.jsp");
		return "layout/layout";
	}
	
}
