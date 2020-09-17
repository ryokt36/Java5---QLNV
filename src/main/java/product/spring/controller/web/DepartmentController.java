package product.spring.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import product.spring.entities.Phongban;
import product.spring.service.PhongbanService;

@Controller
public class DepartmentController {
	@Autowired
	PhongbanService pbs;
	@RequestMapping("department")
	public String department( HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		session.setAttribute("page", "department.jsp");
		List<Phongban> pb = pbs.findAll();
		session.setAttribute("Phongban", pb);
		return "layout/layout";
	}
	@RequestMapping("edit_department")
	public String edit_department(ModelMap model, HttpServletRequest request, 
			@RequestParam("maphongban") Integer maphongban) {
		model.addAttribute("phongban", new Phongban());
		HttpSession session = request.getSession(true);
		Phongban pb = pbs.getById(maphongban);
		session.setAttribute("tenphongban", pb.getTenphongban());
		session.setAttribute("maphongban", maphongban);
		session.setAttribute("page", "edit_department.jsp");
		return "layout/layout";
	}
	@RequestMapping(value = "save_department", method = RequestMethod.POST)
	public String save_department(ModelMap model, HttpServletRequest request, @Valid @ModelAttribute("phongban") Phongban phongban,
			BindingResult errors) {
		HttpSession session = request.getSession(true);
		if(errors.hasErrors()){
			return "layout/layout";
		}
		else{
			pbs.savePhongban(phongban);
			session.setAttribute("page", "department.jsp");
			List<Phongban> pb = pbs.findAll();
			session.setAttribute("Phongban", pb);
			session.setAttribute("success", "Success!");
			session.setAttribute("message", "Save '" + phongban.getTenphongban() + "' succesful !");
			return "redirect:department";
		}

	}
	@RequestMapping("delete_department")
	public String delete_department(HttpServletRequest request, @RequestParam("maphongban") Integer maphongban) {
		HttpSession session = request.getSession(true);
		Phongban pb = pbs.getById(maphongban);
		String ten = pb.getTenphongban();
		pbs.deletePhongban(maphongban);
		session.setAttribute("page", "department.jsp");
		session.setAttribute("success", "Success!");
		session.setAttribute("message", "Delete '"+ten+"' succesful !");
		return "redirect:department";
	}
	@RequestMapping("add_department")
	public String add_department(ModelMap model, HttpServletRequest request) {
		model.addAttribute("phongban", new Phongban());
		HttpSession session = request.getSession(true);
		session.setAttribute("page", "add_department.jsp");
		return "layout/layout";
	}
}
