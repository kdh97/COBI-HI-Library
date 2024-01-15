package egov.library.service;

import java.util.Map;

public interface LibMemberService {
	String insertLibMember(LibMemberVO vo) throws Exception;
	int selectLibMemberUserid(String userid) throws Exception;
	String selectLibMemberLogin(LibMemberVO vo) throws Exception;
	LibMemberVO selectLibMemberDetail(String userid) throws Exception;
	int selectUserPass(LibMemberVO vo) throws Exception;
	int updateLibMemberModifySave(LibMemberVO vo) throws Exception;
	String selectFindUserId(LibMemberVO vo) throws Exception;
	int selectUserPassExistCount(LibMemberVO vo) throws Exception;
	void updateLibUserPass(LibMemberVO vo) throws Exception;
	int updateLibPassChange(Map<String, String> map) throws Exception;
	int updateLibMemberResign(LibMemberVO vo) throws Exception;
	String selectLibMemberState(LibMemberVO vo) throws Exception;
	int selectBookCount(LibMemberVO vo) throws Exception;
	LibMemberVO selectLoginInfo(String userid) throws Exception;
    int selectReserveCount(LibMemberVO vo) throws Exception;
}	
