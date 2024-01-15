package egov.library.web;

import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.library.service.LibMemberService;
import egov.library.service.LibMemberVO;
import egov.library.qrcode.QRCodeGenerator;

@Controller
public class LibMemberController {
	
	
	@Resource(name="libMemberService")
	LibMemberService libMemberService;
	
	@RequestMapping("/libConditions.do")
	public String libCondition() {
		return "member/libConditions";
	}
	
	@RequestMapping("/libJoinWrite.do")
	public String libJoinWrite() {
		return "member/libJoinWrite";
	}
	
	@RequestMapping("/libUserIdCheck.do")
	@ResponseBody
	public String libUserIdCheck(String userid) throws Exception {
		
		String msg = "3";
		int result = 0;
		String pattern = "[a-zA-Z]{1}[0-9a-zA-Z_]{2,12}";  // a
		boolean pattern_chk = userid.matches(pattern);  // true or false
 		if(pattern_chk == true) {
			result = libMemberService.selectLibMemberUserid(userid);
			if(result == 0) {
				msg = "1"; // 사용가능
			} else {
				msg = "2"; // 중복
			}
		}
		return msg;
	}
	
	@RequestMapping("/libJoinSave.do")
	@ResponseBody
	public String insertLibMember(LibMemberVO vo) throws Exception {
		
		String str = "3";
		int result1 = libMemberService.selectLibMemberUserid(vo.getUserid());
		if(result1 == 1) {
			str="2"; // 이미 사용중(아이디)
		} else {
			String pass1 = vo.getUserpass();
			String pass2 = MyEncrypt.testMD5(pass1);
			vo.setUserpass(pass2);
			libMemberService.insertLibMember(vo);
			str="1"; // 저장성공
			
			// QR코드 생성
	        String userData = vo.getUserid(); // QR 코드 데이터를 사용자 정보에 맞게 수정
	        String qrCodeFilePath = "C:/workspace44/library/src/main/webapp/memberQR/" + vo.getUserid() + ".png"; // 파일 경로를 설정합니다
	        QRCodeGenerator.generateQRCode(userData, qrCodeFilePath);
		}
		return str;
	}
	
	@RequestMapping("/libLoginWrite.do")
	public String loginWrite() {
		return "member/libLoginWrite";
	}
	
	@RequestMapping("/libLogout.do")
	@ResponseBody
	public String libLogout(HttpSession session) {
		session.removeAttribute("SessionUserID");
		
		return "1";
	}
	
	/* 
	 * 로그인 처리 
	 */
	@RequestMapping(value="/loginSession.do",produces="application/text;charset=utf-8")
	@ResponseBody
	public String loginSession(LibMemberVO vo, HttpSession session) throws Exception {
		
		String str = "";
		
		int result = libMemberService.selectLibMemberUserid(vo.getUserid());
		if(result == 0) {
			str = "2";
			return str;
		}
		
		String state = libMemberService.selectLibMemberState(vo);
		if(state.equals("Y")) str = "1";
		
		// 패스워드 암호화 처리 후 비교 
		String pass1 = vo.getUserpass(); 
		String pass2 = MyEncrypt.testMD5(pass1); 
		vo.setUserpass(pass2);
		
		String name = libMemberService.selectLibMemberLogin(vo);
		if(name == null) {
			str = null;
		} else {
			if(state.equals("N")) {
				session.setAttribute("SessionUserID", vo.getUserid());
			    str = name;
			}
		}
		return str;
	}
	// 회원정보 상세
	@RequestMapping("/libMemberDetail.do")
	public String selectLibMemberDetail(HttpSession session, ModelMap model) throws Exception { // 세션변수를 불러온다
		
		String userid = (String)session.getAttribute("SessionUserID");
		
		LibMemberVO vo = libMemberService.selectLibMemberDetail(userid);
		model.addAttribute("vo", vo);
		
		return "member/libMemberDetail";
	}
	
	@RequestMapping("/libModifyCheck.do")
	public String libModifyCheck() {
		return "member/libModifyCheck";
	}
	
	@RequestMapping("/modifyCheck.do")
	@ResponseBody
	public String selectUserPass(LibMemberVO vo) throws Exception {
		String str = "";
		String pass1 = vo.getUserpass(); 
		String pass2 = MyEncrypt.testMD5(pass1); 
		vo.setUserpass(pass2);
		int result = libMemberService.selectUserPass(vo);
		if(result == 1) {
			str = "ok";
		}
		
		return str;
	}
	
	@RequestMapping("/libMemberModify.do")
	public String selectLibMemberModify(HttpSession session, ModelMap model) throws Exception { // 세션변수를 불러온다
		
		String url = "member/libMemberModify";
		String userid = (String)session.getAttribute("SessionUserID");
		if(userid == null) {
			url = "redirect:/libLoginWrite.do";  // 로그인 이전에 직접 주소를 쳐서 들어올 경우 로그인창으로 이동시킨다.
		}
		LibMemberVO vo = libMemberService.selectLibMemberDetail(userid); // SQL 까지 전달되어야 하는 값 = userid
		model.addAttribute("vo", vo);
		
		return url;
	}
	
	@RequestMapping("/libMemberModifySave.do")
	@ResponseBody
	public String updateLibMemberModifySave(HttpSession session, LibMemberVO vo) throws Exception {
		
		String str = "";
		String url = "member/libMemberModifySave"; 
		String userid = (String)session.getAttribute("SessionUserID");
		if(userid == null) {
			url = "redirect:/libLoginWrite.do";
		}
		int result = libMemberService.updateLibMemberModifySave(vo);
		if(result == 1) str = "1";
		return str;
	}
	
	@RequestMapping("/libMemberResign.do")
	public String libMemberResign() {
		
		return "member/libMemberResign";
	}
	
	@RequestMapping("/memberResign.do")
	@ResponseBody
	public String updateLibMemberResign(HttpSession session, LibMemberVO vo) throws Exception {
		String str = "";
		String pass1 = vo.getUserpass(); 
		String pass2 = MyEncrypt.testMD5(pass1); 
		vo.setUserpass(pass2);
		
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
		
		int result = libMemberService.updateLibMemberResign(vo);
		
		if(result == 1) {
			session.removeAttribute("SessionUserID");
			str = "ok";
		}
		return str;
	}
	
	@RequestMapping("/libFindUserId.do")
	public String libFindUserId() {
		return "/member/libFindUserId";
	}
	
	@RequestMapping("/libFindUserIdSub.do")
	@ResponseBody
	public String selectFindUserId(LibMemberVO vo) throws Exception {
		String str = "";
		if(vo.getUserid() == null || vo.getUserid().equals("")) {
			// 닉네임, 이메일을 통한 아이디 검색 후 아이디 전송
			String userid = libMemberService.selectFindUserId(vo);
			if(userid != null && !userid.equals("")) {
				str = userid;
			} else {
				str = "2";
			}
		}
		return str;
	}
	
	@RequestMapping("/libFindUserPass.do")
	public String libFindUserPass() {
		return "/member/libFindUserPass";
	}
	
	@RequestMapping("/libFindUserPassSub.do")
	@ResponseBody
	public String updateLibUserPass(LibMemberVO vo) throws Exception {
		String str = "";
		int cnt = libMemberService.selectUserPassExistCount(vo); 
		if(cnt == 0) {
			str = "2";
		} else {
			int length = 8;
	        String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&";
	        
	        SecureRandom random = new SecureRandom();
	        StringBuilder code = new StringBuilder(length);
	        
	        for (int i = 0; i < length; i++) {
	            int randomIndex = random.nextInt(characters.length());
	            char randomChar = characters.charAt(randomIndex);
	            code.append(randomChar);
	        }
	        
	        String randomCode = code.toString();
			
			String pass2 = MyEncrypt.testMD5(randomCode);
			vo.setUserpass(pass2);
			libMemberService.updateLibUserPass(vo);
			str = randomCode;
		}
		return str;
	}
	
	@RequestMapping("/libPassChange.do")
	public String passChangeWrite() {
		return "member/libPassChange";
	}
	
	@RequestMapping("/libPassChangeSub.do")
	@ResponseBody
	public String updateLibPassChange(HttpSession session,String userpass1,String userpass2) throws Exception {
		
		/* 
		 * 로그인 여부확인 
		 */
		String userid = (String)session.getAttribute("SessionUserID");
		
		userpass1 = MyEncrypt.testMD5(userpass1);
		userpass2 = MyEncrypt.testMD5(userpass2);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("userid", userid);
		map.put("userpass1", userpass1);
		map.put("userpass2", userpass2);
		
		String str = "";
		
		int result = libMemberService.updateLibPassChange(map);
		if(result == 1) {
			str = "1";
		} else {
			str = "2";
		}
		
		return str;
	}
}