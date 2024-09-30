import XCTest
@testable import LufthansaPOC

final class AppCoordinatorTests: XCTestCase {

    var coordinator: AppCoordinator!

    override func setUp() {
        super.setUp()
        coordinator = AppCoordinator()
    }

    override func tearDown() {
        coordinator = nil
        super.tearDown()
    }

    func testShowDetailView() {
        // Given
        let userInput = UserInput(text: "Test Input")

        // When
        coordinator.showDetailView(userInput: userInput)

        // Then
        XCTAssertEqual(coordinator.path.count, 1, "Path should contain one element")
    }

    // Test resetting the path
    func testResetNavigationPath() {
        // Given
        coordinator.showDetailView(userInput: UserInput(text: "Input 1"))

        // When: Reset the path
        coordinator.path.removeLast(coordinator.path.count)

        // Then
        XCTAssertEqual(coordinator.path.count, 0, "Path should be empty after reset")
    }
}
