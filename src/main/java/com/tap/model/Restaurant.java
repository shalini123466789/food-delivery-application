package com.tap.model;

public class Restaurant {
	
	

		private int id;
		private String name;
		private String cuisineType;
		private double deliveryTime;
		private String address;
		private double rating;
		private boolean isActive;
        private String imagePath;
        
        public Restaurant() {
        	
        }

		public Restaurant(String name, String cuisineType, double deliveryTime, String address, double rating,
				boolean isActive, String imagePath) {
			super();
			this.name = name;
			this.cuisineType = cuisineType;
			this.deliveryTime = deliveryTime;
			this.address = address;
			this.rating = rating;
			this.isActive = isActive;
			this.imagePath = imagePath;
		}

		

		public Restaurant(int id, String name, String cuisineType, double deliveryTime, String address, double rating,
				boolean isActive, String imagePath) {
			super();
			this.id = id;
			this.name = name;
			this.cuisineType = cuisineType;
			this.deliveryTime = deliveryTime;
			this.address = address;
			this.rating = rating;
			this.isActive = isActive;
			this.imagePath = imagePath;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getCuisineType() {
			return cuisineType;
		}

		public void setCuisineType(String cuisineType) {
			this.cuisineType = cuisineType;
		}

		public double getDeliveryTime() {
			return deliveryTime;
		}

		public void setDeliveryTime(double deliveryTime) {
			this.deliveryTime = deliveryTime;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public double getRating() {
			return rating;
		}

		public void setRating(double rating) {
			this.rating = rating;
		}

		public boolean getActive() {
			return isActive;
		}

		public void setActive(boolean isActive) {
			this.isActive = isActive;
		}

		public String getImagePath() {
			return imagePath;
		}

		public void setImagePath(String imagePath) {
			this.imagePath = imagePath;
		}

		@Override
		public String toString() {
			return "Restaurant [id=" + id + ", name=" + name + ", cuisineType=" + cuisineType + ", deliveryTime="
					+ deliveryTime + ", address=" + address + ", rating=" + rating + ", isActive=" + isActive
					+ ", imagePath=" + imagePath + "]";
		}

		
        
        
        

}
