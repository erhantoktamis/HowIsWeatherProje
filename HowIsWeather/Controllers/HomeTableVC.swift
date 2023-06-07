//
//  ViewController.swift
//  HowIsWeather
//
//  Created by Erhan Toktamış on 31.05.2023.
//

import UIKit

// MARK: - HomeViewController
class HomeTableVC: UITableViewController {
    
    var dailyModel: DailyForecastDataModel!
    var hourlyModel: HourlyForecastDataModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(name: "fullhd")
        setNavigationControllerHidden()
        loadCells()
        fetchWeather()
    }
       
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && ( dailyModel == nil || hourlyModel == nil) {
          return 120
        }
        else if indexPath.row == 0 {
            return 380
        } else if indexPath.row == 1 {
            return 200
        } else if indexPath.row == 2 {
            return 120
        } else {
            return 80
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dailyModel != nil {
            return dailyModel.data!.count + 3
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.backgroundColor = .clear
        if dailyModel == nil || hourlyModel == nil {
            return cell
        } else if indexPath.row == 0 {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: Constants.sharedManeger.headerWeatherCellIdentifier, for: indexPath) as! HeaderTableViewCell
            headerCell.backgroundColor = .clear
            headerCell.setHeaderTitles(dailyModel: dailyModel)
        } else if indexPath.row == 1 {
            let hourlyCell = tableView.dequeueReusableCell(withIdentifier: Constants.sharedManeger.collectionViewTableViewCellIdentifier, for: indexPath) as! CollectionViewTableViewCell
            hourlyCell.hourlyModel = self.hourlyModel
            hourlyCell.cellCollectionView.backgroundColor = .clear
            hourlyCell.backgroundColor = .clear
            cell = hourlyCell
            
        } else if indexPath.row == 2 {
            let humCell = tableView.dequeueReusableCell(withIdentifier: Constants.sharedManeger.humidityWeatherCellIdentifier, for: indexPath) as! HumidityTableViewCell
            humCell.backgroundColor = UIColor(white: 0.75, alpha: 0.5)
            if let hourlyModel = hourlyModel {
                if hourlyModel.data != nil {
                    humCell.setTitles(humidity: String(hourlyModel.data!.first!.rh!), feelsLike: String(hourlyModel.data!.first!.app_temp!))
                }
            } else {
                humCell.setTitles(humidity: "", feelsLike: "")
            }
        } else {
            let dailyCell = tableView.dequeueReusableCell(withIdentifier: Constants.sharedManeger.dailyWeatherCellIdentifier, for: indexPath) as! DailyWeatherTableViewCell
            if let dailyModelData = dailyModel.data {
                dailyCell.setWeatherTitles(dailyModel: dailyModelData[indexPath.row-3], index: indexPath.row-3)
                cell = dailyCell
            }
            if (indexPath.row%2 == 0) {
                cell.backgroundColor = UIColor(white: 0.75, alpha: 0.5)
            } else {
                cell.configureCellFontColors(color: .white)
                cell.backgroundColor = .clear
            }
        }
        return cell
    }
    
    private func loadCells() {
        tableView.separatorStyle = .none
        tableView.scrollIndicatorInsets = .zero
        tableView.register(UINib(nibName: Constants.sharedManeger.headerWeatherCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.sharedManeger.headerWeatherCellIdentifier)
        tableView.register(UINib(nibName: Constants.sharedManeger.collectionViewTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.sharedManeger.collectionViewTableViewCellIdentifier)
        tableView.register(UINib(nibName: Constants.sharedManeger.humidityWeatherCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.sharedManeger.humidityWeatherCellIdentifier)
        tableView.register(UINib(nibName: Constants.sharedManeger.dailyWeatherCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.sharedManeger.dailyWeatherCellIdentifier)
        tableView.register(UINib(nibName: Constants.sharedManeger.emptyTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.sharedManeger.emptyTableViewCellIdentifier)
    }
    
    private func fetchWeather() {
        let dailyUrl = Config.sharedConfigManager.getUrlForDaily(currentLat: "38.73", currentLong: "35.46")
        NetworkManager.shared.fetchData(endPoint: dailyUrl, type: DailyForecastDataModel?.self) { [weak self] result in
            switch result {
            case .success(let response):
                print(response)
                self?.dailyModel = response
                
                DispatchQueue.main.async { [weak self] in
                    self?.reloadTableView()
                }
                
                break
                
            case .failure(let error):
                    print(error)
                break
            }
        }
        
        let hourlyUrl = Config.sharedConfigManager.getUrlForHourly(currentLat: "38.73", currentLong: "35.46")
        NetworkManager.shared.fetchData(endPoint: hourlyUrl, type: HourlyForecastDataModel?.self) {  [weak self] result in
            switch result {
            case .success(let response):
                print(response)
                self?.hourlyModel = response
                DispatchQueue.main.async { [weak self] in
                    self?.reloadTableView()
                }
                break
                
            case .failure(let error):
                    print(error)
                break
            }
        }
    }
}
