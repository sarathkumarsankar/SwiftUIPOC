import Combine

protocol DetailViewModelProtocol: ObservableObject {
    var displayedText: String { get }
}

class DetailViewModel: DetailViewModelProtocol {
    @Published var displayedText: String

    init(userInput: UserInput) {
        self.displayedText = userInput.text
    }
}
