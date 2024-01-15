
  package egov.library.service.impl;
  
  import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO; import
  org.springframework.stereotype.Repository;

import egov.library.service.CalVO;

  
  @Repository("calDAO") public class CalDAO extends EgovAbstractDAO {
  
  
public List<?> selectCalList(CalVO vo) {
	return list ("calDAO.selectCalList",vo);
}

public CalVO selectCalDetail(String unq) {
	return (CalVO) select("calDAO.selectCalDetail", unq);
}

public String insertCal(Map<String, Object> map1) {
	return (String) insert("calDAO.insertCal",map1);
}

public int updateLibCalModifySave(Map<String, Object> map1) {
	return (int) update("calDAO.updateLibCalModifySave",map1);
}

public int deleteCal(String unq) {
	return delete("calDAO.deleteCal",unq);
}

public List<?> selectThisMonthList(CalVO vo) {
		return list ("calDAO.selectThisMonthList",vo);
}
  
  
  
  }
 