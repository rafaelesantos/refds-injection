import Foundation

func mockFatalError(
    _ message: @autoclosure () -> String,
    file: StaticString,
    line: UInt
) -> Never {
    MockFatalError.fatalErrorClosure(message(), file, line)
}

struct MockFatalError {
    static var fatalErrorClosure: (String, StaticString, UInt) -> Never = defaultFatalErrorClosure
    private static let defaultFatalErrorClosure = { Swift.fatalError($0, file: $1, line: $2) }
    
    static func replaceFatalError(closure: @escaping (String, StaticString, UInt) -> Never) {
        fatalErrorClosure = closure
    }
    
    static func restoreMockFatalError() {
        fatalErrorClosure = defaultFatalErrorClosure
    }
}
