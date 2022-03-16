//
//  ViewController.swift
//  task
//
//  Created by 都甲裕希 on 2022/03/10.
//

import UIKit

enum AletMessegeType{
    
    case withinRange
    case outOfRange
    
    var title: String {
        switch self {
        case .withinRange:
            return "指定範囲内"
        case .outOfRange:
            return "指定範囲外"
        }
    }
    
    var messege: String {
        switch self {
        case .withinRange:
            return "選択した値は指定範囲に含まれます。"
        case .outOfRange:
            return "選択した値は指定範囲に含まれません。"
        }
    }
}

class ViewController: UIViewController{
    
    @IBOutlet weak var startTimePicker: UIPickerView!
    @IBOutlet weak var endTimePicket: UIPickerView!
    @IBOutlet weak var selectedTimePIcker: UIPickerView!
    
    
    private var startTime = Int()
    private var endTime = Int()
    private var selectedTime = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPickerViewInfo()
    }
    
    private func setPickerViewInfo(){
        startTimePicker.delegate = self
        startTimePicker.dataSource = self
        startTimePicker.tag = 1
        endTimePicket.delegate = self
        endTimePicket.dataSource = self
        endTimePicket.tag = 2
        selectedTimePIcker.delegate = self
        selectedTimePIcker.dataSource = self
        selectedTimePIcker.tag = 3
    }
    
    
    @IBAction func searchButton(_ sender: Any) {
        let judgeModel = JudgeModel(statTime: self.startTime, endTime: self.endTime, selectedTime: self.selectedTime)
        
        if judgeModel.result() {
            present(UIAlertController(messegeType: .withinRange), animated: true, completion: nil)
        }else{
            present(UIAlertController(messegeType: .outOfRange), animated: true, completion: nil)
        }
    }
    
    
    
    
}

extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 24
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return String(row) + "時"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
        case 1:
            startTime = row
        case 2:
            endTime = row
        case 3:
            selectedTime = row
        default: break
        }
        
    }
}

extension UIAlertController{
   
    convenience init(messegeType type: AletMessegeType){
        self.init(title: type.title, message: type.messege, preferredStyle: .alert)
        self.addAction(.init(title: "OK", style: .default, handler: nil))
    }
    
}
