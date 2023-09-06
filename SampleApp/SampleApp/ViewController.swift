//
//  ViewController.swift
//  SampleApp
//
//  Created by Jaewon Yun on 2023/09/07.
//

import ReSwift
import UIKit

class ViewController: UIViewController, StoreSubscriber {
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.subscribe(self) {
            $0.select(\.counterState)
        }
    }
    
    func newState(state: CounterState) {
        countLabel.text = "\(state.count)"
    }
    
    @IBAction func didTapIncreaseButton(_ sender: Any) {
        store.dispatch(CounterState.Actions.increaseCount)
    }
    
    @IBAction func didTapDecreaseButton(_ sender: Any) {
        store.dispatch(CounterState.Actions.decreaseCount)
    }
    
}

