//
//  HourlyWeatherCollectionViewDataSource.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 8.11.2020.
//

import UIKit

class HourlyWeatherCollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
