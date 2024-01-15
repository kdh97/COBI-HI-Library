package egov.library.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HtmlUtils;

import egov.library.service.CalService;
import egov.library.service.CalVO;



@Controller
public class CalController {

	@Resource(name="calService")
	CalService calService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@RequestMapping("/libCalendar.do")
	public String libCalendar(CalVO vo, ModelMap model) throws Exception {
		
		
		List<?> list = calService.selectCalList(vo);
		
		model.addAttribute("vo", vo);
	    model.addAttribute("resultList", list);
		
		return "calendar/libCalendar";
	}
	
	@RequestMapping("/adminCalendar.do")
	public String adminCalendar(CalVO vo, ModelMap model) throws Exception {
		
		
		List<?> list = calService.selectCalList(vo);
		
		model.addAttribute("vo", vo);
	    model.addAttribute("resultList", list);
		
		return "calendar/adminCalendar";
	}
	
	
	@RequestMapping("/libCalDetail.do")
	public String selectCalDetail(String unq, ModelMap model) 
													throws Exception {
	   
	 
		CalVO vo = calService.selectCalDetail(unq);
		
		String content = vo.getContent();
		content = content.replace("\n","<br>");
		content = content.replace(" ","&nbsp;");
		vo.setContent(content);
		model.addAttribute("vo", vo);

		return "calendar/libCalDetail";
	}
	
	@RequestMapping("/libCalModify.do")
	public String selectCalModify(String unq, ModelMap model) 
													throws Exception {
	   
	 
		CalVO vo = calService.selectCalDetail(unq);
		
		String content = vo.getContent();
		content = content.replace("\\n","<br>");
		content = content.replace(" ","&nbsp;");
		vo.setContent(content);
		model.addAttribute("vo", vo);

		return "calendar/libCalModify";
	}
	
	@RequestMapping("/libCalModifySave.do")
	@ResponseBody
	public String updateLibCalModifySave(@RequestParam Map<String, Object> map1,
            MultipartHttpServletRequest multiRequest) throws Exception {
		
		String str = "true";
	    String path = propertiesService.getString("Globals.fileStorePath");
	    

	    // 파일 업로드는 아래 메소드에서 진행
	    Map<String, String> map2 = uploadProcess(multiRequest, path);
	    
	    // 업로드된 파일로 기존 파일 정보 업데이트
	    if (map2.get("file1") != null && !map2.get("file1").equals("")) {
	        map1.put("file1", map2.get("file1"));
	        // 기존 파일 삭제 로직 추가 (existingFile1을 사용하여 파일 삭제)
	    }
		
		int result = calService.updateLibCalModifySave(map1);
		 if (result != 1) {
		        str = "false";
		    }
		    
		    return str;	
	}
	
	
	@RequestMapping("/libCalInput.do")
	public String libCalInput() {
		return "calendar/libCalInput";
	}
	
	@RequestMapping("/libCalInputSave.do")
	@ResponseBody
	public String insertCal(@RequestParam Map<String,Object> map1
			   ,MultipartHttpServletRequest multiRequest
				) throws Exception {

	    String str = "true";
	    String path = propertiesService.getString("Globals.fileStorePath");
	    
	    Map<String,String> map2 = uploadProcess(multiRequest,path);
		if(map2.get("file1") != null && !map2.get("file1").equals("")) {
			map1.put("file1", map2.get("file1"));
		}
		
		
		  String title = (String) map1.get("title"); 
		  String content = (String) map1.get("content"); 
		  map1.put("title", HtmlUtils.htmlEscape(title));
		  map1.put("content", HtmlUtils.htmlEscape(content));
		 
	    
		String result = calService.insertCal(map1);
		if( result != null ) str = "false"; 
	   
	    return str;
	}
	
	public static Map<String,String> uploadProcess( 
			   MultipartHttpServletRequest multiRequest 
		     , String path ) throws Exception {
				String filePath  = "";
				
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


   
	 @RequestMapping("/libCalDelete.do")
	 @ResponseBody
		public String deleteCal(String unq) throws Exception {
		 String str = "";
			int result = calService.deleteCal(unq);
			
			str = (result == 1) ? "ok" : "false";
		
			return str;
	 }
 
}