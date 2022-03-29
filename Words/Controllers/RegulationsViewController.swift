//
//  RegulationsViewController.swift
//  Words
//
//  Created by Андрей Важенов on 29.03.2022.
//

import UIKit

class RegulationsViewController: UIViewController {

    
    
    
    let scrollView = UIScrollView()
   
     lazy var labelOne: UILabel = {
        let regulationText = UILabel()
        regulationText.translatesAutoresizingMaskIntoConstraints = false
        regulationText.text = K.Regulations.paragraphOne
        regulationText.textColor = .white
        regulationText.numberOfLines = 0
        return regulationText
    }()
    
     lazy var labelTwo: UILabel = {
        let regulationText = UILabel()
        regulationText.translatesAutoresizingMaskIntoConstraints = false
        regulationText.text = K.Regulations.paragraphTwo
        regulationText.textColor = .white
        regulationText.numberOfLines = 0
        return regulationText
    }()
    
     lazy var labelThree: UILabel = {
        let regulationText = UILabel()
        regulationText.translatesAutoresizingMaskIntoConstraints = false
        regulationText.text = K.Regulations.paragraphThree
        regulationText.textColor = .white
        regulationText.numberOfLines = 0
        return regulationText
    }()
    
     lazy var labelFour: UILabel = {
        let regulationText = UILabel()
        regulationText.translatesAutoresizingMaskIntoConstraints = false
        regulationText.text = K.Regulations.paragraphFour
        regulationText.textColor = .white
        regulationText.numberOfLines = 0
        return regulationText
    }()
    
    lazy var stackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [labelOne, labelTwo, labelThree, labelFour])
            stack.spacing = 20
            stack.axis = .vertical
            stack.alignment = .center
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientLayer.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        }
    }
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        navigationController?.navigationBar.tintColor = .white
        setupView()
        setupScrollView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .clear
        view.addSubview(scrollView)
        title = "Правила"
        
    }
    
    func setupScrollView(){
            scrollView.addSubview(stackView)
            scrollView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        func setupConstraints(){
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 5/6).isActive = true
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        }
    

}
