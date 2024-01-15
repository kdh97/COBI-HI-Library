package egov.library.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.library.service.DefaultVO;
import egov.library.service.LibEventVO;


@Repository("libeventDAO") 
public class LibEventDAO extends EgovAbstractDAO {

	public List<?> selectLibEventList(DefaultVO vo) {
		return list ("libeventDAO.selectLibEventList",vo);
	}

	public int selectLibEventTotal(DefaultVO vo) {
		return (int) select ("libeventDAO.selectLibEventTotal",vo);
	}

	public String insertLibEvent(LibEventVO vo) {
		return (String) insert("libeventDAO.insertLibEvent",vo);
	}

	public void updateLibEventHits(String unq) {
		  update ("libeventDAO.updateLibEventHits",unq);
	}

	public LibEventVO selectLibEventDetail(String unq) {
		return (LibEventVO) select("libeventDAO.selectLibEventDetail",unq);
	}

	public int deleteEvent(LibEventVO vo) {
		return (int) delete("libeventDAO.deleteEvent",vo);
	}

	public int updateEvent(LibEventVO vo) {
		//System.out.println("================ update DAO ================");  -->안뜸
		return (int) update("libeventDAO.updateEvent",vo);
	}

	public String libEventWriteSave(Map<String, Object> map1) {
		return  (String) insert("libeventDAO.libEventWriteSave",map1);
	}
	
	//회원만 보는화면(List2/Detail2)
	public List<?> selectLibEventList2(DefaultVO vo) {
		return list ("libeventDAO.selectLibEventList2",vo);
	}

	public LibEventVO selectLibEventDetail2(String unq) {
		return (LibEventVO) select("libeventDAO.selectLibEventDetail2",unq);
	}

	public int updateEvent(Map<String, Object> map1) {
		return (int) update("libeventDAO.updateEvent",map1);
	}

	public List<?> selectLibEventFileName(LibEventVO eventVO) {
		return list ("libeventDAO.selectLibEventFileName",eventVO);
	}
	
	
	
	
	
	

}
