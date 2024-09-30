import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel

    private enum Constants {
        static let navigationBarTitle = "Detail"
        static let textFieldIdentifier = "DetailText"
    }

    var body: some View {
        VStack {
            Text(viewModel.displayedText)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
                .accessibilityIdentifier(Constants.textFieldIdentifier)
        }
        .padding()
        .navigationTitle(Constants.navigationBarTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mockViewModel = DetailViewModel(userInput: UserInput(text: "Sarath"))
        NavigationView {
            DetailView(viewModel: mockViewModel)
        }
    }
}
