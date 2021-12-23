import MetalKit

class SandboxScene: Scene {
    let debugCamera = DebugCamera()
    var cube = Cube()
    
    override func buildScene() {
        addCamera(debugCamera)
        debugCamera.position.z = 5
        addChild(cube)
    }
    
    override func update(deltaTime: Float) {
        cube.rotation.x += deltaTime
        cube.rotation.y += deltaTime / 2.0
        super.update(deltaTime: deltaTime)
    }
}
