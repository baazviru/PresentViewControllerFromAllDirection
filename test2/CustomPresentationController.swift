//
//  CustomPresentationController.swift
//  test2
//
//  Created by Virendra Kumar on 15/06/23.
//

import Foundation
import UIKit

var animateFrom : AnimateFrom = .left

class CustomPresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        
        
        if animateFrom == .top{
            let presentdHeight: CGFloat = 400
            return CGRect(x: 0, y: 0, width: containerView.frame.width, height: presentdHeight)
        }
        else if animateFrom == .left {
            let presentdWidth: CGFloat = containerView.frame.width/2 + 50
            return CGRect(x: 0, y: 0, width: presentdWidth, height: containerView.frame.height)
        }
        else if animateFrom == .bottom {
            let presentdHeight: CGFloat = 400
            let origin = containerView.frame.height - presentdHeight
            return CGRect(x: 0, y: origin, width: containerView.frame.width, height: presentdHeight)
        }
        else if animateFrom == .right{
            let presentdWidth: CGFloat = containerView.frame.width/2 + 50
            let origin = containerView.frame.width - presentdWidth
            return CGRect(x: origin, y: 0, width: presentdWidth, height: containerView.frame.height)
        }else{
            return containerView.frame
        }
       
    }
    
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView, let presentedView = presentedView else { return }
        
        containerView.addSubview(presentedView)
    }
}
