//
//  MapViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import FacebookLogin
import MapKit
import RxSwift

struct FacebookButtonCoords {
    static let marginBottom = CGFloat(120)
    static let width = CGFloat(302)
    static let height = CGFloat(43)
}

class MapViewController: UIViewController, FacebookLoginResultDelegate, FitbookLoginDelegate {

    private let mapKitHelper = MapKitHelper()
    private var initialTabBarViewControllers: [UIViewController]?
    private let loginButton: LoginButton = LoginButton(readPermissions: [.publicProfile, .email])

    var alertHelper: AlertViewHelper!
    var fitbookStore: FitbookLoginStore!
    var gymStore: GymStore!

    private let bag = DisposeBag()

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var facebookView: UIView!
    @IBOutlet weak var searchButton: UIButton!

    func gymStoreCallback( result: [Gym]) {
        for gym in result {
            if let anno = gym.getAnnotation() {
                self.mapView.addAnnotation(anno)
            }
        }
        self.mapKitHelper.stopUpdating(mapView: self.mapView)
    }

    @IBAction func findCloseGym(_ sender: UIButton) {
        let parameters = mapKitHelper.getLocationRequest(mapView: mapView)
        gymStore
            .searchByLocation(parameters: parameters)
            .subscribe(onSuccess: gymStoreCallback)
            .disposed(by: bag)
    }

    func facebookLoginSuccess() {
        alertHelper.showProcess("signing".localized, self)
        fitbookStore.fitbookLoginAfterFacebookSuccess(loginDelegate: self)
    }

    func facebookLoginFailed() {
        alertHelper.showError("facebook_login".localized, self)
    }

    func fitbookLogin() {
        facebookView.isHidden = true
        restoreLoggedTabs()
        alertHelper.closeProcess(controller: self)

    }

    func restoreLoggedTabs() {
        self.tabBarController?.viewControllers = initialTabBarViewControllers
    }

    func removeLoggedTabs() {
        if let tabBarController = self.tabBarController {
            if let viewControllers = tabBarController.viewControllers {
                let lenCondition = 4
                if lenCondition < viewControllers.count {
                    var viewControllers = tabBarController.viewControllers
                    viewControllers?.remove(at: 4)
                    viewControllers?.remove(at: 3)
                    tabBarController.viewControllers = viewControllers
                }
            }
        }
    }

    func fitbookLogout(_ manual: Bool) {
        if manual {
            alertHelper.showInfo("logged_out".localized, self)
            LoginManager().logOut()
            fitbookStore.manualLogout()
        }
        facebookView.isHidden = false
        removeLoggedTabs()
        alertHelper.closeProcess(controller: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.buttonStyle()
        loginButton.delegate = FacebookLoginStore(loginDelegate: self)
        loginButton.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        loginButton.frame.size.width = facebookView.frame.width
        loginButton.frame.size.height = facebookView.frame.height

        facebookView.addSubview(loginButton)
        alertHelper.showProcess("signing".localized, self)
        self.initialTabBarViewControllers = self.tabBarController?.viewControllers
        fitbookStore.checkLogin(loginDelegate: self)
        mapKitHelper.initMap(mapView: mapView)
    }

}
