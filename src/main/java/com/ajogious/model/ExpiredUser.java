package com.ajogious.model;

public class ExpiredUser {
	private User user;

	public ExpiredUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
