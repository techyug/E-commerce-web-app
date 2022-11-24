package classes;

public class CartProduct {
	private String cart_id;
	private float p_price;
	private String p_name;
	private String p_url;
	private String p_id;
	public String getCart_id() {
		return cart_id;
	}
	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}
	public float getP_price() {
		return p_price;
	}
	public void setP_price(float price) {
		this.p_price = price;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_url() {
		return p_url;
	}
	public void setP_url(String p_url) {
		this.p_url = p_url;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getPriceF() {
		return String.format("%,.2f", this.p_price);
	}
	
	

}
