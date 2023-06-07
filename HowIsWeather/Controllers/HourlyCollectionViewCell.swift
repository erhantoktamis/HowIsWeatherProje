//
//  HourlyCollectionViewCell.swift
//  HowIsWeather
//
//  Created by Erhan Toktamış on 2.06.2023.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setHourWeather(time: String, degree: String, airImageCode: String) {
        let hour = time.split(separator: ":")
        hourLabel.text = String(hour[hour.count-1] + ":00")
        degreeLabel.text = degree
        weatherImageView.image = UIImage(named: airImageCode)
    }
    
    override func configureCellFontColors(color: UIColor) {
        hourLabel.textColor = color
        degreeLabel.textColor = color
    }
}
