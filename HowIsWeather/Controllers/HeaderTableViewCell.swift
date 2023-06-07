//
//  HeaderTableViewCell.swift
//  HowIsWeather
//
//  Created by Erhan Toktamış on 31.05.2023.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var todaysDateLabel: UILabel!
    @IBOutlet weak var mainWeatherDegree: UILabel!
    @IBOutlet weak var todaysMinMaxDegree: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setHeaderTitles(dailyModel: DailyForecastDataModel?) {
        if let daily = dailyModel {
            if let dailyModelData = daily.data {
                if let dailyModelDataFirst = dailyModelData.first {
                    cityLabel.text = daily.city_name
                    todaysDateLabel.text = getCurrentFullDate()
                    mainWeatherDegree.text = "\(dailyModelDataFirst.temp ?? 0)°C"
                    todaysMinMaxDegree.text = "\(dailyModelDataFirst.min_temp ?? 0)/\(dailyModelDataFirst.max_temp ?? 0)°C"
                }
            }
        }
    }
    
    private func getCurrentFullDate()->String {
        let mytime = Date()
        let format = DateFormatter()
        format.timeStyle = .none
        format.timeZone = .none
        format.dateStyle = .full
        
        return (format.string(from: mytime))
    }
}
