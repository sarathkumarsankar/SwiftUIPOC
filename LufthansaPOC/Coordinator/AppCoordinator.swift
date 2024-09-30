
import SwiftUI

protocol AppCoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }
    func showDetailView(userInput: UserInput)
}

class AppCoordinator: ObservableObject, AppCoordinatorProtocol {
    @Published var path = NavigationPath()

    func showDetailView(userInput: UserInput) {
        path.append(userInput)
    }
    
    func resetNavigation() {
        path.removeLast(path.count)
    }
}
