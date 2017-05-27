//
//  ViewController.swift
//  DCSidebar
//
//  Created by Alex on 2017/5/26.
//  Copyright © 2017年 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sidebar:DCSidebar? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 250.0, height: UIScreen.main.bounds.height))
        view.backgroundColor = UIColor.blue
        view.addSubview(menuTableview)
        
        sidebar = DCSidebar(sideView: view)
        sidebar?.showAnimationsTime = 0.2
        sidebar?.hideAnimationsTime = 0.2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    lazy var menuTableview: UITableView = {
        let mTV = UITableView(frame: CGRect.init(x: 0, y: 64, width: 250.0, height: UIScreen.main.bounds.height-64))
        mTV.delegate = self
        mTV.dataSource = self
        return mTV
    }()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Category "+String(indexPath.row+1)
        tableView.tableFooterView = UIView()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        print(indexPath.row)
        
        sidebar?.hide()
        
        let alert = UIAlertController(title: "tap", message: String(indexPath.row+1), preferredStyle: .alert)
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func showButtonTouchUpInside(_ sender: Any) {
        sidebar?.show()
    }
    
    @IBAction func screenEdgePanGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state == .ended {
            sidebar?.show()
        }
    }
}

