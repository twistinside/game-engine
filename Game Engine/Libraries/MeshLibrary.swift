import MetalKit

enum MeshType {
    case triangle_custom
    case quad_custom
}

class MeshLibrary {
    private static var meshes: [MeshType:Mesh] = [:]
    
    public static func initialize() {
        createDefaultMeshes()
    }
    
    private static func createDefaultMeshes() {
        meshes.updateValue(Triangle_CustomMesh(), forKey: .triangle_custom)
        meshes.updateValue(Quad_CustomMesh(), forKey: .quad_custom)
    }
    
    public static func mesh(_ meshType: MeshType) -> Mesh {
        return meshes[meshType]!
    }
}

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int! { get }
}

class CustomMesh: Mesh {
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    var vertexCount: Int! {
        vertices.count
    }
    
    init() {
        createVertices()
        createBuffers()
    }
    
    func createVertices() { }
        
    func createBuffers() {
        vertexBuffer = Engine.device.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count), options: [])
    }
}

class Triangle_CustomMesh: CustomMesh {
    override func createVertices() {
        vertices = [
            Vertex(position: float3( 0, 1, 0), color: float4(1, 0, 0, 1)),
            Vertex(position: float3(-1,-1, 0), color: float4(0, 1, 0, 1)),
            Vertex(position: float3( 1,-1, 0), color: float4(0, 0, 1, 1))
        ]
    }
}

class Quad_CustomMesh: CustomMesh {
    override func createVertices() {
        vertices = [
            Vertex(position: float3( 1, 1, 0), color: float4(1, 0, 0, 1)),
            Vertex(position: float3(-1, 1, 0), color: float4(1, 1, 1, 1)),
            Vertex(position: float3(-1,-1, 0), color: float4(0, 0, 1, 1)),
            
            Vertex(position: float3( 1, 1, 0), color: float4(1, 0, 0, 1)),
            Vertex(position: float3(-1,-1, 0), color: float4(0, 0, 1, 1)),
            Vertex(position: float3( 1,-1, 0), color: float4(0, 0, 0, 1))
        ]
    }
}
