//
//  Sidebar.swift
//  BlurrySidebar
//
//  Created by Leandro Silva on 7/27/15.
//  Copyright (c) 2015 The Daddy. All rights reserved.
//

import UIKit

@objc protocol SidebarDelegate {
    func sidebarDidSelectButtonAtIndex(index:Int)
    optional func sidebarWillClose()
    optional func sidebarWillOpen()
}

class Sidebar: NSObject, SidebarTableViewControllerDelegate {
    
    let barWidth:CGFloat = 150.0
    let sidebarTableViewTopInset:CGFloat = 64.0
    let sidebarContainerView:UIView = UIView()
    let sidebarTableViewController:SidebarTableViewController = SidebarTableViewController()

    var originView:UIView?
    var animator:UIDynamicAnimator?
    var delegate:SidebarDelegate?
    var isSidebarOpen:Bool = false
    
    override init() {
        super.init()
    }
    
    init(sourceView:UIView, menuItems:Array<String>) {
        super.init()
        
        originView = sourceView
        sidebarTableViewController.tableData = menuItems
        animator = UIDynamicAnimator(referenceView: originView!)
        
        setupSidebar()
        
        let showGestureRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleSwipe:")
        showGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Right
        originView!.addGestureRecognizer(showGestureRecognizer)
        
        let hideGestureRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleSwipe:")
        hideGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        originView!.addGestureRecognizer(hideGestureRecognizer)
    }
    
    func setupSidebar() {
        sidebarContainerView.frame = CGRectMake(-barWidth - 1, originView!.frame.origin.y, barWidth, originView!.frame.size.height)
        sidebarContainerView.backgroundColor = UIColor.clearColor()
        sidebarContainerView.clipsToBounds = false
        
        originView!.addSubview(sidebarContainerView)
        
        let blurryView:UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        blurryView.frame = sidebarContainerView.bounds
        sidebarContainerView.addSubview(blurryView)
        
        sidebarTableViewController.delegate = self
        sidebarTableViewController.tableView.frame = sidebarContainerView.bounds
        sidebarTableViewController.tableView.clipsToBounds = false
        sidebarTableViewController.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        sidebarTableViewController.tableView.backgroundColor = UIColor.clearColor()
        sidebarTableViewController.tableView.scrollsToTop = false
        sidebarTableViewController.tableView.contentInset = UIEdgeInsetsMake(sidebarTableViewTopInset, 0, 0, 0)
        sidebarTableViewController.tableView.delegate = sidebarTableViewController
        sidebarTableViewController.tableView.reloadData()
        sidebarContainerView.addSubview(sidebarTableViewController.tableView)
    }
    
    func handleSwipe(recognizer:UISwipeGestureRecognizer) {
        if recognizer.direction == UISwipeGestureRecognizerDirection.Left {
            showSidebar(false)
            delegate?.sidebarWillClose?()
        } else {
            showSidebar(true)
        }
    }
    
    func showSidebar(shouldOpen:Bool) {
        animator!.removeAllBehaviors()
        isSidebarOpen = shouldOpen
        
        let gravityX:CGFloat = (shouldOpen) ? 0.5 : -0.5
        let magnitude:CGFloat = (shouldOpen) ? 20 : -20
        let boundaryX:CGFloat = (shouldOpen) ? barWidth : -barWidth - 1
        
        let gravityBehavior:UIGravityBehavior = UIGravityBehavior(items: [sidebarContainerView])
        gravityBehavior.gravityDirection = CGVectorMake(gravityX, 0)
        animator!.addBehavior(gravityBehavior)
        
        let collisionBehavior:UICollisionBehavior = UICollisionBehavior(items: [sidebarContainerView])
        collisionBehavior.addBoundaryWithIdentifier("sidebarBoundary", fromPoint: CGPointMake(boundaryX, 20), toPoint: CGPointMake(boundaryX, originView!.frame.size.height))
        animator!.addBehavior(collisionBehavior)
        
        let pushBehavior:UIPushBehavior = UIPushBehavior(items: [sidebarContainerView], mode: UIPushBehaviorMode.Instantaneous)
        pushBehavior.magnitude = magnitude
        animator!.addBehavior(pushBehavior)
        
        let sidebarBehavior:UIDynamicItemBehavior = UIDynamicItemBehavior(items: [sidebarContainerView])
        sidebarBehavior.elasticity = 0.3
        animator!.addBehavior(sidebarBehavior)
    }
    
    func sidebarControlDidSelectRow(indexPath: NSIndexPath) {
        delegate?.sidebarDidSelectButtonAtIndex(indexPath.row)
    }
}
