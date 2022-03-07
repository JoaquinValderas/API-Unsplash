//
//  OnboardingCollectionView.swift
//  JoaquinCustodio
//
//  Created by Joaquin Custodio  on 14/2/22.
//

import UIKit

class OnboardingCollectionVIew: UICollectionViewCell {
    
    @IBOutlet weak var SlideImage: UIImageView!
    @IBOutlet weak var SlideTitleLbl: UILabel!
    @IBOutlet weak var SlideDescriptionLbl: UILabel!
    
    //Creamos el identificador como static para  usar la
    //constante en todas las clase
    
    static let Identifier = String(describing: OnboardingCollectionVIew.self)
    
    //Esta función asigna los valores a los UIElements
    func setup(_ slide: OnboardingSlides){
        SlideImage.image = slide.image
        SlideTitleLbl.text = slide.title
        SlideDescriptionLbl.text = slide.description
    }
}
