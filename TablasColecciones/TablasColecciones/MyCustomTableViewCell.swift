//
//  MyCustomTableViewCell.swift
//  TablasColecciones
//
//  Created by Cesar Morales Garduño on 4/27/24.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myFirstLabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myFirstLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myFirstLabel.textColor = .blue

        mySecondLabel.numberOfLines = 0

        backgroundColor = .gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print(myFirstLabel.text ?? "")
    }
}
