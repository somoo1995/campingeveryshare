package web.dto;

public class BoardCategory {

	private int boardCate; 
	private String cateNameEn;
	private String cateNameKo;
	
	public BoardCategory() {}

	public BoardCategory(int boardCate, String cateNameEn, String cateNameKo) {
		super();
		this.boardCate = boardCate;
		this.cateNameEn = cateNameEn;
		this.cateNameKo = cateNameKo;
	}

	@Override
	public String toString() {
		return "BoardCategory [boardCate=" + boardCate + ", cateNameEn=" + cateNameEn + ", cateNameKo=" + cateNameKo
				+ "]";
	}

	public int getBoardCate() {
		return boardCate;
	}

	public void setBoardCate(int boardCate) {
		this.boardCate = boardCate;
	}

	public String getCateNameEn() {
		return cateNameEn;
	}

	public void setCateNameEn(String cateNameEn) {
		this.cateNameEn = cateNameEn;
	}

	public String getCateNameKo() {
		return cateNameKo;
	}

	public void setCateNameKo(String cateNameKo) {
		this.cateNameKo = cateNameKo;
	}

	
	
}
