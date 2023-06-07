//
//  EmptyTableViewCell.swift
//  HowIsWeather
//
//  Created by Erhan Toktamış on 5.06.2023.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var loadIndicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
