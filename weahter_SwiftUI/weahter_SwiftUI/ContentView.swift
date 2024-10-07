//
//  ContentView.swift
//  weahter_SwiftUI
//
//  Created by 서준영 on 9/22/24.
//

import SwiftUI

enum Tab {
    case main
    case map
    case menu
}

struct ContentView: View {
    
    @State private var location: String = "Seongnam-si"
    @State private var temperature: Int = 21
    @State private var weather: String = "Partly Cloudy"
    @State private var highest: Int = 29
    @State private var lowest: Int = 15
    
    let timeForecasts = [
        TimeForecast(time: "Now", icon: "cloudyIcon", temp: 21),
        TimeForecast(time: "10PM", icon: "drizzlingIcon", temp: 21),
        TimeForecast(time: "11PM", icon: "rainIcon", temp: 19),
        TimeForecast(time: "12PM", icon: "thunderIcon", temp: 19),
        TimeForecast(time: "1AM", icon: "sunnyRainIcon", temp: 19),
        TimeForecast(time: "2AM", icon: "sunnyRainIcon", temp: 20)
    ]
    
    let forecasts = [
        Forecast(day: "Today", icon: "sunny2", precipitation: nil, lowTemp: 15, highTemp: 29, gradientColors: [Color(hex: "#96D0A8"), Color(hex: "#B5CF79"), Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 84, leadPadding: 16),
        Forecast(day: "Mon", icon: "drizzlingIcon", precipitation: "60%", lowTemp: 18, highTemp: 27, gradientColors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 42, leadPadding: 44),
        Forecast(day: "Tue", icon: "drizzlingIcon", precipitation: "60%", lowTemp: 20, highTemp: 25, gradientColors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 22, leadPadding: 31),
        Forecast(day: "Wed", icon: "drizzlingIcon", precipitation: "70%", lowTemp: 17, highTemp: 25, gradientColors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 22, leadPadding: 41),
        Forecast(day: "Thu", icon: "drizzlingIcon", precipitation: "50%", lowTemp: 17, highTemp: 25, gradientColors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 22, leadPadding: 46),
        Forecast(day: "Fri", icon: "drizzlingIcon", precipitation: "70%", lowTemp: 17, highTemp: 26, gradientColors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 22, leadPadding: 29),
        Forecast(day: "Sat", icon: "sunny2", precipitation: nil, lowTemp: 7, highTemp: 9, gradientColors: [Color(hex: "#B5CF79"), Color(hex: "#EF8835")], gradientWidth: 65, leadPadding: 29),
        Forecast(day: "Sun", icon: "sunny2", precipitation: nil, lowTemp: 7, highTemp: 9, gradientColors: [Color(hex: "#96D0A8"), Color(hex: "#B5CF79")], gradientWidth: 30, leadPadding: 0),
        Forecast(day: "Mon", icon: "sunny2", precipitation: nil, lowTemp: 7, highTemp: 9, gradientColors: [Color(hex: "#B5CF79"), Color(hex: "#EF8835")], gradientWidth: 23, leadPadding: 29)
    ]
    
    var body: some View{
        ZStack {
            Image("BgIMG")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                Text(location)
                    .font(.system(size: 37))
                    .foregroundStyle(.white)
                    .padding(.top, 34)
                
                HStack {
                    Text("\(temperature)")
                        .font(.system(size: 102))
                        .fontWeight(.thin)
                        .foregroundStyle(.white)
                    Text("°")
                        .font(.system(size: 102))
                        .fontWeight(.thin)
                        .foregroundStyle(.white)
                        .offset(x: -8, y: -3)
                }
                .offset(x: 20, y: 0)
            
                Text(weather)
                    .font(.system(size: 24))
                    .foregroundStyle(.white)
                
                Text("H:\(highest)°  L:\(lowest)°")
                    .font(.system(size: 21))
                    .foregroundStyle(.white)
                
                ZStack(alignment: .top) {
                    Rectangle ()
                        .fill(Color.black.opacity(0.25))
                        .frame(width: 335, height: 212)
                        .cornerRadius(15.0)
                        .padding(.top, 44)
                    
                    VStack {
                        Text("Cloudy conditions from 1AM-9AM, with showers expected at 9AM.")
                            .foregroundStyle(.white)
                            .font(.system(size: 18))
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 36)
                            .padding(.trailing, 51)
                            .padding(.top, 44 + 10)
                        
                        Divider()
                            .background(Color.white)
                            .padding(.bottom, 0)
                            .frame(width: 335)
                    
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(timeForecasts) { timeForecast in
                                    TimeForecastRowView(timeForecast: timeForecast)
                                }
                            }
                        }
                        .frame(width: 335)
                        .scrollIndicators(.hidden)
                    }
                }
                
                ZStack(alignment: .top) {
                    Rectangle()
                        .fill(Color.black.opacity(0.25))
                        .frame(width: 335, height: 680)
                        .cornerRadius(15.0)
                        .padding(.top, 8)
                    
                    VStack {
                        HStack {
                            Image("schduleIcon")
                                .padding(.leading, 15)
                            
                            Text("10-DAY FORECAST")
                                .foregroundStyle(.white)
                                .font(.system(size: 15))
                        }
                        .frame(width: 335, alignment: .leading)
                        
                        Divider()
                            .background(Color.white)
                            .padding(.bottom, 0)
                            .frame(width: 335)
                        
                        ForEach(forecasts.indices, id: \.self) { index in
                            ForecastRowView(forecast: forecasts[index], showDivider: index < forecasts.count - 1)
                        }
                    }
                    .padding(.top, 14 + 8)
                }
            }
            .padding(.bottom, 45)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    TabbarView()
}
