//
//  OnboardingModel.swift
//  TehspulTest
//
//  Created by Роман Глухарев on 2.01.24.
//

import Foundation

struct OnboardingModel: Hashable {
    let image: String?
    let description: String?
    let actionLabel: String?
}

extension OnboardingModel {
    static let onboardingArray: [OnboardingModel] = [
        OnboardingModel(image: "image1", description: "Ordina a domicilio senza limiti di distanza. Non è magia, è Moovenda!", actionLabel: "PRONTO?"),
        OnboardingModel(image: "image2", description: "Ogni tanto inviamo degli sconti esclusivi tramite notifiche push, ci stai?", actionLabel: "PROMOZIONI"),
        OnboardingModel(image: "image3", description: "Per sfruttare al massimo l'app, puoi condividerci la tua posizione?", actionLabel: "POSIZIONE")
    ]
}
