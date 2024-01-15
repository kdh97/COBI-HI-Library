package egov.library.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.library.service.DefaultVO;
import egov.library.service.LibraryService;
import egov.library.service.LibraryVO;

@Service("libraryService")
public class LibraryServiceImpl implements LibraryService {

    @Resource(name = "libraryDAO")
    LibraryDAO libraryDAO;

    @Override
    public String insertBook(LibraryVO vo) throws Exception {
    	
        return libraryDAO.insertBook(vo);
    }

    @Override
    public int selectBookTotal(DefaultVO vo) throws Exception {
        return libraryDAO.selectBookTotal(vo);
    }

    @Override
    public List<?> selectBookList(DefaultVO vo) throws Exception {
        return libraryDAO.selectBookList(vo);
    }

    @Override
    public LibraryVO selectBookDetail(String unq) throws Exception {
    	
        return libraryDAO.selectBookDetail(unq);
    }

	@Override
	public List<?> selectPopularBookList(DefaultVO vo) throws Exception {
		return libraryDAO.selectPopularBookList(vo);
	}
	@Override
	public List<?> selectMainPopularBookList(DefaultVO vo) throws Exception {
		return libraryDAO.selectMainPopularBookList(vo);
	}

	@Override
	public List<?> selectNewBookList(DefaultVO vo) throws Exception {
		return libraryDAO.selectNewBookList(vo);
	}

	@Override
	public int deleteBook(String unq) throws Exception {
		return libraryDAO.deleteBook(unq);
	}

	@Override
	public int selectISBN(String isbn) throws Exception {

		return libraryDAO.selectISBN(isbn);
	}
	@Override
	public int selectRentCount(String id) throws Exception {
		return libraryDAO.selectRentCount(id);
	}

	@Override
	public int updateRentId(LibraryVO vo) throws Exception {
		
		return libraryDAO.updateRentId(vo);
	}
    
	@Override
	public int updateReturnId(LibraryVO vo) throws Exception {
		return libraryDAO.updateReturnId(vo);
	}
	
	@Override
    public List<?> selectMyBookList(String id) throws Exception {
        return libraryDAO.selectMyBookList(id);
    }
	
	@Override
	public List<?> selectBorrowBookList(DefaultVO vo) throws Exception {
		
		return libraryDAO.selectBorrowBookList(vo);
	}

	@Override
	public int selectBorrowBookTotal(DefaultVO vo) throws Exception {
		
		return libraryDAO.selectBorrowBookTotal(vo);
	}

	@Override
	public void insertBH(LibraryVO vo) throws Exception {
		System.out.println("insertBHimpl::" + vo);
		libraryDAO.insertBH(vo);
		
	}

	@Override
	public void updateBH(LibraryVO vo) throws Exception {
		libraryDAO.updateBH(vo);
		
	}

	@Override
	public List<?> selectMyBookList2(DefaultVO vo) throws Exception {
		
		return libraryDAO.selectMyBookList2(vo);
	}

	@Override
	public int selectBHTotal(DefaultVO vo) throws Exception {
		System.out.println("BHTOTALImpl");
		return libraryDAO.selectBHTotal(vo);
	}
	
	@Override
    public boolean selectMemberCount(String id) throws Exception {
        int count = libraryDAO.selectMemberCount(id);
        return count > 0;
    }
	@Override
	public void updateBookRentHits(int unq) throws Exception {
		
		libraryDAO.updateBookRentHits(unq);
	}
	
}
