//
//  TabBarController.swift
//  New Tab Bar Sample with UIKit
//
//  Created by eiji.shirakazu on 2024/12/16.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mode = .tabSidebar
        
        let collectionsGroup = UITabGroup(
            title: "Collections",
            image: UIImage(systemName: "folder"),
            identifier: "Tabs.CollectionsGroup",
            children: collectionsTabs()) { _ in
                let storyboard = UIStoryboard(name: "ThirdViewController", bundle: nil)
                return storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        }
        
        collectionsGroup.sidebarActions = [
            UIAction(title: "New Tab", image: UIImage(systemName: "plus.square")) { _ in
                // add new tab function...
            }
        ]

        tabs = [
            UITab(title: "First View", image: UIImage(systemName: "1.circle"), identifier: "Tabs.firstView") { _ in
                let storyboard = UIStoryboard(name: "FirstViewController", bundle: nil)
                return storyboard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
            },
            UITab(title: "Second View", image: UIImage(systemName: "2.circle"), identifier: "Tabs.secondView") { _ in
                let storyboard = UIStoryboard(name: "SecondViewController", bundle: nil)
                return storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            },
            collectionsGroup,
            UISearchTab { _ in
                let storyboard = UIStoryboard(name: "SearchViewController", bundle: nil)
                return storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
            }
        ]
    }
    private func collectionsTabs() -> [UITab] {
        [
            UITab(title: "Third View", image: UIImage(systemName: "3.circle"), identifier: "Tabs.thirdView") { _ in
                let storyboard = UIStoryboard(name: "ThirdViewController", bundle: nil)
                return storyboard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
            },
            UITab(title: "Forth View", image: UIImage(systemName: "4.circle"), identifier: "Tabs.forthView") { _ in
                let storyboard = UIStoryboard(name: "ForthViewController", bundle: nil)
                return storyboard.instantiateViewController(withIdentifier: "ForthViewController") as! ForthViewController
            }
        ]
    }
}
