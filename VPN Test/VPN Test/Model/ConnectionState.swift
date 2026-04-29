//
//  ConnectionState.swift
//  VPN Test
//
//  Created by Селюк Иван on 29.04.2026.
//

import SwiftUI

enum ConnectionState: String {
    case disconnected = "Disconnected"
    case connecting = "Connecting"
    case connected = "Connected"

    var title: String {
        rawValue
    }

    var systemImage: String {
        switch self {
        case .disconnected:
            return "xmark.circle.fill"
        case .connecting:
            return "wifi"
        case .connected:
            return "checkmark.circle.fill"
        }
    }
    
    var systemColor: Color {
        switch self {
        case .disconnected:
            return .red
        case .connecting:
            return .black
        case .connected:
            return .green
        }
    }

    var description: String {
        switch self {
        case .disconnected:
            return "Your connection is not protected"
        case .connecting:
            return "Establishing secure connection..."
        case .connected:
            return "Your connection is protected!"
        }
    }
}
