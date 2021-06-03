package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.Product;
import model.RPhoto;
import model.Room;
import service.ProductServiceImp;
import service.RoomServiceImp;



@Controller
public class RoomController {
	
	@Autowired
	private ProductServiceImp proService;
	@Autowired
	private RoomServiceImp rmService;
	
	// ++객실정보 등록페이지로 이동++
	@RequestMapping("rminsertform")
	public String rminsertform(){
		
		System.out.println("객실정보 등록페이지로 이동");
		return "product/rminsertform";
	}
	
	// ++객실정보 등록++
	@RequestMapping("rminsert")
	public String rminsert(@RequestParam("rm_pic1") MultipartFile mf, @RequestParam("rp_name1") MultipartFile[] mfs, Product pro, Room rm, RPhoto rp,
						   HttpServletRequest request, Model model) throws Exception {
		
		//product 테이블에서 pro_no 구하기 start
		String sel_id = pro.getSel_id();
		pro = proService.proload(sel_id);
		//product 테이블에서 pro_no 구하기 end
		
		//Room 입력 start
		rm.setPro_no(pro.getPro_no());
					
		String filename1 = mf.getOriginalFilename();
		
		int ran = ((int)(Math.random()*1000000000));	
		StringBuffer stsum = new StringBuffer();
	    for (int i = 0; i <= 8; i++) {
	        char ch = (char) ((Math.random() * 26) + 65);
	        String chc = String.valueOf(ch);        
	        stsum.append(chc);
	      }		
		StringBuffer stsum2 = stsum.append(ran);
		String picf = stsum2.toString();
		
		String filename = picf.concat(filename1);
		
		int size = (int)mf.getSize();
		String path = request.getRealPath("upload");		
				
		int result=0;
		
		// 객실 썸네일 업로드
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
		
		rm.setRm_pic(filename);
		
		int rmresult = rmService.rminsertdo(rm); //Room테이블 입력실행
		model.addAttribute("rmresult", rmresult);
		
		System.out.println("객실정보입력여부 : "+ rmresult);
		//Room 입력 end
		
		
		// rm_type값 저장 증가			
//		System.out.println("rm_type : " + rm.getRm_type());	
//		int t = rm.getRm_type();
//		t += 1;
//		rm.setRm_type(t);			
//		System.out.println("rm_type : " + rm.getRm_type());
//		System.out.println("-------------------------------");
//		int rt = rm.getRm_type();
//		model.addAttribute("rt", rt);
		
		
		//room 테이블에서 rm_no 구하기 start
		int pro_no = rm.getPro_no();
		rm = rmService.rmload(pro_no);
		System.out.println("rm_no : "+ rm.getRm_no());
		//room 테이블에서 rm_no 구하기 end
		
		
		
		//Rphoto 입력 start	
		int rpresult = 0;
		for(MultipartFile rp_mf : mfs) {
					
			rp.setRm_no(rm.getRm_no());
						
			String rp_filename1 = rp_mf.getOriginalFilename();
			
			int ran1 = ((int)(Math.random()*1000000000));	
			StringBuffer stsum1 = new StringBuffer();
		    for (int i = 0; i <= 8; i++) {
		        char ch = (char) ((Math.random() * 26) + 65);
		        String chc = String.valueOf(ch);        
		        stsum1.append(chc);
		      }		
			StringBuffer stsum21 = stsum1.append(ran1);
			String picf1 = stsum21.toString();
			
			String rp_filename = picf1.concat(rp_filename1);
			
				
			int rp_size = (int)rp_mf.getSize();
					
			int rp_result=0;
			
			// 업체사진 업로드
			String rp_file[] = new String[2];

			StringTokenizer rp_st = new StringTokenizer(rp_filename, ".");
			rp_file[0] = rp_st.nextToken();		
			rp_file[1] = rp_st.nextToken();		// 확장자	
			
			if(rp_size > 10000000){
				rp_result=1;
				model.addAttribute("rp_result", rp_result);
				
				return "product/uploadResult";
				
			}else if(!rp_file[1].equals("jpg") &&
					 !rp_file[1].equals("jpeg") &&
					 !rp_file[1].equals("gif") &&
					 !rp_file[1].equals("png") ){
				
				rp_result=2;
				model.addAttribute("rp_result", rp_result);
				
				return "product/uploadResult";
			}
			

			if (rp_size > 0) { // 첨부파일이 전송된 경우

				rp_mf.transferTo(new File(path + "/" + rp_filename));

			}
			
			rp.setRp_name(rp_filename);					
			rpresult = rmService.rpinsertdo(rp);  // Rphoto 테이블 입력실행	
			
		}
		System.out.println("rphoto입력 성공여부 : " + rpresult);		
		//Rphoto 입력 end
			
		return "product/rminsertResult";
	}
	
	
	
	// ++객실 상세페이지++
	@RequestMapping("roomdetail")
	public String rmdetail(@RequestParam("rm_no") int rm_no) {
		System.out.println(rm_no);
		return "product/selrmdetail";
	}
	
}
