//
//  Slide.swift
//  TutorialSlider
//
//  Created by OlegChudnovskiy on 17.07.2020.
//  Copyright © 2020 OlegChudnovskiy. All rights reserved.
//

import UIKit

class Slide: UIView {
    
    @IBOutlet weak var contentView: UIView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var imageView: UIImageView?
        
    static func createSlides() -> [Slide] {
        let slide1: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView?.image = UIImage(named: "1")
        slide1.titleLabel?.text = "Выбирете блюдо, продукт или французский специалитет, который Вас интересует"
        
        let slide2: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView?.image = UIImage(named: "2")
        slide2.titleLabel?.text = "Найдите и посетите самые вкусные места с Фпвнцузскими специалистами вокруг Вас"
        
        let slide3: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView?.image = UIImage(named: "3")
        slide3.titleLabel?.text = "Практикуй свой французский, учи слова и фразы, чтобы свободно изъясняться"
        
        let slide4: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.imageView?.image = UIImage(named: "4")
        slide4.titleLabel?.text = "Получай баллы за ответы на вопросы и комментарии. Баллы меня на призы."
        
        return [slide1, slide2, slide3, slide4]
    }
}
