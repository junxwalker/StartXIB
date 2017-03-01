//
//  btn_Image.swift
//  startXIB
//
//  Created by jun walker on 2017/1/18.
//  Copyright © 2017年 jun walker. All rights reserved.
//

import UIKit
@IBDesignable class btnImage: UIView {

    @IBOutlet fileprivate var view: UIView!
    
    @IBOutlet var btn: UIButton!
    
    @IBAction func btn_event(_ sender: Any) {
        print("(btnImage) press button")
    }
        
    @IBInspectable var image:UIImage?
        {
        get {
            return btn.image(for: UIControlState.normal)
        }
        set(newImage) {
            btn.setImage(newImage, for: UIControlState.normal)
        }
    }
    @IBInspectable var highlightedImage:UIImage?
        {
        get {
            return btn.image(for: UIControlState.highlighted)
        }
        set(highlightedImage){
            btn.setImage(highlightedImage, for: UIControlState.highlighted)
        }
    }

    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initFromXIB()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initFromXIB()
    }
    
    
    func initFromXIB() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "btnImage", bundle: bundle)
        view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        self.addSubview(view)
    }
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
}

