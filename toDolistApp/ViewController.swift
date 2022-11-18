//
//  ViewController.swift
//  toDolistApp
//
//  Created by ddukk15 on 17/11/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = taskList[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var myTableView: UITableView!
 
    
    @IBOutlet weak var myTextView: UITextField!
    var taskList:[String] = ["jun -21","BirthDay party","Attend","monday","gift","Full time Party"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func addNewData(_ sender: Any) {
        guard let listData = myTextView.text
        
            else
        {
            return
        }
        taskList.append(listData)
        let alert = UIAlertController(title: "message box", message: "add Data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Add Action", style: .destructive,handler: nil))
        present(alert, animated: true)
        myTextView.text = ""
        myTableView.reloadData()
    }
}
