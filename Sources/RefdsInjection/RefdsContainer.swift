import Foundation

public actor RefdsContainer {
    static var services: [String: Any] = [:]
    
    public static func register<Service>(
        for type: Service.Type,
        service: () -> Service
    ) {
        services["\(type)"] = service()
    }
    
    public static func resolve<Service>(for type: Service.Type) -> Service {
        guard let service = services["\(type)"] as? Service else {
            fatalError("No dependency found. Please make sure to inject the dependency correctly.")
        }
        return service
    }
    
    public static func resolveOptional<Service>(for type: Service.Type) -> Service? {
        services["\(type)"] as? Service
    }
}
