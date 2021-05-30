package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Room;
import service.room.RoomService;

@Controller
public class RoomController {
	@Autowired
	private RoomService rms;
	
	@RequestMapping("/rmlist/pro_no/{pro_no}")
	public String rmlist(@PathVariable int pro_no, Model model) {
		List<Room> rmlist = rms.list(pro_no);
		
		model.addAttribute("rmlist", rmlist);
		
		return "product/roomlist";
	}
	
}
