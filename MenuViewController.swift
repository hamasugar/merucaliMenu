//
//  MenuViewController.swift
//  gyakubiki2
//
//  Created by user on 2018/07/19.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var label:UILabel = UILabel()
    let aa:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(menu))
    
    var tableView2 = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView2.delegate = self
        tableView2.dataSource = self
        print ("kidou")
        
        
        label.frame = CGRect(x: -50, y: 100, width: 60, height: 100)
        label.center = CGPoint(x: 50.0, y: 30.0)
        label.backgroundColor = UIColor.red
        label.text = "aaa"
        self.view.addSubview(label)
        
        let aa:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.menu))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(aa)
        
        
        tableView2.frame = CGRect(x: -300, y: 0, width: 300, height: self.view.frame.size.height)
        tableView2.backgroundColor = UIColor.orange
        tableView2.dequeueReusableCell(withIdentifier: "aa")
        tableView2.register(UITableViewCell.self, forCellReuseIdentifier: "aa")
        tableView2.estimatedRowHeight = 90
        tableView2.rowHeight = UITableViewAutomaticDimension
        tableView2.separatorColor = UIColor.white
        self.view.addSubview(tableView2)
       
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func menu(sender:UIPanGestureRecognizer){
        print ("yoko")
        var idouyoko = sender.translation(in: view)
       
        if idouyoko.x>50 && self.tableView2.center.x<0{
            
             print (self.label.center.x)
            UIView.animate(withDuration: 0.5, delay:0.0, animations: {
                () -> Void in
                print (self.label.center.x)
                print (self.label.center.y)
                
                self.label.center.x += 50.0
                
                
          },completion:nil)
          
            UIView.animate(withDuration: 0.5, delay:0.0, animations: {
                () -> Void in
                
                
                self.tableView2.center.x += 300.0
                
                
            },completion:nil)
            
            
            
            
        }
            
        if idouyoko.x < -50 && self.tableView2.center.x>0{
            
        
            UIView.animate(withDuration: 0.5, delay:0.0, animations: {
                () -> Void in
                print (self.label.center.x)
                print (self.label.center.y)
                
                self.label.center.x -= 50.0
                
                
            },completion:nil)
            
            
            UIView.animate(withDuration: 0.5, delay:0.0, animations: {
                () -> Void in
                print (self.label.center.x)
                print (self.label.center.y)
                
                self.tableView2.center.x -= 300.0
                
                
            },completion:nil)
            
            
            
            
            
        }
        
            
            
    }
    
    let sentence = ["               山田太郎","ホーム","ニュース","いいね","購入した商品","設定","ガイド","お問い合わせ","招待してポイントGET"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sentence.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        
        if indexPath.row == 0{
        
        let  cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "aa", for: indexPath)
        cell.textLabel?.text = sentence[indexPath.row]
        cell.backgroundColor = UIColor.orange
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 26)
        cell.textLabel?.textAlignment = .left
        
        let circle = UILabel()
        circle.frame = CGRect(x: 10, y: 20, width: 80, height: 80)
        circle.layer.masksToBounds = true
        circle.layer.cornerRadius = 40
        circle.backgroundColor = UIColor.brown
        cell.addSubview(circle)
        cell.layoutIfNeeded()
            
        return cell
        }
        else{
            
            let  cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "aa", for: indexPath)
            cell.textLabel?.text = sentence[indexPath.row]
            cell.backgroundColor = UIColor.orange
            cell.textLabel?.textColor = UIColor.white
            cell.textLabel?.font = UIFont.systemFont(ofSize: 23)
            cell.textLabel?.textAlignment = .left
            cell.layoutIfNeeded()
            
            return cell
            
            
            
        }
        
        
        
        
       
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if indexPath.row == 0{
            let firstheight:CGFloat = 120
            return firstheight
        }
        
        else{
            let firstheight2:CGFloat = 70
            return firstheight2
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goto", sender: nil)
        
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
