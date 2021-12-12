import MetalKit

class Node {
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        guard let renderable = self as? Renderable else {
            return
        }
        renderable.doRender(renderCommandEncoder)
    }
}
