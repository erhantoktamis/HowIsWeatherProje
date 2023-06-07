//
//  CollectionViewTableViewCell.swift
//  HowIsWeather
//
//  Created by Erhan Toktamış on 2.06.2023.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var cellCollectionView: UICollectionView!
    var hourlyModel: HourlyForecastDataModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        cellCollectionView.delegate = self
        cellCollectionView.dataSource = self
        cellCollectionView.register(UINib(nibName: Constants.sharedManeger.hourlyWeatherCellIdentifier, bundle: nil), forCellWithReuseIdentifier: Constants.sharedManeger.hourlyWeatherCellIdentifier)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configureCellFontColors(color: UIColor) {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if hourlyModel == nil {
            return 0
        }
        return hourlyModel.data!.count-3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if hourlyModel != nil {
            let hourCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.sharedManeger.hourlyWeatherCellIdentifier, for: indexPath) as! HourlyCollectionViewCell
            
            if let hourlyModelData = hourlyModel.data {
                if hourlyModelData.count-3 >= indexPath.row {
                    if let timeStamp = hourlyModelData[indexPath.row+3].datetime, let temp = hourlyModelData[indexPath.row+3].temp {
                        hourCell.setHourWeather(time: timeStamp, degree: String(temp)+"°C", airImageCode: hourlyModelData[indexPath.row+3].weather?.icon ?? "bolt.fill")
                    }
                }
                hourCell.configureCellFontColors(color: .white)
            }
            hourCell.backgroundColor = .clear
            cell = hourCell
        }
        cell.backgroundColor = .clear
        return cell
    }

    
    func reloadCollectionView() {
        cellCollectionView.reloadData()
    }
}
