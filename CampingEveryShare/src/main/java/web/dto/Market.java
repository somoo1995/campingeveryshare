package web.dto;

public class Market {

	private int marketNo;
	private int price;
	private int boardNo;
	
	public Market() {}

	public Market(int marketNo, int price, int boardNo) {
		super();
		this.marketNo = marketNo;
		this.price = price;
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Market [marketNo=" + marketNo + ", price=" + price + ", boardNo=" + boardNo + "]";
	}

	public int getMarketNo() {
		return marketNo;
	}

	public void setMarketNo(int marketNo) {
		this.marketNo = marketNo;
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
