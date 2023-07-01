//
//  StudentStruct.swift
//  StudentCRUDAppX
//
//  Created by Asbika Hicham on 4/15/23.
//

import Foundation

struct Student{
    var image: String
    var name : String
    var lastName : String
    var age : Int16
    var field : String
    var major : String
    var mail : String
    var phone : String
    init(image: String, name : String,lastName : String,age : Int16,field : String,major : String,mail : String,phone : String) {
        self.image = image
        self.name = name
        self.lastName = lastName
        self.age = age
        self.field = field
        self.major = major
        self.mail = mail
        self.phone = phone
    }
}
