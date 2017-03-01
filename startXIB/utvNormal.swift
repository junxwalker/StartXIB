//
//  utvNormal.swift
//  startXIB
//
//  Created by jun walker on 2017/1/16.
//  Copyright © 2017年 jun walker. All rights reserved.
//


/*

 let TBviewController:UIViewController = UIStoryboard(name: "uiTableView", bundle: nil).instantiateViewController(withIdentifier: "utvNormal")
 TBviewController.view.frame = CGRect(x: 0, y: 300, width: self.view.frame.width, height: 100)
 self.view.addSubview(TBviewController.view)
 self.addChildViewController(TBviewController)

*/


import UIKit

class utvNormal: UITableViewController {
    
    
    //建立資料陣列
    var ListArray: NSArray = ["Hello world", "Swift", "UITableView", "媽!我在這裡"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 68.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        //去除单元格分隔线
        //self.eventTableView!.separatorStyle = .None
        //创建一个重用的单元格
        self.tableView.register(UINib(nibName:"eventCell", bundle:nil),forCellReuseIdentifier:"eventcell_id")

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /**
     - parameter tableView: 当前要显示的TableView
     
     - returns:  TableView中Section的个数
     */
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    /**
     返回每个Section中的Cell个数
     
     - parameter tableView: 当前显示的TableView
     - parameter section:   对应的Section
     
     - returns: 对应Section中cell的个数
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return ListArray.count
    }
    

    /**
     返回要显示的Cell
     
     - parameter tableView: cell要显示的TableView
     - parameter indexPath: cell的索引信息
     
     - returns: 返回要显示的Cell对象
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:eventCell = self.tableView.dequeueReusableCell(withIdentifier: "eventcell_id", for: indexPath) as! eventCell
        cell.cellContext.text = "\(ListArray.object(at: indexPath.row))"
        cell.cellTital.text = "\(indexPath.row)"
        
        return cell
    }
    
    
    
    //tableView代理：点击一行
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        //释放选中效果
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        print("Select \(indexPath.row)")
    }
    
    
}
