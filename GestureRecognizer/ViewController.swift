//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Kamil Wysocki on 08/04/2019.
//  Copyright © 2019 CodingPeak. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var presentButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        initializePreview()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("moved on parent")
        super.touchesMoved(touches, with: event)
    }

}

extension ViewController: UIViewControllerPreviewingDelegate {

    private func initializePreview() {
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: view)
        }
    }

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let gestureVC = GestureViewController()
        if !presentButton.frame.contains(location) {
            return nil
        }
        previewingContext.sourceRect = presentButton.frame
        return gestureVC
    }

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.view.isUserInteractionEnabled = false
        self.present(viewControllerToCommit, animated: true)
    }

}
