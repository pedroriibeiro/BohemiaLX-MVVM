//
//  FirstVC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 20/06/2024.
//

import UIKit

class FirstVC: UIViewController {
    
    var firstScreen: FirstScreen?
    
    var images: [UIImage?] = [
          UIImage(systemName: "book.fill"),
          UIImage(systemName: "clock.fill"),
          UIImage(systemName: "list.clipboard.fill"),
          UIImage(systemName: "gearshape.fill"),
      ]
    
    var labels: [String] = [
           "Reservas",
           "Lembretes",
           "Lista de faltas",
           "Configurações"
       ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
        firstScreen?.configHomeCollection(delegate: self, dataSource: self)
    }
    
    override func loadView() {
        firstScreen = FirstScreen()
        view = firstScreen
    }
    

}

extension FirstVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCell.identifier, for: indexPath) as? FirstCell
        cell?.configure(with: images[indexPath.item], labelText: labels[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let padding: CGFloat = 10
            let collectionViewSize = collectionView.frame.size.width - padding
            let width = collectionViewSize / 2 - padding
        return CGSize(width: width, height: width * 1.4) // Ajuste conforme necessário
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 20
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 20
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 0 {
                 let vc = PinVC() 
                 navigationController?.pushViewController(vc, animated: true)
             }
        
        if indexPath.item == 1 {
                 let vc = BetaVC()
                 navigationController?.pushViewController(vc, animated: true)
             }
        
        if indexPath.item == 2 {
                 let vc = BetaVC()
                 navigationController?.pushViewController(vc, animated: true)
             }
        if indexPath.item == 3 {
                 let vc = ConfigVC()
                 navigationController?.pushViewController(vc, animated: true)
             }
    }
    
}
