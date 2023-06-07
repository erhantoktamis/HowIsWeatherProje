//
//  Config.swift
//  HowIsWeather
//
//  Created by Erhan Toktamış on 31.05.2023.
//

import Foundation

struct Config {
    static let sharedConfigManager = Config()
    // MARK: - Api Keys
    fileprivate let privateApiKey = "&key=aacdfc04d9dc4a26889d34d02a945eb3"
    
    // MARK: - API Attiributes
    fileprivate let mainUrl = "https://api.weatherbit.io/v2.0/forecast/"
    fileprivate let lat = "lat="
    fileprivate let long = "&lon="
    fileprivate let daily = "daily?"
    fileprivate let hourly = "hourly?"
    fileprivate let lang = "&lang=tr"
    fileprivate let hours = "&hours=28"
    fileprivate let days = "&days=12"
    fileprivate let dayCount = "&days="
    
    func getUrlForDaily(currentLat: String, currentLong: String)-> String {
        let url = mainUrl + daily + lat + currentLat + long + currentLong + days + lang + privateApiKey
        return url
    }
    func getUrlForDaily(currentLat: String, currentLong: String, dayCount: String)-> String {
        let url = mainUrl + daily + lat + currentLat + long + currentLong + dayCount + dayCount + lang + privateApiKey
        return url
    }
    
    func getUrlForHourly(currentLat: String, currentLong: String)-> String {
        let url = mainUrl + hourly + lat + currentLat + long + currentLong + lang + privateApiKey + hours
        return url
    }
}
