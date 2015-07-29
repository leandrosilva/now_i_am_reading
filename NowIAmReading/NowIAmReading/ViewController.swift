//
//  ViewController.swift
//  NowIAmReading
//
//  Created by Leandro Silva on 7/28/15.
//  Copyright (c) 2015 The Daddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SidebarDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var sharedBookTableView: UITableView!
    
    var sidebar:Sidebar = Sidebar()
    var sharedBooks:Array<Book> = [Book(picture: "batman_logo.png", title: "Batman Begins", author: "Zé Guaruis", sharedBy: "Bruce Wayne", rating: 3), Book(picture: "batman_logo.png", title: "Batman Dark Knight", author: "Zé Panguan", sharedBy: "Leandro Silva", rating: 5)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sidebar = Sidebar(sourceView: self.view, menuItems: ["Home", "Profile", "Readings", "Friends"])
        sidebar.delegate = self
        
        sharedBookTableView.delegate = self
        sharedBookTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggleMenu(sender: UIBarButtonItem) {
        sidebar.showSidebar(!sidebar.isSidebarOpen)
    }
    
    func sidebarDidSelectButtonAtIndex(index:Int) {
        switch index {
        case 0:
            println(index+1)
            break
        case 1:
            println(index+1)
            break
        case 2:
            println(index+1)
            break
        case 3:
            println(index+1)
            break
        default:
            println(index+1)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedBooks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = sharedBookTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SharedBookTableViewCell
        
        cell.bookPicture.image = UIImage(named: sharedBooks[indexPath.row].picture)
        cell.bookTitle.text = sharedBooks[indexPath.row].title
        cell.bookAuthor.text = sharedBooks[indexPath.row].author
        cell.bookSharedBy.text = sharedBooks[indexPath.row].sharedBy
        cell.bookRating.text = String(sharedBooks[indexPath.row].rating)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        sharedBookTableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.performSegueWithIdentifier("SharedBook", sender: self)
    }
}

