package egov.library.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.library.service.DefaultVO;
import egov.library.service.LibEventService;
import egov.library.service.LibEventVO;

@Service("libeventService")
public class LibEventServiceImpl implements LibEventService {
	
	@Resource(name="libeventDAO") LibEventDAO libeventDAO;

	@Override
	public List<?> selectLibEventList(DefaultVO vo) throws Exception {
		return libeventDAO.selectLibEventList(vo); 
	}

	@Override
	public int selectLibEventTotal(DefaultVO vo) throws Exception {
		return libeventDAO.selectLibEventTotal(vo) ;
	}

	@Override
	public String insertLibEvent(LibEventVO vo) throws Exception {
		return libeventDAO.insertLibEvent(vo);
	}

	@Override
	public void updateLibEventHits(String unq) throws Exception {
		 libeventDAO.updateLibEventHits(unq);
	}

	@Override
	public LibEventVO selectLibEventDetail(String unq) throws Exception {
		return libeventDAO.selectLibEventDetail(unq);
	}

	@Override
	public int deleteEvent(LibEventVO vo) throws Exception {
		return libeventDAO.deleteEvent(vo);
	}

	@Override
	public int updateEvent(LibEventVO vo) throws Exception {
		return libeventDAO.updateEvent(vo);
	}
	@Override
	public String libEventWriteSave(Map<String, Object> map1) throws Exception {
		return libeventDAO.libEventWriteSave(map1);
	}

	@Override
	public List<?> selectLibEventList2(DefaultVO vo) throws Exception {
		return libeventDAO.selectLibEventList2(vo);
	}

	@Override
	public LibEventVO selectLibEventDetail2(String unq) throws Exception {
		return libeventDAO.selectLibEventDetail2(unq);
	}

	@Override
	public int updateEvent(Map<String, Object> map1) throws Exception {
		return libeventDAO.updateEvent(map1);
	}
	
	@Override
	public List<?> selectLibEventFileName(LibEventVO eventVO) throws Exception {
		return libeventDAO.selectLibEventFileName(eventVO);
	}

}
