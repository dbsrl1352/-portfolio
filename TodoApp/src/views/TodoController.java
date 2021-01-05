package views;

import java.time.LocalDate;

import application.Todo;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.DatePicker;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;

public class TodoController {
	@FXML
	private DatePicker datePicker;
	@FXML
	private TextField txtField;

	@FXML
	private ListView<Todo> listView;

	private ObservableList<Todo> items;

	@FXML
	private void initialize() {
		items = FXCollections.observableArrayList();
		listView.setItems(items);
	}

	public void addTodo() {
		String content = txtField.getText();
		if (content.isEmpty()) {
			System.out.println("할 일을 입력하셔야 합니다");
			return;
		}

		LocalDate date = datePicker.getValue();
		if (date == null) {
			System.out.println("날짜를 입력하세요");
			return;
		}
		
		Todo todo = new Todo(content, date);
		items.add(todo);
	}
	
	public void delTodo() {
		int idx = listView.getSelectionModel().getSelectedIndex();
		
		if(idx >= 0) {
			items.remove(idx);
		}else {
			System.out.println("삭제할 아이템을 입력하세요");
		}
	}

}
