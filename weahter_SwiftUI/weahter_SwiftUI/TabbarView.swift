//
//  TabbarView.swift
//  weahter_SwiftUI
//
//  Created by 서준영 on 9/30/24.
//

import SwiftUI

struct TabbarView: View {
    
    @State var selectedTab: Tab = .main
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .main:
                ContentView()
            case .map:
                MapView()
            case .menu:
                MenuView()
            }
            
            // 하단 탭바 구현
            VStack {
                Spacer()
                Divider()
                    .background(Color.white)
                    .padding(.bottom, 8)
                HStack {
                    Button(action: {
                        print("\n맵 버튼이 눌림")
                        selectedTab = (selectedTab == .map) ? .main : .map
                    }) {
                        Image("mapImg")
                            .resizable()
                            .frame(width: 29, height: 27)
                            .aspectRatio(contentMode: .fit)
                            .padding(.leading, 20)
                    }
                    Spacer()
                    Image("arrow")
                        .resizable()
                        .frame(width: 14, height: 13)
                        .aspectRatio(contentMode: .fit)
                    Image("dot")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 9, height: 9)
                        // 틴트컬러로 회색으로 변경
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.gray)
                    Spacer()
                    Button(action: {
                        print("\n메뉴 버튼 눌림")
                        selectedTab = (selectedTab == .menu) ? .main : .menu
                    }) {
                        Image("menu")
                            .resizable()
                            .frame(width: 28, height: 27)
                            .aspectRatio(contentMode: .fit)
                            .padding(.trailing, 21)
                    }
                }
            }
            .frame(maxHeight: .infinity)
            
        }
    }
}

#Preview {
    TabbarView()
}
