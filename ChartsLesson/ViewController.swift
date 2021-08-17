//
//  ViewController.swift
//  ChartsLesson
//
//  Created by Андрей Колесников on 17.08.2021.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var leftStepper: UIStepper!
    @IBOutlet weak var rightStepper: UIStepper!
    
    var rightDataEntry = PieChartDataEntry(value: 0)
    var leftDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfPolitisians = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        rightDataEntry.value = rightStepper.value
        leftDataEntry.value = leftStepper.value
        
        rightDataEntry.label = "Right"
        leftDataEntry.label = "Left"
        
        numberOfPolitisians = [rightDataEntry, leftDataEntry]
        
        updateChartData()
    }
    
    @IBAction func rightTapped(_ sender: UIStepper) {
        rightDataEntry.value = sender.value + 1
        updateChartData()
    }
    
    @IBAction func leftTapped(_ sender: UIStepper) {
        leftDataEntry.value += sender.value + 1
        updateChartData()
    }
    
    func updateChartData() {
        let chartDataSet = PieChartDataSet(entries: numberOfPolitisians, label: "Debates")
        
        let colors = [UIColor(named: "Right"), UIColor(named: "Left")]
        chartDataSet.colors = colors as! [NSUIColor]

        let chartData = PieChartData(dataSet: chartDataSet)
        
        pieChart.data = chartData
    }
}

