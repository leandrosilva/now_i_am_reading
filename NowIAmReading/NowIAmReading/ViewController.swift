//
//  ViewController.swift
//  NowIAmReading
//
//  Created by Leandro Silva on 7/28/15.
//  Copyright (c) 2015 The Daddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SidebarDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var recommendedBookTableView: UITableView!
    
    var sidebar:Sidebar = Sidebar()
    var recommendedBooks:Array<Book> = [Book(picture: "batman_logo.png", title: "Batman Begins", author: "Zé Guaruis", recommendedBy: "Bruce Wayne", recommendationText: "Lorem ipsum", rating: 3), Book(picture: "batman_logo.png", title: "Batman Dark Knight", author: "Zé Panguan", recommendedBy: "Leandro Silva", recommendationText: "Lorem ipsum", rating: 5)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sidebar = Sidebar(sourceView: self.view, menuItems: ["Home", "Profile", "Readings", "Friends"])
        sidebar.delegate = self
        
        recommendedBookTableView.delegate = self
        recommendedBookTableView.dataSource = self
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
        return recommendedBooks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = recommendedBookTableView.dequeueReusableCellWithIdentifier("RecommendedBookCell", forIndexPath: indexPath) as! RecommendedBookTableViewCell
        
        cell.bookPicture.image = UIImage(named: recommendedBooks[indexPath.row].picture)
        cell.bookTitle.text = recommendedBooks[indexPath.row].title
        cell.bookAuthor.text = recommendedBooks[indexPath.row].author
        cell.bookRecommendedBy.text = "by " + recommendedBooks[indexPath.row].recommendedBy
        cell.bookRating.text = String(recommendedBooks[indexPath.row].rating)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        recommendedBookTableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.performSegueWithIdentifier("RecommendedBook", sender: self)
    }
}

