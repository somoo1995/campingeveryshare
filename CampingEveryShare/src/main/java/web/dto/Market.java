package web.dto;

public class Market {

	private int price;
	private int boardNo;
	
	public Market() {}

	public Market(int price, int boardNo) {
		super();
		this.price = price;
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Market [price=" + price + ", boardNo=" + boardNo + "]";
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	
	
}
