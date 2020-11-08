//
//  CitiesCollectionViewDataSource.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 8.11.2020.
//

import UIKit

class CitiesCollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Sadece İstanbul
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
