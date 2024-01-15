package egov.libreserve.service;

import java.util.List;

import egov.library.service.LibMemberVO;

public interface LibrsService {
	
	/*
	 * 좌석 배정 시작
	 */
	
	int selectUserinfo1(String session_id) throws Exception;
	int selectUserinfo2(String session_id) throws Exception;
	int updateSit(LibrsVO vo) throws Exception;
	List<?> selectAlreadySit(LibrsVO vo) throws Exception;
	
	/*
	 * 좌석 배정 끝
	 */
	
	/*
	 * 좌석 배정 기록 시작
	 */
	
	String insertarchive(LibrsVO vo) throws Exception;
	String selectSdate(LibrsVO vo) throws Exception;
	int updateEdate(LibrsVO vo) throws Exception;

	/*
	 * 좌석 배정 기록 끝
	 */
	
	/*
	 * 좌석 번호 리스트 시작
	 */
	
	List<?> selectSitnumber(LibrsVO vo) throws Exception; 
	List<?> selectSitnumber1(LibrsVO vo) throws Exception;
	List<?> selectSitnumber2(LibrsVO vo) throws Exception;
	List<?> selectSitnumber3(LibrsVO vo) throws Exception;
	List<?> selectSitnumber4(LibrsVO vo) throws Exception;
	
	/*
	 * 좌석 번호 리스트 끝
	 */
	
	/*
	 * 사용중인 좌석의 갯수 시작
	 */
	
	int selectYSitTotal(LibrsVO vo) throws Exception;
	int selectNSitTotal(LibrsVO vo) throws Exception;
	List<?> selectSitid(LibrsVO vo) throws Exception;
	
	/*
	 * 사용중인 좌석의 갯수 끝
	 */
	
	/*
	 * 좌석 사용 종료 시작
	 */
	
	int updateSitout(LibrsVO vo) throws Exception;

	
	/*
	 * 좌석 사용 종료 끝
	 */
	
	/*
	 * 좌석 관리 시작
	 */
	
	int updateAdminSitout(LibrsVO vo) throws Exception;
	List<?> selectSitSdate(LibrsVO vo) throws Exception; 
	List<?> selectSitName(LibMemberVO vo) throws Exception;
	
	/*
	 * 좌석 관리 끝
	 */
	
	/*
	 * 좌석 배정기록 목록 시작
	 */
	
	List<?> selectSitArchive(LibrsVO vo) throws Exception;
	int selectArchiveTotal(String session_id) throws Exception;
	String selectArchiveName(String session_id) throws Exception;
	List<?> selectAdminSitArchive(LibrsVO vo) throws Exception;
	int selectAdminArchiveTotal(LibrsVO vo) throws Exception;
	List<?> selectAdminArchiveName(LibrsVO vo) throws Exception;
	
	/*
	 * 좌석 배정기록 목록 끝
	 */
	
}
