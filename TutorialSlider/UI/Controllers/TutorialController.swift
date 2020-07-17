//
//  TutorialController.swift
//  TutorialSlider
//
//  Created by OlegChudnovskiy on 17.07.2020.
//  Copyright © 2020 OlegChudnovskiy. All rights reserved.
//

import UIKit

class TutorialController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView? {
        didSet{
            if let scrollView = scrollView {
                scrollView.delegate = self
            }
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl?
    @IBOutlet weak var customButton: TutorialButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

}
