package egov.library.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egov.library.service.DefaultVO;
import egov.library.service.LibAdminService;
import egov.library.service.LibMemberVO;

@Service("libAdminService")
public class LibAdminServiceImpl extends EgovAbstractServiceImpl implements LibAdminService {
	
	@Resource(name = "libAdminDAO")
	LibAdminDAO libAdminDAO;
	
	@Override
	public List<?> selectAdminMemberList(DefaultVO vo) throws Exception {
		
		return libAdminDAO.selectAdminMemberList(vo);
	}

	@Override
	public List<?> selectAdminMemberList2(DefaultVO vo) throws Exception {
		
		return libAdminDAO.selectAdminMemberList2(vo);
	}
	
	@Override
	public int selectMemberListTotal(DefaultVO vo) throws Exception {
		
		return libAdminDAO.selectMemberListTotal(vo);
	}
	
	@Override
	public int selectMemberListTotal2(DefaultVO vo) throws Exception {
		
		return libAdminDAO.selectMemberListTotal2(vo);
	}

	@Override
	public LibMemberVO selectLibAdminMemberModify(String userid) throws Exception {
		
		return libAdminDAO.selectLibAdminMemberModify(userid);
	}

	@Override
	public int updateLibAdminMemberModifySave(LibMemberVO vo) throws Exception {
		
		return libAdminDAO.updateLibAdminMemberModifySave(vo);
	}

	@Override
	public int deleteLibAdminMember(String userid) throws Exception {
		
		return libAdminDAO.deleteLibAdminMember(userid);
	}

	

}
