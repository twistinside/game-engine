import simd

class DebugCamera: Camera {
    var cameraType: CameraType = .debug
    var position: float3 = float3(0)
    
    func update(deltaTime: Float) {
        if Keyboard.isKeyPressed(.leftArrow) {
            self.position.x -= deltaTime
        }
        
        if Keyboard.isKeyPressed(.rightArrow) {
            self.position.x += deltaTime
        }
        
        if Keyboard.isKeyPressed(.upArrow) {
            self.position.y += deltaTime
        }
        
        if Keyboard.isKeyPressed(.downArrow) {
            self.position.y -= deltaTime
        }
    }
}
