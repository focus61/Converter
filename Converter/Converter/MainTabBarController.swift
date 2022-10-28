//
//  ViewController.swift
//  Converter
//
//  Created by Aleksandr on 24.10.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {
    private let networkService: NetworkService = .init()
    private enum Constants: String {
        case cryptoTitle = "Crypto"
        case cryptoImageName = "bitcoinsign"
        case converterTitle = "Converter"
        case coverterImageName = "dollarsign"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        viewControllers = viewControllersConfigure()
//        networkService.getList { result in
//            switch result {
//            case .success(let newData):
//                print(newData)
//            case .failure(let newError):
//                print(newError.localizedDescription)
//            }
//        }
    }
    private func viewControllersConfigure() -> [UIViewController] {
        let firstVC = CryptoConverterViewController()
        let firstNavCont = tabBarControllersConfig(viewController: firstVC, title: Constants.cryptoTitle.rawValue, imageName: Constants.cryptoImageName.rawValue)
        let secondVC = ConverterViewController()
        let secondNavCont = tabBarControllersConfig(viewController: secondVC, title: Constants.converterTitle.rawValue, imageName: Constants.coverterImageName.rawValue)
        return [firstNavCont, secondNavCont]
    }
    private func tabBarControllersConfig(
        viewController: UIViewController,
        title: String,
        imageName: String
    ) -> UINavigationController {
        viewController.tabBarItem.image = UIImage(systemName: imageName)
        viewController.tabBarItem.title = title
        return UINavigationController(rootViewController: viewController)
    }
}
