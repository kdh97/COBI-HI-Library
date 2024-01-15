package egov.library.web;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.HtmlUtils;

import egov.library.service.DefaultVO;
import egov.library.service.LibEventService;
import egov.library.service.LibEventVO;


@Controller
public class LibEventController {

	@Resource(name="libeventService")
	LibEventService libeventService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@RequestMapping("/libEventWrite.do")
	public String libEventWrite() {
				
		return "libeventboard/libEventWrite";
	}

	@RequestMapping("/libEventWriteSave.do")
	@ResponseBody
	public String libEventWriteSave(   @RequestParam Map<String,Object> map1
										   ,MultipartHttpServletRequest multiRequest
										) throws Exception {
		// 파일
		String str = "ok";
		String path = propertiesService.getString("Globals.fileStorePath");
		
		// 파일업로드는 아래 메소드에서 진행 
		Map<String, String> map2 = uploadProcess(multiRequest, path);

		if(map2.get("file1") != null && !map2.get("file1").equals("")) {
			map1.put("file1", map2.get("file1"));
		}
		if(map2.get("file2") != null && !map2.get("file2").equals("")) {
			map1.put("file2", map2.get("file2"));
		}
		
		String title = (String) map1.get("title");
	    String content = (String) map1.get("content");
	    map1.put("title", HtmlUtils.htmlEscape(title));
	    map1.put("content", HtmlUtils.htmlEscape(content));  
		
		
		String result = libeventService.libEventWriteSave(map1);
		if( result != null ) str = "error"; 
	
		return str;
	}
	
	
	public static Map<String,String> uploadProcess( 
									   MultipartHttpServletRequest multiRequest 
								     , String path ) throws Exception {
			String filePath  = "";
	
			/* multiRequest 변수를 통해 파일 정보들을 가져와 Map에 넣음
			* */
			Map<String, MultipartFile> files = multiRequest.getFileMap();				
			Map<String,String> map1 = new HashMap<String,String>();
		
			Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		
			while (itr.hasNext()) {
				Entry<String, MultipartFile> entry = itr.next();
				
				MultipartFile file = entry.getValue();
				String orgname = file.getOriginalFilename();
				
				if( orgname != null && !orgname.equals("") ) {
					filePath = path + "/" + orgname;
					file.transferTo(new File(filePath));
					
					// 파일 확장자 추출
		            int dotIndex = orgname.lastIndexOf('.');
		            String fileExtension = orgname.substring(dotIndex + 1);

		            // 파일 확장자 비교 (대소문자 구분 없이)
		            if (fileExtension.equalsIgnoreCase("jpg") ||
		            	fileExtension.equalsIgnoreCase("png") ||
		                fileExtension.equalsIgnoreCase("gif") ||
		                fileExtension.equalsIgnoreCase("JPG") ||
		            	fileExtension.equalsIgnoreCase("PNG") ||
		                fileExtension.equalsIgnoreCase("GIF")) {
		                map1.put("file1", orgname);
		            } else {
		                map1.put("file2", orgname);
		            }
					
				
			}
		}
	
		return map1;
	}
			
	
	@RequestMapping("/libEventList.do")
	public String selectLibEventList(DefaultVO vo, ModelMap model)  //공지사항 게시물 
											throws Exception {
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
		
		int total = libeventService.selectLibEventTotal(vo);
		
		// 화면출력 시작번호
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		vo.setRecordCountPerPage(recordCountPerPage);
		
		// 12/10 ->  ceil(1.2) -> 2
		int lastPage = (int) Math.ceil((double)total/pageUnit);
		vo.setLastPage(lastPage);
		
		int firstPage = (int) (Math.floor(pageIndex-1)/10)*10 + 1;
		List<?> list = libeventService.selectLibEventList(vo);
	
		model.addAttribute("vo", vo);
		model.addAttribute("total", total);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("resultList", list);
		
		return "libeventboard/libEventList";
	}
	//회원만 보는 List2
	@RequestMapping("/libEventList2.do")
	public String selectLibEventList2(DefaultVO vo, ModelMap model)  //공지사항 게시물 
											throws Exception {
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
		
		int total = libeventService.selectLibEventTotal(vo);
		
		// 화면출력 시작번호
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		vo.setRecordCountPerPage(recordCountPerPage);
		
		// 12/10 ->  ceil(1.2) -> 2
		int lastPage = (int) Math.ceil((double)total/pageUnit);
		vo.setLastPage(lastPage);
		
		int firstPage = (int) (Math.floor(pageIndex-1)/10)*10 + 1;
		List<?> list = libeventService.selectLibEventList2(vo);
	
		model.addAttribute("vo", vo);
		model.addAttribute("total", total);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("resultList", list);
		
		return "libeventboard/libEventList2";
	}
	
	
	/*
	 *  문화행사 상세보기
	 */
	@RequestMapping("/libEventDetail.do")
	public String selectLibEventDetail( String unq
									 ,ModelMap model) throws Exception {
		// 조회수 증가
		libeventService.updateLibEventHits(unq);
		// 상세보기  
		LibEventVO vo = libeventService.selectLibEventDetail(unq);
		
		String content = vo.getContent();
		content = content.replace("\n","<br>");
		content = content.replace(" ","&nbsp;");
		vo.setContent(content);
		
		model.addAttribute("vo", vo);
		
		return "libeventboard/libEventDetail";
	}
	//회원만 보는 화면
	@RequestMapping("/libEventDetail2.do")
	
	public String selectLibEventDetail2( String unq
									 ,ModelMap model) throws Exception {
		// 조회수 증가
		libeventService.updateLibEventHits(unq);
		// 상세보기  
		LibEventVO vo = libeventService.selectLibEventDetail2(unq);
		
		String content = vo.getContent();
		content = content.replace("\n","<br>");
		content = content.replace(" ","&nbsp;");
		vo.setContent(content);
		
		model.addAttribute("vo", vo);
		
		return "libeventboard/libEventDetail2";
	}
	/*
	 *  게시판 수정화면
	 */
	@RequestMapping("/libEventModify.do")
	public String selectLibEventModify(String unq, ModelMap model) throws Exception {
		
		// 수정화면 상세보기  
		LibEventVO vo = libeventService.selectLibEventDetail(unq);
		model.addAttribute("vo", vo);
		
		return "libeventboard/libEventModify";
	}
	
	//파일 modifySave.do (수정)
	@RequestMapping("/libEventModifySave.do")
	@ResponseBody
	public String updateEvent(@RequestParam Map<String, Object> map1,
	                         MultipartHttpServletRequest multiRequest) throws Exception {
	    String str = "ok";
	    String path = propertiesService.getString("Globals.fileStorePath");
	    

	    // 파일 업로드는 아래 메소드에서 진행
	    Map<String, String> map2 = uploadProcess(multiRequest, path);
	    
	    // 업로드된 파일로 기존 파일 정보 업데이트
	    if (map2.get("file1") != null && !map2.get("file1").equals("")) {
	        map1.put("file1", map2.get("file1"));
	        // 기존 파일 삭제 로직 추가 (existingFile1을 사용하여 파일 삭제)
	    }
	    if (map2.get("file2") != null && !map2.get("file2").equals("")) {
	        map1.put("file2", map2.get("file2"));
	        // 기존 파일 삭제 로직 추가 (existingFile2을 사용하여 파일 삭제)
	    }
	    
	    // 파일 수정 로직
	    int result = libeventService.updateEvent(map1);
	    if (result != 1) {
	        str = "error";
	    }
	    
	    return str;
	}

	
	@RequestMapping("/libEventDelete.do")
	@ResponseBody
	public String deleteEvent(LibEventVO vo) throws Exception {
	
		int result = libeventService.deleteEvent(vo);
		String str = "";
		if(result == 1) str = "ok";
		else str = "fail";
		
		return str;
	}
	
}





