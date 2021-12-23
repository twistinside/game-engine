import MetalKit

class Pointer: GameObject {
    private var camera: Camera!
    init(camera: Camera) {
        super.init(meshType: .triangle_custom)
        self.camera = camera
        
    }
    
    override func update(deltaTime: Float) {
        self.rotation.z = -atan2f(Mouse.getMouseViewportPosition().x - position.x + camera.position.x,
                                  Mouse.getMouseViewportPosition().y - position.y + camera.position.y)
        super.update(deltaTime: deltaTime)
    }
}
