import MetalKit

public enum ClearColors {
    static let white: MTLClearColor = MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    static let green: MTLClearColor = MTLClearColor(red: 0.2, green: 0.5, blue: 0.3, alpha: 1)
    static let grey: MTLClearColor  = MTLClearColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    static let black: MTLClearColor = MTLClearColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
}

class Preferences {
    public static var clearColor: MTLClearColor = ClearColors.white
    public static var mainPixelFormat: MTLPixelFormat = MTLPixelFormat.bgra8Unorm
    public static var startingSceneType: SceneType = .sandbox
}
