//
//  XVView.swift
//  StoryBoardXibDemo
//
//  Created by tb on 15/11/2.
//  Copyright © 2015年 Yasin. All rights reserved.
//

import UIKit
@IBDesignable class XVView: UIView {
    @IBOutlet fileprivate var contView: UIView!
    
    @IBOutlet fileprivate weak var imageTitleLabel: UILabel!
    @IBOutlet fileprivate weak var imageView: UIImageView!
    
    @IBInspectable var imageTitle:String?
        {
        get {
            return imageTitleLabel.text
        }
        set(newTitle){
            imageTitleLabel.text = newTitle
        }
    }
    @IBInspectable var image:UIImage?
        {
        get {
            return imageView.image
        }
        set(newImage) {
            imageView.image = newImage
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
        let nib = UINib(nibName: "XVView", bundle: bundle)
        contView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        contView.frame = bounds
        self.addSubview(contView)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
