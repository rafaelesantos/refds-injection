import Foundation

public final class RefdsContainer: RefdsInjectionProtocol {
    static var services: [String: Any] = [:]
    
    public static func register<Service>(
        type: Service.Type,
        component: () -> Service
    ) {
        services["\(type)"] = component()
    }
    
    public static func resolve<Service>(
        type: Service.Type,
        fatalError: @escaping (@autoclosure () -> String, StaticString, UInt) -> Never = Swift.fatalError
    ) -> Service {
        guard let service = services["\(type)"] as? Service else {
            fatalError("No dependency found. Please make sure to inject the dependency correctly.", #file, #line)
        }
        return service
    }
    
    public static func resolveOptional<Service>(
        type: Service.Type
    ) -> Service? {
        services["\(type)"] as? Service
    }
}
