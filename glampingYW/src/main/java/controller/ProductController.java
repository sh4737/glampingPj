package controller;

import java.io.File;

import java.util.ArrayList;
import java.util.List;
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
import model.Revc;
import model.Review;
import model.Room;
import model.Star;
import service.ProductServiceImp;
import service.RoomServiceImp;



@Controller
public class ProductController {
	
	@Autowired
	private ProductServiceImp proService;
	@Autowired
	private RoomServiceImp rmService;
	
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
	public String proinsert(@RequestParam("pro_pic1") MultipartFile mf, @RequestParam("pp_name1") MultipartFile[] pp_mfs,
							Product pro, Product procp,
							PPhoto pp,
							HttpServletRequest request, Model model) throws Exception {
	
		//product 입력 start
		
		// 파일이름앞에 난수및 무작위문자
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
		// 파일이름앞에 난수및 무작위문자 종료
		
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
		System.out.println("product입력 성공여부 : " + proresult);
		//product 입력 end	
		
		
		//product 테이블에서 pro_no 구하기 start
		String sel_id = procp.getSel_id();
		pro = proService.proload(sel_id);
		System.out.println("pro_no : "+ pro.getPro_no());
		//product 테이블에서 pro_no 구하기 end
		
		
		
		//Pphoto 입력 start	
	
		int ppresult = 0;
		for(MultipartFile pp_mf : pp_mfs) {
					
			pp.setPro_no(pro.getPro_no());
						
			String pp_filename1 = pp_mf.getOriginalFilename();
			
			int ran1 = ((int)(Math.random()*1000000000));	
			StringBuffer stsum1 = new StringBuffer();
		    for (int i = 0; i <= 8; i++) {
		        char ch = (char) ((Math.random() * 26) + 65);
		        String chc = String.valueOf(ch);        
		        stsum1.append(chc);
		      }		
			StringBuffer stsum21 = stsum1.append(ran1);
			String picf1 = stsum21.toString();
			
			String pp_filename = picf1.concat(pp_filename1);
			
			int pp_size = (int)pp_mf.getSize();
					
			int pp_result=0;
			
			// 업체사진 업로드
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
			ppresult = proService.ppinsertdo(pp);  // PPhoto 테이블 입력실행	
			
		}
		System.out.println("pphoto입력 성공여부 : " + ppresult);
		
		
		//Pphoto 입력 end
		
		
		
		return "product/proinsertResult";
	}
	

	
	// ++상품목록페이지로 이동(product,room,review 등을 구함)++
	@RequestMapping("selprolist")
	public String selprolist(String sel_id, HttpServletRequest request, Model model) throws Exception{
	
		// Product리스트를 받아옴
		List<Product> prolist = new ArrayList<Product>();
		prolist = proService.getprolist(sel_id); // product 리스트 불러오기
			
		model.addAttribute("prolist", prolist);
		
		
		// rm리스트를 받아옴		
		List<Room> s_rmlist = new ArrayList<Room>();
	
		List<Room> rprice = new ArrayList<Room>();
		
		List<Star> star = new ArrayList<Star>();
		
		List<Revc> revcl = new ArrayList<Revc>();
		
		for(Product pro : prolist) {
			int pro_no = pro.getPro_no();				
			List<Room> rmlist = new ArrayList<Room>();
			rmlist = rmService.getrmlist(pro_no);	// room 리스트 불러오기							
			s_rmlist.addAll(rmlist);
			
			Room rm = rmService.getlowpri(pro_no); // product내 가장 싼방 정보 불러오기
			rprice.add(rm);
			
			
			double savg_no = proService.getstaravg(pro_no); //별점평균 구해오기			
			String savg_no1 = String.format("%.2f", savg_no);			
			Star starcp = new Star();
			starcp.setPro_no(pro_no);
			starcp.setStar_avg(savg_no1);
			star.add(starcp);
			
			
			int rev_count = proService.getrevcount(pro_no); //리뷰수 구해오기		
			Revc revcln = new Revc();
			revcln.setPro_no(pro_no);
			revcln.setRev_cnt(rev_count);
			revcl.add(revcln);
		}	

		
		model.addAttribute("s_rmlist", s_rmlist);
		model.addAttribute("rprice", rprice);
		model.addAttribute("star", star);
		model.addAttribute("revcl", revcl);

		
		
		
		return "product/selprolist";
	}
	
	// ++상품상세페이지로 (판매자)
	@RequestMapping("selprodetail")
	public String selprodetail(int pro_no, HttpServletRequest request, Model model) throws Exception {
		
		Product pro = proService.getprodetail(pro_no); // product 상세정보구하기		
		String cont = pro.getPro_con();	// 편의시설 나누기
		String[] con = cont.split("-");
		
		model.addAttribute("pro", pro);
		model.addAttribute("con", con);
		
		List<PPhoto> pplist = proService.getpplist(pro_no); // pphoto 리스트구하기
		model.addAttribute("pplist", pplist);
		
		List<Room> rmlist = new ArrayList<Room>();
		rmlist = rmService.getrmlist(pro_no);	// room 리스트 불러오기					
		model.addAttribute("rmlist", rmlist);
		
		List<Review> relist = new ArrayList<Review>();
		relist = proService.getrevlist(pro_no); // review 리스트 불러오기				
		model.addAttribute("relist", relist);
		
		
		
		return "product/selprodetail";
	}
	
	
	
	
	
	
}
