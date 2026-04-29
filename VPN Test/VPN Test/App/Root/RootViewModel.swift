//
//  RootViewModel.swift
//  VPN Test
//
//  Created by Селюк Иван on 29.04.2026.
//

import Foundation
import Combine

enum SheetScreenModal: Identifiable {
    case settings
    case help
    
    var id: Int { hashValue }
}

@MainActor
final class RootViewModel: ObservableObject {

    @Published private(set) var state: ConnectionState = .disconnected
    @Published var selectedServer: VPNService = .germany
    @Published var sheetScreenModal: SheetScreenModal?

    private var connectionTask: Task<Void, Never>?

    var mainButtonTitle: String {
        switch state {
        case .disconnected: Strings.Main.connect
        case .connecting: Strings.Main.connecting
        case .connected: Strings.Main.connected
        }
    }

    var isMainButtonDisabled: Bool {
        state == .connecting
    }

    func mainButtonTapped() {
        switch state {
        case .disconnected:
            connect()
        case .connected:
            disconnect()
        case .connecting:
            break
        }
    }

    func connect() {
        connectionTask?.cancel()
        state = .connecting

        connectionTask = Task { [weak self] in
            try? await Task.sleep(for: .seconds(2))
            guard !Task.isCancelled else { return }
            await MainActor.run {
                self?.state = .connected
            }
        }
    }

    func disconnect() {
        connectionTask?.cancel()
        state = .disconnected
    }
    
    func showSettingsView() {
        sheetScreenModal = .settings
    }
    
    func showHelpView() {
        sheetScreenModal = .help
    }
}
