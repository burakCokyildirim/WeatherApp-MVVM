//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 7.11.2020.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController<T: BaseViewModel>: UIViewController {
    
    var viewModel: T! {
        didSet {
            self.initVM()
        }
    }
    
    lazy var keyWindow: UIWindow? = {
         if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene}).compactMap({$0})
                .first?.windows.filter({$0.isKeyWindow}).first
        } else {
            return UIApplication.shared.keyWindow
        }
    }()
    
    lazy var loading: NVActivityIndicatorView? = {
        guard let window = self.keyWindow else { return nil }
        
        let loading = NVActivityIndicatorView(frame: CGRect.zero, type: .ballPulseSync, color: .purplyBlue, padding: 20)
        window.addSubview(loading)
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
        loading.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
        return loading
    }()
    
    var barTitle: String? {
        didSet {
            navigationItem.title = barTitle
        }
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        initView()
    }
    
    // MARK: - Configure
    
    func initVM() {
        viewModel.updateLoadingStatus = { [weak self] () in
            DispatchQueue.main.async {
                if self?.viewModel?.isLoading ?? false {
                    self?.startLoading()
                } else {
                    self?.stopLoading()
                }
            }
        }
    }
    
    func initView() {
        
    }
    
    func showError(errorMessage: String, completionHandler: PopupCompletionHandler? = nil) {
        stopLoading()
        showPopup(title: "error_title".localized, message: errorMessage, completionHandler: completionHandler)
    }
    
    func startLoading() {
        if !(loading?.isAnimating ?? false) { loading?.startAnimating() }
    }
    
    func stopLoading() {
        loading?.stopAnimating()
    }
}


