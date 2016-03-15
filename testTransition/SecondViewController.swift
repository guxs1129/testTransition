//
//  SecondViewController.swift
//  testTransition
//
//  Created by 顾新生 on 16/3/15.
//  Copyright © 2016年 顾新生. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.grayColor()
        
//        let backItem=UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: "close")
//        navigationItem.leftBarButtonItem=backItem
        
        view.addSubview(jumpBtn)
        jumpBtn.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 100, height: 35))
            make.centerX.equalTo(self.view.snp_centerX)
            make.centerY.equalTo(self.view.snp_centerY)
        }
    }
    func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    private lazy var jumpBtn:UIButton={
        let btn=UIButton()
        btn.setTitle("返回", forState: UIControlState.Normal)
        btn.layer.borderColor=UIColor.darkGrayColor().CGColor
        btn.layer.borderWidth=2
        btn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: "close", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print(__FUNCTION__)
    }
    
}
