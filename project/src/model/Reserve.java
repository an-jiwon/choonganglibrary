package model;

import java.sql.Date;

public class Reserve {
	private int book_id;
	private String id;
	private String reserve_ok;
	private Date reserve_date;
	private String title;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReserve_ok() {
		return reserve_ok;
	}
	public void setReserve_ok(String reserve_ok) {
		this.reserve_ok = reserve_ok;
	}

	
}
