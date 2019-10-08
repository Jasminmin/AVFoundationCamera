//
//  ViewController.swift
//  AVFunction_Camera
//
//  Created by Rebecca on 2019/10/8.
//  Copyright © 2019 Jasmine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cameraController = CameraController()
    
    @IBOutlet fileprivate var captureButton: UIButton!
    @IBOutlet fileprivate var photoModeButton: UIButton!
    @IBOutlet fileprivate var videoModeButton: UIButton!
    @IBOutlet fileprivate var toggleFlashButton: UIButton!
    @IBOutlet fileprivate var toggleCameraButton: UIButton!
    @IBOutlet fileprivate var capturePreviewView: UIView!
    
    @IBAction func toggleFlash(_ sender: UIButton) {
        if cameraController.flashMode == .on {
            cameraController.flashMode = .off
            toggleFlashButton.setImage(#imageLiteral(resourceName: "Flash Off Icon"), for: .normal)
        }
        else{
            cameraController.flashMode = .on
            toggleFlashButton.setImage(#imageLiteral(resourceName: "Flash On Icon"), for: .normal)
        }
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidLoad() {
        func configureCameraController() {
            cameraController.prepare {(error) in if let error = error {
                print(error)
            }
            try? self.cameraController.displayPreview(on: self.capturePreviewView)
            }
        }
    
        func styleCaptureButton() {
            captureButton.layer.borderColor = UIColor(red: 77/255, green: 105/255, blue: 149/255, alpha: 1).cgColor
            captureButton.layer.borderWidth = 3
            captureButton.layer.cornerRadius = min(captureButton.frame.width, captureButton.frame.height) / 2
        }
        styleCaptureButton()
        configureCameraController()
    }

}

