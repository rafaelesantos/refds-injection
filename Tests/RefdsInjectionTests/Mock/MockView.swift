import Foundation
import RefdsInjection

class MockView {
    @RefdsInjection(fatalError: mockFatalError)
    var viewModel: MockViewModelProtocol
}
