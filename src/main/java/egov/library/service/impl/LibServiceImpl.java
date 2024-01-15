package egov.library.service.impl;
  
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import egov.library.service.DefaultVO; 
import egov.library.service.LibService;
import egov.library.service.LibVO;

  @Service("libService") 
  public class LibServiceImpl implements LibService {
  
  @Resource(name="libDAO") LibDAO libDAO;
  
  @Override
  public String insertLibNotice(LibVO vo) throws Exception {
	  	return libDAO.insertLibNotice(vo); 
  }
  @Override 
  public List<?> selectLibNoticeList(DefaultVO vo) throws Exception {
	  	return libDAO.selectLibNoticeList(vo); 
  }
  @Override 
  public int selectLibNoticeTotal(DefaultVO vo) throws Exception {
	  	return libDAO.selectLibNoticeTotal(vo);   	
  }
  @Override
  public void updateLibNoticeHits(String unq) throws Exception {
	  	libDAO.updateLibNoticeHits(unq);
  }
  @Override
  public LibVO selectLibNoticeDetail(String unq) throws Exception {
		return libDAO.selectLibNoticeDetail(unq);
  }
  @Override
  public int deleteNotice(LibVO vo) throws Exception {
		return libDAO.deleteNotice(vo);
  }
  
  @Override
  public int updateNotice(LibVO vo) throws Exception {
		return libDAO.updateNotice(vo);
  }
  @Override
  public String libNoticeWriteSave(Map<String, Object> map1) throws Exception {
		return libDAO.libNoticeWriteSave(map1);
  }

 @Override
 public List<?> selectLibNoticeList2(DefaultVO vo) throws Exception {
	  return libDAO.selectLibNoticeList2(vo);
 }
 
 @Override
 public LibVO selectLibNoticeDetail2(String unq) throws Exception {
 	  return libDAO.selectLibNoticeDetail2(unq);
 }
			  
  
  
  }
 