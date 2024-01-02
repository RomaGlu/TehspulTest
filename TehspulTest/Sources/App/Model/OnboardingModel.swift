//
//  OnboardingModel.swift
//  TehspulTest
//
//  Created by Роман Глухарев on 2.01.24.
//

import Foundation

struct ImagesModel {
    let image: String?
}

extension ImagesModel {
    static let imagesArray: [ImagesModel] = [
        ImagesModel(image: "image1"),
        ImagesModel(image: "image2"),
        ImagesModel(image: "image3")
    ]
}
