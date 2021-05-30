package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Product;
import model.Review;
import service.product.ProductService;
import service.review.ReviewService;


@Controller
public class ReviewController {
	@Autowired
	private ReviewService res;
	@Autowired
	private ProductService pros;
	
	@RequestMapping("/relist/pro_no/{pro_no}")
	public String relist(@PathVariable int pro_no, Model model) {
		Product product = pros.proview(pro_no);
		List<Review> relist = res.list(pro_no);
		int retotal = res.getTotal(pro_no);

		// 별점 평균 구하기
		if(relist.size() != 0) {
			int star = 0;
			
			for(int i = 0; i <relist.size(); i++) {
				Review re = relist.get(i);
				
				//상세 정보 줄바꿈
				String con = re.getRev_con().replace("\n", "<br>");
				re.setRev_con(con);
				
				star += re.getRev_star();
			}
			
			double star_avg = Math.round((star/ relist.size()*10)/10.0);
			model.addAttribute("star_avg", star_avg);
		}
		
		model.addAttribute("retotal", retotal);
		model.addAttribute("relist", relist);
		model.addAttribute("product", product);
		
		return "product/review";
	}
}
