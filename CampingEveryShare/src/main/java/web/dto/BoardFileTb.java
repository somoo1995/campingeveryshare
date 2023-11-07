package web.dto;

public class BoardFileTb {

	private int fileNo;
	private String originName;
	private String storedName;
	private int boardNo;
	private int boardCate;
	
	public BoardFileTb() {
		// TODO Auto-generated constructor stub
	}

	public BoardFileTb(int fileNo, String originName, String storedName, int boardNo, int boardCate) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.storedName = storedName;
		this.boardNo = boardNo;
		this.boardCate = boardCate;
	}

	@Override
	public String toString() {
		return "BoardFileTb [fileNo=" + fileNo + ", originName=" + originName + ", storedName=" + storedName
				+ ", boardNo=" + boardNo + ", boardCate=" + boardCate + "]";
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardCate() {
		return boardCate;
	}

	public void setBoardCate(int boardCate) {
		this.boardCate = boardCate;
	}
	
	
}
