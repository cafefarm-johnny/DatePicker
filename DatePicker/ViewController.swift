//
//  ViewController.swift
//  DatePicker
//
//  Created by Johnny Uhm on 2020/02/24.
//  Copyright © 2020 Jamong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime) // 타이머 구동 시 실행할 함수
    let interval = 1.0 // 타이머 간격
    var count = 0 // 타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 타이머 간격 / 동작될 View / 타이머가 구동될 때 실행할 함수 / 사용자 정보 / 반복 여부
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter() // 날짜를 출력하기 위해 DateFormatter 클래스 상수 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" // formatter의 dateFormat속성 날짜 형식 설정
        
        // 데이트 피커에서 선택한 날짜를 formatter의 dateFormat속성에 설정한 포맷으로 string() 메소드를 사용하여 문자열로 변환한다.
        lblPickerTime.text = "선택 시간: " + formatter.string(from: datePickerView.date)
    }
    
    // 타이머 동작 함수
    // Swift4에서 #selector()의 인자로 사용되는 메소드를 선언할 때에는
    // Objective-C와의 호환성을 위해 함수 앞에 @objc 키워드를 붙인다.
    @objc func updateTime() {
//        lblCurrentTime.text = String(count)
//        count = count + 1
        
        let date = NSDate() // 현재 시간을 NSDate 함수를 사용해 가져온다.
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재 시간: " + formatter.string(from: date as Date)
    }
}

