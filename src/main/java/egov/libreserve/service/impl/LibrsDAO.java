package egov.libreserve.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egov.library.service.DefaultVO;
import egov.library.service.LibMemberVO;
import egov.libreserve.service.LibrsVO;

@Repository("LibrsDAO")
public class LibrsDAO extends EgovAbstractDAO {

	/*
	 * 좌석 배정 시작
	 */
	
	public int updateSit(LibrsVO vo) {
		
		return (int) update("LibrsDAO.updateSit",vo);
	}

	public int selectUserinfo1(String session_id) {
		
		return (int) select("LibrsDAO.selectUserinfo1",session_id);
	}

	public int selectUserinfo2(String session_id) {
		
		return (int) select("LibrsDAO.selectUserinfo2",session_id);
	}

	public List<?> selectAlreadySit(LibrsVO vo) {
		
		return list("LibrsDAO.selectAlreadySit",vo);
	}
	
	/*
	 * 좌석 배정 끝
	 */
	
	/*
	 * 좌석 배정 기록 시작
	 */
	
	public String insertarchive(LibrsVO vo) {
		
		return (String) insert("LibrsDAO.insertarchive",vo);
	}

	public int updateEdate(LibrsVO vo) {
		
		return (int) update("LibrsDAO.updateEdate",vo);
	}

	public String selectSdate(LibrsVO vo) {
		
		return (String) select("LibrsDAO.selectSdate",vo);
	}
	
	/*
	 * 좌석 배정 기록 끝
	 */
	
	/*
	 * 좌석 번호 리스트 시작
	 */
	public List<?> selectSitnumber(LibrsVO vo) {
		
		return list("LibrsDAO.selectSitnumber",vo);
	}
	
	public List<?> selectSitnumber1(LibrsVO vo) {
		
		return list("LibrsDAO.selectSitnumber1",vo);
	}

	public List<?> selectSitnumber2(LibrsVO vo) {
		
		return list("LibrsDAO.selectSitnumber2",vo);
	}

	public List<?> selectSitnumber3(LibrsVO vo) {
		
		return list("LibrsDAO.selectSitnumber3",vo);
	}

	public List<?> selectSitnumber4(LibrsVO vo) {
		
		return list("LibrsDAO.selectSitnumber4",vo);
	}
	
	/*
	 * 좌석 번호 리스트 끝
	 */

	/*
	 * 사용중인 좌석 갯수 시작
	 */

	public int selectYSitTotal(LibrsVO vo) {
		
		return (int) select("LibrsDAO.selectYSitTotal",vo);
	}

	public int selectNSitTotal(LibrsVO vo) {
	
		return (int) select("LibrsDAO.selectNSitTotal",vo);
	}

	public List<?> selectSitid(LibrsVO vo) {

		return list("LibrsDAO.selectSitid",vo);
	}
	
	/*
	 * 사용중인 좌석 갯수 끝
	 */
	
	/* 
	 * 좌석 사용 종료 시작
	 */
	
	public int updateSitout(LibrsVO vo) {
		
		return (int) update("LibrsDAO.updateSitout",vo);
	}

	/* 
	 * 좌석 사용 종료 끝
	 */
	
	/*
	 * 좌석 관리 시작
	 */
	
	public int updateAdminSitout(LibrsVO vo) {
		
		return (int) update("LibrsDAO.updateSitout",vo);
	}

	public List<?> selectSitSdate(LibrsVO vo) {
		
		return list("LibrsDAO.selectSitSdate",vo);
	}

	public List<?> selectSitName(LibMemberVO vo) {
		
		return list("LibrsDAO.selectSitName");
	}
	
	/*
	 * 좌석 관리 끝
	 */

	/*
	 * 좌석 배정기록 목록 시작
	 */
	
	public List<?> selectSitArchive(LibrsVO vo) {
		
		return list("LibrsDAO.selectSitArchive",vo);
	}

	public int selectArchiveTotal(String session_id) {
		
		return (int) select("LibrsDAO.selectArchiveTotal",session_id);
	}

	public String selectArchiveName(String session_id) {

		return (String) select("LibrsDAO.selectArchiveName",session_id);
	}

	public List<?> selectAdminSitArchive(LibrsVO vo) {
		
		return list("LibrsDAO.selectAdminSitArchive",vo);
	}

	public int selectAdminArchiveTotal(LibrsVO vo) {
		
		return (int) select("LibrsDAO.selectAdminArchiveTotal",vo);
	}

	public List<?> selectAdminArchiveName(LibrsVO vo) {
		
		return list("LibrsDAO.selectAdminArchiveName",vo);
	}


	/*
	 * 좌석 배정기록 목록 끝
	 */
	
}
