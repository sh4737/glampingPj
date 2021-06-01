package controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.PPhoto;
import model.Product;
import service.pphoto.PPhotoService;
import service.product.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService pros;
	@Autowired
	private PPhotoService pps;
	
	//메인 페이지
	@RequestMapping("/main")
	public String main(Product product, Model model) {
		
		List<Product> listTop = pros.listTop(product);
		
		List<Product> listBest = pros.listBest(product);
		
		model.addAttribute("listTop", listTop);
		model.addAttribute("listBest", listBest);
		
		return "/product/main";
	}
	
	//검색 페이지 이동(page 없을 떄)
	@RequestMapping("/prolist")
	public String initList() {
		return "redirect:prolist/pageNum/1";
	}
	
	//검색 페이지
	@RequestMapping(value ="/prolist/pageNum/{pageNum}", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(@PathVariable String pageNum, String checkInS, String checkOutS, String capS, String regionS, Product product, Model model) {
		// 페이징
		final int rowPerPage = 20;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		product.setStartRow(startRow);
		product.setEndRow(endRow);
		
		System.out.println("capS : "+ capS);
		
		// 지역 입력
		product.setRegion(regionS);
		
		// 인원 수 형변환 (String to int)
		if(capS == null || capS.equals("")) {
			capS = "0";
		}
		
		int capNum = Integer.parseInt(capS);
		product.setCap(capNum);
		
		System.out.println("cap : " + product.getCap());
			
		// 체크인, 체크아웃 형변환 (String to Timestamp)
		if(checkInS == "" && checkOutS == "") {
			checkInS = null;
			checkOutS = null;
		}
		
		if(checkInS != null && checkOutS != null) {
			
			String cis = checkInS + " 00:00:00";
			String cos = checkOutS + " 00:00:00";
			
			Timestamp checkInT = Timestamp.valueOf(cis);
			Timestamp checkOutT = Timestamp.valueOf(cos);
			
			product.setCheckIn(checkInT);
			product.setCheckOut(checkOutT);
		}
		
		// 페이지 수
		int total = pros.getTotal(product);
		int pageCount = (total + rowPerPage - 1) / rowPerPage;
		model.addAttribute("pageCount", pageCount);
		
		List<Product> list = pros.list(product); 
		model.addAttribute("list", list);
		
		model.addAttribute("pageNum", pageNum);
		//검색
		model.addAttribute("regionS", regionS);
		model.addAttribute("checkInS", checkInS);
		model.addAttribute("checkOutS", checkOutS);
		model.addAttribute("cap", product.getCap());
		model.addAttribute("keyword", product.getKeyword());
		
		return "/product/prolist";
	}
	
	// 검색 무한 스크롤 추가 페이지
	@RequestMapping("/fetchprolist")
	public String fetchList(String pageNum, String checkInS, String checkOutS, String capS, String regionS, Product product, Model model) {
		// 페이징
		final int rowPerPage = 20;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "2";
		}
		System.out.println("pageNum : " + pageNum);
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		product.setStartRow(startRow);
		product.setEndRow(endRow);

		// 지역 입력
		product.setRegion(regionS);
		
		// 인원 수 형변환 (String to int)
		if(capS == null || capS.equals("")) {
			capS = "0";
		}
		
		int capNum = Integer.parseInt(capS);
		product.setCap(capNum);
			
		// 체크인, 체크아웃 형변환 (String to Timestamp)
		if(checkInS == "" && checkOutS == "") {
			checkInS = null;
			checkOutS = null;
		}
		
		if(checkInS != null && checkOutS != null) {
			
			String cis = checkInS + " 00:00:00";
			String cos = checkOutS + " 00:00:00";
			
			Timestamp checkInT = Timestamp.valueOf(cis);
			Timestamp checkOutT = Timestamp.valueOf(cos);
			
			product.setCheckIn(checkInT);
			product.setCheckOut(checkOutT);
		}
		
			
		List<Product> list = pros.list(product); 
		model.addAttribute("list", list);
		
		return "/product/fetchprolist";
	}
	
	// 상품 상세 페이지(날짜, 인원 미선택)
	@RequestMapping("/proView/pro_no/{pro_no}")
	public String initProView(@PathVariable int pro_no, Model model) {
		Product product = pros.proview(pro_no);
		
		//해당 상품 사진 구해오기
		List<PPhoto> pplist = pps.list(pro_no);
		
		//상세 정보 줄바꿈
		String intro = product.getPro_intro().replace("\n", "<br>");
		
		//편의 시설 배열 변환
		String c = product.getPro_con();
		String[] con = c.split("-");
		
		model.addAttribute("pplist", pplist);
		model.addAttribute("product", product);
		model.addAttribute("intro", intro);
		model.addAttribute("con", con);
		
		return "/product/proview";
	}
	
	// 상품 상세 페이지
	@RequestMapping("/proView/pro_no/{pro_no}/checkInS/{checkInS}/checkOutS/{checkOutS}")
	public String proView(@PathVariable int pro_no, @PathVariable String checkInS, @PathVariable String checkOutS, Model model) {
		Product product = pros.proview(pro_no);
		
		//해당 상품 사진 구해오기
		List<PPhoto> pplist = pps.list(pro_no);
		
		//상세 정보 줄바꿈
		String intro = product.getPro_intro().replace("\n", "<br>");
		
		//편의 시설 배열 변환
		String c = product.getPro_con();
		String[] con = c.split("-");
		
		
		model.addAttribute("pplist", pplist);
		model.addAttribute("product", product);
		model.addAttribute("intro", intro);
		model.addAttribute("con", con);
		
		model.addAttribute("checkInS", checkInS);
		model.addAttribute("checkOutS", checkOutS);
		
		return "/product/proview";
	}
	
	
	
	
}
