//
//  AlamoCallback.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation

protocol AlamoCallback {
    associatedtype T
    func onSuccess(_: T)
}
