package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.StringJoiner;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.PPhoto;
import model.Product;
import service.ProductServiceImp;



@Controller
public class ProductController {
	
	@Autowired
	private ProductServiceImp proService;
	
	// ++인덱스에서 마이페이지데모로 이동(삭제예정)++
	@RequestMapping("mypagedemo")
	public String mypagedemo(HttpSession session, Model model){
		System.out.println("마이페이지데모로 이동");
		String sel_id = "pama";
		
		session.setAttribute("sel_id", sel_id);
		
		return "product/mypagedemo";
	}
	
	

	
	// ++상품등록페이지로 이동++
	@RequestMapping("proinsertform")
	public String proinsertform(){
		System.out.println("상품등록페이지로 이동");			
		return "product/proinsertform";
	}
	
	// ++상품등록++
	@RequestMapping("proinsert")
	public String proinsert(@RequestParam("pro_pic1") MultipartFile mf, @RequestParam("pp_name1") MultipartFile[] pp_mfs, Product pro, Product procp,
							PPhoto pp,
							HttpServletRequest request, Model model) throws Exception {
		
		//product 입력 start
		String filename = mf.getOriginalFilename();
		int size = (int)mf.getSize();
		String path = request.getRealPath("upload");		
				
		int result=0;
		
		// 상품 썸네일 업로드
		String file[] = new String[2];

		StringTokenizer st = new StringTokenizer(filename, ".");
		file[0] = st.nextToken();		
		file[1] = st.nextToken();		// 확장자	
		
		if(size > 10000000){
			result=1;
			model.addAttribute("result", result);
			
			return "product/uploadResult";
			
		}else if(!file[1].equals("jpg") &&
				 !file[1].equals("jpeg") &&
				 !file[1].equals("gif") &&
				 !file[1].equals("png") ){
			
			result=2;
			model.addAttribute("result", result);
			
			return "product/uploadResult";
		}
		

		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + filename));

		}
		
		pro.setPro_pic(filename);
		
		// 편의시설 항목 파싱저장
		String con = "";
		String[] con1 = request.getParameterValues("pro_con");
		for(String con2 : con1) {
			con += con2 + "-";
		}
		pro.setPro_con(con);
				
		int proresult = proService.proinsertdo(pro); // Product 테이블 입력실행
		model.addAttribute("proresult", proresult); //Product 테이블 입력결과 1 또는 0
		System.out.println("proresult : " + proresult);
		//product 입력 end	
		
		
		//product 테이블에서 pro_no 구하기 start
		String sel_id = procp.getSel_id();
		pro = proService.proload(sel_id);
		System.out.println("pro_no : "+ pro.getPro_no());
		//product 테이블에서 pro_no 구하기 end
		
		model.addAttribute("pro", pro);
		
		
		//Pphoto 입력 start

		
		for(MultipartFile pp_mf : pp_mfs) {
			
			pp.setPro_no(pro.getPro_no());
			
			String pp_filename = pp_mf.getOriginalFilename();	
			int pp_size = (int)pp_mf.getSize();
					
			int pp_result=0;
			
			// 상품 썸네일 업로드
			String pp_file[] = new String[2];

			StringTokenizer pp_st = new StringTokenizer(pp_filename, ".");
			pp_file[0] = pp_st.nextToken();		
			pp_file[1] = pp_st.nextToken();		// 확장자	
			
			if(pp_size > 10000000){
				pp_result=1;
				model.addAttribute("pp_result", pp_result);
				
				return "product/uploadResult";
				
			}else if(!pp_file[1].equals("jpg") &&
					 !pp_file[1].equals("jpeg") &&
					 !pp_file[1].equals("gif") &&
					 !pp_file[1].equals("png") ){
				
				pp_result=2;
				model.addAttribute("pp_result", pp_result);
				
				return "product/uploadResult";
			}
			

			if (pp_size > 0) { // 첨부파일이 전송된 경우

				pp_mf.transferTo(new File(path + "/" + pp_filename));

			}
			
			pp.setPp_name(pp_filename);
			
			System.out.println("사업장번호 : " + pp.getPro_no());
			System.out.println("사진 : " + pp.getPp_name());

		}
		
		
		
		
				
		
		//Pphoto 입력 end
		
		
		return "product/insertResult";
	}
	

	
	
}
