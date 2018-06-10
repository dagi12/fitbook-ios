//
//  String+localized.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2018.
//  Copyright © 2018 Eryk Mariankowski. All rights reserved.
//

import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: Bundle.main, value: "", comment: "")
    }

}
