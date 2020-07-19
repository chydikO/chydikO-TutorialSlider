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
    
    func scrollView(_ scrollView: UIScrollView, didScrollToPercentageOffset percentageHorizontalOffset: CGFloat) {
        if let pageControl = pageControl {
            
            if(pageControl.currentPage == 0) {
                //Change background color to toRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1
                //Change pageControl selected color to toRed: 103/255, toGreen: 58/255, toBlue: 183/255, fromAlpha: 0.2
                //Change pageControl unselected color to toRed: 255/255, toGreen: 255/255, toBlue: 255/255, fromAlpha: 1
                
                let pageUnselectedColor: UIColor = fade(fromRed: 125/255, fromGreen: 189/255, fromBlue: 211/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
                pageControl.pageIndicatorTintColor = pageUnselectedColor
                
                
                let bgColor: UIColor = fade(fromRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1, toRed: 255/255, toGreen: 255/255, toBlue: 255/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
                slides[pageControl.currentPage].backgroundColor = bgColor
                
                let pageSelectedColor: UIColor = fade(fromRed: 81/255, fromGreen: 36/255, fromBlue: 152/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
                pageControl.currentPageIndicatorTintColor = pageSelectedColor
            }
        }
    }
    
    
    func fade(fromRed: CGFloat,
              fromGreen: CGFloat,
              fromBlue: CGFloat,
              fromAlpha: CGFloat,
              toRed: CGFloat,
              toGreen: CGFloat,
              toBlue: CGFloat,
              toAlpha: CGFloat,
              withPercentage percentage: CGFloat) -> UIColor {
        
        let red: CGFloat = (toRed - fromRed) * percentage + fromRed
        let green: CGFloat = (toGreen - fromGreen) * percentage + fromGreen
        let blue: CGFloat = (toBlue - fromBlue) * percentage + fromBlue
        let alpha: CGFloat = (toAlpha - fromAlpha) * percentage + fromAlpha
        
        // return the fade colour
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
