import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "Slice")!
        ImageProcessor.shared()?.processImage(image)
        ImageProcessor1.processImage(image: image)
    }

}

