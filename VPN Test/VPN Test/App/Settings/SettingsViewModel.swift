//
//  SettingsViewModel.swift
//  VPN Test
//
//  Created by Селюк Иван on 29.04.2026.
//

import Foundation
import Combine

final class SettingsViewModel: ObservableObject {
    
    func makeFeedbackEmailURL() -> URL? {
        var components = URLComponents()
        components.scheme = "mailto"
        components.path = Constants.mail
        components.queryItems = [
            URLQueryItem(name: "subject", value: Strings.Settings.subject),
            URLQueryItem(name: "body", value: Strings.Settings.body)
        ]
        
        return components.url
    }
}

