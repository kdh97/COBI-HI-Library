package egov.library.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.library.service.DefaultVO;
import egov.library.service.LibraryVO;

@Repository("libraryDAO")
public class LibraryDAO extends EgovAbstractDAO {

    public String insertBook(LibraryVO vo) {
        return (String) insert("libraryDAO.insertBook", vo);
    }

    public int selectBookTotal(DefaultVO vo) {
        return (int) select("libraryDAO.selectBookTotal", vo);
    }

    public List<?> selectBookList(DefaultVO vo) {
        return list("libraryDAO.selectBookList", vo);
    }

    public LibraryVO selectBookDetail(String unq) {
    	
        return (LibraryVO) select("libraryDAO.selectBookDetail", unq);
    }

	public List<?> selectPopularBookList(DefaultVO vo) {
		return list("libraryDAO.selectPopularBookList", vo);
	}


	public List<?> selectNewBookList(DefaultVO vo) {
		return list("libraryDAO.selectNewBookList", vo);
	}

	public int deleteBook(String unq) {
		return delete("libraryDAO.deleteBook",unq);
	}

	public int selectISBN(String isbn) {
		
		return (int) select("libraryDAO.selectISBN",isbn);
	}
	public int updateRentId(LibraryVO vo) {
		return update("libraryDAO.updateRentId",vo);
	}

	public int selectRentCount(String id) {
		return (int) select("libraryDAO.selectRentCount",id);
	}


	public List<?> selectMyBookList(String id) {
        return list ("libraryDAO.selectMyBookList", id);
    }

	public int updateReturnId(LibraryVO vo) {
		return update("libraryDAO.updateRentId",vo);
	}
	public List<?> selectBorrowBookList(DefaultVO vo) {
		
		return list ("libraryDAO.selectBorrowBookList",vo);
	}

	public int selectBorrowBookTotal(DefaultVO vo) {
		
		return (int) select("libraryDAO.selectBorrowBookTotal",vo);
	}

	public void insertBH(LibraryVO vo) {

		insert("libraryDAO.insertBH",vo);
		
	}

	public void updateBH(LibraryVO vo) {
		update("libraryDAO.updateBH",vo);
		
	}

	public List<?> selectMyBookList2(DefaultVO vo) {
		
		return list ("libraryDAO.selectMyBookList2",vo);
	}

	public int selectBHTotal(DefaultVO vo) {

		return (int) select("libraryDAO.selectBHTotal",vo);
	}

	public List<?> selectMainPopularBookList(DefaultVO vo) {
		return list("libraryDAO.selectMainPopularBookList", vo);
	}
	public int selectMemberCount(String id) {
        return (int) select("libraryDAO.selectMemberCount", id);
    }

   	public void updateBookRentHits(int unq) {
		update("libraryDAO.updateBookRentHits",unq);
		
	}
}
