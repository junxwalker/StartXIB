//
//  ViewController.swift
//  startXIB
//
//  Created by jun walker on 2017/1/14.
//  Copyright © 2017年 jun walker. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    /*
        let serBoard = Bundle.main.loadNibNamed("servicesBoard", owner: nil, options: nil)?.first as? servicesBoard
        serBoard?.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 70)
        self.view.addSubview(serBoard!)
        
        
        let yesnoBoard = Bundle.main.loadNibNamed("yesnoBoard", owner: nil, options: nil)?.first as? yesnoBoard
        yesnoBoard?.frame = CGRect(x: 0, y: 230, width: self.view.frame.width, height: 30)
        self.view.addSubview(yesnoBoard!)
        yesnoBoard?.delegate = self
        
        
        let TBviewController:UIViewController = UIStoryboard(name: "uiTableView", bundle: nil).instantiateViewController(withIdentifier: "utvNormal")
        TBviewController.view.frame = CGRect(x: 0, y: 300, width: self.view.frame.width, height: 100)
        self.view.addSubview(TBviewController.view)
        self.addChildViewController(TBviewController)
   */
   /*
        let image_btn = Bundle.main.loadNibNamed("btn_Image", owner: nil, options: nil)?.first as? btn_Image
        image_btn?.frame = CGRect(x: 100, y: 420, width: (image_btn?.frame.height)!, height: (image_btn?.frame.height)!)
//        image_btn?.btn.setImage(UIImage(named: "Video-Camera-2.png"), for: UIControlState.highlighted)
        self.view.addSubview(image_btn!)
*/
        
        
        
        
        let upView:UIView = {
            $0.backgroundColor = UIColor.red
            $0.frame = CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width, height:200)
 //           $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        } (UIView())
        self.view.addSubview(upView)
        let barView:UIView = {
            $0.backgroundColor = UIColor.blue
            $0.frame = CGRect(x: 0, y: 200, width:UIScreen.main.bounds.width, height:50)
//            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        } (UIView())
        self.view.addSubview(barView)
        let downView:UIView = {
            $0.backgroundColor = UIColor.yellow
            $0.frame = CGRect(x: 0, y: 250, width:UIScreen.main.bounds.width, height:200)
//            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        } (UIView())
        self.view.addSubview(downView)
        
        upView.addConstraint(NSLayoutConstraint(item: upView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: barView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0)
                              )
        downView.addConstraint(NSLayoutConstraint(item: downView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: barView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0)
        )
        
        
        // 拖曳手勢
        let pan = UIPanGestureRecognizer(target:self,action:#selector(ViewController.pan(_:)))
        pan.minimumNumberOfTouches = 1
        pan.maximumNumberOfTouches = 1
        barView.addGestureRecognizer(pan)
        
/*
        let tpuVC:UIViewController = UIStoryboard(name: "Popup", bundle: nil).instantiateViewController(withIdentifier: "testPopup")
        tpuVC.view.frame = CGRect(x: 100, y: 350, width: 200, height: 100)
        tpuVC.view.alpha = 1
        self.view.addSubview(tpuVC.view)
        self.addChildViewController(tpuVC)
*/
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gotovc(_ sender: Any) {
  //      let viewController:UIViewController = UIStoryboard(name: "login", bundle: nil).instantiateViewController(withIdentifier: "loginVC")
  //      self.present(viewController, animated: true, completion: nil)
        
        
        let viewController:UIViewController = UIStoryboard(name: "uiTableView", bundle: nil).instantiateViewController(withIdentifier: "utvNormal")
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch: AnyObject in touches {
            var t:UITouch = touch as! UITouch
            print("item: ", t)
        }
    }

    
    // 觸發拖曳手勢後 執行的動作
    func pan(_ recognizer:UIPanGestureRecognizer) {
        // 設置 UIView 新的位置
        let point = recognizer.location(in: self.view)
        //anotherUIView.center = point
        //print(recognizer.view?.center)
        //print(point)
        recognizer.view?.center.y = point.y
        
        self.view.setNeedsLayout()
        
    }
    
}

