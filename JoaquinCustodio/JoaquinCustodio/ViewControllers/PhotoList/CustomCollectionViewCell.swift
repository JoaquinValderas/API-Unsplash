//
//  CustomCollectionViewCell.swift
//  JoaquinCustodio
//
//  Created by Joaquin Custodio  on 21/2/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell{
        
    @IBOutlet weak var imageView: UIImageView!
    
    override var isHighlighted: Bool {
          didSet {
              if self.isHighlighted {
                  let tintViewSelected = UIView()
                  tintViewSelected.backgroundColor = UIColor(white: 0, alpha: 0.5)
                  tintViewSelected.frame = CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height)
                  imageView.addSubview(tintViewSelected)
              }else{
                  for view in imageView.subviews{
                     view.removeFromSuperview()
                  }
              }
          }
    }
}
    


