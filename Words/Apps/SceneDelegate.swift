//
//  SceneDelegate.swift
//  Words
//
//  Created by Владимир Файб on 22.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    let viewController = WordsCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
//    viewController.game = getGame()
    window.rootViewController = UINavigationController(rootViewController: viewController)
    window.makeKeyAndVisible()
    self.window = window
  }
  
  func getGame() -> WordsBrain {
    let words = ["футбол", "каша", "карандаш", "тигр", "автобус", "прекрасный", "роза", "учитель"]
    let joke = "А вы знаете основные достоинства IT-шников? Конечно же, это высокомерие, нетерпимость и невероятная лень."
    return WordsBrain(title: "Алиас", words: words, joke: joke, time: 60)
  }
  
  func sceneDidDisconnect(_ scene: UIScene) {}
  
  func sceneDidBecomeActive(_ scene: UIScene) {}
  
  func sceneWillResignActive(_ scene: UIScene) {}
  
  func sceneWillEnterForeground(_ scene: UIScene) {}
  
  func sceneDidEnterBackground(_ scene: UIScene) {}
}

