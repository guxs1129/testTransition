//
//  ViewController.swift
//  testTransition
//
//  Created by 顾新生 on 16/3/11.
//  Copyright © 2016年 顾新生. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.a
        view.backgroundColor=UIColor.greenColor()
        view.addSubview(jumpBtn)
        jumpBtn.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 100, height: 35))
            make.centerX.equalTo(self.view.snp_centerX)
            make.centerY.equalTo(self.view.snp_centerY)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var jumpBtn:UIButton={
        let btn=UIButton()
        btn.setTitle("jump", forState: UIControlState.Normal)
        btn.layer.borderColor=UIColor.darkGrayColor().CGColor
        btn.layer.borderWidth=2
        btn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: "btnClick", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()

    func btnClick(){
        print(__FUNCTION__)
        let vc=SecondViewController()
//        let navi=UINavigationController(rootViewController: vc)
        vc.modalPresentationStyle=UIModalPresentationStyle.Custom
        vc.transitioningDelegate=animator
        
        presentViewController(vc, animated: true, completion: nil)
    }

    
    private lazy var animator=TransitionDelegate()
}

