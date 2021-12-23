class CameraManager {
    private var cameras: [CameraType : Camera] = [:]
    public var currentCamera: Camera!
    
    public func registerCamera(_ camera: Camera) {
        self.cameras.updateValue(camera, forKey: camera.cameraType)
    }
    
    public func setCamera(_ cameraType: CameraType) {
        self.currentCamera = cameras[cameraType]
    }
    
    internal func update(deltaTime: Float) {
        for camera in cameras.values {
            camera.update(deltaTime: deltaTime)
        }
    }
}
