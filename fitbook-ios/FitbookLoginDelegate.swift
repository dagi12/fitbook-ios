//
//  FitbookLoginDelegate.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

protocol FitbookLoginDelegate: class {
    func fitbookLogout(_: Bool)

    func fitbookLogin()
}
