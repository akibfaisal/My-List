//
//  ViewController.swift
//  My List
//
//  Created by S. M. Akib Al Faisal on 12/4/20.
//  Copyright © 2020 S. M. Akib Al Faisal. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{
    @IBOutlet weak var listcollectionView: UICollectionView!
    
    @IBOutlet weak var secondsubview: UIView!
    
    var demoCellCount = 4
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        secondsubview.addTopBorder(with: UIColor.init(red: 228/255, green: 228/255, blue: 228/255, alpha: 1), andWidth: 1)
        
        listcollectionView.dataSource = self
        listcollectionView.delegate = self
        
        
        
      
        
    }
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return demoCellCount
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as! CollectionViewCell
        
        cell.layer.cornerRadius = 5
        
        if indexPath.item == demoCellCount-1{
            print("enter \(indexPath.item) total \(demoCellCount)")
            cell.imageView.image = #imageLiteral(resourceName: "plus")
            cell.titleLabel.text = "Add List"
        }
        
        
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        if indexPath.row == demoCellCount - 1
        {
            print(indexPath.row)
        }
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
    
           let location = sender.location(in: self.listcollectionView)
           let indexPath = self.listcollectionView.indexPathForItem(at: location)
    
           if let index = indexPath {
              print("Got clicked on index: \(index)!")
           }
    
            if indexPath?.item == demoCellCount-1{
               //add action to perform create dynamic cell
               demoCellCount = demoCellCount + 1
                DispatchQueue.main.async{
                    self.listcollectionView.reloadData()
            }
            }
        }
    
    
}

extension UIView{
    
    func addTopBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }
    
    
}

