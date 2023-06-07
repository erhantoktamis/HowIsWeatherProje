//
//  HumidityTableViewCell.swift
//  HowIsWeather
//
//  Created by Erhan Toktamış on 1.06.2023.
//

import UIKit

class HumidityTableViewCell: UITableViewCell {

    @IBOutlet weak var humidityValueLabel: UILabel!
    
    @IBOutlet weak var feelsLikeValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTitles(humidity: String, feelsLike: String) {
        humidityValueLabel.text = "\(humidity)%"
        feelsLikeValueLabel.text = "\(feelsLike)°C"
    }
    
}
