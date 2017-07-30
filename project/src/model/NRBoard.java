package model;

import java.sql.Date;

public class NRBoard {
	private int num;
	private String category;
	private String title;
	private String writer;
	private String main;
	private String NRBoard_file;
	private Date nr_date;
	private int nr_view;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMain() {
		return main;
	}
	public void setMain(String main) {
		this.main = main;
	}
	public String getNRBoard_file() {
		return NRBoard_file;
	}
	public void setNRBoard_file(String nRBoard_file) {
		NRBoard_file = nRBoard_file;
	}
	public Date getNr_date() {
		return nr_date;
	}
	public void setNr_date(Date nr_date) {
		this.nr_date = nr_date;
	}
	public int getNr_view() {
		return nr_view;
	}
	public void setNr_view(int nr_view) {
		this.nr_view = nr_view;
	}

	
}
