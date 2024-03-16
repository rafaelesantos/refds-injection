import XCTest
@testable import RefdsInjection

extension XCTestCase {
    func expectFatalError(expectedMessage: String, testcase: @escaping () -> Void) {
        let expectation = self.expectation(description: "fatal error")
        var receivedMessage: String? = nil
        
        MockFatalError.replaceFatalError { message, file, line in
            receivedMessage = message
            expectation.fulfill()
            self.unreachable()
        }
        
        DispatchQueue.global(qos: .userInitiated).async(execute: testcase)
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(expectedMessage, receivedMessage)
        MockFatalError.restoreMockFatalError()
    }
    
    private func unreachable() -> Never {
        repeat { RunLoop.current.run() } while (true)
    }
}
