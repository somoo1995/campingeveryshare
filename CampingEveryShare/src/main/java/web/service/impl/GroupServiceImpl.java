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
import web.dao.face.GroupDao;
import web.dao.face.ReComDao;
import web.dao.face.ReportDao;
import web.dto.Board;
import web.dto.BoardFile;
import web.dto.Comm;
import web.dto.Group;
import web.dto.Recom;
import web.dto.Report;
import web.dto.User;
import web.service.face.GroupService;
import web.util.Paging;

@Service
public class GroupServiceImpl implements GroupService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired GroupDao groupDao;
	@Autowired CommDao commDao;
	@Autowired ReComDao recomDao;
	@Autowired ReportDao reportDao;
	
	@Autowired ServletContext context;
	@Override
	public List<Map<String, Object>> list(Paging paging) {
		
		List<Map<String, Object>> list = groupDao.selectGroupAll(paging);
		
		return list;
	}

	@Override
	public Paging getPaging(Paging param) {

		int totalCount = groupDao.selectCntAll(param);

		Paging paging = new Paging(totalCount, param.getCurPage(), 15, param.getPageCount());
		paging.setLocation(param.getLocation());
		return paging;
	}

	@Override
	public Board groupView(Board board) {

		Board boardtb = groupDao.selectBoardView(board);
		groupDao.hit(board);
		
		return boardtb;
	}

	@Override
	public User getNick(User user) {
		
		User usertb = groupDao.selectByUserNick(user);
		
		return usertb;
	}
	
	@Override
	public Group getStatus(Group group) {
		
		Group groupStatus = groupDao.selectSatus(group);
		
		return groupStatus;
	}
	
	
	@Override
	public List<BoardFile> fileView(Board board) {

		return groupDao.selectGetFileByBoardNo(board);
	}
	
	@Override
	public void groupWrite(Board board, List<MultipartFile> file, Group group) {
		
		if( board.getTitle() == null || "".equals(board.getTitle())) {
			board.setTitle("(제목없음)");
		}		
	
		groupDao.insertGroupWrite(board);
		group.setBoardNo(board.getBoardNo());
		groupDao.insertGroupStatus(group);
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
		
		groupDao.insertGroupFile( boardFile );		
	}
	
	@Override
	public Board view(Board board) {

		if( board.getHit() != -1 ) {
			groupDao.hit(board);
		}
		
		return groupDao.selectBoardView(board);
	}
	
	@Override
	public List<BoardFile> getAttachFile(Board board) {
		
		return groupDao.selectGroupFileByBoardNo(board);
	}

	@Override
	public void updateProc(Board board, List<MultipartFile> file, int[] delFileNo, Group group) {
		
		if( board.getTitle() == null || "".equals(board.getTitle()) ) {
			board.setTitle("(제목없음)");
		}
		
		groupDao.updateProc(board);
		groupDao.updateStatus(group);

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
			groupDao.deleteFiles( delFileNo );
		}
		
	}

	@Override
	public void delete(Board board) {
//		groupDao.deleteFileByBoardNo( boardFile );
		groupDao.deleteByBoardNo( board );	
	}
	
	@Override
	public List<Comm> getCommList(Comm comm) {
		 
		return commDao.selectComm(comm);
	}
	 
	@Override
	public int insertComm(Comm comm) {

		int res = commDao.insertCommByGroup(comm);
		
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
	public boolean reComCnt(Recom recom) {
		
		int cnt = recomDao.selectCntRecomByUserId(recom);
		
		if( cnt > 0) {
			return true;
		} 
		
		return false;
	}

	@Override
	public boolean recom(Recom recom) {
		if( reComCnt(recom) ) {
			recomDao.deleteReCom(recom);
			
			return false;
		} else {
			recomDao.insertReCom(recom);
			
			return true;
		}
	}

	@Override
	public int getTotalCntRecom(Recom recom) {
		return recomDao.selectTotalCntRecom(recom);
	}

	@Override
	public void insertReport(Report report) {
		reportDao.insertReport(report);
	}

	@Override
	public int getTotalCntReport(Report report) {
		return reportDao.selectTotalCntReport(report);
	}

	@Override
	public boolean reportCnt(Report report) {
		int rCnt = reportDao.selectCntReportByUserId(report);
		
		if( rCnt > 0 ) {
			return true;
		}
		return false;
	}
}
