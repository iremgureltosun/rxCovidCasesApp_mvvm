//
//  AnimateViewController.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//

import Lottie
import UIKit

class AnimateViewController: BaseViewController {
    @IBOutlet var viewAnimate: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewAnimate.loopMode = .loop
        viewAnimate?.play()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now().advanced(by: .seconds(Constants.animationDelayInSeconds))) { [weak self] in
            let view = ListCountryViewController.loadFromNib()
            self?.navigationController?.pushViewController(view, animated: true)
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewAnimate.stop()
    }
}
