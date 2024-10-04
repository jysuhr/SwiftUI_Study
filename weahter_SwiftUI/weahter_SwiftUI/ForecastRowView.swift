//
//  ForecastRowView.swift
//  weahter_SwiftUI
//
//  Created by 서준영 on 10/4/24.
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
}

struct ForecastRowView: View {
    let forecast: Forecast
    
    var body: some View {
        
        HStack {
            ZStack {
                HStack {
                    Text(forecast.day)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 22))
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
                        .padding(.leading, 87)
                    } else {
                        Image(forecast.icon)
                            .padding(.leading, 87)
                    }
                    Spacer()
                }
                
                HStack {
                    Text("\(forecast.lowTemp)°")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 22))
                        .padding(.leading, 130)
                    Spacer()
                }
                
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 100, height: 4)
                            .cornerRadius(2)
                        
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: forecast.gradientColors), startPoint: .leading, endPoint: .trailing))
                            .frame(width: forecast.gradientWidth, height: 4)
                            .cornerRadius(2)
                        // 개별 설정 필요
                            .padding(.leading, 16)
                    }
                    .frame(width: 100, height: 4)
                    .padding(.leading, 173)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("\(forecast.highTemp)°")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 22))
                        .padding(.trailing, 17)
                }
            }
        }
        .frame(width: 335, height: 55)
        
        Divider()
            .background(Color.white)
            .padding(.bottom, 0)
            .frame(width: 305)
    }
}

#Preview {
    TabbarView()
}
