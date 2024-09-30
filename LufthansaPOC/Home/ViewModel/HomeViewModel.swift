import Combine

struct UserInput: Hashable {
    var text: String
}

protocol HomeViewModelProtocol: ObservableObject {
    var userInput: UserInput { get set }
    func navigateToDetail()
}

class HomeViewModel: HomeViewModelProtocol, ObservableObject {
    @Published var userInput = UserInput(text: "")
    
    private var coordinator: any AppCoordinatorProtocol

    init(coordinator: any AppCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    func navigateToDetail() {
        coordinator.showDetailView(userInput: userInput)
    }
}
