//
//  EditStudentViewController.swift
//  StudentCRUDAppX
//
//  Created by Asbika Hicham on 5/13/23.
//

import UIKit

protocol EditStudentDelegate: AnyObject {
    func didEditStudent(student: Student)
}

class EditStudentViewController: UIViewController {
    var editStudentDelegate: EditStudentDelegate?
    var student : Student?
    var field1 : String?
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textMajor: UITextField!
    @IBOutlet weak var textAge: UITextField!
    @IBOutlet weak var textMail: UITextField!
    @IBOutlet weak var textPhone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //textName.text = "Hicham Asbika"
        textName.text = (student!.lastName)+" "+(student!.name)
        myImage.image = UIImage(named:"\(student!.image)")
        textMajor.text = student!.major
        textAge.text = "\(student!.age) YO"
        textMail.text = student?.mail
        textPhone.text = student!.phone
        field1 = student!.phone
    }
    
    @IBAction func ONCLICKED(_ sender: Any) {
        if let editedName = textName.text,
                   let editedMajor = textMajor.text,
                   let editedAgeText = textAge.text,
                   let editedMail = textMail.text,
                   let editedPhone = textPhone.text,
                   let editedAge = Int16(editedAgeText) {
                    
                    let editedStudent = Student(image: student!.image,
                                                name: editedName,
                                                lastName: editedName,
                                                age: editedAge,
                                                field: student!.field,
                                                major: editedMajor,
                                                mail: editedMail,
                                                phone: editedPhone)
                    
                  //  editStudentDelegate?.didEditStudent(student: editedStudent)
           
        }
    }
    

}
