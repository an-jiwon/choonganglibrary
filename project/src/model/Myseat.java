package model;

import java.util.Date;

public class Myseat {
	private int seatnum;
	private String id;
	private Date seatIn;
	private Date seatOut;
	
	public int getSeatnum() {
		return seatnum;
	}
	public void setSeatnum(int seatnum) {
		this.seatnum = seatnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getSeatIn() {
		return seatIn;
	}
	public void setSeatIn(Date seatIn) {
		this.seatIn = seatIn;
	}
	public Date getSeatOut() {
		return seatOut;
	}
	public void setSeatOut(Date seatOut) {
		this.seatOut = seatOut;
	}

	
}
