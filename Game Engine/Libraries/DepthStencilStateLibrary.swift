import MetalKit

enum DepthStencilStateType {
    case less
}

class DepthStencilStateLibrary {
    
    private static var depthStencilStates: [DepthStencilStateType : DepthStencilState] = [:]
    
    public static func initialize() {
        createDefaultDepthStencilStates()
    }
    
    private static func createDefaultDepthStencilStates() {
        depthStencilStates.updateValue(Less_DepthStencilState(), forKey: .less)
    }
    
    public static func depthStencilState(_ depthStencilStateType: DepthStencilStateType) -> MTLDepthStencilState {
        return depthStencilStates[depthStencilStateType]!.depthStencilState
    }
}

protocol DepthStencilState {
    var depthStencilState: MTLDepthStencilState! { get }
}

class Less_DepthStencilState: DepthStencilState {
    var depthStencilState: MTLDepthStencilState!
    
    init() {
        let depthStencilDescriptor = MTLDepthStencilDescriptor()
        depthStencilDescriptor.isDepthWriteEnabled = true
        depthStencilDescriptor.depthCompareFunction = .less
        depthStencilState = Engine.device.makeDepthStencilState(descriptor: depthStencilDescriptor)
    }
}
