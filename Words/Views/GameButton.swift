//
//  GameButton.swift
//  Words
//
//  Created by Владимир Файб on 22.03.2022.
//

import UIKit

class GameButton: UIButton {
  func configure(width: Double = 120, color: UIColor = .systemGreen, image: String = "checkmark") {
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 0.4 * width, weight: .bold, scale: .large)
    let largeBoldDoc = UIImage(systemName: image, withConfiguration: largeConfig)
    setImage(largeBoldDoc, for: .normal)
    backgroundColor = color
    tintColor = .white
    layer.cornerRadius = width / 2
    layer.shadowColor = UIColor.lightGray.cgColor
    layer.shadowOffset = CGSize(width: 1, height: 1)
    layer.shadowOpacity = 0.5
    layer.shadowRadius = 1.0
    anchor(width: width, height: width)
  }
}
