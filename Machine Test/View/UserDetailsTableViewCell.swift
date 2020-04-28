//
//  UserDetailsTableViewCell.swift
//  Machine Test
//
//  Created by Sourabh Jain on 28/04/20.
//  Copyright © 2020 Sourabh Jain. All rights reserved.
//

import UIKit

class UserDetailsTableViewCell: UITableViewCell {
    let defaultURL = "https://img.icons8.com/ios/50/000000/user-female-circle.png"
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!



    override func awakeFromNib() {
        super.awakeFromNib()
        UrlToImage.shared.circleImageAvatar(image: userImage)
        // Initialization code
    }
    
    func loadData(UserDetails cell: UserDetailsModel) {
        userImage.image = UrlToImage.shared.getImage(from: cell.url ?? defaultURL )
        nameLabel.text = "Name: \(cell.name ?? "")"
        ageLabel.text = "Age: \(cell.age ?? "")"
        locationLabel.text = "Location: \(cell.location ?? "")"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

