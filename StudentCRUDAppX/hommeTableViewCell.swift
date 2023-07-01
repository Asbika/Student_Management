//
//  hommeTableViewCell.swift
//  StudentCRUDAppX
//
//  Created by Asbika Hicham on 4/15/23.
//

import UIKit

class hommeTableViewCell: UITableViewCell {
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblField: UILabel!
    @IBOutlet weak var studentImage: UIImageView!
    
    func setupCell(photo : UIImage, fistName : String, lastName : String,age : Int16, field : String){
        studentImage.image = photo
        lblFullName.text = fistName+" "+lastName
        lblAge.text = "\(age) YO"
        lblField.text = field
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
