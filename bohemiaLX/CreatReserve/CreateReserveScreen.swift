//
//  CreateReserveScreen.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 02/04/2024.
//

import UIKit

protocol CreateReserveScreenProtocol: AnyObject {
    func customNavigation()
}

class CreateReserveScreen: UIView {
    
    private weak var delegate: CreateReserveScreenProtocol?
    
    public func delegate(delegate: CreateReserveScreenProtocol?) {
        self.delegate = delegate
    }

}
