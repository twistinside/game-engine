import MetalKit

class Engine {
    public static var device: MTLDevice!
    public static var commandQueue: MTLCommandQueue!
    
    public static func Ignite(device: MTLDevice) {
        self.device = device
        self.commandQueue = device.makeCommandQueue()
        ShaderLibrary.initialize()
        VertexDescriptorLibrary.initialize()
        RenderPipelineDescriptorLibrary.initialize()
        RenderPipelineStateLibrary.initialize()
        RenderPipelineDescriptorLibrary.initialize()
    }
}