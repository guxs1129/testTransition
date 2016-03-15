//
//  PresentationController.swift
//  testTransition
//
//  Created by 顾新生 on 16/3/15.
//  Copyright © 2016年 顾新生. All rights reserved.
//
/// 负责转场视图控制
import UIKit

class PresentationController: UIPresentationController {

    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        print(__FUNCTION__)

    }
    
    override func containerViewWillLayoutSubviews() {
        containerView?.insertSubview(btnView, atIndex: 0)
        btnView.frame=(containerView?.bounds)!
        presentedView()?.frame=CGRect(x: 100, y: 30, width: 200, height: 200)
    }
    
    private lazy var btnView:UIView = {
        print(self.presentedViewController)
        let view=UIView()
        view.backgroundColor=UIColor(white: 0.5, alpha: 0.5)
        let tap=UITapGestureRecognizer(target: self, action: "close")
        view.addGestureRecognizer(tap)
        return view
    }()
    func close(){
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
