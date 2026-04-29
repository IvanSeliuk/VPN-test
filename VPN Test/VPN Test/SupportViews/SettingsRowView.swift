//
//  SettingsRowView.swift
//  VPN Test
//
//  Created by Селюк Иван on 29.04.2026.
//

import SwiftUI

struct SettingsRowView: View {
    let title: String
    let systemImage: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                Image(systemName: systemImage)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.5))
                
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black)
                
                Image(systemName: "chevron.right")
                    .frame(width: 16, height: 16)
                    .foregroundColor(.black.opacity(0.5))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(14)
            .frame(maxWidth: .infinity)
            .background(.black.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SettingsRowView(title: "Privacy", systemImage: "xmark", action: {})
}
