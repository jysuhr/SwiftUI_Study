//
//  MenuView.swift
//  weahter_SwiftUI
//
//  Created by 서준영 on 9/30/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            // 그라데이션 배경
            LinearGradient(
                gradient: Gradient(colors: [Color.red, Color.yellow, Color.blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            Text("이곳은 MenuView 입니다.")
                .font(.system(size: 30))
                .padding(.horizontal, 10)
                .background(Color.blue)
        }
    }
}


#Preview {
    MenuView()
}
