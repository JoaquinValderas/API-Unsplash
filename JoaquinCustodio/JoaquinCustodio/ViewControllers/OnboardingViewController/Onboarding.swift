//
//  Onboarding.swift
//  JoaquinCustodio
//
//  Created by Joaquin Custodio  on 14/2/22.
//

import UIKit

class Onboarding: UIViewController {

    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var PageControl: UIPageControl!
    @IBOutlet weak var skip: UIButton!
    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    var slide:[OnboardingSlides] = []
    var currentPage = 0 {
        didSet{
            //Actualizamos le control page
            PageControl.currentPage = currentPage
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Información de las slides
        slide = [
            OnboardingSlides(title: "Find random photos", description: "Search using the most powerful free image  API search in the world", image: #imageLiteral(resourceName: "onboarding1")),
            OnboardingSlides(title: "Get a list", description: "Look at a list of random photos, search for your favorite photo and click on it to enlarge it", image: #imageLiteral(resourceName: "onboarding2")),
            OnboardingSlides(title: "Get details", description: "You can see the username that took the photo, their profile picture and the likes", image: #imageLiteral(resourceName: "onboarding3"))
        ]
    }
    
    // Función para pasar al SecondViewController
    func showScreen(){
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SecondViewController")
        self.present(vc, animated: true, completion: nil)

    }
    
    @IBAction func PressSkip(_ sender: Any) {
        showScreen()
    }
    
    @IBAction func PressNext(_ sender: Any) {
        //slides.count -1 es la última página de las slides
        if(currentPage == slide.count - 1){
           showScreen()
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            CollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

// MARK: CollectionView
 
extension Onboarding: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionVIew.Identifier, for: indexPath) as! OnboardingCollectionVIew
        //Va a pasar la información de las slides al collection view cell
        cell.setup(slide[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        // ContentOffset indica la posición actual
        // del contenido de la vista sobre el eje x
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
