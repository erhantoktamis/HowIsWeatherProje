//
//  HourlyForecastDataModel.swift
//  HowIsWeather
//
//  Created by Erhan Toktamış on 5.06.2023.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let hourlyForecastDataModel = try? JSONDecoder().decode(HourlyForecastDataModel.self, from: jsonData)
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let hourlyForecastDataModel = try? JSONDecoder().decode(HourlyForecastDataModel.self, from: jsonData)

// MARK: - HourlyForecastDataModel
struct HourlyForecastDataModel: Codable {
    let city_name, stateCode, country_code: String?
    let lat, lon: Double?
    let timezone: String?
    let data: [DatumHourlyForecast]?
}

// MARK: - Datum
struct DatumHourlyForecast: Codable {
    let app_temp: Double!
    let timestampLocal, timestampUTC, datetime: String?
    let snow, ts: Double?
    let snowDepth: Int?
    let precip, temp: Double?
    let rh: Int?
    let weather: WeatherHourlyForecast?
    let uv: Double?
}

// MARK: - Weather
struct WeatherHourlyForecast: Codable {
    let icon, description: String?
    let code: Int?
}
