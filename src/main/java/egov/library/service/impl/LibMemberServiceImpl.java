package egov.library.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egov.library.service.LibMemberService;
import egov.library.service.LibMemberVO;
@Service("libMemberService")
public class LibMemberServiceImpl extends EgovAbstractServiceImpl implements LibMemberService {
	
	@Resource(name="libMemberDAO")
	LibMemberDAO libMemberDAO;
	
	@Override
	public String insertLibMember(LibMemberVO vo) throws Exception {
		
		return libMemberDAO.insertLibMember(vo);
	}

	@Override
	public int selectLibMemberUserid(String userid) throws Exception {
		
		return libMemberDAO.selectLibMemberUserid(userid);
	}

	@Override
	public String selectLibMemberLogin(LibMemberVO vo) throws Exception {
		
		return libMemberDAO.selectLibMemberLogin(vo);
	}

	@Override
	public LibMemberVO selectLibMemberDetail(String userid) throws Exception {
		
		return libMemberDAO.selectLibMemberDetail(userid);
	}

	@Override
	public int selectUserPass(LibMemberVO vo) throws Exception {
		
		return libMemberDAO.selectUserPass(vo);
	}

	@Override
	public int updateLibMemberModifySave(LibMemberVO vo) throws Exception {
		
		return libMemberDAO.updateLibMemberModifySave(vo);
	}

	@Override
	public String selectFindUserId(LibMemberVO vo) throws Exception {
		
		return libMemberDAO.selectFindUserId(vo);
	}

	@Override
	public int selectUserPassExistCount(LibMemberVO vo) throws Exception {
		
		return libMemberDAO.selectUserPassExistCount(vo);
	}

	@Override
	public void updateLibUserPass(LibMemberVO vo) throws Exception {
		
		libMemberDAO.updateLibUserPass(vo);
	}

	@Override
	public int updateLibPassChange(Map<String, String> map) throws Exception {
		
		return libMemberDAO.updateLibPassChange(map);
	}

	@Override
	public int updateLibMemberResign(LibMemberVO vo) throws Exception {
		
		return libMemberDAO.updateLibMemberResign(vo);
	}

	@Override
	public String selectLibMemberState(LibMemberVO vo) throws Exception {
		
		return libMemberDAO.selectLibMemberState(vo);
	}

	@Override
	public int selectBookCount(LibMemberVO vo) throws Exception {
		
		return libMemberDAO.selectBookCount(vo);
	}

	@Override
	public LibMemberVO selectLoginInfo(String userid) throws Exception {
		
		return libMemberDAO.selectLoginInfo(userid);
	}

	@Override
	public int selectReserveCount(LibMemberVO vo) throws Exception {
		
		return libMemberDAO.selectReserveCount(vo);
	}
	

}
