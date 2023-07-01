//
//  MyViewController.swift
//  StudentCRUDAppX
//
//  Created by Asbika Hicham on 5/8/23.
//

import UIKit

class MyViewController: UIViewController,EditStudentDelegate {
//    func didEditStudent(student student1: Student) {
//        student = student1;
//        print("KIU")
//    }
    var editedStudent: Student?
    
    @IBOutlet weak var profileImage: UIImageView!
    
    var cellLabelString: String = ""
    var student : Student?
    @IBOutlet weak var myCellLabel: UILabel!
    
    @IBOutlet weak var myMajor: UILabel!
    @IBOutlet weak var myAge: UILabel!
    @IBOutlet weak var myMail: UILabel!
    @IBOutlet weak var myPhone: UILabel!
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           if let editedStudent = editedStudent {
               myCellLabel.text = "\(editedStudent.lastName) \(editedStudent.name)"
               profileImage.image = UIImage(named: editedStudent.image)
               myMajor.text = editedStudent.major
               myAge.text = "\(editedStudent.age) YO"
               myMail.text = editedStudent.mail
               myPhone.text = editedStudent.phone
           }
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        myCellLabel.text = (student!.lastName)+" "+(student!.name)
        profileImage.image = UIImage(named:"\(student!.image)")
        myMajor.text = student!.major
        myAge.text = "\(student!.age) YO"
        myMail.text = student?.mail
        myPhone.text = student!.phone
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "editSegue" {
                  let destinationVC = segue.destination as! EditStudentViewController
                  destinationVC.student = student
                  destinationVC.editStudentDelegate = self
              }
       }
    func didEditStudent(student: Student) {
            editedStudent = student
            navigationController?.popViewController(animated: true)
        }
}
