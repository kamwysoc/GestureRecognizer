//
// Created by Kamil Wysocki on 2019-04-08.
// Copyright (c) 2019 CodingPeak. All rights reserved.
//

import UIKit

class PassthroughToWindowView: UIView {

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("moved")
        super.touchesMoved(touches, with: event)
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        var view = super.hitTest(point, with: event)
        if view != self {
            return view
        }

        while !(view is PassthroughToWindowView) {
            view = view?.superview
        }
        return view
    }
}

class GestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vv = PassthroughToWindowView()
        vv.frame = self.view.frame
        vv.backgroundColor = .blue
        view.addSubview(vv)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("moved on child")
        super.touchesMoved(touches, with: event)

    }

}
