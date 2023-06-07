//
//  CountryWeatherTableViewCell.swift
//  HowIsWeather
//
//  Created by Erhan Toktamış on 31.05.2023.
//

import UIKit

class CountryWeatherTableViewCell: UITableViewCell {

    
    @IBOutlet weak var weatherMinMaxLabel: UILabel!
    @IBOutlet var cityTitleLabel: UILabel!
    @IBOutlet weak var cityImageView: UIImageView!
    
    @IBOutlet weak var cityWeatherImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
    func setLabels(dailyModel: DailyForecastDataModel) {
        if dailyModel.country_code != nil && dailyModel.city_name != nil {
            if let countryName = Constants.sharedManeger.countries[dailyModel.country_code!],
               let cityName = dailyModel.city_name,
               let dailyModelDataFirstMinTemp = dailyModel.data?.first?.min_temp,
               let dailyModelDataFirstMaxTemp = dailyModel.data?.first?.max_temp,
               let dailyModelDataFirstTempIcon = dailyModel.data?.first?.weather?.icon {
                let cityNCountry = cityName + ", " + countryName
                cityTitleLabel.text = cityNCountry
                weatherMinMaxLabel.text = String(dailyModelDataFirstMinTemp) + "/" + String(dailyModelDataFirstMaxTemp) + "°C"
                cityWeatherImageView.image = UIImage(named: dailyModelDataFirstTempIcon)
            }
        }
        self.backgroundColor = UIColor(white: 0.75, alpha: 0.5)
        cityImageView.image = UIImage(systemName: "building")
    }
    
}
