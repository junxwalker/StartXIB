//
//  yesnoBoard.swift
//  testXIB
//
//  Created by jun walker on 2016/12/11.
//  Copyright © 2016年 jun walker. All rights reserved.
//


/*
 
 let yesnoBoard = Bundle.main.loadNibNamed("yesnoBoard", owner: nil, options: nil)?.first as? yesnoBoard
 yesnoBoard?.frame = CGRect(x: 0, y: 230, width: self.view.frame.width, height: 30)
 self.view.addSubview(yesnoBoard!)
 yesnoBoard?.delegate = self
 
 
 */

import UIKit

class yesnoBoard: UIView {
    
    @IBOutlet  weak var yesButton: UIButton!
    @IBOutlet  weak var noButton: UIButton!
    
    var delegate:UIViewController?
    
    
    @IBAction func yesAction(_ sender: Any) {
        print("touch Yes Button")
        let viewController:UIViewController = UIStoryboard(name: "uiTableView", bundle: nil).instantiateViewController(withIdentifier: "utvNormal")
        self.delegate!.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func noAction(_ sender: Any) {
        print("touch No Button")
    }
    
}
