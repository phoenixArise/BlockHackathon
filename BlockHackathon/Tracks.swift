//
//  Tracks.swift
//  BlockHackathon
//
//  Created by Brian Seo on 2022-11-06.
//

import Foundation

enum WeatherCondition: String {
    case rain = "rain"
    case snow = "snow"
    case clear = "clear"
    case cloudy = "cloudy"
}

enum Surface: Double {
    case wet = 0.3
    case dry = 0.7
}

struct Track {
    let weatherCondition: WeatherCondition
    let numberOfCorners: Int
    let maximumLengthOfStraightRoad: Int64
    let roadSurfaceCondition: Surface
}
