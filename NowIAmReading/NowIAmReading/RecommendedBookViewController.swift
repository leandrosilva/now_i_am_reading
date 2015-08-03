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
    
    @IBOutlet weak var comment: UITextField!
    
    var book:Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil);

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "dismissKeyboard"))

        bookPicture.image = UIImage(named: book!.picture)
        bookTitle.text = book!.title
        bookAuthor.text = book!.author
        bookRecommendedBy.text = book!.recommendedBy
        bookRecommendationText.text = book!.recommendationText
        
        setBookRating(book!.rating)
    }
    
    func setBookRating(rating: Int) {
        book?.rating = rating
        
        let ratingButtons: Array<UIButton> = [bookRating1, bookRating2, bookRating3, bookRating4, bookRating5]
        
        for i in 0...4 {
            deselectRatingButton(ratingButtons[i])
        }
        
        if rating > 0 {
            for i in 0...(rating - 1) {
                selectRatingButton(ratingButtons[i])
            }
        }
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -220
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }

    func dismissKeyboard() {
        comment.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rate(sender: UIButton) {
        switch sender {
        case bookRating1:
            if book?.rating == 0 {
                setBookRating(1)
            } else if book?.rating == 1 {
                setBookRating(0)
            } else {
                setBookRating(1)
            }
            
            break
        case bookRating2:
            setBookRating(2)
            break
        case bookRating3:
            setBookRating(3)
            break
        case bookRating4:
            setBookRating(4)
            break
        case bookRating5:
            setBookRating(5)
            break
        default:
            setBookRating(0)
        }
    }
    
    func isRatingButtonSelected(ratingButton: UIButton) -> Bool {
        if ratingButton.titleLabel?.text == "★" {
            return true
        } else {
            return false
        }
    }
    
    func selectRatingButton(ratingButton: UIButton) {
        ratingButton.setTitle("★", forState: UIControlState.Normal)
    }
    
    func deselectRatingButton(ratingButton: UIButton) {
        ratingButton.setTitle("☆", forState: UIControlState.Normal)
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
}
