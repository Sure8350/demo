package com.ys.entity;

public class Goods {
	private Integer goodsId;
	private String goodsName;
	private Integer amount;
	private String goodsPhotoFile;
	private String type;
	private Float price;

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getGoodsPhotoFile() {
		return goodsPhotoFile;
	}

	public void setGoodsPhotoFile(String goodsPhotoFile) {
		this.goodsPhotoFile = goodsPhotoFile;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

}
