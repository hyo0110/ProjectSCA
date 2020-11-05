package com.mrs.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("market_board_type")
public class MarketBoardType {
	int market_type;
	String market_name;
	public int getMarket_type() {
		return market_type;
	}
	public void setMarket_type(int market_type) {
		this.market_type = market_type;
	}
	public String getMarket_name() {
		return market_name;
	}
	public void setMarket_name(String market_name) {
		this.market_name = market_name;
	}
	
}
