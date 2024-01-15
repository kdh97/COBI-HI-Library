package egov.library.service.impl;
  
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO; 
import org.springframework.stereotype.Repository;
 
import egov.library.service.DefaultVO;
import egov.library.service.LibVO;

@Repository("libDAO") 
  
  public class LibDAO extends EgovAbstractDAO {
  
  public String insertLibNotice(LibVO vo) {
	   return (String) insert("libDAO.insertLibNotice",vo); 	
  }
  public List<?> selectLibNoticeList(DefaultVO vo) {
	  return list ("libDAO.selectLibNoticeList",vo);
  }
  
  public int selectLibNoticeTotal(DefaultVO vo) { 
	  return (int) select ("libDAO.selectLibNoticeTotal",vo); 
  }
  
  public void updateLibNoticeHits(String unq) {
	  update ("libDAO.updateLibNoticeHits",unq);
  }

  public LibVO selectLibNoticeDetail(String unq) {
	 return  (LibVO) select("libDAO.selectLibNoticeDetail",unq);
  }

  public int deleteNotice(LibVO vo) {
	return (int) delete("libDAO.deleteNotice",vo);
  }

  public int updateNotice(LibVO vo) {

	return (int) update("libDAO.updateNotice",vo);
  }
  
  public String libNoticeWriteSave(Map<String, Object> map1) {
	return (String) insert("libDAO.libNoticeWriteSave",map1);
  }

  public List<?> selectLibNoticeList2(DefaultVO vo) {
	return list ("libDAO.selectLibNoticeList2",vo);
}
  public LibVO selectLibNoticeDetail2(String unq) {
	return (LibVO) select("libDAO.selectLibNoticeDetail2",unq);
}
  
  
  
  
  }
 