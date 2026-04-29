import SwiftUI

struct SettingsView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        VStack(spacing: 24) {
            topBar
            settingsList
        }
        .padding(20)
        .frame(width: 400)
    }

    private var topBar: some View {
        ZStack {
            headerView
            dismissButton
        }
    }
    
    private var dismissButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(.black.opacity(0.5))
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity, alignment: .topTrailing)
    }

    private var headerView: some View {
        HStack(spacing: 12) {
            Image(systemName: "gearshape.fill")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundColor(.black)

            Text(Strings.Settings.title)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.black)
        }
    }
    
    private var settingsList: some View {
        VStack(spacing: 8) {
            SettingsRowView(
                title: Strings.Settings.privacy,
                systemImage: "hand.raised.fill"
            ) {
                openLink(Constants.privacy)
            }

            SettingsRowView(
                title: Strings.Settings.terms,
                systemImage: "doc.text.fill"
            ) {
                openLink(Constants.terms)
            }

            SettingsRowView(
                title: Strings.Settings.feedback,
                systemImage: "envelope.fill"
            ) {
                openFeedback()
            }
        }
    }
}

private extension SettingsView {
    func openLink(_ url: String?) {
        guard let url = URL(string: url ?? "") else { return }
        openURL(url)
    }

    func openFeedback() {
        guard let url = viewModel.makeFeedbackEmailURL() else { return }
        openURL(url)
    }
}

#Preview {
    SettingsView()
}
