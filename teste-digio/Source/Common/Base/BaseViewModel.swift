//
//  BaseViewModel.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation

class BaseViewModel {
    var service: ServiceProtocol {
        #if DEBUG
        return MockService()
        #else
        return Service()
        #endif
    }
}
