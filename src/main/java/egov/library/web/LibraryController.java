package egov.library.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.library.service.DefaultVO;
import egov.library.service.LibraryService;
import egov.library.service.LibraryVO;


@Controller
public class LibraryController {

	@Resource(name="libraryService")
	LibraryService libraryService;
	
		
	@RequestMapping("/bookInput.do")
	public String bookInput() {
		return "library/bookInput";
	}
	
	@RequestMapping("/bookInputSave.do")
	@ResponseBody
	public String insertBook(LibraryVO vo,String isbn) throws Exception {

	    String str = "";

	    int cnt = libraryService.selectISBN(isbn);
	    
	    if (cnt > 0) {
	        str = "duplicate";
	    } else {
	        String result = libraryService.insertBook(vo);
	        str = (result == null) ? "true" : "false";
	    }
	    return str;
	}

	
   @RequestMapping("/bookList.do")
   public String selectLibraryList(DefaultVO vo, ModelMap model) throws Exception {
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
      
      int total = libraryService.selectBookTotal(vo);
      
      // 화면출력 시작번호
      int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
      vo.setRecordCountPerPage(recordCountPerPage);
      
      // 12/10 ->  ceil(1.2) -> 2
      int lastPage = (int) Math.ceil((double)total/pageUnit);
      vo.setLastPage(lastPage);
      
      int firstPage = (int) (Math.floor(pageIndex-1)/10)*10 + 1;
      List<?> list = libraryService.selectBookList(vo);
   
      model.addAttribute("vo", vo);
      model.addAttribute("total", total);
      model.addAttribute("firstPage", firstPage);
      model.addAttribute("resultList", list);
      
      return "library/bookList";
   }
   
 
   @RequestMapping("/bookDetail.do")
	public String selectBookDetail(String unq, ModelMap model) throws Exception {
	   
	   
	   
		LibraryVO vo = libraryService.selectBookDetail(unq);
		String contents = vo.getContents();
		vo.setContents(contents);
		
		model.addAttribute("vo", vo);

		return "library/bookDetail";
	}
   
   @RequestMapping("/bookSearch.do")
	public String bookSearch() {
		
		return "library/bookSearch";
	}
   
   @RequestMapping("/popularBook.do")
   public String selectPopularBookList(DefaultVO vo, ModelMap model) 
                                 throws Exception {
     
      List<?> list = libraryService.selectPopularBookList(vo);
  
      model.addAttribute("vo", vo);
      model.addAttribute("resultList", list);
      
      return "library/popularBook";
   }
   
   @RequestMapping("/newBook.do")
   public String selectNewBookList(DefaultVO vo, ModelMap model) 
                                 throws Exception {
     
      List<?> list = libraryService.selectNewBookList(vo);
  
      model.addAttribute("vo", vo);
      model.addAttribute("resultList", list);
      
      return "library/newBook";
   }
   
    @RequestMapping("/bookDelete.do")
	public String deleteBook(String unq) throws Exception {
		
    	
    	
		int result = libraryService.deleteBook(unq);
		if( result == 1 ) {
		
		System.out.println("<script> alert('삭제되었습니다') </script>");
		}
		return "redirect:/listModify.do";
	}

    @RequestMapping("/listModify.do")
    public String selectLibraryList1(DefaultVO vo, ModelMap model) 
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
       
       int total = libraryService.selectBookTotal(vo);
       
       // 화면출력 시작번호
       int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
       vo.setRecordCountPerPage(recordCountPerPage);
       
       // 12/10 ->  ceil(1.2) -> 2
       int lastPage = (int) Math.ceil((double)total/pageUnit);
       vo.setLastPage(lastPage);
       
       int firstPage = (int) (Math.floor(pageIndex-1)/10)*10 + 1;
       List<?> list = libraryService.selectBookList(vo);
    
       model.addAttribute("vo", vo);
       model.addAttribute("total", total);
       model.addAttribute("firstPage", firstPage);
       model.addAttribute("resultList", list);
       
       return "library/listModify";
    }
    @RequestMapping("/bookRent.do")
    public String selectLibraryList2(DefaultVO vo, ModelMap model) 
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
       
       int total = libraryService.selectBookTotal(vo);
       
       // 화면출력 시작번호
       int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
       vo.setRecordCountPerPage(recordCountPerPage);
       
       // 12/10 ->  ceil(1.2) -> 2
       int lastPage = (int) Math.ceil((double)total/pageUnit);
       vo.setLastPage(lastPage);
       
       int firstPage = (int) (Math.floor(pageIndex-1)/10)*10 + 1;
       List<?> list = libraryService.selectBookList(vo);
    
       model.addAttribute("vo", vo);
       model.addAttribute("total", total);
       model.addAttribute("firstPage", firstPage);
       model.addAttribute("resultList", list);
       
       return "library/bookRent";
    }
    
    @RequestMapping("/bookRentSave.do")
    @ResponseBody
    public String updateRentId(LibraryVO vo, HttpSession session) throws Exception {
        String str = "";
        String id = (String) session.getAttribute("SessionUserID");
        int unq = vo.getUnq();
        
        if (id == null) {
            str = "5";
        } else {
            if ("admin".equals(id)) {
                // 입력한 아이디가 회원인지 확인하는 로직
                boolean isMember = libraryService.selectMemberCount(vo.getId());
                
                if (!isMember) {
                    str = "notMember";
                } else {
                    int cnt1 = libraryService.selectRentCount(vo.getId()); // 입력한 아이디의 렌트 카운트 확인

                    if (cnt1 >= 3) {
                        str = "overRent";
                    } else {
                        int result = libraryService.updateRentId(vo);
                        libraryService.updateBookRentHits(unq);

                        if (result == 0) {
                            str = "fail";
                        } else if (result == 1) {
                        	libraryService.insertBH(vo);
                            str = "ok";
                        }
                    }
                }
            } else {
                int cnt = libraryService.selectRentCount(id);

                if (cnt >= 3) {
                    str = "overRent";
                } else {
                    int result = libraryService.updateRentId(vo);
                    libraryService.updateBookRentHits(unq);
                    
                    if (result == 0) {
                        str = "fail";
                    } else if (result == 1) {
                    	libraryService.insertBH(vo);
                        str = "ok";
                    }
                }
            }
        }

        return str;
    }
    
    @RequestMapping("/myBookList.do") 
	public String selectMyBookList(HttpSession session, ModelMap model, DefaultVO vo) throws Exception { 
		
		String id = (String) session.getAttribute("SessionUserID");
		
		if(id != null) {
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
			vo.setId(id);
			
			int total = libraryService.selectBHTotal(vo);
			
			int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
			vo.setRecordCountPerPage(recordCountPerPage);
			
			// 12/10 -> ceil(1.2) -> 2
			int lastPage = (int) Math.ceil((double)total/pageUnit);
			vo.setLastPage(lastPage);
			
			int firstPage = (int) (Math.floor(pageIndex-1)/10)*10 + 1;
			
			List<?> list = libraryService.selectMyBookList(id);
			
			List<?> list2 = libraryService.selectMyBookList2(vo);
			model.addAttribute("vo", vo);
			model.addAttribute("list", list);
			model.addAttribute("list2",list2);
			model.addAttribute("firstPage", firstPage);
		}
		return "library/myBookList"; 
	}

    @RequestMapping("/bookReturn.do")
    public String selectLibraryList3(DefaultVO vo, ModelMap model) 
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
       
       int total = libraryService.selectBookTotal(vo);
       
       // 화면출력 시작번호
       int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
       vo.setRecordCountPerPage(recordCountPerPage);
       
       // 12/10 ->  ceil(1.2) -> 2
       int lastPage = (int) Math.ceil((double)total/pageUnit);
       vo.setLastPage(lastPage);
       
       int firstPage = (int) (Math.floor(pageIndex-1)/10)*10 + 1;
       List<?> list = libraryService.selectBookList(vo);
    
       model.addAttribute("vo", vo);
       model.addAttribute("total", total);
       model.addAttribute("firstPage", firstPage);
       model.addAttribute("resultList", list);
       
       return "library/bookReturn";
    }
	   
    @RequestMapping("/bookReturnSave.do") // bookReturn - 대출/반납 관리
    @ResponseBody
    public String updateReturnId(LibraryVO vo, HttpSession session) throws Exception {
        String str = "";
        String userid = (String) session.getAttribute("SessionUserID");
        libraryService.updateBH(vo);
        if (userid == null) {
            str = "5"; // 로그인되지 않은 경우
        } else {
            vo.setId(null); // 아이디 값을 null로 설정
            int result = libraryService.updateReturnId(vo);
            
            if (result == 0) {
                str = "fail"; // 실패한 경우
            } else if (result == 1) {
            	
                str = "ok"; // 성공한 경우
            }
        }
        return str;
    }
    
    
    
}