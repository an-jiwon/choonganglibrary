package model;

import java.sql.Date;

public class CheckOut {
	private int book_id;
	private String id;
	private Date checkout_date;
	private Date checkin_date;
	private String check_ok;
	private String title;
	private int overdate;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getOverdate() {
		return overdate;
	}
	public void setOverdate(int overdate) {
		this.overdate = overdate;
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
	public Date getCheckout_date() {
		return checkout_date;
	}
	public void setCheckout_date(Date checkout_date) {
		this.checkout_date = checkout_date;
	}
	public Date getCheckin_date() {
		return checkin_date;
	}
	public void setCheckin_date(Date checkin_date) {
		this.checkin_date = checkin_date;
	}
	public String getCheck_ok() {
		return check_ok;
	}
	public void setCheck_ok(String check_ok) {
		this.check_ok = check_ok;
	}
	

}
