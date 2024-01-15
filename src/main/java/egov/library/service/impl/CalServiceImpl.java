package egov.library.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.library.service.CalService;
import egov.library.service.CalVO;


@Service("calService")
public class CalServiceImpl implements CalService {

	
	@Resource(name = "calDAO")
    CalDAO calDAO;
	
	@Override
	public List<?> selectCalList(CalVO vo) throws Exception {
		return calDAO.selectCalList(vo);
	}

	@Override
	public CalVO selectCalDetail(String unq) throws Exception {
		return calDAO.selectCalDetail(unq);
	}

	@Override
	public String insertCal(Map<String, Object> map1) throws Exception {
		return calDAO.insertCal(map1);
	}

	@Override
	public int updateLibCalModifySave(Map<String, Object> map1) throws Exception {
		return calDAO.updateLibCalModifySave(map1);
	}

	@Override
	public int deleteCal(String unq) throws Exception {
		return calDAO.deleteCal(unq);
	}

	@Override
	public List<?> selectThisMonthList(CalVO vo) throws Exception {
		return calDAO.selectThisMonthList(vo);
	}

}
