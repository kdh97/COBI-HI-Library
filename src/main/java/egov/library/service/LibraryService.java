package egov.library.service;

import java.util.List;

public interface LibraryService {
    String insertBook(LibraryVO vo) throws Exception;
    int selectBookTotal(DefaultVO vo) throws Exception;
    List<?> selectBookList(DefaultVO vo) throws Exception;
    LibraryVO selectBookDetail(String unq) throws Exception;
	List<?> selectPopularBookList(DefaultVO vo) throws Exception;
	List<?> selectMainPopularBookList(DefaultVO vo) throws Exception;
	List<?> selectNewBookList(DefaultVO vo) throws Exception;
	int deleteBook(String unq) throws Exception;
	int selectISBN(String isbn) throws Exception;
	int updateRentId(LibraryVO vo) throws Exception;
	int selectRentCount(String id) throws Exception;
	int updateReturnId(LibraryVO vo) throws Exception;
	List<?> selectMyBookList(String id) throws Exception;
	List<?> selectBorrowBookList(DefaultVO vo) throws Exception;
	int selectBorrowBookTotal(DefaultVO vo) throws Exception;
	void insertBH(LibraryVO vo) throws Exception;
	void updateBH(LibraryVO vo) throws Exception;
	List<?> selectMyBookList2(DefaultVO vo) throws Exception;
	int selectBHTotal(DefaultVO vo) throws Exception;
	boolean selectMemberCount(String id) throws Exception;
	void updateBookRentHits(int unq) throws Exception;
	
}
