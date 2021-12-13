import MetalKit

class Renderer: NSObject { }

extension Renderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // future things go here
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
