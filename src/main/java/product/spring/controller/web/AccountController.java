package product.spring.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import product.spring.entities.Taikhoan;
import product.spring.service.TaikhoanService;

@Controller
public class AccountController {
	Logger log = org.slf4j.LoggerFactory.getLogger(this.getClass());
	@Autowired
	TaikhoanService tks;

	@RequestMapping("account")
	public String acount(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		session.setAttribute("page", "account.jsp");
		List<Taikhoan> tk = tks.findAll();
		session.setAttribute("Taikhoan", tk);
		return "layout/layout";
	}

	@RequestMapping("changepass")
	public String changepass(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		session.setAttribute("page", "changepass.jsp");
		return "layout/layout";
	}

	@RequestMapping(value = "save_pass", method = RequestMethod.POST)
	public String save_pass(ModelMap model, HttpServletRequest request, @RequestParam("matkhaucu") String passold,
			@RequestParam("matkhaumoi") String passnew, @RequestParam("nhaplai") String passconfirm) {
		HttpSession session = request.getSession(true);
		Taikhoan tk = (Taikhoan) session.getAttribute("tk");
		if (passold.equals("") || passnew.equals("") || passconfirm.equals("")) {
			if (passold.equals("")) {
				model.addAttribute("mess1", "Current Password may not be null !");
			} else {
				model.remove("mess1");
			}
			if (passnew.equals("") || 6 > passnew.length() || passnew.length() > 100) {
				model.addAttribute("mess2", "New Password must be from 6-100 characters !");
			} else {
				model.remove("mess2");
			}
			if (passconfirm.equals("")) {
				model.addAttribute("mess3", "Confirm New Password may not be null !");
			} else {
				model.remove("mess3");
			}
			model.addAttribute("passold", passold);
			model.addAttribute("passnew", passnew);
			model.addAttribute("passconfirm", passconfirm);
			return "layout/layout";
		}

		else if (!passold.equals(tk.getMatkhau()) || passnew.equals(passold) || !passnew.equals(passconfirm)) {
			if (!passold.equals(tk.getMatkhau())) {
				model.addAttribute("mess1", "Incorrect Current Password");
			} else {
				model.remove("mess1");
			}
			if (passnew.equals(passold)) {
				model.addAttribute("mess2", "Please use a new password");
			} else {
				model.remove("mess2");
			}
			if (!passnew.equals(passconfirm)) {
				model.addAttribute("mess3", "Incorrect Confirm New Password");
			} else {
				model.remove("mess3");
			}
			model.addAttribute("passold", passold);
			model.addAttribute("passnew", passnew);
			model.addAttribute("passconfirm", passconfirm);
			return "layout/layout";
		} else {
			String tendangnhap = tk.getTendangnhap();
			String quyen = tk.getQuyen();
			String hoten = tk.getHoten();
			Taikhoan tk1 = new Taikhoan(tendangnhap, passnew, quyen, hoten);
			session.setAttribute("tk", tk1);
			tks.save(tk1);
			session.setAttribute("success", "Success!");
			session.setAttribute("message", "Change password succesful !");
			return "redirect:home";
		}

	}

	@RequestMapping("add_account")
	public String add_account(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		model.addAttribute("taikhoan", new Taikhoan());
		session.setAttribute("page", "add_account.jsp");
		return "layout/layout";
	}

	@RequestMapping("edit_account")
	public String edit_account(ModelMap model, HttpServletRequest request,
			@RequestParam("tendangnhap") String tendangnhap) {
		HttpSession session = request.getSession(true);
		model.addAttribute("taikhoan", new Taikhoan());
		Taikhoan tk = tks.get(tendangnhap);
		Taikhoan tkLogin = (Taikhoan) session.getAttribute("tk");
		if (tk.getQuyen().equals("admin") && !tkLogin.getTendangnhap().equals("admin")) {
			model.addAttribute("error", "Oops!");
			model.addAttribute("message", "Cannot edit to admin ! You are: " + tkLogin.getTendangnhap());
			return "layout/layout";
		}
		session.setAttribute("taikhoanShow", tk);
		session.setAttribute("page", "edit_account.jsp");
		return "layout/layout";
	}

	@RequestMapping("save_account")
	public String save_account(ModelMap model, HttpServletRequest request,
			@RequestParam(required = false, name = "quyen") String quyen,
			@Valid @ModelAttribute("taikhoan") Taikhoan taikhoan, BindingResult errors) {
		try {
			HttpSession session = request.getSession(true);
			boolean check = tks.checkTaiKhoan(taikhoan.getTendangnhap());
			String page = (String) session.getAttribute("page");
			if (check==true && page.equals("add_account.jsp")) {
				errors.rejectValue("tendangnhap", "taikhoan", "Username already exists");
				log.info("Lỗi tk trùng:.....  ");
				return "layout/layout";
			}
			if (errors.hasErrors()) {
				model.addAttribute("error", "Oops!");
				model.addAttribute("message", "Something went wrong !");
				log.info("Lỗi error:.....  " + errors.toString());
				return "layout/layout";
			}
			else {
				taikhoan.setQuyen(quyen);
				tks.save(taikhoan);
				List<Taikhoan> tk = tks.findAll();
				session.setAttribute("Taikhoan", tk);
				session.setAttribute("page", "account.jsp");
				session.setAttribute("success", "Success!");
				session.setAttribute("message", "Save '" + taikhoan.getHoten() + "' succesful !");
				return "layout/layout";
			}
		} catch (Exception e) {
			model.addAttribute("error", "Oops!");
			model.addAttribute("message", "Something went wrong !");
			log.info("Lỗi e:.....  " + e.toString());
			return "layout/layout";
		}
	}

	@RequestMapping("delete_account")
	public String delete_account(ModelMap model, HttpServletRequest request,
			@RequestParam("tendangnhap") String tendangnhap) {
		HttpSession session = request.getSession(true);
		Taikhoan tk = tks.get(tendangnhap);
		Taikhoan tkLogin = (Taikhoan) session.getAttribute("tk");
		try {
			if (tk.getQuyen().equals("admin") && !tkLogin.getTendangnhap().equals("admin")) {
				model.addAttribute("error", "Oops!");
				model.addAttribute("message", "Cannot delete to admin ! You are: " + tkLogin.getTendangnhap());
				return "layout/layout";
			}
			String ten = (String) tk.getHoten();
			tks.delete(tendangnhap);
			session.setAttribute("success", "Success!");
			session.setAttribute("message", "Delete '" + ten + "' succesful !");
			return "redirect:account";
		} catch (Exception e) {
			model.addAttribute("error", "Oops!");
			model.addAttribute("message", "Cannot delete to admin ! You are: " + tkLogin.getTendangnhap());
			return "layout/layout";
		}
	}
}
