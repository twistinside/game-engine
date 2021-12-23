import MetalKit

enum SceneType {
    case sandbox
}

class SceneManager {
    private static var currentScene: Scene!
    
    public static func initialize(_ sceneType: SceneType) {
        setScene(sceneType)
    }
    
    public static func setScene(_ sceneType: SceneType) {
        switch sceneType {
        case .sandbox:
            currentScene = SandboxScene()
        }
    }
    
    public static func tickScene(renderCommandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        currentScene.updateCameras(deltaTime: deltaTime)
        currentScene.update(deltaTime: deltaTime)
        currentScene.render(renderCommandEncoder: renderCommandEncoder)
    }
}
