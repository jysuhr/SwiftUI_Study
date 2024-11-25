//
//  Weather++Bundle.swift
//  weahter_SwiftUI
//
//  Created by 서준영 on 11/4/24.
//

import Foundation

extension Bundle {
    var apiKey: String {
        guard let file = self.path(forResource: "WeatherInfo", ofType: "plist") else { return "" }
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["API_KEY"] as? String else { fatalError("WeatherInfo.plist에 API_KEY설정을 해주세요.")}
        return key
    }
}
