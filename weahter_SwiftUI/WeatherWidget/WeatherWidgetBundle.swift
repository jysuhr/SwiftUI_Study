//
//  WeatherWidgetBundle.swift
//  WeatherWidget
//
//  Created by 서준영 on 11/25/24.
//

import WidgetKit
import SwiftUI

@main
struct WeatherWidgetBundle: WidgetBundle {
    var body: some Widget {
        WeatherWidget()
        WeatherWidgetControl()
        WeatherWidgetLiveActivity()
    }
}
