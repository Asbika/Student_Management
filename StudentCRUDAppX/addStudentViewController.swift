//
//  addStudentViewController.swift
//  StudentCRUDAppX
//
//  Created by Asbika Hicham on 5/12/23.
//

import UIKit
// Define a protocol for the delegate
protocol AddStudentDelegate: AnyObject {
    func didAddStudent(_ student: Student)
}
class addStudentViewController: UIViewController {
    
    //DECLARE WEAK DELEGATE PROPERTY
    weak var delegate: AddStudentDelegate?

    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    @IBOutlet weak var textAge: UITextField!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textMajor: UITextField!
    @IBOutlet weak var textMail: UITextField!
    @IBOutlet weak var textPhoneNumeber: UITextField!
    
    
    @IBAction func onClickAdd(_ sender: Any) {
        
                if let nom = textName.text, let prenom = textLastName.text, let age = textAge.text,let field=textField.text, let major = textMajor.text, let mail = textMail.text, let phone = textPhoneNumeber.text{
                    
                    let student : Student = Student(image: "1.png", name: nom, lastName: prenom, age: Int16(age)!, field: field, major: major, mail: mail, phone: phone);
                    
                    //Notify the delegate that a student has been added
                    delegate?.didAddStudent(student)
                    
                }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
