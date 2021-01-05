package application;

import java.time.LocalDate;

public class Todo {
	private String content;
	private LocalDate date;
	
	public Todo(String content, LocalDate date) {
		this.content = content;
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return this.content + "(" + this.date.toString() + ")";

	}
	
}
