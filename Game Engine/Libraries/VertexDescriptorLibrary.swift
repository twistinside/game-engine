import MetalKit

enum VertexDescriptorType {
    case basic
}

class VertexDescriptorLibrary {
    
    private static var vertexDescriptors: [VertexDescriptorType : VertexDescriptor] = [:]
    
    public static func initialize() {
        createDefaultVertexDescriptors()
    }
    
    private static func createDefaultVertexDescriptors() {
        vertexDescriptors.updateValue(Basic_VertexDescriptor(), forKey: .basic)
    }
    
    public static func descriptor(_ vertexDescriptorType: VertexDescriptorType) -> MTLVertexDescriptor {
        return vertexDescriptors[vertexDescriptorType]!.vertexDescriptor
    }
}

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor! { get }
}

public struct Basic_VertexDescriptor: VertexDescriptor {
    var name: String = "Basic Vertex Descriptor"
    
    var vertexDescriptor: MTLVertexDescriptor!
    init() {
        vertexDescriptor = MTLVertexDescriptor()
        // position
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0
        
        // color
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = float3.stride
        
        vertexDescriptor.layouts[0].stride = Vertex.stride
    }
}
