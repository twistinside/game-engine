import MetalKit

enum RenderPipelineDescriptorType {
    case basic
}

class RenderPipelineDescriptorLibrary {
    
    private static var renderPipelineDescriptors: [RenderPipelineDescriptorType : RenderPipelineDescriptor] = [:]
    
    public static func initialize() {
        createDefaultRenderPipelineDescriptors()
    }
    
    private static func createDefaultRenderPipelineDescriptors() {
        renderPipelineDescriptors.updateValue(Basic_RenderPipelineDescriptor(), forKey: .basic)
    }
    
    public static func descriptor(_ renderPipelineDescriptorType: RenderPipelineDescriptorType) -> MTLRenderPipelineDescriptor{
        return renderPipelineDescriptors[renderPipelineDescriptorType]!.renderPipelineDescriptor
    }
    
}

protocol RenderPipelineDescriptor {
    var name: String { get }
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor! { get }
}

public struct Basic_RenderPipelineDescriptor: RenderPipelineDescriptor{
    var name: String = "Basic Render Pipeline Descriptor"
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor!
    init () {
        renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.mainPixelFormat
        renderPipelineDescriptor.vertexFunction = ShaderLibrary.vertex(.basic)
        renderPipelineDescriptor.fragmentFunction = ShaderLibrary.fragment(.basic)
        renderPipelineDescriptor.vertexDescriptor = VertexDescriptorLibrary.descriptor(.basic)
    }
}
