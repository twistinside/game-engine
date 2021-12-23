import MetalKit

class Renderer: NSObject {
    public static var screenSize: float2 = float2(0)
    public static var aspectRatio: Float {
        return screenSize.x / screenSize.y
    }
    
    init(_ view: MTKView) {
        super.init()
        updateScreenSize(view: view)
    }
}

extension Renderer: MTKViewDelegate {
    
    public func updateScreenSize(view: MTKView) {
        Renderer.screenSize = float2(Float(view.bounds.width), Float(view.bounds.height))
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        updateScreenSize(view: view)
    }
    
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
              let renderPassDescriptor = view.currentRenderPassDescriptor,
              let commandBuffer = Engine.commandQueue.makeCommandBuffer(),
              let renderCommandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor:renderPassDescriptor) else {
                  return
              }
        
        SceneManager.tickScene(renderCommandEncoder: renderCommandEncoder, deltaTime: 1/Float(view.preferredFramesPerSecond))
        
        renderCommandEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
