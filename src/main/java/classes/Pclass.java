package classes;

	public class Pclass {
		int product_id;
		String product_name;
		Float product_price;
		String product_url;
		public int getProduct_id() {
			return product_id;
		}
		public void setProduct_id(int product_id) {
			this.product_id = product_id;
		}
		public String getProduct_name() {
			return product_name;
		}
		public void setProduct_name(String product_name) {
			this.product_name = product_name;
		}
		public Float getProduct_price() {
			return product_price;
		}
		public String getPriceF() {
			return String.format("%,.2f", this.product_price);
		}
		public void setProduct_price(Float product_price) {
			this.product_price = product_price;
		}
		public String getProduct_url() {
			return product_url;
		}
		public void setProduct_url(String product_url) {
			this.product_url = product_url;
		}
		
		
		

	}


