package egov.library.service;

import java.util.List;
import java.util.Map;

public interface LibService {
	
	List<?> selectLibNoticeList(DefaultVO vo) throws Exception;
	int selectLibNoticeTotal(DefaultVO vo) throws Exception;
	String insertLibNotice(LibVO vo) throws Exception;
	void updateLibNoticeHits(String unq)throws Exception;
	LibVO selectLibNoticeDetail(String unq) throws Exception;
	int deleteNotice(LibVO vo) throws Exception;
	int updateNotice(LibVO vo) throws Exception;
	//파일넣기
	String libNoticeWriteSave(Map<String, Object> map1) throws Exception;
	//파일업뎃
	//String libNoticeModifySave(Map<String, Object> map1)throws Exception;
	
	//회원만 보는화면
	List<?> selectLibNoticeList2(DefaultVO vo) throws Exception;
	LibVO selectLibNoticeDetail2(String unq) throws Exception;
}
