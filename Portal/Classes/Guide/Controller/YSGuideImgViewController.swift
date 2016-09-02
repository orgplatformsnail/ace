//
//  YSGuideImgViewController.swift
//  Portal
//
//  Created by 陈晓克 on 16/9/2.
//  Copyright © 2016年 陈晓克. All rights reserved.
//

/// 具体承载引导图片的VC
import UIKit
class YSGuideImgViewController: UIViewController {
    
    private(set) lazy var imgview:UIImageView = {
        return UIImageView.init(frame:self.view.bounds)
    }()
    
    private(set) lazy var beginBtn:UIButton = {
        return UIButton(type:.Custom)
    }()
    /**
     重写了初始化方法
     
     - parameter imgName: 使用到的图片名称
     - parameter frame:   图片的frame
     - parameter showBtn: 是否展示开始体验的按钮
     
     - returns:
     */
    init(imgName:String, frame:CGRect, showBtn:Bool){
        super.init(nibName: nil, bundle: nil)
        self.view.frame = frame
        self.view.addSubview(self.imgview)
        self.imgview.image = UIImage(named: imgName)
        
        self.beginBtn.frame = CGRectMake((self.view.bounds.width-174)/2, self.view.bounds.height-40-82, 174, 42)
        self.beginBtn.setImage(UIImage(named:"icon_pin"), forState: .Normal)
        self.beginBtn.addTarget(self, action:#selector(beginBtnClicked), forControlEvents: .TouchUpInside)
        self.view.addSubview(self.beginBtn)
        self.beginBtn.hidden = !showBtn
    }
    
    /**
     按钮点击事件
     */
    func beginBtnClicked() {
        let storyboard:UIStoryboard =  UIStoryboard(name: "Portal", bundle: nil)
        presentViewController(storyboard.instantiateViewControllerWithIdentifier("ram"), animated: false, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
