//
//  MainTabBarController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/22/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController {
    
    private lazy var vm = MainTabBarVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTabBar()
    }
    
    private func createNavController(for viewController: UIViewController, title: String, imageName: String, id: Int) -> UINavigationController {
        let navController = AppNavigationController(rootViewController: viewController)
        navController.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName)?.resizedImage(Size: .init(width: 16, height: 16))?.withRenderingMode(.alwaysTemplate), tag: id)
        return navController
    }
    
    private func setupUI() {
        delegate = self
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .cardBackground
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Geist-medium", size: 12)!,
            .foregroundColor: UIColor.mutedForeground
        ]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Geist-medium", size: 12)!,
            .foregroundColor: UIColor.foreground
        ]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        
        tabBar.standardAppearance = appearance
        tabBar.tintColor = .foreground

        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
    private func configureTabBar() {
        viewControllers = vm.data.map { model in
            createNavController(
                for: Router.tabbarViewController(for: model.viewControllerType),
                title: model.title,
                imageName: model.image,
                id: model.id
            )
        }
        
        selectedIndex = 0
    }
}

extension MainTabBarVC:UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        return FadeTransition()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let navController = viewController as? AppNavigationController else { return }
        
        let rootViewController = navController.viewControllers.first
        
        if let collectionViewController = rootViewController as? BaseSidePageVC {
            if let collectionView = collectionViewController.view.subviews.first(where: { $0 is UICollectionView }) as? UICollectionView {
                collectionView.setContentOffset(.zero, animated: false)
            }
        }
    }
}
