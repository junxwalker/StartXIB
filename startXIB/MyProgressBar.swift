//
//  MyProgressBar.swift
//  hangge_1394
//
//  Created by hangge on 2016/10/11.
//  Copyright © 2016年 hangge. All rights reserved.
//

import UIKit

@IBDesignable class MyProgressBar: UIView {
    
    //显示进度的文本标签
    @IBOutlet weak var textLabel: UILabel!

    //显示当前进度区域
    @IBOutlet weak var bar: UIView!
    
    //进度
    @IBInspectable var percent: Int = 0 {
        didSet {
            if percent > 100 {
                percent = 100
            }else if percent < 0 {
                percent = 0
            }
            textLabel.text =  "\(percent)%"
            setNeedsLayout()
        }
    }
    
    //文本颜色
    @IBInspectable var color: UIColor = .white {
        didSet {
            textLabel.textColor = color
        }
    }
    
    //进度条颜色
    @IBInspectable var barColor: UIColor = UIColor.orange {
        didSet {
            bar.backgroundColor = barColor
        }
    }
    
    //进度条背景颜色
    @IBInspectable var barBgColor: UIColor = UIColor.lightGray {
        didSet {
            layer.backgroundColor = barBgColor.cgColor
        }
    }
    
    //初始化默认属性配置
    func initialSetup(){
        textLabel.text =  "\(self.percent)%"
        textLabel.textColor = self.color
        bar.backgroundColor = self.barColor
        layer.backgroundColor = self.barBgColor.cgColor
    }
    
    //布局相关设置
    override func layoutSubviews() {
        super.layoutSubviews()

        var barFrame = bounds
        barFrame.size.width *= (CGFloat(self.percent) / 100)
        bar.frame = barFrame
    }
    
    /*** 下面的几个方法都是为了让这个自定义类能将xib里的view加载进来。这个是通用的，我们不需修改。 ****/
    var contentView:UIView!
    
    //初始化时将xib中的view添加进来
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView = loadViewFromNib()
        addSubview(contentView)
        addConstraints()
        //初始化属性配置
        initialSetup()
    }
    
     //初始化时将xib中的view添加进来
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentView = loadViewFromNib()
        addSubview(contentView)
        addConstraints()
        //初始化属性配置
        initialSetup()
    }
    //加载xib
    func loadViewFromNib() -> UIView {
        let className = type(of: self)
        let bundle = Bundle(for: className)
        let name = NSStringFromClass(className).components(separatedBy: ".").last
        let nib = UINib(nibName: name!, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    //设置好xib视图约束
    func addConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        var constraint = NSLayoutConstraint(item: contentView, attribute: .leading,
                                    relatedBy: .equal, toItem: self, attribute: .leading,
                                    multiplier: 1, constant: 0)
        addConstraint(constraint)
        constraint = NSLayoutConstraint(item: contentView, attribute: .trailing,
                                        relatedBy: .equal, toItem: self, attribute: .trailing,
                                        multiplier: 1, constant: 0)
        addConstraint(constraint)
        constraint = NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal,
                                        toItem: self, attribute: .top, multiplier: 1, constant: 0)
        addConstraint(constraint)
        constraint = NSLayoutConstraint(item: contentView, attribute: .bottom,
                                    relatedBy: .equal, toItem: self, attribute: .bottom,
                                    multiplier: 1, constant: 0)
        addConstraint(constraint)
    }
}
