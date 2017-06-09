//
//  MapViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import UIKit
import FacebookLogin

struct FacebookButtonCoords {
    static let marginBottom = CGFloat(60)
    static let width = CGFloat(250)
    static let height = CGFloat(40)
}

class MapViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email ])
        let frameHeight = UIScreen.main.bounds.height
        let buttonHeight = loginButton.frame.height
        let yCoord = frameHeight - buttonHeight - FacebookButtonCoords.marginBottom
        var loginButtonFrame = loginButton.frame
        loginButtonFrame.size.width = FacebookButtonCoords.width
        loginButtonFrame.size.height = FacebookButtonCoords.height
        loginButton.frame = loginButtonFrame
        loginButton.center = CGPoint(x: view.center.x, y: yCoord)
        view.addSubview(loginButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    

}
