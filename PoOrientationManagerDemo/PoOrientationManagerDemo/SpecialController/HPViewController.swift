//
//  HPViewController.swift
//  PoOrientationManager
//
//  Created by HzS on 2024/1/11.
//

import UIKit
import PoOrientationManager

class HPViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        poSupportedInterfaceOrientations = .allButUpsideDown
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        poSupportedInterfaceOrientations = .allButUpsideDown
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(handleDismissButtonClick))
    }
    
    override var shouldAutorotate: Bool {
        true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        poCurrentSupportedInterfaceOrientations
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        poDevicePreferredHorizontalInterfaceOrientation
    }
    
    // MARK: - Action
    
    @IBAction
    func changeToHorizontal() {
        PoOrientationManager.shared.set(poDevicePreferredHorizontalInterfaceOrientation)
    }
    
    @IBAction
    func changeToPortrait() {
        PoOrientationManager.shared.set(.portrait)
    }
    
    @IBAction
    func changeToSupportPortrait() {
        poSupportedInterfaceOrientations = .portrait
    }
    
    @IBAction
    func changeToSupportAll() {
        poSupportedInterfaceOrientations = .allButUpsideDown
    }
    
    @IBAction
    func lockOrUnlockScreen(_ sender: UIButton) {
        if poIsRotationLockedBySubviews {
            poUnlockRotation(by: view)
            sender.setTitle("锁屏", for: .normal)
        } else {
            poLockRotation(by: view)
            sender.setTitle("解锁", for: .normal)
        }
    }
    
    @IBAction
    func push() {
        let vc = HPViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    func present() {
        let vc = HPViewController()
        let nav = NavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
}
