package com.mrs.project.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("board")
public class BoardDTO {
	private int board_idx;
	private String board_type;
	private String id;
	private String subject;
	private String content;
	private int bHit;
	private Date reg_date;
	private String private_bbs;
	private String bchk;
	private String board_name;
	private MarketBoardType market_board_type;
	public MarketBoardType getMarket_board_type() {
		return market_board_type;
	}
	public void setMarket_board_type(MarketBoardType market_board_type) {
		this.market_board_type = market_board_type;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getPrivate_bbs() {
		return private_bbs;
	}
	public void setPrivate_bbs(String private_bbs) {
		this.private_bbs = private_bbs;
	}
	public String getBchk() {
		return bchk;
	}
	public void setBchk(String bchk) {
		this.bchk = bchk;
	}
}
