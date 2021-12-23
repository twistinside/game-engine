import simd

protocol Sizeable { }

extension Sizeable {
    static var size: Int {
        return MemoryLayout<Self>.size
    }
    static var stride: Int {
        return MemoryLayout<Self>.stride
    }
    static func size(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }
    static func stride(_ count: Int) -> Int {
        return MemoryLayout<Self>.stride * count
    }
}

extension Float: Sizeable {}
extension float3: Sizeable {}

struct Vertex: Sizeable {
    var position: float3
    var color: float4
}

struct ModelConstants: Sizeable {
    var modelMatrix = matrix_identity_float4x4
}

struct SceneConstants: Sizeable {
    var viewMatrix = matrix_identity_float4x4
    var projectionMatrix = matrix_identity_float4x4
}
