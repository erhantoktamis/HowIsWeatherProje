//
//  CitiesTableViewController.swift
//  HowIsWeather
//
//  Created by Erhan Toktamış on 5.06.2023.
//

import UIKit

class CitiesTableViewController: UITableViewController {

    var cities = [DailyForecastDataModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getCities()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Constants.sharedManeger.countryWeatherCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.sharedManeger.countryWeatherCellIdentifier)
        setBackgroundImage(name: "fullhd")
        setNavigationControllerHidden()
    }

    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        cities.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.sharedManeger.countryWeatherCellIdentifier, for: indexPath) as! CountryWeatherTableViewCell
        cell.backgroundColor = .clear
        if cities[indexPath.section].data != nil {
            cell.setLabels(dailyModel: cities[indexPath.section])
        }
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = UIColor.clear
        return v
    }

    func getCities() {
        let lats = ["41.01384","38.73","39.925018","47.55","36.884804","34.052235"]
        let longs = ["28.94966","41.49","32.836956","7.58","30.704044","-118.243683"]
        for i in 0..<lats.count {
            let dailyUrl = Config.sharedConfigManager.getUrlForDaily(currentLat: lats[i], currentLong: longs[i], dayCount: "1")
            NetworkManager.shared.fetchData(endPoint: dailyUrl, type: DailyForecastDataModel?.self) {  [weak self] result in
                switch result {
                case .success(let response):
                    print(response)
                    self?.cities.append(response)
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
}
