import MetalKit

protocol Renderable {
    func doRender(_ renderCommandEndcore: MTLRenderCommandEncoder)
}
