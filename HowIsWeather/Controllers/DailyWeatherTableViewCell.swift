//
//  DailyWeatherTableViewCell.swift
//  HowIsWeather
//
//  Created by Erhan Toktamış on 31.05.2023.
//

import UIKit

class DailyWeatherTableViewCell: UITableViewCell {
  
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configureCellFontColors(color: UIColor) {
        self.degreeLabel.textColor = color
        self.dayLabel.textColor = color
    }
    
    
    func setWeatherTitles(dailyModel: DatumDailyForecast!, index: Int) {
        if dailyModel != nil {
            if dailyModel.datetime != nil {
                let date = dailyModel.datetime!.split(separator: "-")
                let month = date[1]
                let day = date.last!
                
                dayLabel.text = "\(day)/\(month)"
                degreeLabel.text = "\(dailyModel.min_temp!)/\(dailyModel.max_temp!)°C"
            }
        }
    }
}
