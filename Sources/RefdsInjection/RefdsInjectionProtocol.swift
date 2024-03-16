import Foundation

public protocol RefdsInjectionProtocol {
    static func register<Service>(
        type: Service.Type,
        component: () -> Service
    )
    
    static func resolve<Service>(
        type: Service.Type,
        fatalError: @escaping ((@autoclosure () -> String, StaticString, UInt) -> Never)
    ) -> Service
}
