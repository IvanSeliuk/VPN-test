//
//  Strings.swift
//  VPN Test
//
//  Created by Селюк Иван on 29.04.2026.
//

import Foundation

enum Strings {}

extension Strings {
    enum Main {
        static let title: String = "Secure VPN"
        static let connect: String = "Connect"
        static let connecting: String = "Connecting..."
        static let connected: String = "Disconnect"
        static let pickerTitle: String = "Select Server:"
    }
}

extension Strings {
    enum Settings {
        static let title: String = "Settings"
        static let subject: String = "VPN App Feedback"
        static let body: String = """
            Hello,
            I would like to share feedback about the VPN app.
            """
        static let privacy: String = "Privacy Policy"
        static let terms: String = "Terms of Use"
        static let feedback: String = "Feedback"
    }
}
    
extension Strings {
    enum Help {
        static let title: String = "Help"
        static let description: String = "Test task for SPORTDATA"
        static let buttonTitle: String = "Ok"
    }
}
