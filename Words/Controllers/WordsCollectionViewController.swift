//
//  WordsCollectionViewController.swift
//  Words
//
//  Created by Владимир Файб on 25.03.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class WordsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureUI()
    }

    private func configureUI() {
        configureNavigationBar()
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    private func configureNavigationBar() {
        title = "Alias"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
    }

    
    @objc func addAction() {
        print("Add")
    }
    
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        cell.backgroundColor = .red

        return cell
    }

    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let joke = "А вы знаете основные достоинства IT-шников? Конечно же, это высокомерие, нетерпимость и невероятная лень."
        NetworkManager.shared.getAlias(index: 0) { alias in
            if let alias = alias {
                DispatchQueue.main.async {
                    let viewController = ViewController()
                    viewController.game = WordsBrain(title: alias.title, words: alias.words, joke: joke, time: 60)
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }
        }
        
    }
}
