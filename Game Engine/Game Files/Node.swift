import MetalKit

class Node {
    var position: float3 = float3(0)
    var rotation: float3 = float3(0)
    var scale: float3    = float3(1)
    var children: [Node] = []
    var modelMatrix: matrix_float4x4 {
        var modelMatrix = matrix_identity_float4x4
        modelMatrix.translate(direction: position)
        modelMatrix.rotate(angle: rotation.x, axis: X_AXIS)
        modelMatrix.rotate(angle: rotation.y, axis: Y_AXIS)
        modelMatrix.rotate(angle: rotation.z, axis: Z_AXIS)
        modelMatrix.scale(axis: scale)
        return modelMatrix
    }
    
    func addChild(_ child: Node) {
        children.append(child)
    }
    
    func update(deltaTime: Float) {
        for child in children {
            child.update(deltaTime: deltaTime)
        }
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        for child in children {
            child.render(renderCommandEncoder: renderCommandEncoder)
        }
        guard let renderable = self as? Renderable else {
            return
        }
        renderable.doRender(renderCommandEncoder)
    }
}
