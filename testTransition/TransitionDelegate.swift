//
//  TransitionDelegate.swift
//  testTransition
//
//  Created by 顾新生 on 16/3/15.
//  Copyright © 2016年 顾新生. All rights reserved.
//
/// 用来描述转场动画设置
import UIKit

class TransitionDelegate: NSObject {
    var isPresent:Bool=false
}
extension TransitionDelegate:UIViewControllerTransitioningDelegate{
    @available(iOS 2.0, *)
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        print(__FUNCTION__)

        isPresent=true
        return self
    }
    
    @available(iOS 2.0, *)
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        print(__FUNCTION__)
        isPresent=false
        return self
    }
    

    @available(iOS 8.0, *)
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?{
        print(__FUNCTION__)
        return PresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}

extension TransitionDelegate:UIViewControllerAnimatedTransitioning{
    // This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
    // synchronize with the main animation.
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{
        return 0.5
    }
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(transitionContext: UIViewControllerContextTransitioning){
        print(__FUNCTION__)

        if isPresent{
            
            let toView=transitionContext.viewForKey(UITransitionContextToViewKey)
            print(toView)
            toView?.transform=CGAffineTransformMakeTranslation(0.0, -300)
            transitionContext.containerView()?.addSubview(toView!)
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                toView?.transform=CGAffineTransformIdentity
                }, completion: { (_) -> Void in
                    transitionContext.completeTransition(true)
            })
        }else{
            let fromView=transitionContext.viewForKey(UITransitionContextFromViewKey)
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                fromView?.transform=CGAffineTransformMakeTranslation(0.0, -300)
                }, completion: { (_) -> Void in
                    transitionContext.completeTransition(true)
            })
        }

        
    }
    
    // This is a convenience and if implemented will be invoked by the system when the transition context's completeTransition: method is invoked.
    func animationEnded(transitionCompleted: Bool){
        print(__FUNCTION__)

    }
    


}