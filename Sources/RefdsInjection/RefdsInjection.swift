import Foundation

@propertyWrapper
public struct RefdsInjection<Service> {
    private var service: Service
    
    public var wrappedValue: Service { service }
    
    public init(fatalError: @escaping (@autoclosure () -> String, StaticString, UInt) -> Never = Swift.fatalError) {
        service = RefdsContainer.resolve(type: Service.self, fatalError: fatalError)
    }
}
