import simd

class DebugCamera: Camera {
    var cameraType: CameraType = .debug
    var position: float3 = float3(0)
    
    var projectionMatrix: matrix_float4x4 {
        return matrix_float4x4.perspective(degreesFov: 45, aspectRatio: Renderer.aspectRatio, near: 0.1, far: 1000)
    }
    
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
