package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.CommDao;
import web.dao.face.InquiryDao;
import web.dto.Admin;
import web.dto.Board;
import web.dto.BoardFile;
import web.dto.Comm;
import web.dto.User;
import web.service.face.InquiryService;
import web.util.Paging;

@Service
public class InquiryServiceImpl implements InquiryService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired InquiryDao inquiryDao;
	@Autowired CommDao commDao;
	
	@Autowired ServletContext context;

	@Override
	public List<Map<String, Object>> list(Paging paging) {
		List<Map<String, Object>> list = inquiryDao.selectInquiryAll(paging);
		
		return list;
	}

	@Override
	public Paging getPaging(Paging param) {

		int totalCount = inquiryDao.selectCntAll();

		Paging paging = new Paging(totalCount, param.getCurPage(), 9, param.getPageCount());
		
		return paging;
	}
	
	@Override
	public Board inquiryView(Board board) {
		
		Board boardtb = inquiryDao.selectBoardView(board);
		inquiryDao.hit(board);
		
		return boardtb;
	}
	
	@Override
	public User getNick(User user) {
		
		User usertb = inquiryDao.selectByUserNick(user);
		
		return usertb;
	}
	
	@Override
	public List<BoardFile> fileView(Board board) {
		return inquiryDao.selectGetFileByBoardNo(board);
	}
	
	@Override
	public void inquiryWrite(Board board, List<MultipartFile> file) {
	
		if( board.getTitle() == null || "".equals(board.getTitle())) {
			board.setTitle("(제목없음)");
		}		
	
		inquiryDao.insertInquiryWrite(board);
		//--------------------------------------------------------------------------------
		
		
		//첨부파일이 없을 경우 처리
		if( file.size() == 0) {
			return;
		}
		
		//--------------------------------------------------------------------------------

		for(MultipartFile f : file) {
			this.fileinsert(f, board.getBoardNo());
		}
		
	}

	private void fileinsert(MultipartFile file, int boardNo) {
		//빈 파일 처리
		if( file.getSize() <= 0 ) {
			//filesave() 메소드 중단
			return;
		}
		//파일이 저장될 경로 - RealPath
		String storedPath = context.getRealPath("upload");
	
		//upload폴더가 존재하지 않으면 생성하기
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
	
		//업로드된 파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일 객체
		File dest = new File(storedFolder, storedName);
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//-------------------------------------------
		
		//DB에 기록하기

		BoardFile boardFile = new BoardFile();
		boardFile.setBoardNo(boardNo);
		boardFile.setOriginName(originName);
		boardFile.setStoredName(storedName);
		
		inquiryDao.insertInquiryFile( boardFile );	
	}
	
	@Override
	public Board view(Board board) {
		
		if( board.getHit() != -1 ) {
			inquiryDao.hit(board);
		}
		
		return inquiryDao.selectBoardView(board);
	}
	
	@Override
	public List<BoardFile> getAttachFile(Board board) {
		return inquiryDao.selectInquiryFileByBoardNo(board);
	}
	
	@Override
	public void updateProc(Board board, List<MultipartFile> file, int[] delFileNo) {
		
		if( board.getTitle() == null || "".equals(board.getTitle()) ) {
			board.setTitle("(제목없음)");
		}
		
		inquiryDao.updateProc(board);

		//---------------------------------------------------------------------------
		
		//첨부파일이 없을 경우 처리
		if( file.size() == 0 ) {
			return;
		}

		for(MultipartFile f : file) {
			this.fileinsert( f, board.getBoardNo() );
		}

		//---------------------------------------------------------------------------

		//삭제할 첨부 파일 처리
		if( delFileNo != null ) {
			inquiryDao.deleteFiles( delFileNo );
		}		
	}
	
	@Override
	public void delete(Board board) {
		inquiryDao.deleteByBoardNo( board );	
	}
	
	@Override
	public List<Comm> getCommList(Comm comm) {
		return commDao.selectComm(comm);
	}
	
	@Override
	public int insertComm(Comm comm) {
		int res = commDao.insertCommByInquiry(comm);
		
		if( res > 0 ) {

		} else {

		}
		
		return res;
	}
	
	@Override
	public void deleteComm(Comm comm) {
		commDao.deleteComm(comm);
	}
	
	@Override
	public List<Map<String, Object>> getCommListByUserNick(Comm comm) {
		
		List<Map<String, Object>> commList = commDao.getCommListByUserNick(comm);
		
		return commList;
	}
	
	@Override	
	public Admin getAdminCode(Admin admin) {

		Admin adminCode = inquiryDao.selectByAdminCode(admin);
		
		return adminCode;
	}
	
}
