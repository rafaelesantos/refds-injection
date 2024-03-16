import Foundation

protocol MockViewModelProtocol {
    var id: UUID { get }
}

class MockViewModel: MockViewModelProtocol {
    var id: UUID
    init(id: UUID) { self.id = id }
}
