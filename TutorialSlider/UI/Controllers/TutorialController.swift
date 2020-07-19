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
    
    var slides = Slide.createSlides()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        setupSlideScrollView(slides: slides)
        
        if let pageControl = pageControl {
            pageControl.numberOfPages = slides.count
            pageControl.currentPage = 0
            
            pageControl.pageIndicatorTintColor = UIColor(red: 53/255, green: 132/255, blue: 159/255, alpha: 1)
            pageControl.currentPageIndicatorTintColor = UIColor(red: 125/255, green: 189/255, blue: 211/255, alpha: 1)
            
            view.bringSubviewToFront(pageControl)
        }
        scrollView?.contentSize.height = 1.0 // disable vertical scroll
        scrollView?.showsVerticalScrollIndicator = false
        scrollView?.showsHorizontalScrollIndicator = false
        
        if let customButton = customButton {
            customButton.onButtonClicked = { [weak self] _ in
                if
                    let pageControl = self?.pageControl,
                    pageControl.currentPage < self?.slides.count ?? 0,
                    let scrollView = self?.scrollView
                {
                    pageControl.currentPage = pageControl.currentPage + 1
                    
                    if
                        let x = self?.slides[pageControl.currentPage].frame.origin.x,
                        let y = self?.slides[pageControl.currentPage].frame.origin.y
                    {
                        scrollView.setContentOffset(CGPoint(x: x, y: y), animated: true)
                    }
                } else {
                    // Start Login
                    debugPrint("Start Login")
                }
            }
        }
    }
    
    private func setupSlideScrollView(slides : [Slide]) {
        if let scrollView = scrollView {
            scrollView.frame = CGRect(x: 0,
                                      y: 0,
                                      width: view.frame.width,
                                      height: scrollView.frame.height)
            scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count),
                                            height: scrollView.frame.height)
            scrollView.isPagingEnabled = true
            
            for i in 0 ..< slides.count {
                slides[i].frame = CGRect(x: view.frame.width * CGFloat(i),
                                         y: 0,
                                         width: view.frame.width,
                                         height: scrollView.frame.height)
                scrollView.addSubview(slides[i])
            }
        }
    }
    
    //MARK: - UIScrollViewDelegate
    /*
     * default function called when view is scolled. In order to enable callback
     * when scrollview is scrolled, the below code needs to be called:
     * slideScrollView.delegate = self or
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        
        if let pageControl = pageControl {
            pageControl.currentPage = Int(pageIndex)
            if pageControl.currentPage == slides.count - 1 {
                customButton?.textToButtonLabel = "Приступить"
            } else {
                customButton?.textToButtonLabel = "Далее"
            }
        }
    }
}
