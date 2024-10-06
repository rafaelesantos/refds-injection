import Foundation

@propertyWrapper
public struct RefdsInjection<Service> {
    private var service: Service
    
    public var wrappedValue: Service { service }
    
    public init() {
        service = RefdsContainer.resolve(for: Service.self)
    }
}
