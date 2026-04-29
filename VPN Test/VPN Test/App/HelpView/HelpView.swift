//
//  HelpView.swift
//  VPN Test
//
//  Created by Селюк Иван on 29.04.2026.
//

import SwiftUI

struct HelpView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            headerView
            descriptionView
            buttonView
        }
        .padding(20)
        .frame(width: 400)
    }
    
    private var headerView: some View {
        VStack(spacing: 10) {
            Image(systemName: "questionmark.circle.fill")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundColor(.green)
            
            Text(Strings.Help.title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
        }
    }
    
    private var descriptionView: some View {
        Text(Strings.Help.description)
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.black.opacity(0.5))
    }
    
    private var buttonView: some View {
        Button {
            dismiss()
        } label: {
            Text(Strings.Help.buttonTitle)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)
                .padding(.horizontal, 32)
                .padding(.vertical, 8)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 100, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HelpView()
}
