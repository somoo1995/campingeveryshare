package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.ShareDao;
import web.dto.Board;
import web.dto.BoardFile;
import web.dto.User;
import web.service.face.ShareService;
import web.util.Paging;

@Service
public class ShareServiceImpl implements ShareService {

	@Autowired ShareDao shareDao;
	@Autowired ServletContext context;
	@Override
	public List<Map<String, Object>> list(Paging paging) {
		return shareDao.selectShareAll(paging);
	}

	@Override
	public Paging getPaging(Paging param) {

		int totalCount = shareDao.selectCntAll();

		Paging paging = new Paging(totalCount, param.getCurPage());
		
		return paging;
	}

	@Override
	public Board shareView(Board board) {

		Board boardtb = shareDao.selectBoardView(board);
		shareDao.hit(board);
		
		return boardtb;
	}

	@Override
	public User getNick(User user) {
		
		User usertb = shareDao.selectByUserNick(user);
		
		return usertb;
	}
	
	@Override
	public List<BoardFile> fileView(Board board) {

		return shareDao.selectGetFileByBoardNo(board);
	}
	
	@Override
	public void shareWrite(Board board, List<MultipartFile> file) {
		
		if( board.getTitle() == null || "".equals(board.getTitle())) {
			board.setTitle("(제목없음)");
		}		
	
		shareDao.insertShareWrite(board);
		
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
		//mkdir() - 없으면 만들어주는 메소드
	
		//업로드된 파일이 저장될 이름
//		String storedName = null;
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
		
		shareDao.insertShareFile( boardFile );		
	}
	
	@Override
	public Board view(Board board) {

		//update 일 때에는 조회수가 증가되지 않는다
		if( board.getHit() != -1 ) {
			//조회수 증가
			shareDao.hit(board);
		}
		
		return shareDao.selectBoardView(board);
	}
	
	@Override
	public List<BoardFile> getAttachFile(Board board) {
		
		//여기해야돼
		return null;
	}
}
