//
//  WeatherWidget.swift
//  WeatherWidget
//
//  Created by 서준영 on 11/25/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }

//    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct WeatherWidgetEntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: Provider.Entry
    
    @State private var location: String = "Seongnam-si"
    @State private var temperature: Int = 21
    @State private var weather: String = "Partly Cloudy"
    @State private var highest: Int = 29
    @State private var lowest: Int = 15
    @State private var isLoading: Bool = true
    
    let timeForecasts = [
        TimeForecast(time: "Now", icon: "cloudyIcon", temp: 21),
        TimeForecast(time: "10PM", icon: "drizzlingIcon", temp: 21),
        TimeForecast(time: "11PM", icon: "rainIcon", temp: 19),
        TimeForecast(time: "12PM", icon: "thunderIcon", temp: 19),
        TimeForecast(time: "1AM", icon: "sunnyRainIcon", temp: 19),
        TimeForecast(time: "2AM", icon: "sunnyRainIcon", temp: 20)
    ]
    
    let forecasts = [
        Forecast(day: "Tue", icon: "ic_sunny", precipitation: nil, lowTemp: 15, highTemp: 29, gradientColors: [Color(hex: "#96D0A8"), Color(hex: "#B5CF79"), Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 84, leadPadding: 16),
        Forecast(day: "Wed", icon: "ic_sunny", precipitation: nil, lowTemp: 18, highTemp: 27, gradientColors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 42, leadPadding: 44),
        Forecast(day: "Thu", icon: "ic_sunny", precipitation: nil, lowTemp: 17, highTemp: 26, gradientColors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 22, leadPadding: 29),
        Forecast(day: "Fri", icon: "ic_sunny", precipitation: nil, lowTemp: 7, highTemp: 9, gradientColors: [Color(hex: "#B5CF79"), Color(hex: "#EF8835")], gradientWidth: 65, leadPadding: 29),
        Forecast(day: "Sat", icon: "ic_sunny", precipitation: nil, lowTemp: 7, highTemp: 9, gradientColors: [Color(hex: "#96D0A8"), Color(hex: "#B5CF79")], gradientWidth: 30, leadPadding: 0)
    ]
    
    @ViewBuilder
    var body: some View {
        switch self.family {
        case .systemSmall:
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        Text(location)
                            .foregroundStyle(.white)
                            .font(.system(size: 15))
                            .frame(height: 12)
                        
                        Image("arrow")
                            .resizable()
                            .frame(width: 9, height: 9)
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 4)
                    }
                    
                    Text("\(temperature)°")
                        .foregroundStyle(.white)
                        .font(.system(size: 45))
                        .frame(height: 34)
                        .padding(.top, 9)
                    
                    Image("ic_sunny")
                        .resizable()
                        .frame(width: 19, height: 19)
                        .padding(.top, 19)
                    
                    Text(weather)
                        .foregroundStyle(.white)
                        .font(.system(size: 13))
                        .frame(height: 10)
                        .padding(.top, 5)
                    
                    Text("H: \(highest) L: \(lowest)")
                        .foregroundStyle(.white)
                        .font(.system(size: 13))
                        .frame(height: 10)
                        .padding(.top, 8)
                    
                    Spacer()
                }
                Spacer()
            }
            
        case .systemMedium:
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 0) {
                            Text(location)
                                .foregroundStyle(.white)
                                .font(.system(size: 15))
                                .frame(height: 12)
                            
                            Image("arrow")
                                .resizable()
                                .frame(width: 9, height: 9)
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, 4)
                        }
                        
                        Text("\(temperature)°")
                            .foregroundStyle(.white)
                            .font(.system(size: 45))
                            .frame(height: 34)
                            .padding(.top, 9)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 0) {
                        Image("ic_sunny")
                            .resizable()
                            .frame(width: 19, height: 19)
                            .padding(.top, 3)
                        
                        Text(weather)
                            .foregroundStyle(.white)
                            .font(.system(size: 13))
                            .frame(height: 10)
                            .padding(.top, 5)
                        
                        Text("H: \(highest) L: \(lowest)")
                            .foregroundStyle(.white)
                            .font(.system(size: 13))
                            .frame(height: 10)
                            .padding(.top, 8)
                        
                        Spacer()
                    }
                }
                
                HStack(spacing: 0) {
                    ForEach(timeForecasts) { timeForecast in
                        TimeForecastWView(timeForecast: timeForecast)
                    }
                }
                .padding(.top, 16)
            }
            
        case .systemLarge:
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 0) {
                            Text(location)
                                .foregroundStyle(.white)
                                .font(.system(size: 15))
                                .frame(height: 12)
                            
                            Image("arrow")
                                .resizable()
                                .frame(width: 9, height: 9)
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, 4)
                        }
                        
                        Text("\(temperature)°")
                            .foregroundStyle(.white)
                            .font(.system(size: 45))
                            .frame(height: 34)
                            .padding(.top, 9)
                        
                    }
                    .padding(.top, 16)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 0) {
                        Image("ic_sunny")
                            .resizable()
                            .frame(width: 19, height: 19)
                            .padding(.top, 3)
                        
                        Text(weather)
                            .foregroundStyle(.white)
                            .font(.system(size: 13))
                            .frame(height: 10)
                            .padding(.top, 5)
                        
                        Text("H: \(highest) L: \(lowest)")
                            .foregroundStyle(.white)
                            .font(.system(size: 13))
                            .frame(height: 10)
                            .padding(.top, 8)
                        
                    }
                }
                
                Divider()
                    .background(.white)
                    .padding(.top, 24)
                    .padding(.bottom, 16)
                
                HStack(spacing: 0) {
                    ForEach(timeForecasts) { timeForecast in
                        TimeForecastWView(timeForecast: timeForecast)
                    }
                }
                
                Divider()
                    .background(.white)
                    .padding(.top, 16)
                    .padding(.bottom, 5)
                
                ForEach(forecasts.indices, id: \.self) { index in
                    ForecastWView(forecast: forecasts[index])
                }
                
                Spacer()
            }
            
        case .systemExtraLarge: // ExtraLarge는 iPad에만
            Text(".systemExtraLarge")
            
        default:
            Text("Default˚∆˚")
        }

    }
}

struct WeatherWidget: Widget {
    let kind: String = "WeatherWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WeatherWidgetEntryView(entry: entry)
                .containerBackground(
                    Gradient(colors: [Color(hex: "#074A8E"), Color(hex: "#5596D8")]),
                    for: .widget
                )
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemMedium) {
    WeatherWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
}
