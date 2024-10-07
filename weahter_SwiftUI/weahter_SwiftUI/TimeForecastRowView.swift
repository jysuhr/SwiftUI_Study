//
//  TimeForecastRowView.swift
//  weahter_SwiftUI
//
//  Created by 서준영 on 10/7/24.
//

import SwiftUI

struct TimeForecast: Identifiable {
    let id = UUID()
    let time: String
    let icon: String
    let temp: Int
}

struct TimeForecastRowView: View {
    let timeForecast: TimeForecast
    
    var body: some View {
        VStack {
            Text(timeForecast.time)
                .foregroundStyle(.white)
                .font(.system(size: 17))
            Image(timeForecast.icon)
                .padding(.vertical, 18)
            Text("\(timeForecast.temp)°")
                .foregroundStyle(.white)
                .font(.system(size: 22))
        }
        .padding(.horizontal, 15)
    }
}
