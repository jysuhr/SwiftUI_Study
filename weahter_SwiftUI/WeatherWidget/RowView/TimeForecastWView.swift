//
//  TimeForecastWView.swift
//  weahter_SwiftUI
//
//  Created by 서준영 on 12/17/24.
//

import SwiftUI

struct TimeForecast: Identifiable {
    let id = UUID()
    let time: String
    let icon: String
    let temp: Int
}

struct TimeForecastWView: View {
    let timeForecast: TimeForecast
    
    var body: some View {
        VStack(spacing: 0) {
            Text(timeForecast.time)
                .foregroundStyle(.white)
                .font(.system(size: 11))
                .frame(width: 30, height: 9)
            Image(timeForecast.icon)
                .resizable()
                .frame(width: 24, height: 24)
                .padding(.vertical, 6)
            Text("\(timeForecast.temp)°")
                .foregroundStyle(.white)
                .font(.system(size: 12))
                .frame(height: 10)
        }
        .padding(.horizontal, 10)
    }
}
