import MetalKit

class Cube: GameObject {
    init() {
        super.init(meshType: .cube_custom)
    }
    
    override func update(deltaTime: Float) {
        self.rotation.x += deltaTime
        self.rotation.y += deltaTime / 2
        super.update(deltaTime: deltaTime)
    }
}
