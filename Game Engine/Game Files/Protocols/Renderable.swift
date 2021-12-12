import MetalKit

protocol Renderable {
    func doRender(_ renderCommandEndcoder: MTLRenderCommandEncoder)
}
