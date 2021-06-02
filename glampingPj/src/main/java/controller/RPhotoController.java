package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import model.RPhoto;
import service.rphoto.RPhotoService;

@Controller
public class RPhotoController {
	@Autowired
	private RPhotoService rps;
	
	@RequestMapping("/loadimglist/rm_no/{rm_no}")
	public String imglist(@PathVariable int rm_no, Model model) {
		List<RPhoto> imglist = rps.list(rm_no);
		
		model.addAttribute("imglist", imglist);
		
		return "product/loadimglist";
	}
}
