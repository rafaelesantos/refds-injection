import XCTest
@testable import RefdsInjection

final class RefdsInjectionTests: XCTestCase {
    func testAddDependencyInjectionShouldCompletesWithResolvedDependency() {
        let expectedID = UUID()
        RefdsContainer.register(type: MockViewModelProtocol.self) { MockViewModel(id: expectedID) }
        let viewModel = RefdsContainer.resolve(type: MockViewModelProtocol.self)
        let receivedID = viewModel.id
        XCTAssertEqual(expectedID, receivedID)
    }
    
    func testDenpendencyInjectionWithPropertyWrapperShouldCompletesWithResolvedDependency() {
        let expectedID = UUID()
        RefdsContainer.register(type: MockViewModelProtocol.self) { MockViewModel(id: expectedID) }
        let view = MockView()
        let receivedID = view.viewModel.id
        XCTAssertEqual(expectedID, receivedID)
    }
    
    func testDenpendencyInjectionWithPropertyWrapperShouldCompletesWithFatalError() {
        RefdsContainer.services = [:]
        expectFatalError(expectedMessage: "No dependency found. Please make sure to inject the dependency correctly.") {
            let _ = MockView()
        }
    }
    
    func testAddDependencyInjectionShouldCompletesWithFatalError() {
        RefdsContainer.services = [:]
        expectFatalError(expectedMessage: "No dependency found. Please make sure to inject the dependency correctly.") {
            let _ = RefdsContainer.resolve(type: MockViewModelProtocol.self, fatalError: mockFatalError)
        }
    }
}
