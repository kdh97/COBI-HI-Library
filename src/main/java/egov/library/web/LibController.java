package egov.library.web;

import java.io.File;
import java.util.ArrayList;
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

import egov.library.service.LibService;
import egov.library.service.LibVO;
import egov.library.service.DefaultVO;


@Controller
public class LibController {

	@Resource(name="libService")
	LibService libService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@RequestMapping("/libNoticeWrite.do")
	public String libNoticeWrite() {
				
		return "librboard/libNoticeWrite";
	}

	@RequestMapping("/libNoticeWriteSave.do")
	@ResponseBody
	public String libNoticeWriteSave(@RequestParam Map<String, Object> map1, MultipartHttpServletRequest multiRequest) throws Exception {

	    // 파일
	    String str = "ok";
	    String path = propertiesService.getString("Globals.fileStorePath");

	    // 파일업로드는 아래 메소드에서 진행
	    Map<String, String> map2 = uploadProcess(multiRequest, path);
	    if (map2.get("file1") != null && !map2.get("file1").equals("")) {
	        map1.put("file1", map2.get("file1"));
	    }
	    if (map2.get("file2") != null && !map2.get("file2").equals("")) {
	        map1.put("file2", map2.get("file2"));
	    }

		
		 // title과 content에 대한 특수 문자 이스케이프 
	      String title = (String) map1.get("title");
		  String content = (String) map1.get("content"); 
		  map1.put("title",HtmlUtils.htmlEscape(title)); 
		  map1.put("content",HtmlUtils.htmlEscape(content));
		 

	    String result = libService.libNoticeWriteSave(map1);
	    if (result != null) {
	        str = "error";
	    }

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
			int number = 1;
		
			while (itr.hasNext()) {
				Entry<String, MultipartFile> entry = itr.next();
				MultipartFile file = entry.getValue();
				String orgname = file.getOriginalFilename();
				
				if( orgname != null && !orgname.equals("") ) {
					filePath = path + "/" + orgname;
					file.transferTo(new File(filePath));
					map1.put("file"+number,orgname);
					
				number++;
			}
		}
	
		return map1;
	}
			
	
	@RequestMapping("/libNoticeList.do")
	public String selectLibNoticeList(DefaultVO vo, ModelMap model)  //공지사항 게시물 
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
		
		int total = libService.selectLibNoticeTotal(vo);
		
		// 화면출력 시작번호
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		vo.setRecordCountPerPage(recordCountPerPage);
		
		// 12/10 ->  ceil(1.2) -> 2
		int lastPage = (int) Math.ceil((double)total/pageUnit);
		vo.setLastPage(lastPage);
		
		int firstPage = (int) (Math.floor(pageIndex-1)/10)*10 + 1;
		List<?> list = libService.selectLibNoticeList(vo);
	
		model.addAttribute("vo", vo);
		model.addAttribute("total", total);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("resultList", list);
		
		return "librboard/libNoticeList";
	}
	/*회원만 보는 list*/
	@RequestMapping("/libNoticeList2.do")
	public String selectLibNoticeList2(DefaultVO vo, ModelMap model)  //공지사항 게시물 
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
		
		int total = libService.selectLibNoticeTotal(vo);
		
		// 화면출력 시작번호
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		vo.setRecordCountPerPage(recordCountPerPage);
		
		// 12/10 ->  ceil(1.2) -> 2
		int lastPage = (int) Math.ceil((double)total/pageUnit);
		vo.setLastPage(lastPage);
		
		int firstPage = (int) (Math.floor(pageIndex-1)/10)*10 + 1;
		List<?> list = libService.selectLibNoticeList2(vo);
	
		model.addAttribute("vo", vo);
		model.addAttribute("total", total);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("resultList", list);
		
		return "librboard/libNoticeList2";
	}
	//회원만보는 detail
	@RequestMapping("/libNoticeDetail2.do")
	public String selectLibNoticeDetail2( String unq
									 ,ModelMap model) throws Exception {
		// 조회수 증가
		libService.updateLibNoticeHits(unq);
		// 상세보기  
		LibVO vo = libService.selectLibNoticeDetail2(unq);
		
		String content = vo.getContent();
		content = content.replace("\n","<br>");
		content = content.replace(" ","&nbsp;");
		vo.setContent(content);
		
		model.addAttribute("vo", vo);
		
		return "librboard/libNoticeDetail2";
	}
	
	
	/*
	 *  공지사항 상세보기
	 */
	@RequestMapping("/libNoticeDetail.do")
	public String selectLibNoticeDetail( String unq
									 ,ModelMap model) throws Exception {
		// 조회수 증가
		libService.updateLibNoticeHits(unq);
		// 상세보기  
		LibVO vo = libService.selectLibNoticeDetail(unq);
		
		String content = vo.getContent();
		content = content.replace("\n","<br>");
		content = content.replace(" ","&nbsp;");
		vo.setContent(content);
		
		model.addAttribute("vo", vo);
		
		return "librboard/libNoticeDetail";
	}
	
	/*
	 *  게시판 수정화면
	 */
	@RequestMapping("/libNoticeModify.do")
	public String selectLibNoticeModify(String unq, ModelMap model) throws Exception {
		
		// 수정화면 상세보기  
		LibVO vo = libService.selectLibNoticeDetail(unq);
		model.addAttribute("vo", vo);
		
		return "librboard/libNoticeModify";
	}
	//공지 수정저장
	@RequestMapping("/libNoticeModifySave.do")
	@ResponseBody
	public String updateNotice(LibVO vo) throws Exception {
		
		int result = libService.updateNotice(vo);
		// 0 , 1
		String str = "";
		if(result == 0) str = "fail";
		else if(result == 1) str = "ok";
		
		return str;
	}
	//공지 삭제
	@RequestMapping("/libNoticeDelete.do")
	@ResponseBody
	public String deleteNotice(LibVO vo) throws Exception {
		
		//여기에 파일삭제하는거 추가
		int result = libService.deleteNotice(vo);
		String str = "";
		if(result == 1) str = "ok";
		else str = "fail";
		
		return str;
	}
	
}





