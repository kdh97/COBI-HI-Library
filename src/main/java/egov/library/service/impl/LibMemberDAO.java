package egov.library.service.impl;

import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.library.service.LibMemberVO;

@Repository("libMemberDAO")
public class LibMemberDAO extends EgovAbstractDAO {

	public String insertLibMember(LibMemberVO vo) {
		
		return (String) insert("libMemberDAO.insertLibMember",vo);
	}

	public int selectLibMemberUserid(String userid) {
		return (int) select("libMemberDAO.selectLibMemberUserid",userid);
	}

	public String selectLibMemberLogin(LibMemberVO vo) {
		
		return (String) select("libMemberDAO.selectLibMemberLogin",vo);
	}

	public LibMemberVO selectLibMemberDetail(String userid) {
		
		return (LibMemberVO) select("libMemberDAO.selectLibMemberDetail",userid);
	}

	public int selectUserPass(LibMemberVO vo) {
		
		return (int) select("libMemberDAO.selectUserPass",vo);
	}

	public int updateLibMemberModifySave(LibMemberVO vo) {
		
		return update("libMemberDAO.updateLibMemberModifySave",vo);
	}

	public String selectFindUserId(LibMemberVO vo) {
		
		return (String) select("libMemberDAO.selectFindUserId",vo);
	}

	public int selectUserPassExistCount(LibMemberVO vo) {
		
		return (int) select("libMemberDAO.selectUserPassExistCount",vo);
	}

	public void updateLibUserPass(LibMemberVO vo) {
		
		update("libMemberDAO.updateLibUserPass",vo);
	}

	public int updateLibPassChange(Map<String, String> map) {
		
		return update("libMemberDAO.updateLibPassChange",map);
	}

	public int updateLibMemberResign(LibMemberVO vo) {
		
		return update("libMemberDAO.updateLibMemberResign",vo);
	}

	public String selectLibMemberState(LibMemberVO vo) {
		
		return (String) select("libMemberDAO.selectLibMemberState",vo);
	}

	public int selectBookCount(LibMemberVO vo) {
		
		return (int) select("libMemberDAO.selectBookCount",vo);
	}

	public LibMemberVO selectLoginInfo(String userid) {
		
		return (LibMemberVO) select("libMemberDAO.selectLoginInfo",userid);
	}

	public int selectReserveCount(LibMemberVO vo) {
		
		return (int) select("libMemberDAO.selectReserveCount",vo);
	}


}
