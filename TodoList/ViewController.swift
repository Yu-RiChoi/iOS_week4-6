//
//  ViewController.swift
//  TodoList
//
//  Created by 최유리 on 12/14/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var todoData = [Todo]()
    
    @IBOutlet var todoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoTable.dataSource = self
        todoTable.delegate = self
    }
    
    // 알림창에서 입력한 값 셀에 넣기
    @IBAction func addTodoButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "할 일 추가", message: "할 일과 마감기한을 입력하세요.", preferredStyle: .alert)
        alert.addTextField { (tf) in
            tf.placeholder = "할 일을 입력하세요"
        }
        alert.addTextField { (tf) in
            tf.placeholder = "마감일을 입력하세요(월.일 형태)"
        }
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        alert.addAction(UIAlertAction(title: "추가", style: .default, handler: { _ in
            let todoTitle = String((alert.textFields?[0].text)!)
            let dueDateTodo = String((alert.textFields?[1].text)!)
            self.todoData.append(Todo(todos: todoTitle, isCompleted: false, dueDate: "~ \(dueDateTodo)"))
            self.todoTable.reloadData()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // 수정기능 어떻게 하지?
    @IBAction func editTodoButton(_ sender: UIButton) {
            let editAlert = UIAlertController(title: "수정", message: "수정하세요.", preferredStyle: .alert)
            editAlert.addTextField { (tf) in
                tf.placeholder = "수정하세요."
            }
            editAlert.addAction(UIAlertAction(title: "취소", style: .cancel))
            
            // 어떻게 해야 값 바뀔까?
            editAlert.addAction(UIAlertAction(title: "수정", style: .default, handler: { _ in
                let editTodo = String((editAlert.textFields?[0].text)!)
                let dueDateTodo = String((editAlert.textFields?[1].text)!)
                self.todoData.append(Todo(todos: editTodo, isCompleted: false, dueDate: "~ \(dueDateTodo)"))
                
                self.todoTable.reloadData()
            }))
            
            self.present(editAlert, animated: true, completion: nil)
        }
        
        // 행 개수
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return todoData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            cell.selectionStyle = .none
            cell.cellLabel.text = todoData[indexPath.row].todos
            cell.dueDateLabel.text = todoData[indexPath.row].dueDate
            return cell
        }
        
        // 스와이프로 삭제
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                todoData.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
