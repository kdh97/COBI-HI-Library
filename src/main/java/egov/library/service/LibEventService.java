package egov.library.service;

import java.util.List;
import java.util.Map;

public interface LibEventService {
	
	List<?> selectLibEventList(DefaultVO vo) throws Exception;
	int selectLibEventTotal(DefaultVO vo) throws Exception;
	String insertLibEvent(LibEventVO vo) throws Exception;
	void updateLibEventHits(String unq)throws Exception;
	LibEventVO selectLibEventDetail(String unq) throws Exception;
	int deleteEvent(LibEventVO vo) throws Exception;
	int updateEvent(LibEventVO vo) throws Exception;
	//파일넣기
	String libEventWriteSave(Map<String, Object> map1) throws Exception;
	//회원만 보는 화면(List2,Detail2)
	List<?> selectLibEventList2(DefaultVO vo) throws Exception;
	LibEventVO selectLibEventDetail2(String unq) throws Exception;
	//파일 업뎃
	int updateEvent(Map<String, Object> map1)throws Exception;
	List<?> selectLibEventFileName(LibEventVO eventVO) throws Exception;
	
	
	
	
	

}
