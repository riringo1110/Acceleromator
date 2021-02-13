//
//  GameViewController.swift
//  Acceleromator
//
//  Created by Ririko Nagaishi on 2021/02/13.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    
    @IBOutlet var awaImageView: UIImageView!
    let motionManager = CMMotionManager()
    var accelerationX: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //加速度計が使用できる状態かを判別
        if motionManager.isAccelerometerAvailable {
            //加速度の取得感覚を設定
            motionManager.accelerometerUpdateInterval = 0.01
            //加速度計が更新された時に呼ばれる関数
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { data, errpr in
                //現在の加速度を取得し、その値に基づきawaImageViewの座標を更新
                self.accelerationX = (data?.acceleration.x)!
                self.awaImageView.center.x += CGFloat(self.accelerationX*20)
                //awaImageViewが水平器からはみ出ないためのX座標の限界を設定
                if self.awaImageView.frame.origin.x < 40 {
                    self.awaImageView.frame.origin.x = 40
                }
                
                if self.awaImageView.frame.origin.x > 260 {
                    self.awaImageView.frame.origin.x = 260
                }
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.accelerationX = self.accelerationX
        
    }
}
