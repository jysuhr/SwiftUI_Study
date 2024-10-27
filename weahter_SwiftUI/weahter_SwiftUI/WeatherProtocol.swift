//
//  WeatherView.swift
//  weahter_SwiftUI
//
//  Created by 서준영 on 10/27/24.
//

import Foundation

struct WeatherResponse: Codable {
    let coord: Coordinates
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let sys: System
    let name: String
}

struct Coordinates: Codable {
    let lon: Double
    let lat: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let temp_max: Double
    let temp_min: Double
    let pressure: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case temp_max
        case temp_min
        case pressure
        case humidity
    }
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
}

struct System: Codable {
    let country: String
}
