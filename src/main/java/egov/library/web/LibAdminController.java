package egov.library.web;


import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.library.service.DefaultVO;
import egov.library.service.LibAdminService;
import egov.library.service.LibMemberService;
import egov.library.service.LibMemberVO;


@Controller
public class LibAdminController {
	
	
	@Resource(name="libMemberService")
	LibMemberService libMemberService;
	
	
	@Resource(name="libAdminService")
	LibAdminService libAdminService;
	
	@RequestMapping("/libAdminMemberList.do")
	public String selectAdminMemberList(DefaultVO vo, ModelMap model) throws Exception {
		
		// 화면에 출력할 갯수
		int pageUnit = vo.getPageUnit();
		// 현재 페이지 번호
		int pageIndex = vo.getPageIndex();
		// firstIndex 값 계산 ;; 1 -> 1  // 2 -> 11 // 3 -> 21
		int firstIndex = (pageIndex-1)*pageUnit+1;
		// lastIndex 값 계산 ;; 1 -> 10 // 2 -> 20 // 3 -> 30
		int lastIndex = pageIndex*pageUnit;
		
		// vo에 값을 부여
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		int total = libAdminService.selectMemberListTotal(vo);
		
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		vo.setRecordCountPerPage(recordCountPerPage);
		
		// 12/10 -> ceil(1.2) -> 2
		int lastPage = (int) Math.ceil((double)total/pageUnit);
		vo.setLastPage(lastPage);
		
		int firstPage = (int) (Math.floor(pageIndex-1)/10)*10 + 1;
		List<?> list = libAdminService.selectAdminMemberList(vo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("firstPage", firstPage);
		return "admin/libAdminMemberList";
	}
	
	@RequestMapping("/libAdminMemberList2.do")
	public String selectAdminMemberList2(DefaultVO vo, ModelMap model) throws Exception {
		
		// 화면에 출력할 갯수
		int pageUnit = vo.getPageUnit();
		// 현재 페이지 번호
		int pageIndex = vo.getPageIndex();
		// firstIndex 값 계산 ;; 1 -> 1  // 2 -> 11 // 3 -> 21
		int firstIndex = (pageIndex-1)*pageUnit+1;
		// lastIndex 값 계산 ;; 1 -> 10 // 2 -> 20 // 3 -> 30
		int lastIndex = pageIndex*pageUnit;
		
		// vo에 값을 부여
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		int total = libAdminService.selectMemberListTotal2(vo);
		
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		vo.setRecordCountPerPage(recordCountPerPage);
		
		// 12/10 -> ceil(1.2) -> 2
		int lastPage = (int) Math.ceil((double)total/pageUnit);
		vo.setLastPage(lastPage);
		int firstPage = (int) (Math.floor(pageIndex-1)/10)*10 + 1;
		
		List<?> list = libAdminService.selectAdminMemberList2(vo);
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("total",total);
		return "admin/libAdminMemberList2";
	}
	
	@RequestMapping("/libAdminMemberModify.do")
	public String selectLibAdminMemberModify(String userid, ModelMap model) throws Exception {
	    
	    LibMemberVO vo = libAdminService.selectLibAdminMemberModify(userid);
	    model.addAttribute("vo", vo);

	    return "admin/libAdminMemberModify";
	}
	
	@RequestMapping("/libAdminMemberModifySave.do")
	@ResponseBody public String updateLibAdminMemberModifySave(LibMemberVO vo) throws Exception {
	  
	    String str = ""; 
	    String state = String.valueOf(vo.getState());
	    if(state.equals("N")) {
	    	
	    	int result = libAdminService.updateLibAdminMemberModifySave(vo);
			if(result == 1) { str = "1"; }
				
			return str; 
			
	    } else {
	    	 int cnt = libMemberService.selectBookCount(vo);
	 		
	 		if(cnt > 0) {
	 			str = "no";
	 			return str;
	 		}
	 		int cnt2 = libMemberService.selectReserveCount(vo);
	 		if(cnt2 > 0) {
	 			str = "no2";
	 			return str;
	 		}
	 	    
	 		int result = libAdminService.updateLibAdminMemberModifySave(vo);
	 		if(result == 1) { str = "1"; }
	 			
	 		return str; 
	    }
	   
	}
	
	@RequestMapping("/libAdminMemberDelete.do")
	@ResponseBody
	public String deleteLibAdminMember(String userid) throws Exception {
	    String str = "";
	    
	    // Delete the QR code image
	    String qrCodeFilePath = "C:/workspace44/library/src/main/webapp/memberQR/" + userid + ".png"; // Modify the path if necessary
	    File qrCodeFile = new File(qrCodeFilePath);
	    
	    if (qrCodeFile.exists()) {
	        if (qrCodeFile.delete()) {
	            System.out.println("QR code image deleted successfully.");
	        } else {
	            System.out.println("Failed to delete QR code image.");
	        }
	    } else {
	        System.out.println("QR code image does not exist.");
	    }

	    // Delete the member's information from the database
	    int cnt = libAdminService.deleteLibAdminMember(userid);
	    
	    if (cnt == 1) {
	        str = "ok"; // Deletion success
	    }
	    
	    return str;
	}
	 
}
