package egov.library.service;

import java.util.List;
import java.util.Map;

public interface CalService {
	
	List<?> selectCalList(CalVO vo) throws Exception;
	CalVO selectCalDetail(String unq) throws Exception;
	String insertCal(Map<String, Object> map1) throws Exception;
	int updateLibCalModifySave(Map<String, Object> map1) throws Exception;
	int deleteCal(String unq) throws Exception;
	List<?> selectThisMonthList(CalVO vo) throws Exception;
	
}
