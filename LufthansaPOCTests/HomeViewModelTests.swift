

import XCTest
import SwiftUI
@testable import LufthansaPOC

final class HomeViewModelTests: XCTestCase {

    var homeViewModel: HomeViewModel!
    var mockCoordinator: MockCoordinator!

    override func setUp() {
        super.setUp()
        mockCoordinator = MockCoordinator()
        homeViewModel = HomeViewModel(coordinator: mockCoordinator)
    }

    override func tearDown() {
        homeViewModel = nil
        mockCoordinator = nil
        super.tearDown()
    }

    func testNavigateToDetail() {
        // Given
        let userInput = "Test Input"
        homeViewModel.userInput.text = userInput

        // When
        homeViewModel.navigateToDetail()

        // Then
        XCTAssertTrue(mockCoordinator.didCallShowDetailView, "Coordinator should navigate to DetailView")
        XCTAssertEqual(mockCoordinator.passedUserInput?.text, userInput, "User input should be passed to the coordinator")
    }
}

class MockCoordinator: AppCoordinatorProtocol, ObservableObject {
    @Published var path = NavigationPath()
    
    var didCallShowDetailView = false
    var didCallShowThirdView = false
    var passedUserInput: UserInput?
    var passedMessage: String?

    func showDetailView(userInput: UserInput) {
        didCallShowDetailView = true
        passedUserInput = userInput
    }
}
