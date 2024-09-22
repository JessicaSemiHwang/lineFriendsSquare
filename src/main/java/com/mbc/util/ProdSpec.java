package com.mbc.util;

public enum ProdSpec {

	HIT("인기"), RECOMMEND("추천"), None("일반"), NEW("신규");
	
	private final String value;
	
	private ProdSpec(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
	
}
