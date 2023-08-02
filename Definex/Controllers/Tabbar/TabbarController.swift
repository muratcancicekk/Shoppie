//
//  TabbarController.swift
//  Definex
//
//  Created by Murat Çiçek on 31.07.2023.
//

import UIKit

final class TabbarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupUI()
        setupTabs()
        self.tabBar.backgroundColor = .white
        selectedIndex = 0
        // Do any additional setup after loading the view.
    }

}
extension TabbarController {
    func setupUI() {
        let tabbarItem = UITabBarItem.appearance()
        tabbarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 4)

        let normalAttributes = [NSAttributedString.Key.font: Fonts.shared.robotoMedium14,
                                NSAttributedString.Key.foregroundColor: UIColor.clear]
        tabbarItem.setTitleTextAttributes(normalAttributes as [NSAttributedString.Key: Any], for: .normal)
        let selectedAttributes = [NSAttributedString.Key.font: Fonts.shared.robotoMedium14,
                                  NSAttributedString.Key.foregroundColor: UIColor.black]
        tabbarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
    }
    
    // MARK: - Install tabbar
    func setupTabs() {
        let discoverVC = HomeViewController()
        let discover = createNavController(for: discoverVC,
                                              headerImage: "",
                                              title: "TAB_DISCOVER".localized(),
                                              image: UIImage(systemName: "bag"),
                                              selectedImage: UIImage(systemName: "bag.fill"))

        let emptyVC = EmptyViewController()
        let empty1 = createNavController(for: emptyVC,
                                            headerImage: "",
                                            title: "TAB_EMPTY".localized(),
                                            image: UIImage(systemName: "book"),
                                            selectedImage: UIImage(systemName: "book.fill"))
        let emptyVC2 = EmptyViewController()

        let empty2 = createNavController(for: emptyVC2,
                                               headerImage: "",
                                               title: "TAB_EMPTY".localized(),
                                               image: UIImage(named: "liveChatIcon"),
                                               selectedImage: UIImage(named: "liveChatIcon"))
        let emptyVC3 = EmptyViewController()

        let empty3 = createNavController(for: emptyVC3, headerImage: "",
                                               title: "TAB_EMPTY".localized(),
                                               image: UIImage(named: "profileIcon"),
                                               selectedImage: UIImage(named: "profileIcon"))
        let emptyVC4 = EmptyViewController()

        let empty4 = createNavController(for: emptyVC3, headerImage: "",
                                               title: "TAB_EMPTY".localized(),
                                               image: UIImage(named: "profileIcon"),
                                               selectedImage: UIImage(named: "profileIcon"))
        self.viewControllers = [discover, empty1, empty2 , empty3, empty4]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         headerImage: String? = nil,
                                         title: String,
                                         image: UIImage?, selectedImage: UIImage?) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage

        return navController
    }
}
