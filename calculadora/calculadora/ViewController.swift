//
//  ViewController.swift
//  calculadora
//
//  Created by Usuarios on 01/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LVisor: UILabel!
    var resultado: Double = 0
    var operacao: String = ""
    var flag: Bool = false
    var ponto: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tocarNumeros(_ sender: UIButton) {
        
        if(LVisor.text == "0"){
            
            LVisor.text = sender.titleLabel?.text
        }
        else{
            
            LVisor.text = LVisor.text! + sender.titleLabel!.text!
        }
    }
    
    @IBAction func colocarPonto(_sender: UIButton) {
        
        if (self.ponto == false) {
            if (LVisor.text == "0") {
                LVisor.text = "0."
            }
            else {
                LVisor.text = LVisor.text! + "."
                self.ponto = true
            }
        }
    }
    
    @IBAction func tocarOperacao(_ sender: Any) {
        
        let botao: UIButton = sender as! UIButton
        var Resultado: Double = 0
        operacao = (botao.titleLabel?.text)!
        resultado = Double(LVisor.text!)!
        
        self.ponto = false
        
        if (operacao == "%") {
            Resultado = resultado / 100
            LVisor.text = String(Resultado)
        }
        else if (operacao == "+/-") {
            if (resultado > 0) {
                Resultado = resultado * -1
                LVisor.text = String(Resultado)
            }
            else if (resultado < 0) {
                Resultado = resultado * -1
                LVisor.text = String(Resultado)
            }
        }
        else {
            LVisor.text = "0"
        }
    }
    
    @IBAction func tocarIgual(_ sender: Any) {
        
        let valorVisor: Double = Double(LVisor.text!)!
        var Resultado: Double = 0
        flag = true
        
        if (operacao == "+") {
            Resultado = resultado + valorVisor
        }
        else if (operacao == "-") {
            Resultado = resultado - valorVisor
        }
        else if (operacao == "X") {
            Resultado = resultado * valorVisor
        }
        else if (operacao == "/") {
            Resultado = resultado / valorVisor
        }
        
        LVisor.text = String(Resultado)
    }
    
    @IBAction func tocarAC(_ sender: Any) {
        
        resultado = 0.0
        operacao = ""
        flag = false
        LVisor.text = "0"
        self.ponto = false
    }
}
