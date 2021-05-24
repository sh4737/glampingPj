package controller;

import java.io.File;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.Product;
import service.ProductServiceImp;



@Controller
public class ProductController {
	
	@Autowired
	private ProductServiceImp proService;
	
	//인덱스에서 마이페이지데모로 이동(삭제예정)
	@RequestMapping("mypagedemo")
	public String mypagedemo(HttpSession session, Model model){
		System.out.println("마이페이지데모로 이동");
		String sel_id = "para";
		
		session.setAttribute("sel_id", sel_id);
		
		return "product/mypagedemo";
	}
	
	

	
	// 상품등록페이지로 이동
	@RequestMapping("proinsertform")
	public String proinsertform(){
		System.out.println("상품등록페이지로 이동");			
		return "product/proinsertform";
	}
	
	// 상품등록
	@RequestMapping("proinsert")
	public String proinsert(@RequestParam("pro_pic1") MultipartFile mf, Product pro, HttpServletRequest request, Model model) throws Exception {
		
		String filename = mf.getOriginalFilename();
		int size = (int)mf.getSize();
		String path = request.getRealPath("upload");		
		
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename);
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		System.out.println("sel_id=" + pro.getSel_id());
		
		int result=0;
		
		/* 상품 썸네일 업로드 */
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
		/* 상품 썸네일 업로드 종료*/
		
		pro.setPro_pic(filename);
		
		String con = "";
		String[] con1 = request.getParameterValues("pro_con");
		for(String con2 : con1) {
			con += con2 + "-";
		}
		pro.setPro_con(con);
		
		proService.proinsertdo(pro);
		
		
		
		return "product/proinsertresult";
	}
	


	
	
}
