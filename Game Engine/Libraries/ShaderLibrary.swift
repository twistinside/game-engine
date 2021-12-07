import MetalKit

enum VertexShaderType {
    case basic
}

enum FragmentShaderType {
    case basic
}

class ShaderLibrary {
    public static var defaultLibrary: MTLLibrary!
    private static var vertexShaders: [VertexShaderType : Shader] = [:]
    private static var fragmentShaders: [FragmentShaderType : Shader] = [:]
    
    public static func initialize() {
        defaultLibrary = Engine.device.makeDefaultLibrary()
        createDefaultShaders()
    }
    
    public static func createDefaultShaders() {
        // vertex shaders
        vertexShaders.updateValue(Basic_VertexShader(), forKey: .basic)
        
        // fragment shaders
        fragmentShaders.updateValue(Basic_FragmentShader(), forKey: .basic)
    }
    
    public static func vertex(_ shaderType: VertexShaderType) -> MTLFunction {
        return vertexShaders[shaderType]!.function
    }
    
    public static func fragment(_ shaderType: FragmentShaderType) -> MTLFunction {
        return fragmentShaders[shaderType]!.function
    }
}

protocol Shader {
    var name: String { get }
    var functionName: String { get }
    var function: MTLFunction! { get }
}

public struct Basic_VertexShader: Shader {
    public var name: String = "Basic Vertex Shader"
    public var functionName: String = "basic_vertex_shader"
    public var function: MTLFunction!
    init () {
        function = ShaderLibrary.defaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}

public struct Basic_FragmentShader: Shader {
    public var name: String = "Basic Fragment Shader"
    public var functionName: String = "basic_fragment_shader"
    public var function: MTLFunction!
    init() {
        function = ShaderLibrary.defaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}
