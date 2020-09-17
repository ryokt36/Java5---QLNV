package product.spring.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.spring.entities.Phongban;
import product.spring.entities.Taikhoan;
import product.spring.service.NhanvienService;
import product.spring.service.PhongbanService;
import product.spring.service.TaikhoanService;


@Controller
public class LoginController {
	Logger log = org.slf4j.LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	TaikhoanService tks;
	@Autowired
	NhanvienService nvs;
	@Autowired
	PhongbanService pbs;
	
	
	@RequestMapping(value = {"/"})
	public String index( HttpServletRequest request) {
		HttpSession session = request.getSession();
        Taikhoan tk = (Taikhoan) session.getAttribute("tk");
        log.info("//////////");
        if(tk==null){
        	return "redirect:login";
        }
        else return "home/home";
	}
	@RequestMapping(value = {"login"})
	public ModelAndView login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		log.info("//////////login");
		session.removeAttribute("tk");
		ModelAndView mav = new ModelAndView("/login");
		return mav;
	}
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(ModelMap model, HttpServletRequest request, @RequestParam("username") String username, @RequestParam("pass") String pass) {
		Taikhoan tk = tks.findById(username);
		if(tk==null) {
			model.addAttribute("message", "The account or password is incorrect!");
			return "login";
		}
		else {
			if(tk.getMatkhau().equals(pass)) {
				HttpSession session = request.getSession(true);
				List<String[]> nvt = nvs.get10NhanVien();
				session.setAttribute("tk", tk);
				session.setAttribute("QUYEN", tk.getQuyen());
				session.setAttribute("Nhanvientop", nvt);
				session.setAttribute("language", "English");
				model.remove("message");
				return "home/home";
			}
			else {
				model.addAttribute("message", "The account or password is incorrect!");
				return "login";
			}
		}
	}
	
	
	@RequestMapping("home")
	public String home(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		List<String[]> nvt = nvs.get10NhanVien();
		session.setAttribute("Nhanvientop", nvt);
		return "home/home";
	}
	
	@RequestMapping("manager")
	public String manager(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		List<Phongban> pb = pbs.findAll();
		session.setAttribute("Phongban", pb);
		session.setAttribute("page", "department.jsp");
		return "layout/layout";
		
	}
	
	@RequestMapping("/DaNgonNgu")
	public String dangonngu(HttpServletRequest request) {
		String language = request.getParameter("language");
		HttpSession session = request.getSession(true);
		session.setAttribute("language", language);
		String a = "home/home";
		return a;
		
		
	}
}
