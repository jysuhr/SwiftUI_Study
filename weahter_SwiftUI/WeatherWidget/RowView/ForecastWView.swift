//
//  ForecastWView.swift
//  weahter_SwiftUI
//
//  Created by 서준영 on 12/17/24.
//

import SwiftUI

struct Forecast: Identifiable {
    let id = UUID()
    let day : String
    let icon : String
    let precipitation: String?
    let lowTemp : Int
    let highTemp : Int
    let gradientColors : [Color]
    let gradientWidth: CGFloat
    let leadPadding: CGFloat
}

struct ForecastWView: View {
    let forecast: Forecast
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    Text(forecast.day)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 12))
                        .padding(.leading, 16)
                    Spacer()
                }
                
                HStack {
                    if let precipitation = forecast.precipitation {
                        VStack {
                            Image(forecast.icon)
                            Text(precipitation)
                                .foregroundStyle(Color(hex: "#81CFFA"))
                        }
                        .padding(.leading, 56)
                    } else {
                        Image(forecast.icon)
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding(.leading, 56)
                    }
                    Spacer()
                }
                
                HStack {
                    Text("\(forecast.lowTemp)°")
                        .foregroundStyle(Color.white)
                        .opacity(0.5)
                        .font(.system(size: 12))
                        .padding(.leading, 129)
                    Spacer()
                }
                
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.black)
                            .opacity(0.15)
                            .frame(width: 100, height: 4)
                            .cornerRadius(2)
                        
                        HStack {
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: forecast.gradientColors), startPoint: .leading, endPoint: .trailing))
                                .frame(width: forecast.gradientWidth, height: 4)
                                .cornerRadius(2)
                            // 개별 설정 필요
                                .padding(.leading, forecast.leadPadding)
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 4)
                    .padding(.leading, 160)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("\(forecast.highTemp)°")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 12))
                        .padding(.trailing, 17)
                }
            }
            .padding(.vertical, 8)
        }
//        .frame(width: 335, height: 55)
    }
}
