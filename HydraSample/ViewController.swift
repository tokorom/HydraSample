//
//  ViewController.swift
//
//  Created by ToKoRo on 2019-03-08.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        beginAsync {
            do {
                let value = try await(self.intValue())
                let ret = try await(self.intToString(value))
                print(ret)
            } catch {
                print(error)
            }
        }
    }

    func intValue() -> Promise<Int> { return async { _ in
        return 123
    }}

    func intToString(_ val: Int) -> Promise<String> { return async { _ in
        return "String(\(val))"
    }}
}
