import SwiftUI

@main
struct LufthansaPOCApp: App {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                HomeView(viewModel: HomeViewModel(coordinator: coordinator))
                    .navigationDestination(for: UserInput.self) { userInput in
                        DetailView(viewModel: DetailViewModel(userInput: userInput))
                    }
            }
        }
    }
}
