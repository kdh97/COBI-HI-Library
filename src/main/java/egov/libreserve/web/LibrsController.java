package egov.libreserve.web;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egov.library.service.DefaultVO;
import egov.library.service.LibMemberVO;
import egov.libreserve.service.LibrsService;
import egov.libreserve.service.LibrsVO;

@Controller
public class LibrsController {

	@Resource(name="LibrsService")
 	LibrsService LibrsService;

	
	@RequestMapping("/libReserve.do")
	public String selectSit(LibrsVO vo
				,ModelMap model,String session_id) throws Exception {
		
		List<?> list = LibrsService.selectSitnumber(vo);
		List<?> list1 = LibrsService.selectSitnumber1(vo);
		List<?> list2 = LibrsService.selectSitnumber2(vo);
		List<?> list3 = LibrsService.selectSitnumber3(vo);
		List<?> list4 = LibrsService.selectSitnumber4(vo);
		
		int Ytotal = LibrsService.selectYSitTotal(vo);
		int Ntotal = LibrsService.selectNSitTotal(vo);
		
		model.addAttribute("rs", list);
		model.addAttribute("rs1",list1);
		model.addAttribute("rs2",list2);
		model.addAttribute("rs3",list3);
		model.addAttribute("rs4",list4);
		
		model.addAttribute("Ytotal",Ytotal);	
		model.addAttribute("Ntotal",Ntotal);

		List<?> already = LibrsService.selectAlreadySit(vo);
		List<?> idlist = LibrsService.selectSitid(vo);
		model.addAttribute("idlist",idlist);
		model.addAttribute("al",already);
		
	return "libreserve/libReserve";
	}	
	
	@RequestMapping("/libAdminReserve.do")
	public String selectAdmin(LibrsVO vo,ModelMap model,String session_id,LibMemberVO vo1) throws Exception {

		List<?> list = LibrsService.selectSitnumber(vo);
		List<?> list1 = LibrsService.selectSitnumber1(vo);
		List<?> list2 = LibrsService.selectSitnumber2(vo);
		List<?> list3 = LibrsService.selectSitnumber3(vo);
		List<?> list4 = LibrsService.selectSitnumber4(vo);
		
		int Ytotal = LibrsService.selectYSitTotal(vo);
		int Ntotal = LibrsService.selectNSitTotal(vo);
		
		model.addAttribute("rs", list);
		model.addAttribute("rs1",list1);
		model.addAttribute("rs2",list2);
		model.addAttribute("rs3",list3);
		model.addAttribute("rs4",list4);
		
		model.addAttribute("Ytotal",Ytotal);	
		model.addAttribute("Ntotal",Ntotal);

		List<?> sdate = LibrsService.selectSitSdate(vo);
		List<?> idlist = LibrsService.selectSitid(vo);
		List<?> name = LibrsService.selectSitName(vo1);
		model.addAttribute("idlist",idlist);
		model.addAttribute("sdate",sdate);
		model.addAttribute("name",name);
		
	return "libreserve/libAdminReserve";
	}
	
	@RequestMapping("/librsAdminOut.do") 
	public String updateAdmin(LibrsVO vo) throws Exception {
		
	    int chk2 = LibrsService.selectUserinfo2(vo.getSession_id());
	    
	    Date currentDate = new Date();
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
	    String formattedDate = dateFormat.format(currentDate);

	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(currentDate);
	    calendar.add(Calendar.HOUR_OF_DAY, 2);
	    Date laterDate = calendar.getTime();
	    String formattedLaterDate = dateFormat.format(laterDate);
	    
	    String sdate = LibrsService.selectSdate(vo);
	    SimpleDateFormat dbDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Date enterTime = dbDateFormat.parse(sdate);

	    SimpleDateFormat userDateFormat = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
	    String formattedSdate = userDateFormat.format(enterTime);

	    long timeDifferenceMillis = currentDate.getTime() - enterTime.getTime();
	    long seconds = timeDifferenceMillis / 1000;
	    long minutes = seconds / 60;
	    long hours = minutes / 60;
	    minutes = minutes % 60;
	    seconds = seconds % 60;

	    String timeDifference = hours + "시간 " + minutes + "분 " + seconds + "초";
	    
	    if (chk2 == 1) {
	        
	        int result = LibrsService.updateAdminSitout(vo);
	        int result1 = LibrsService.updateEdate(vo);

	        String message = vo.getSession_id() + "님이 "+ vo.getSit_number() + "번 좌석에서 퇴실하였습니다."
	                + "\\n입실시간 : " + formattedSdate + "로 부터"
	                + "\\n총 이용 시간 : " + timeDifference;
	        String encodedMessage = URLEncoder.encode(message, "UTF-8");
	        String redirectURL = "redirect:libAdminReserve.do?alertMessage=" + encodedMessage;
	        return redirectURL;
	        
	    } else {
	        return "redirect:libAdminReserve.do?alertMessage=" + URLEncoder.encode("존재하지 않는 아이디입니다.", "UTF-8");
	    }
	    
	}

	@SuppressWarnings("unused")
	@RequestMapping("/librsUp.do")
	public String updateSitinsertArchive(LibrsVO vo,@RequestParam(value = "alertMessage", required = false) String alertMessage) throws Exception {
		
		int chk1 = LibrsService.selectUserinfo1(vo.getSession_id());
		int chk2 = LibrsService.selectUserinfo2(vo.getSession_id());

		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		String formattedDate = dateFormat.format(currentDate);

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(currentDate);
		calendar.add(Calendar.HOUR_OF_DAY, 2);
		Date laterDate = calendar.getTime();
		String formattedLaterDate = dateFormat.format(laterDate);
			
			if( chk1 != 1) {
				
				if ( chk2 == 1) {
					
					int result = LibrsService.updateSit(vo);
					LibrsService.insertarchive(vo);
					String message = vo.getSession_id() + "님에게 "+ vo.getSit_number() + "번 좌석이 배정되었습니다.\\n좌석의 최대 이용시간은 2시간 입니다."
							+ "\\n현재시간 : " + formattedDate + " 퇴실시간 : " + formattedLaterDate;
					String encodedMessage = URLEncoder.encode(message, "UTF-8");
					String redirectURL = "redirect:libReserve.do?alertMessage=" + encodedMessage;
					return redirectURL;
					
				} else { return "redirect:libReserve.do?alertMessage=" + URLEncoder.encode("존재하지 않는 아이디입니다.", "UTF-8"); }
				
			} else { return "redirect:libReserve.do?alertMessage=" + URLEncoder.encode("이미 배정받은 좌석이 존재합니다.", "UTF-8"); }
	
	}
	
	@SuppressWarnings("unused")
	@RequestMapping("/librsOut.do")
	public String updateSitout(LibrsVO vo) throws Exception {
	    
	    int chk2 = LibrsService.selectUserinfo2(vo.getSession_id());
	    
	    Date currentDate = new Date();
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
	    String formattedDate = dateFormat.format(currentDate);

	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(currentDate);
	    calendar.add(Calendar.HOUR_OF_DAY, 2);
	    Date laterDate = calendar.getTime();
	    String formattedLaterDate = dateFormat.format(laterDate);
	    
	    String sdate = LibrsService.selectSdate(vo);
	    SimpleDateFormat dbDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Date enterTime = dbDateFormat.parse(sdate);

	    SimpleDateFormat userDateFormat = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
	    String formattedSdate = userDateFormat.format(enterTime);

	    long timeDifferenceMillis = currentDate.getTime() - enterTime.getTime();
	    long seconds = timeDifferenceMillis / 1000;
	    long minutes = seconds / 60;
	    long hours = minutes / 60;
	    minutes = minutes % 60;
	    seconds = seconds % 60;

	    String timeDifference = hours + "시간 " + minutes + "분 " + seconds + "초";
	    
	    if (chk2 == 1) {
	        
	        int result = LibrsService.updateSitout(vo);
	        int result1 = LibrsService.updateEdate(vo);

	        String message = vo.getSession_id() + "님이 "+ vo.getSit_number() + "번 좌석에서 퇴실하였습니다."
	                + "\\n입실시간 : " + formattedSdate + "로 부터"
	                + "\\n총 이용 시간 : " + timeDifference;
	        String encodedMessage = URLEncoder.encode(message, "UTF-8");
	        String redirectURL = "redirect:libReserve.do?alertMessage=" + encodedMessage;
	        return redirectURL;
	        
	    } else {
	        return "redirect:libReserve.do?alertMessage=" + URLEncoder.encode("존재하지 않는 아이디입니다.", "UTF-8");
	    }
	       	
	}
	
	@RequestMapping("/libArchive.do") 
	public String showArchive(ModelMap model,String session_id,LibrsVO vo) throws Exception {
		
		if(session_id == null || session_id.trim().isEmpty()) {
			
			return "redirect:libLoginWrite.do?alertMessage=" + URLEncoder.encode("로그인이 필요한 서비스입니다.", "UTF-8");
		}

		// 화면에 출력할 개수
		int pageUnit = vo.getPageUnit();
		
		// 현재 페이지 번호
		int pageIndex = vo.getPageIndex();
		
		// firstIndex 값 계산 ;;  1->1 ; 2->11 ; 3->21
		int firstIndex = (pageIndex-1)*pageUnit + 1;
		
		// lastIndex 값 계산
		int lastIndex = pageIndex*pageUnit;	
		
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		int total = LibrsService.selectArchiveTotal(session_id);
		// 화면출력 시작번호
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		vo.setRecordCountPerPage(recordCountPerPage);
		
		// 12/10 ->  ceil(1.2) -> 2
		int lastPage = (int) Math.ceil((double)total/pageUnit);
		vo.setLastPage(lastPage);
		
		int firstPage = (int) (Math.floor(pageIndex-1)/10)*10 + 1;
		
		List<?> archive = LibrsService.selectSitArchive(vo);
		String name = LibrsService.selectArchiveName(session_id);
		
		model.addAttribute("vo", vo);
		model.addAttribute("archive",archive);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("name",name);
		model.addAttribute("total",total);
		
		return "libreserve/libArchive";
	}
	
	@RequestMapping("/libAdminArchive.do")
	public String showAllArchive(HttpSession session,ModelMap model,LibrsVO vo) throws Exception{
		
		String str = "";
		String userid = (String) session.getAttribute("SessionUserID");
		
		if(userid == null || userid.trim().isEmpty() || !userid.equals("admin") ) {
			
			return "redirect:libLoginWrite.do?alertMessage=" + URLEncoder.encode("관리자만 이용가능한 서비스입니다.", "UTF-8");
		}
		
		// 화면에 출력할 개수
		int pageUnit = vo.getPageUnit();
		
		// 현재 페이지 번호
		int pageIndex = vo.getPageIndex();
		
		// firstIndex 값 계산 ;;  1->1 ; 2->11 ; 3->21
		int firstIndex = (pageIndex-1)*pageUnit + 1;
		
		// lastIndex 값 계산
		int lastIndex = pageIndex*pageUnit;	
		
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		int total = LibrsService.selectAdminArchiveTotal(vo);
		// 화면출력 시작번호
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		vo.setRecordCountPerPage(recordCountPerPage);
		
		// 12/10 ->  ceil(1.2) -> 2
		int lastPage = (int) Math.ceil((double)total/pageUnit);
		vo.setLastPage(lastPage);
		
		int firstPage = (int) (Math.floor(pageIndex-1)/10)*10 + 1;
		
		List<?> archive = LibrsService.selectAdminSitArchive(vo);
		List<?> name = LibrsService.selectAdminArchiveName(vo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("archive",archive);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("name",name);
		model.addAttribute("total",total);
		
		return "libreserve/libAdminArchive";
	}

}
