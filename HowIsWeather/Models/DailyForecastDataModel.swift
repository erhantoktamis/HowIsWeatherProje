//
//  DailyForecastDataModel.swift
//  HowIsWeather
//
//  Created by Erhan Toktamış on 5.06.2023.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dailyForecastDataModel = try? JSONDecoder().decode(DailyForecastDataModel.self, from: jsonData)
// MARK: - DailyForecastDataModel
struct DailyForecastDataModel: Decodable {
    let city_name, country_code: String?
    let data: [DatumDailyForecast]?
    let lat, lon: Double?
    let stateCode, timezone: String?
}

// MARK: - Datum
struct DatumDailyForecast: Decodable {
    let appMaxTemp, appMinTemp: Double?
    let clouds, cloudsHi, cloudsLow, cloudsMid: Int?
    let datetime: String?
    let dewpt, high_temp, low_temp: Double?
    let max_temp, min_temp, moonPhase, moonPhaseLunation: Double?
    let moonriseTs, moonsetTs: Int?
    let ozone: Double?
    let pop: Int?
    let precip, pres: Double?
    let rh: Int?
    let slp: Double?
    let snow, snowDepth, sunriseTs, sunsetTs: Int?
    let temp: Double?
    let ts: Int?
    let uv: Double?
    let validDate: String?
    let vis: Double?
    let weather: WeatherDailyForecast?
    let windCdir, windCdirFull: String?
    let windDir: Int?
    let windGustSpd, windSpd: Double?
}

// MARK: - Weather
struct WeatherDailyForecast: Decodable{
    let icon, description: String?
    let code: Int?
}
