//
//  RecommendedBookViewController.swift
//  NowIAmReading
//
//  Created by Leandro Silva on 7/29/15.
//  Copyright (c) 2015 The Daddy. All rights reserved.
//

import UIKit

class RecommendedBookViewController: UIViewController {

    @IBOutlet weak var bookPicture: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookRecommendedBy: UILabel!
    @IBOutlet weak var bookRecommendationText: UITextView!
    
    @IBOutlet weak var bookRating1: UIButton!
    @IBOutlet weak var bookRating2: UIButton!
    @IBOutlet weak var bookRating3: UIButton!
    @IBOutlet weak var bookRating4: UIButton!
    @IBOutlet weak var bookRating5: UIButton!
    
    var book:Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);

        bookPicture.image = UIImage(named: book!.picture)
        bookTitle.text = book!.title
        bookAuthor.text = book!.author
        bookRecommendedBy.text = book!.recommendedBy
        bookRecommendationText.text = book!.recommendationText
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -220
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rate(sender: UIButton) {
        switch sender {
        case bookRating1:
            println("rating 1")
            break
        case bookRating2:
            println("rating 2")
            break
        case bookRating3:
            println("rating 3")
            break
        case bookRating4:
            println("rating 4")
            break
        case bookRating5:
            println("rating 5")
            break
        default:
            println("rating 0")
        }
    }
    
    @IBAction func recommend(sender: UIButton) {
        println("recommend")
    }
    
    @IBAction func shareOnFacebook(sender: UIButton!) {
        println("shareOnFacebook")
    }
    
    @IBAction func shareOnTwitter(sender: UIButton!) {
        println("shareOnTwitter")
    }
    
    @IBAction func shareOnInstagram(sender: UIButton!) {
        println("shareOnInstagram")
    }
    
    @IBAction func postComment(sender: UIButton) {
        println("postComment")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
