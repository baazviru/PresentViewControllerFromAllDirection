//
//  CustomTransitionAnimator.swift
//  test2
//
//  Created by Virendra Kumar on 15/06/23.
//

import Foundation
import UIKit

enum AnimateFrom {
    case left
    case right
    case top
    case bottom
}

class CustomTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let isPresenting: Bool
    private let animateFrom : AnimateFrom
    
    init(isPresenting: Bool, animateFrom: AnimateFrom) {
        self.isPresenting = isPresenting
        self.animateFrom = animateFrom
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let duration = transitionDuration(using: transitionContext)
        
        
        guard let fromViewController = transitionContext.viewController(forKey: .from),
              let toViewController = transitionContext.viewController(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }
        let fromView = transitionContext.view(forKey: .from)
        let toView = transitionContext.view(forKey: .to)
        
        let containerView = transitionContext.containerView
        let initialFrame = transitionContext.initialFrame(for: fromViewController)
        let finalFrame = transitionContext.finalFrame(for: toViewController)
        
        let yOffset: CGFloat = isPresenting ? -finalFrame.height : -finalFrame.height
        let xOffset: CGFloat = isPresenting ? -finalFrame.width : -finalFrame.width
        

        
        if animateFrom == .top {
            if isPresenting {
                toView?.frame = finalFrame.offsetBy(dx: 0, dy: yOffset)
                containerView.addSubview(toView!)
            } else {
               // containerView.insertSubview(toView!, belowSubview: fromView!)
            }
            
            UIView.animate(withDuration: duration, animations: {
                fromView?.frame = initialFrame.offsetBy(dx: 0, dy: yOffset)
                toView?.frame = finalFrame
                
                if self.isPresenting {
                    fromViewController.view.alpha = 0.5
                } else {
                    toViewController.view.alpha = 1.0
                }
                
            }, completion: { _ in
                let isCancelled = transitionContext.transitionWasCancelled
                if isCancelled {
                    toView?.removeFromSuperview()
                }
                transitionContext.completeTransition(!isCancelled)
            })

        }
        else if animateFrom == .bottom {
            if isPresenting {
                toView?.frame = finalFrame.offsetBy(dx: 0, dy: -yOffset)
                containerView.addSubview(toView!)
            } else {
               // containerView.insertSubview(toView!, belowSubview: fromView!)
            }
            
            UIView.animate(withDuration: duration, animations: {
                fromView?.frame = initialFrame.offsetBy(dx: 0, dy: -yOffset)
                toView?.frame = finalFrame
                
                if self.isPresenting {
                    fromViewController.view.alpha = 0.5
                } else {
                    toViewController.view.alpha = 1.0
                }
                
            }, completion: { _ in
                let isCancelled = transitionContext.transitionWasCancelled
                if isCancelled {
                    toView?.removeFromSuperview()
                }
                transitionContext.completeTransition(!isCancelled)
            })

        }
        
        else if animateFrom == .left {
            if isPresenting {
                toView?.frame = finalFrame.offsetBy(dx: xOffset, dy: 0)
                containerView.addSubview(toView!)
            } else {
               // containerView.insertSubview(toView!, belowSubview: fromView!)
            }
            
            UIView.animate(withDuration: duration, animations: {
                fromView?.frame = initialFrame.offsetBy(dx: xOffset, dy: 0)
                toView?.frame = finalFrame
                
                if self.isPresenting {
                    fromViewController.view.alpha = 0.5
                } else {
                    toViewController.view.alpha = 1.0
                }
            }, completion: { _ in
                let isCancelled = transitionContext.transitionWasCancelled
                if isCancelled {
                    toView?.removeFromSuperview()
                }
                transitionContext.completeTransition(!isCancelled)
            })
        }
        else if animateFrom == .right {
            if isPresenting {
                toView?.frame = finalFrame.offsetBy(dx: -xOffset, dy: 0)
                containerView.addSubview(toView!)
            } else {
               // containerView.insertSubview(toView!, belowSubview: fromView!)
            }
            
            UIView.animate(withDuration: duration, animations: {
                fromView?.frame = initialFrame.offsetBy(dx: -xOffset, dy: 0)
                toView?.frame = finalFrame
                
                if self.isPresenting {
                    fromViewController.view.alpha = 0.5
                } else {
                    toViewController.view.alpha = 1.0
                }
            }, completion: { _ in
                let isCancelled = transitionContext.transitionWasCancelled
                if isCancelled {
                    toView?.removeFromSuperview()
                }
                transitionContext.completeTransition(!isCancelled)
            })
        }
        else {
            
        }
    }
}
