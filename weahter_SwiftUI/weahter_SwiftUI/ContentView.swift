//
//  ContentView.swift
//  weahter_SwiftUI
//
//  Created by 서준영 on 9/22/24.
//

import SwiftUI

var location: String = "Seongnam-si"
var temperature: Int = 21
var weather: String = "Partly Cloudy"
var highest: Int = 29
var lowest: Int = 15

struct ContentView: View {
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

                Text(" \(temperature)°")
                    .font(.system(size: 102))
                    .fontWeight(.thin)
                    .foregroundStyle(.white)
                
                Text(weather)
                    .font(.system(size: 24))
                    .foregroundStyle(.white)
                
                Text("H:\(highest)°  L:\(lowest)°")
                    .font(.system(size: 21))
                    .foregroundStyle(.white)
            }
            
            VStack {
                Spacer() // 남은 공간을 위쪽으로 밀어냅니다.
                Divider()
                    .background(Color.white)
                    .padding(.bottom, 8)
                HStack {
                    Image("mapImg")
                        .resizable()
                        .frame(width: 29, height: 27)
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading, 20)
                        .onTapGesture {
                            // 클릭 시 실행할 동작
                            print("map 이미지가 클릭됨.")
                        }
                    Spacer()
                    Image("arrow")
                        .resizable()
                        .frame(width: 14, height: 13)
                        .aspectRatio(contentMode: .fit)
                    Image("dot")
                        .resizable()
                        .frame(width: 9, height: 9)
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Image("menu")
                        .resizable()
                        .frame(width: 28, height: 27)
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing, 21)
                        .onTapGesture {
                            // 클릭 시 실행할 동작
                            print("menu 이미지가 클릭됨.")
                        }
                }
            }
            .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
