//
//  CollectionViewController.swift
//  lesson1 UI
//
//  Created by Дмитрий Виноградов on 19.09.2021.
//

import UIKit

class CollectionController: UIViewController {
   
    @IBOutlet weak var collectionView: UICollectionView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CollectionController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    
    
}

/*
extension CollectionController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
}
*/
