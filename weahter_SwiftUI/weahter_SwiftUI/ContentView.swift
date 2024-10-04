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
    
    let forecasts = [
        Forecast(day: "Today", icon: "sunny2", precipitation: nil, lowTemp: 15, highTemp: 29, gradientColors: [Color(hex: "#96D0A8"), Color(hex: "#B5CF79"), Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 84),
        Forecast(day: "Mon", icon: "drizzlingIcon", precipitation: "60%", lowTemp: 18, highTemp: 27, gradientColors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 42),
        Forecast(day: "Tue", icon: "drizzlingIcon", precipitation: "60%", lowTemp: 20, highTemp: 25, gradientColors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 22),
        Forecast(day: "Wed", icon: "drizzlingIcon", precipitation: "70%", lowTemp: 17, highTemp: 25, gradientColors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 22),
        Forecast(day: "Thu", icon: "drizzlingIcon", precipitation: "50%", lowTemp: 17, highTemp: 25, gradientColors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 22),
        Forecast(day: "Fri", icon: "drizzlingIcon", precipitation: "70%", lowTemp: 17, highTemp: 25, gradientColors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")], gradientWidth: 22),
        Forecast(day: "Sat", icon: "sunny2", precipitation: nil, lowTemp: 7, highTemp: 9, gradientColors: [Color.blue, Color.purple], gradientWidth: 80)
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
                                VStack {
                                    Text("Now")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 17))
                                    Image("cloudyIcon")
                                        .padding(.vertical, 18)
                                    Text("21°")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 22))
                                }
                                .padding(.horizontal, 15)
                                
                                VStack {
                                    Text("10PM")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 17))
                                    Image("drizzlingIcon")
                                        .padding(.vertical, 18)
                                    Text("21°")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 22))
                                }
                                .padding(.horizontal, 15)
                                
                                VStack {
                                    Text("11PM")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 17))
                                    Image("rainIcon")
                                        .padding(.vertical, 18)
                                    Text("19°")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 22))
                                }
                                .padding(.horizontal, 15)
                                
                                VStack {
                                    Text("12PM")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 17))
                                    Image("thunderIcon")
                                        .padding(.vertical, 18)
                                    Text("19°")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 22))
                                }
                                .padding(.horizontal, 15)
                                
                                VStack {
                                    Text("1AM")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 17))
                                    Image("sunnyRainIcon")
                                        .padding(.vertical, 18)
                                    Text("19°")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 22))
                                }
                                .padding(.horizontal, 15)
                            }
                        }
                        .frame(width: 335)
                        .scrollIndicators(.hidden)
                    }
                }
                
                ZStack(alignment: .top) {
                    Rectangle()
                        .fill(Color.black.opacity(0.25))
                        .frame(width: 335, height: 550)
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
                        
                        ForEach(forecasts) { forecast in
                            ForecastRowView(forecast: forecast)
                         }
                        
                        /*
                        HStack {
                            Text("Today")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22))
                                .padding(.leading, 16)
                            Spacer()
                            Image("sunny2")
                                .padding(.trailing, 5)
                            Text("15°")
                                .foregroundStyle(Color.gray)
                                .font(.system(size: 22))
                            ZStack {
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: 100, height: 4)
                                    .cornerRadius(2)
                                HStack {
                                    Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: "#96D0A8"), Color(hex: "#B5CF79"), Color(hex: "#F8D74A"), Color(hex: "#EF8835")]), startPoint: .leading, endPoint: .trailing))
                                        .frame(width: 84, height: 4)
                                        .cornerRadius(2)
                                        .padding(.leading, 16)
                                }
                            }
                            .frame(width: 100, height: 4)
                            .padding(.leading, 6)
                            .padding(.trailing, 5)
                            Text("29°")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22))
                                .padding(.trailing, 17)
                        }
                        .frame(width: 335, height: 55, alignment: .trailing)

                        Divider()
                            .background(Color.white)
                            .padding(.bottom, 0)
                            .frame(width: 305)
                        
                        HStack {
                            Text("Mon")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22))
                                .padding(.leading, 16)
                            Spacer()
                            VStack {
                                Image("drizzlingIcon")
                                    .padding(.trailing, 5)
                                Text("60%")
                                    .foregroundStyle(Color(hex: "#81CFFA"))
                            }
                            Text("18°")
                                .foregroundStyle(Color.gray)
                                .font(.system(size: 22))
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: 100, height: 4)
                                    .cornerRadius(2)
                                HStack {
                                    Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")]), startPoint: .leading, endPoint: .trailing))
                                        .frame(width: 42, height: 4)
                                        .cornerRadius(2)
                                        .padding(.leading, 44)
                                    Spacer()
                                }
                            }
                            .frame(width: 100, height: 4)
                            .padding(.leading, 6)
                            .padding(.trailing, 5)
                            Text("27°")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22))
                                .padding(.trailing, 17)
                        }
                        .frame(width: 335, height: 55, alignment: .trailing)

                        Divider()
                            .background(Color.white)
                            .padding(.bottom, 0)
                            .frame(width: 305)
                        
                        HStack {
                            Text("Tue")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22))
                                .padding(.leading, 16)
                            Spacer()
                            VStack {
                                Image("drizzlingIcon")
                                    .padding(.trailing, 5)
                                Text("60%")
                                    .foregroundStyle(Color(hex: "#81CFFA"))
                            }
                            Text("20°")
                                .foregroundStyle(Color.gray)
                                .font(.system(size: 22))
                            ZStack {
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: 100, height: 4)
                                    .cornerRadius(2)
                                HStack {
                                    Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")]), startPoint: .leading, endPoint: .trailing))
                                        .frame(width: 22, height: 4)
                                        .cornerRadius(2)
                                        .padding(.leading, 41)
                                    Spacer()
                                }
                            }
                            .frame(width: 100, height: 4)
                            .padding(.leading, 6)
                            .padding(.trailing, 5)
                            Text("25°")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22))
                                .padding(.trailing, 17)
                        }
                        .frame(width: 335, height: 55, alignment: .trailing)

                        Divider()
                            .background(Color.white)
                            .padding(.bottom, 0)
                            .frame(width: 305)
                        
                        HStack {
                            Text("Wed")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22))
                                .padding(.leading, 16)
                            Spacer()
                            VStack {
                                Image("drizzlingIcon")
                                    .padding(.trailing, 5)
                                Text("70%")
                                    .foregroundStyle(Color(hex: "#81CFFA"))
                            }
                            Text("17°")
                                .foregroundStyle(Color.gray)
                                .font(.system(size: 22))
                            ZStack {
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: 100, height: 4)
                                    .cornerRadius(2)
                                HStack {
                                    Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")]), startPoint: .leading, endPoint: .trailing))
                                        .frame(width: 22, height: 4)
                                        .cornerRadius(2)
                                        .padding(.leading, 41)
                                    Spacer()
                                }
                            }
                            .frame(width: 100, height: 4)
                            .padding(.leading, 6)
                            .padding(.trailing, 5)
                            Text("25°")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22))
                                .padding(.trailing, 17)
                        }
                        .frame(width: 335, height: 55, alignment: .trailing)
                        
                        Divider()
                            .background(Color.white)
                            .padding(.bottom, 0)
                            .frame(width: 305)
                        
                        HStack {
                            Text("Thu")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22))
                                .padding(.leading, 16)
                            Spacer()
                            VStack {
                                Image("drizzlingIcon")
                                    .padding(.trailing, 5)
                                Text("50%")
                                    .foregroundStyle(Color(hex: "#81CFFA"))
                            }
                            Text("17°")
                                .foregroundStyle(Color.gray)
                                .font(.system(size: 22))
                            ZStack {
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: 100, height: 4)
                                    .cornerRadius(2)
                                HStack {
                                    Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")]), startPoint: .leading, endPoint: .trailing))
                                        .frame(width: 22, height: 4)
                                        .cornerRadius(2)
                                        .padding(.leading, 41)
                                    Spacer()
                                }
                            }
                            .frame(width: 100, height: 4)
                            .padding(.leading, 6)
                            .padding(.trailing, 5)
                            Text("25°")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22))
                                .padding(.trailing, 17)
                        }
                        .frame(width: 335, height: 55, alignment: .trailing)

                        Divider()
                            .background(Color.white)
                            .padding(.bottom, 0)
                            .frame(width: 305)
                        
                        HStack {
                            Text("Fri")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22))
                                .padding(.leading, 16)
                            Spacer()
                            VStack {
                                Image("drizzlingIcon")
                                    .padding(.trailing, 5)
                                Text("70%")
                                    .foregroundStyle(Color(hex: "#81CFFA"))
                            }
                            Text("17°")
                                .foregroundStyle(Color.gray)
                                .font(.system(size: 22))
                            ZStack {
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: 100, height: 4)
                                    .cornerRadius(2)
                                HStack {
                                    Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: "#F8D74A"), Color(hex: "#EF8835")]), startPoint: .leading, endPoint: .trailing))
                                        .frame(width: 22, height: 4)
                                        .cornerRadius(2)
                                        .padding(.leading, 41)
                                    Spacer()
                                }
                            }
                            .frame(width: 100, height: 4)
                            .padding(.leading, 6)
                            .padding(.trailing, 5)
                            Text("25°")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22))
                                .padding(.trailing, 17)
                            
                        }
                        .frame(width: 335, height: 55, alignment: .trailing)

                        Divider()
                            .background(Color.white)
                            .padding(.bottom, 0)
                            .frame(width: 305)
                         */
                        
                        
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
