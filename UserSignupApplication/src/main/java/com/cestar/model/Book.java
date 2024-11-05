package com.cestar.model;


import java.sql.Date;

public class Book {
	private String entryID;
	private String title;
	private String author;
	private String genre;
	private String publicationDate;
	private String isbn;
	
	public String getEntryID() {
		return entryID;
	}
	public void setEntryID(String entryID) {
		this.entryID = entryID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getPublicationDate() {
		return publicationDate;
	}
	public void setPublicationDate(String publicationDate) {
		this.publicationDate = publicationDate;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public Book(String entryID, String title, String author, String genre, String publicationDate, String isbn) {
		super();
		this.entryID = entryID;
		this.title = title;
		this.author = author;
		this.genre = genre;
		this.publicationDate = publicationDate;
		this.isbn = isbn;
	}
	@Override
	public String toString() {
		return "Inventory [entryID=" + entryID + ", title=" + title + ", author=" + author + ", genre=" + genre
				+ ", publicationDate=" + publicationDate + ", isbn=" + isbn + "]";
	}
	
	
}
