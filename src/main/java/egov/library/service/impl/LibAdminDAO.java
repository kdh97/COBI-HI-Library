package egov.library.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.library.service.DefaultVO;
import egov.library.service.LibMemberVO;

@Repository("libAdminDAO")
public class LibAdminDAO extends EgovAbstractDAO {

	public List<?> selectAdminMemberList(DefaultVO vo) {
		
		return list ("libAdminDAO.selectAdminMemberList",vo);
	}

	public List<?> selectAdminMemberList2(DefaultVO vo) {
		
		return list ("libAdminDAO.selectAdminMemberList2",vo);
	}
	
	public int selectMemberListTotal(DefaultVO vo) {
		
		return (int) select("libAdminDAO.selectMemberListTotal",vo);
	}
	
	public int selectMemberListTotal2(DefaultVO vo) {
		
		return (int) select("libAdminDAO.selectMemberListTotal2",vo);
	}

	public LibMemberVO selectLibAdminMemberModify(String userid) {
		
		return (LibMemberVO) select("libAdminDAO.selectLibAdminMemberModify",userid);
	}

	public int updateLibAdminMemberModifySave(LibMemberVO vo) {
		
		return update("libAdminDAO.updateLibAdminMemberModifySave",vo);
	}

	public int deleteLibAdminMember(String userid) {
		
		return delete("libAdminDAO.deleteLibAdminMember",userid);
	}

	

}
