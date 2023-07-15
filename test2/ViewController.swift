//
//  ViewController.swift
//  test2
//
//  Created by Virendra Kumar on 12/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
      
        
    }
        
    @IBAction func presentXIBViewController(_ sender: UIButton) {
        let xibViewController = XIBViewController(nibName: "XIBViewController", bundle: nil)
        xibViewController.modalPresentationStyle = .custom
        xibViewController.transitioningDelegate = self
        animateFrom = .bottom
        present(xibViewController, animated: true, completion: nil)
    }

}

extension ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransitionAnimator(isPresenting: true, animateFrom: animateFrom)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransitionAnimator(isPresenting: false, animateFrom: animateFrom)
    }
}



