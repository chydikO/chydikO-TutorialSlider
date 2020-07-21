//
//  Slide.swift
//  TutorialSlider
//
//  Created by OlegChudnovskiy on 17.07.2020.
//  Copyright © 2020 OlegChudnovskiy. All rights reserved.
//

import UIKit

class SlideView: UIView {
    
    @IBOutlet weak var contentView: UIView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var iconImageView: UIImageView?
    @IBOutlet weak var leadingIconLayoutConstraint: NSLayoutConstraint?
    @IBOutlet weak var widthIconLayoutConstraint: NSLayoutConstraint?

        
    static func createSlides() -> [SlideView] {
        let slide1: SlideView = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! SlideView
        var frameWidth = Float(slide1.frame.width / 2)
        slide1.leadingIconLayoutConstraint?.constant = CGFloat(frameWidth - 16)
        slide1.iconImageView?.image = UIImage(named: "FoodAndWine")
        slide1.imageView?.image = UIImage(named: "1")
        slide1.titleLabel?.text = "Выбирете блюдо, продукт или французский специалитет, который Вас интересует"
        
        let slide2: SlideView = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! SlideView
        frameWidth = Float(slide2.frame.width * 0.3)
        slide2.leadingIconLayoutConstraint?.constant = CGFloat(frameWidth + 16)
        slide2.iconImageView?.image = UIImage(named: "Marker")
        slide2.imageView?.image = UIImage(named: "2")
        slide2.titleLabel?.text = "Найдите и посетите самые вкусные места с Фпвнцузскими специалистами вокруг Вас"
        
        let slide3: SlideView = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! SlideView
        frameWidth = Float(slide3.frame.width - (slide3.frame.width * 0.34))
        slide3.leadingIconLayoutConstraint?.constant = CGFloat(frameWidth - 31)
        slide3.iconImageView?.image = UIImage(named: "EiffelTower")
        slide3.imageView?.image = UIImage(named: "3")
        slide3.titleLabel?.text = "Практикуй свой французский, учи слова и фразы, чтобы свободно изъясняться"
        
        let slide4: SlideView = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! SlideView
        frameWidth = Float(slide4.frame.width * 0.3)
        slide4.leadingIconLayoutConstraint?.constant = CGFloat(frameWidth - 31)
        slide4.iconImageView?.image = UIImage(named: "VoiceRecognition")
        slide4.imageView?.image = UIImage(named: "4")
        slide4.titleLabel?.text = "Получай баллы за ответы на вопросы и комментарии. Баллы меня на призы."
        
        return [slide1, slide2, slide3, slide4]
    }
}
