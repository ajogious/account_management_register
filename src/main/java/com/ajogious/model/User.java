package com.ajogious.model;

import org.mindrot.jbcrypt.BCrypt;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class User {
	private String username;
	private String fullName;
	private String phoneNumber;
	private String dateOfBirth;
	private String state;
	private String email;
	private String gender;
	private String lga;
	private String password;
	private String registrationDate;
	private String address;
	private String role;
	private boolean isActive;
	private String accountExpiring;
	
	

	public User() {
		super();
	}

	// Constructor
	public User(String username, String fullName, String phoneNumber, String dateOfBirth, String state, String email,
			String gender, String lga, String password, String address) {
		this.username = username;
		this.fullName = fullName;
		this.phoneNumber = phoneNumber;
		this.dateOfBirth = dateOfBirth;
		this.state = state;
		this.email = email;
		this.gender = gender;
		this.lga = lga;
		setPassword(password); // Hash password
		this.registrationDate = getCurrentDateTime(); // Set registration date
		this.address = address;
		this.role = "normal user";
		this.isActive = true;
		this.accountExpiring = getDefaultAccountExpiry(); // Set default account expiry
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getLga() {
		return lga;
	}

	public void setLga(String lga) {
		this.lga = lga;
	}

	public String getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public String getAccountExpiring() {
		return accountExpiring;
	}

	public void setAccountExpiring(String accountExpiring) {
		this.accountExpiring = accountExpiring;
	}

	public String getPassword() {
		return password;
	}

	// Password hashing
	public void setPassword(String password) {
		this.password = hashPassword(password);
	}

	private String hashPassword(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt());
	}
	
	public static boolean checkPassword(String plainTextPassword, String hashedPassword) {
        return BCrypt.checkpw(plainTextPassword, hashedPassword);
    }

	// Current date and time formatter
	private String getCurrentDateTime() {
		return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}

	// Default account expiry formatter
	private String getDefaultAccountExpiry() {
		return LocalDateTime.now().plusYears(30).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}

	@Override
	public String toString() {
		return "User{" + "username='" + username + '\'' + ", fullName='" + fullName + '\'' + ", phoneNumber='"
				+ phoneNumber + '\'' + ", dateOfBirth='" + dateOfBirth + '\'' + ", state='" + state + '\'' + ", email='"
				+ email + '\'' + ", gender='" + gender + '\'' + ", lga='" + lga + '\'' + ", registrationDate='"
				+ registrationDate + '\'' + ", address='" + address + '\'' + ", role='" + role + '\'' + ", isActive="
				+ isActive + ", accountExpiring='" + accountExpiring + '\'' + '}';
	}
}
