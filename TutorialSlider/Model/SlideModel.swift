//
//  SlideModel.swift
//  TutorialSlider
//
//  Created by OlegChudnovskiy on 20.07.2020.
//  Copyright © 2020 OlegChudnovskiy. All rights reserved.
//

import Foundation

struct SlideModel {
    private var title: String
    private var image: String
    private var icon: String
    private var leadingIconLayoutConstraint: Float
    
    //MARK: - Getters
    func getTitle() -> String {
        return title
    }
    
    func getImage() -> String {
        return image
    }
    
    func getIcon() -> String {
        return icon
    }
    
    func getleadingIconLayoutConstraint() -> Float {
        return leadingIconLayoutConstraint
    }

    //MARK: - Create SlideModel
    static func createSlides() -> [SlideModel] {
        let slide1 = SlideModel(title: "Выбирете блюдо, продукт или французский специалитет, который Вас интересует", image: "1", icon: "FoodAndWine", leadingIconLayoutConstraint: 0.5)

        let slide2 = SlideModel(title: "Найдите и посетите самые вкусные места с Фпвнцузскими специалистами вокруг Вас", image: "2", icon: "Marker", leadingIconLayoutConstraint: 0.3)
        
        let slide3 = SlideModel(title: "Практикуй свой французский, учи слова и фразы, чтобы свободно изъясняться", image: "3", icon: "EiffelTower", leadingIconLayoutConstraint: 0.34)
        
        let slide4: SlideModel = SlideModel(title: "Получай баллы за ответы на вопросы и комментарии. Баллы меня на призы.", image: "4", icon: "VoiceRecognition", leadingIconLayoutConstraint: 0.3)
        
        return [slide1, slide2, slide3, slide4]
    }
}
