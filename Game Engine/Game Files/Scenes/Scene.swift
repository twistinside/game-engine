import MetalKit

class Scene: Node {
    var sceneConstants = SceneConstants()
    var cameraManager = CameraManager()
    
    override init() {
        super.init()
        buildScene()
    }
    
    func addCamera(_ camera: Camera, _ isCurrentCamera: Bool = true) {
        cameraManager.registerCamera(camera)
        if isCurrentCamera {
            cameraManager.setCamera(camera.cameraType)
        }
    }
    
    func updateSceneConstants() {
        sceneConstants.viewMatrix = cameraManager.currentCamera.viewMatrix
        sceneConstants.projectionMatrix = cameraManager.currentCamera.projectionMatrix
    }
    
    func updateCameras(deltaTime: Float) {
        cameraManager.update(deltaTime: deltaTime)
    }
    
    override func update(deltaTime: Float) {
        updateSceneConstants()
        super.update(deltaTime: deltaTime)
    }
    
    override func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBytes(&sceneConstants, length: SceneConstants.stride, index: 1)
        super.render(renderCommandEncoder: renderCommandEncoder)
    }
    
    func buildScene() { }
}
