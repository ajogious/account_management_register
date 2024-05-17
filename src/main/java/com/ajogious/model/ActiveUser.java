package com.ajogious.model;

import java.time.LocalDateTime;

public class ActiveUser {

	private User user;
	private LocalDateTime expirationDate;

	public ActiveUser(User user, LocalDateTime expirationDate) {
		this.user = user;
		this.expirationDate = expirationDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public LocalDateTime getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(LocalDateTime expirationDate) {
		this.expirationDate = expirationDate;
	}

}
