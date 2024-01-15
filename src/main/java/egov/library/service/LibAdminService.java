package egov.library.service;

import java.util.List;

public interface LibAdminService {

	List<?> selectAdminMemberList(DefaultVO vo) throws Exception;

	List<?> selectAdminMemberList2(DefaultVO vo) throws Exception;
	
	int selectMemberListTotal(DefaultVO vo) throws Exception;
	
	int selectMemberListTotal2(DefaultVO vo) throws Exception;

	LibMemberVO selectLibAdminMemberModify(String userid) throws Exception;

	int updateLibAdminMemberModifySave(LibMemberVO vo) throws Exception;

	int deleteLibAdminMember(String userid) throws Exception;

	

}
