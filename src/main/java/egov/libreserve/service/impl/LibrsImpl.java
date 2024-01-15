package egov.libreserve.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.library.service.LibMemberVO;
import egov.libreserve.service.LibrsService;
import egov.libreserve.service.LibrsVO;

@Service("LibrsService")
public class LibrsImpl implements LibrsService {
	
	@Resource(name="LibrsDAO")
	LibrsDAO LibrsDAO;
	
	/*
	 * 좌석 배정 시작
	 */

	@Override
	public int updateSit(LibrsVO vo) throws Exception {
		
		return LibrsDAO.updateSit(vo);
	}
	
	@Override
	public int selectUserinfo1(String session_id) throws Exception {
		
		return LibrsDAO.selectUserinfo1(session_id);
	}

	@Override
	public int selectUserinfo2(String session_id) throws Exception {

		return LibrsDAO.selectUserinfo2(session_id);
	}

	@Override
	public List<?> selectAlreadySit(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectAlreadySit(vo);
	}

	
	/*
	 * 좌석 배정 끝
	 */
	
	/*
	 * 좌석 배정 기록 시작
	 */

	@Override
	public String insertarchive(LibrsVO vo) {
		
		return LibrsDAO.insertarchive(vo);
	}

	@Override
	public int updateEdate(LibrsVO vo) throws Exception {
		
		return LibrsDAO.updateEdate(vo);
	}

	@Override
	public String selectSdate(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectSdate(vo);
	}
	
	/*
	 * 좌석 배정 기록 끝
	 */
	
	/*
	 * 좌석 번호 리스트 시작
	 */
	
	@Override
	public List<?> selectSitnumber(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectSitnumber(vo);
	}

	@Override
	public List<?> selectSitnumber1(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectSitnumber1(vo);
	}

	@Override
	public List<?> selectSitnumber2(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectSitnumber2(vo);
	}

	@Override
	public List<?> selectSitnumber3(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectSitnumber3(vo);
	}

	@Override
	public List<?> selectSitnumber4(LibrsVO vo) throws Exception {
	
		return LibrsDAO.selectSitnumber4(vo);
	}

	/*
	 * 좌석 번호 리스트 끝
	 */
	
	/*
	 * 사용중인 좌석 갯수 시작
	 */
	
	@Override
	public int selectYSitTotal(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectYSitTotal(vo);
	}

	@Override
	public int selectNSitTotal(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectNSitTotal(vo);
	}

	@Override
	public List<?> selectSitid(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectSitid(vo);
	}
	
	/*
	 * 사용중인 좌석 갯수 끝
	 */
	
	/*
	 * 좌석 사용 종료 시작
	 */

	@Override
	public int updateSitout(LibrsVO vo) throws Exception {
		
		return LibrsDAO.updateSitout(vo);
	}

	/*
	 * 좌석 사용 종료 끝
	 */

	/*
	 * 좌석 관리 시작
	 */
	
	@Override
	public int updateAdminSitout(LibrsVO vo) throws Exception {
		
		return LibrsDAO.updateAdminSitout(vo);
	}

	@Override
	public List<?> selectSitSdate(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectSitSdate(vo);
	}

	@Override
	public List<?> selectSitName(LibMemberVO vo) throws Exception {
		
		return LibrsDAO.selectSitName(vo);
	}
	
	/*
	 * 좌석 관리 끝
	 */
	
	/*
	 * 좌석 배정기록 목록 시작
	 */
	

	@Override
	public List<?> selectSitArchive(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectSitArchive(vo);
	}

	@Override
	public int selectArchiveTotal(String session_id) throws Exception {
		
		return LibrsDAO.selectArchiveTotal(session_id);
	}

	@Override
	public String selectArchiveName(String session_id) throws Exception {
		
		return LibrsDAO.selectArchiveName(session_id);
	}

	@Override
	public List<?> selectAdminSitArchive(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectAdminSitArchive(vo);
	}

	@Override
	public int selectAdminArchiveTotal(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectAdminArchiveTotal(vo);
	}

	@Override
	public List<?> selectAdminArchiveName(LibrsVO vo) throws Exception {
		
		return LibrsDAO.selectAdminArchiveName(vo);
	}

	/*
	 * 좌석 배정기록 목록 끝
	 */
}
