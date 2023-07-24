//
//  SceneDelegate.swift
//  FoodRecommendation
//
//  Created by 전민수 on 2023/07/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: Properties

    var window: UIWindow?

    // MARK: - Methods

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: SettingsViewController())
        window?.makeKeyAndVisible()
        setLaunchScreenImage()
    }

    // MARK: - Methods

    private func setLaunchScreenImage() {
        let launchScreenImageName = getLaunchScreenImageName()
        let launchScreenImageView = UIImageView(image: UIImage(named: launchScreenImageName))
        launchScreenImageView.contentMode = .scaleAspectFill
        launchScreenImageView.frame = UIScreen.main.bounds

        if let window = window {
            window.addSubview(launchScreenImageView)

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                UIView.animate(withDuration: 0.3, animations: {
                    launchScreenImageView.alpha = 0
                }) { _ in
                    launchScreenImageView.removeFromSuperview()
                }
            }
        }
    }

    private func getLaunchScreenImageName() -> String {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return "iPhoneLaunchScreen"
        } else {
            return "iPadLaunchScreen"
        }
    }
}

