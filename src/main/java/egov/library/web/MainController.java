package egov.library.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egov.library.service.CalService;
import egov.library.service.CalVO;
import egov.library.service.DefaultVO;
import egov.library.service.LibEventService;
import egov.library.service.LibEventVO;
import egov.library.service.LibMemberService;
import egov.library.service.LibMemberVO;
import egov.library.service.LibService;
import egov.library.service.LibraryService;

@Controller
public class MainController {
	
	@Resource(name="libMemberService")
	LibMemberService libMemberService;
	
	@Resource(name="libeventService")
	LibEventService libeventService;
	
	@Resource(name="libService")
	LibService libService;
	
	@Resource(name="calService")
	CalService calService;
	
	@Resource(name="libraryService")
	LibraryService libraryService;
	
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/main.do")
	public String libCalendar(CalVO calVO, DefaultVO defaultVO, LibEventVO eventVO,  ModelMap model, HttpSession session) throws Exception {
		
		
		int pageUnit = defaultVO.getPageUnit();
		
		int pageIndex = defaultVO.getPageIndex();
		
		String userid = (String)session.getAttribute("SessionUserID");

		
		List<?> list = calService.selectThisMonthList(calVO);
		List<?> bookList = libraryService.selectMainPopularBookList(defaultVO);
		List<?> noticeList = libService.selectLibNoticeList2(defaultVO);
		List<?> eventList = libeventService.selectLibEventFileName(eventVO);
		LibMemberVO memberVO = libMemberService.selectLoginInfo(userid);
		int total = libService.selectLibNoticeTotal(defaultVO);
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		defaultVO.setRecordCountPerPage(recordCountPerPage);
		
		
		model.addAttribute("total",total);
		model.addAttribute("memberVO", memberVO);
	    model.addAttribute("list", list);
	    model.addAttribute("bookList", bookList);
	    model.addAttribute("noticeList", noticeList);
	    model.addAttribute("eventList",eventList);
		
		
		return "main/main";
	}
	
	@RequestMapping("/adminMain.do")
	public String adminMain(HttpSession session) throws Exception {
		
		String adminId = (String)session.getAttribute("SessionUserID");

	    if (!"admin".equals(adminId)) {
	        return "redirect:/main.do";
	    }
		
		return "admin/adminMain";
	}
	
	@RequestMapping("/voluntary.do")
	public String voluntary() {
		return "libraryGuide/voluntary";
	}
	@RequestMapping("/guide.do")
	public String guide() {
		return "libraryGuide/guide";
	}
	@RequestMapping("/rentGuide.do")
	public String rentGuide() {
		return "libraryGuide/rentGuide";
	}
	@RequestMapping("/tourGuide.do")
	public String tourGuide() {
		return "libraryGuide/tourGuide";
	}
	@RequestMapping("/reserveGuide.do")
	public String reserveGuide() {
		return "libraryGuide/reserveGuide";
	}
	@RequestMapping("/libMap.do")
	public String libMap() {
		return "libraryGuide/libMap";
	}
	
}
