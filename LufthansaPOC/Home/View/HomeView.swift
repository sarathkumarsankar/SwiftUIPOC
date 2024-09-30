import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    private enum Constants {
        static let navigationBarTitle = "Home"
        static let textFieldPlaceholder = "Enter something..."
        static let submitButtonText = "Submit"
    }
    
    var body: some View {
        VStack(spacing: 20) {
            userInputField
            submitButton
        }
        .padding()
        .navigationTitle(Constants.navigationBarTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var userInputField: some View {
        TextField(Constants.textFieldPlaceholder, text: $viewModel.userInput.text)
            .padding()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.horizontal)
    }
    
    private var submitButton: some View {
        Button(action: {
            viewModel.navigateToDetail()
        }) {
            Text(Constants.submitButtonText)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
        }
        .padding(.horizontal)
    }
}

