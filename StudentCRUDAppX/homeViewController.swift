//
//  homeViewController.swift
//  StudentCRUDAppX
//
//  Created by Asbika Hicham on 4/15/23.
//

import UIKit
var student1 : Student?


class homeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,AddStudentDelegate, EditStudentDelegate {
    func didAddStudent(_ student: Student) {
            
            studentsENG.append(student)
            tableView.reloadData()
        
    }
    
    
    
    var selectedStudentIndex: Int?
    var studentsENG = [Student(image: "1.png",name: "Ahmed", lastName: "Morabit", age: 22, field: "Genie Informatique", major: "Software Engineering", mail: "ahmed.morabit@uhp.com",phone: "06.98.09.90.37"),Student(image: "1.png",name: "Ihsane", lastName: "Kasimi", age: 23, field: "Genie Mecanique", major: "Mechanical Engineering",mail: "Ihsane.Kasimi@uhp.com",phone: "06.08.23.90.84")]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return studentsENG.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Students"
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! hommeTableViewCell
        if indexPath.section == 0 {
            cell.setupCell(photo: UIImage(named: studentsENG[indexPath.row].image)!, fistName: studentsENG[indexPath.row].name, lastName: studentsENG[indexPath.row].lastName, age: studentsENG[indexPath.row].age, field: studentsENG[indexPath.row].field)
        }
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    var indx : Int = 0
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "seg"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationVC = segue.destination as! MyViewController
                destinationVC.student = studentsENG[indexPath.row]
                selectedStudentIndex = indexPath.row;
                //indx = indexPath.row
                
                let vcUserData = self.storyboard?.instantiateViewController(identifier: "uservcId") as! EditStudentViewController
                vcUserData.editStudentDelegate = self
            }
        }else{
            if let addStudentVC = segue.destination as? addStudentViewController{
                addStudentVC.delegate = self
                
            }
        }
    }
  
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
                self.studentsENG.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                completionHandler(true)
            }
            deleteAction.image = UIImage(systemName: "trash")
            
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            configuration.performsFirstActionWithFullSwipe = false
            
            return configuration
        }

  
    
//    func didEditStudent(student: Student){
////        if let index = tableView.indexPathForSelectedRow?.row{
////            studentsENG[index] = student
////            tableView.reloadData()
////        }
//        print("------")
//        print(student)
//    }
    func didEditStudent(student: Student) {
            if let index = selectedStudentIndex {
                studentsENG[index] = student
                //tableView.reloadData()
            }
}


}
