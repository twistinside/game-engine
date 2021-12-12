import MetalKit

class Node {
    var position: float3 = float3(0)
    var rotation: float3 = float3(0)
    var scale: float3    = float3(1)
    var modelMatrix: matrix_float4x4 {
        var modelMatrix = matrix_identity_float4x4
        modelMatrix.translate(direction: position)
        modelMatrix.rotate(angle: rotation.x, axis: X_AXIS)
        modelMatrix.rotate(angle: rotation.y, axis: Y_AXIS)
        modelMatrix.rotate(angle: rotation.z, axis: Z_AXIS)
        modelMatrix.scale(axis: scale)
        return modelMatrix
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        guard let renderable = self as? Renderable else {
            return
        }
        renderable.doRender(renderCommandEncoder)
    }
}
