//
//  RootView.swift
//  VPN Test
//
//  Created by Селюк Иван on 29.04.2026.
//

import SwiftUI

struct RootView: View {
    
    @StateObject private var viewModel = RootViewModel()
    
    var body: some View {
        VStack(spacing: 24) {
            headerView
            statusCard
            serverPickerView
            connectButton
            
            Spacer(minLength: 0)
        }
        
        .padding(32)
        .frame(width: 400)
        .background {
            Image(.bg)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
        }
        .toolbar {
            ToolbarItemGroup {
                Button {
                    viewModel.showSettingsView()
                } label: {
                    Image(systemName: "gearshape")
                }
                
                Button {
                    viewModel.showHelpView()
                } label: {
                    Image(systemName: "questionmark.circle")
                }
            }
        }
        .sheet(item: $viewModel.sheetScreenModal) { model in
            switch model {
            case .settings: SettingsView()
            case .help: HelpView()
            }
        }
    }
    
    private var headerView: some View {
        VStack(spacing: 8) {
            Image(systemName: "lock.shield.fill")
                .font(.system(size: 42))
            
            Text(Strings.Main.title)
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.black)
        }
    }
    
    private var statusCard: some View {
        VStack(spacing: 12) {
            HStack(spacing: 10) {
                Image(systemName: viewModel.state.systemImage)
                    .font(.system(size: 18))
                    .foregroundColor(viewModel.state.systemColor)
                
                Text(viewModel.state.title)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(viewModel.state.systemColor)
                
                if viewModel.state == .connecting {
                    ProgressView()
                        .scaleEffect(0.75)
                }
            }
            
            Text(viewModel.state.description)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .glassEffect(.clear.tint(.black.opacity(0.2)))
    }
    
    private var serverPickerView: some View {
        Picker(Strings.Main.pickerTitle, selection: $viewModel.selectedServer) {
            ForEach(VPNService.allCases) { server in
                Text(server.displayName)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.black)
                    .tag(server)
            }
        }
        
        .pickerStyle(.menu)
        .frame(maxWidth: .infinity, alignment: .leading)
        .disabled(viewModel.state == .connecting)
    }
    
    private var connectButton: some View {
        Button {
            viewModel.mainButtonTapped()
        } label: {
            Text(viewModel.mainButtonTitle)
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .padding(.vertical, 12)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 100, style: .continuous))
        }
        .buttonStyle(.plain)
        .disabled(viewModel.isMainButtonDisabled)
    }
}

#Preview {
    RootView()
}
