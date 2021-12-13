import MetalKit

class Player: GameObject {
    
    init() {
        super.init(meshType: .triangle_custom)
    }
    
    override func update(deltaTime: Float) {
        self.rotation.z = -atan2f(Mouse.getMouseViewportPosition().x - position.x,
                                  Mouse.getMouseViewportPosition().y - position.y)
        super.update(deltaTime: deltaTime)
    }
}
