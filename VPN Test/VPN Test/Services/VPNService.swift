//
//  VPNService.swift
//  VPN Test
//
//  Created by Селюк Иван on 29.04.2026.
//

import Foundation

enum VPNService: String, CaseIterable, Identifiable {
    case germany = "Germany"
    case usa = "USA"
    case japan = "Japan"
    case netherlands = "Netherlands"

    var id: String {
        rawValue
    }

    var flag: String {
        switch self {
        case .germany:
            return "🇩🇪"
        case .usa:
            return "🇺🇸"
        case .japan:
            return "🇯🇵"
        case .netherlands:
            return "🇳🇱"
        }
    }

    var displayName: String {
        "\(flag) \(rawValue)"
    }
}
