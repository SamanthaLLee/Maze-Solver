// First View Controller
//
// FirstViewController.swift
// MathConcepts
//
// Created by Samantha Lee on 6/3/16.
// Copyright (c) 2016 Samantha Lee. All rights reserved.
//
import UIKit
import Foundation
class FirstViewController: UIViewController {
//when buttons are clicked, information pops up
@IBOutlet weak var aDesc: UIButton!
@IBOutlet weak var bDesc: UIButton!
@IBOutlet weak var cDesc: UIButton!
// @IBOutlet weak var aPopUp: UILabel!
// @IBOutlet weak var bPopUp: UILabel!
// @IBOutlet weak var cPopUp: UILabel!
// removed for efficiency
@IBOutlet weak var popUp: UITextView!
//originally had 3 text views (see above), changed for efficiency
//if user clicks button a, the following text will appear
@IBAction func clickA(sender: AnyObject) {
popUp.text = "The a value is the coefficient of x², and it is also known as the leading
coefficient in a quadratic equation. It must be a numerical value, if one is solving for x."
}
//if user clicks button b, the following text will appear
@IBAction func clickB(sender: AnyObject) {
popUp.text = "The value b is the coefficient of x. It also is a numerical value."
}
//if user clicks button c, the following text will appear
@IBAction func clickC(sender: AnyObject) {
popUp.text = "The c value is the constant term; its term does not include x. Like the a and
b values, it is a numerical term."
}

override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.
}
override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}

}
// Second View Controller
import UIKit
class SecondViewController: UIViewController {
//takes user input values, plugs them into equation and formula
@IBOutlet weak var aValue: UITextField!
@IBOutlet weak var bValue: UITextField!
@IBOutlet weak var cValue: UITextField!
// displays answer → should be a number value or "invalid"
@IBOutlet weak var showAnswer: UITextField!
@IBOutlet weak var showAnswer2: UITextField!
// if the user input is invalid (the values do not work in the formula), a note will appear to
inform the user
@IBOutlet weak var ifWrong: UITextView!
//values will be plugged into the formula and equation
@IBOutlet weak var formula: UILabel! //numerator of formula
@IBOutlet weak var formula2: UILabel! //denominator of formula
@IBOutlet weak var equation: UILabel! //full equation
@IBAction func solveButton(sender: AnyObject) { //calculates via the quadratic formula
//convert text to numerical values
var a = atof(aValue.text)
var b = atof(bValue.text)
var c = atof(cValue.text)
//necessary calculations
let radical = (b*b) - (4*a*c)
let discrim = sqrt(radical) //must import foundation

//mathematically, the answer would be invalid (negative value means no solutions)

if (radical &lt; 0)
{
showAnswer.text = "Invalid"
showAnswer2.text = "Invalid"
ifWrong.text = "Stay tuned to find out why these values don&#39;t work"
}
// if discriminant = 0, there is one solution and it is displayed
else if (discrim == 0)
{
let zeroAnswer = (-(b)) / (2*a)
showAnswer.text = "\(zeroAnswer)"
showAnswer2.text = "N/A" //only one solution
ifWrong.text = ""
//test variables test if the solutions are otherwise valid -- in case the output is "nan", "inf",
or "-inf"
let test = showAnswer.text
if (test == "nan" || test == "inf" || test == "-inf")
{
showAnswer.text = "Invalid"
showAnswer2.text = "Invalid"
ifWrong.text = "Stay tuned to find out why these values don&#39;t work"
}
}
//values yield two solutions, which are calculated and displayed
else
{
let numeratorPlus = -(b) + discrim
let plusAnswer = numeratorPlus/(2*a)
let numeratorMinus = -(b) - discrim
let minusAnswer = numeratorMinus/(2*a)
showAnswer.text = "\(plusAnswer)"
showAnswer2.text = "\(minusAnswer)"
ifWrong.text = ""
//more test variables to ensure validity
let test = showAnswer.text
let test2 = showAnswer2.text
if (test == "nan" || test == "inf" || test == "-inf" || test2 == "nan" || test2 == "inf" || test2 ==
"-inf")
{
showAnswer.text = "Invalid"
showAnswer2.text = "Invalid"
ifWrong.text = "Stay tuned to find out why these values don&#39;t work"
}

}

//plugging values into formula/equation
formula.text = "- (\(b)) ± √((\(b))² - 4*(\(a))*(\(c)))"
formula2.text = "2*(\(a))"
equation.text = "(\(a))x² + (\(b))x + (\(c))"
cValue.resignFirstResponder();
}
override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.
}
override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}

}

// Third View Controller
import Foundation
import UIKit
import AVFoundation //required for audio
class solutions: UIViewController {
//code necessary for audio, played when certain buttons are clicked
let beepSoundURL = NSBundle.mainBundle().URLForResource("fail-buzzer-02",
withExtension: "mp3")!
var beepPlayer = AVAudioPlayer()
func playMySound(){
beepPlayer = AVAudioPlayer(contentsOfURL: beepSoundURL, error: nil)
beepPlayer.prepareToPlay()
beepPlayer.play()
}
// tells user if their choice is the correct answer

@IBOutlet weak var displayCorrect: UILabel!
@IBAction func wrongAns1(sender: AnyObject) {
displayCorrect.text = "Not quite..."
playMySound() //as it says, play sound
}
@IBAction func wrongAns2(sender: AnyObject) {
displayCorrect.text = "Not quite..."
playMySound()
}
@IBAction func wrongAns3(sender: AnyObject) {
displayCorrect.text = "Not quite..."
playMySound()
}
@IBAction func rightAns(sender: AnyObject) { //only right answer
displayCorrect.text = "Correct!"
}

override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view.
}
override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}}

// Fourth View Controller
import UIKit
class quizIdentify: UIViewController {
//question 1; user input values of a, b, and c
@IBOutlet weak var q1AVal: UITextField!
@IBOutlet weak var q1BVal: UITextField!
@IBOutlet weak var q1CVal: UITextField!
//question 2; user input values of a, b, and c
@IBOutlet weak var q2AVal: UITextField!
@IBOutlet weak var q2BVal: UITextField!

@IBOutlet weak var q2CVal: UITextField!
//question 3; user input values of a, b, and c
@IBOutlet weak var q3AVal: UITextField!
@IBOutlet weak var q3BVal: UITextField!
@IBOutlet weak var q3CVal: UITextField!
// tells user if their input was correct
@IBOutlet weak var afterCheck: UILabel!
//button actually checks the answers
@IBAction func checkQ1(sender: AnyObject) {
let a1 = atof(q1AVal.text)
let b1 = atof(q1BVal.text)
let c1 = atof(q1CVal.text)
let a2 = atof(q2AVal.text)
let b2 = atof(q2BVal.text)
let c2 = atof(q2CVal.text)
let a3 = atof(q3AVal.text)
let b3 = atof(q3BVal.text)
let c3 = atof(q3CVal.text)
//all correct answers listed
if (a1 == 1 &amp;&amp; b1 == -14 &amp;&amp; c1 == 45 &amp;&amp; a2 == 5 &amp;&amp; b2 == -3 &amp;&amp; c2 == 3 &amp;&amp; a3 == 1 &amp;&amp;
b3 == 0 &amp;&amp; c3 == -9)
{
afterCheck.text = "Correct!"
}
else //answers must be completely correct
{
afterCheck.text = "Incorrect."
}
q3CVal.resignFirstResponder(); //keyboard disappears //unsure if needed
}
override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.
}
override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}

}

// Fifth View Controller
import UIKit
class quizSolutions: UIViewController {
//cocoa touch classes (here and the following views) created to create segues between views
// each stepper correlates to a question
@IBOutlet weak var q1Step: UIStepper!
@IBOutlet weak var q2Step: UIStepper!
@IBOutlet weak var q3Step: UIStepper!
// each label correlates to a question (text [number value] will change with stepper)
@IBOutlet weak var displayQ1: UILabel!
@IBOutlet weak var displayQ2: UILabel!
@IBOutlet weak var displayQ3: UILabel!
// tells user if their answers were correct
@IBOutlet weak var correct: UILabel!
// stepper for question 1
@IBAction func q1stepper(sender: UIStepper) {
displayQ1.text = Int(sender.value).description
}
// stepper for question 2
@IBAction func q2stepper(sender: UIStepper) {
displayQ2.text = Int(sender.value).description
}
// stepper for question 3
@IBAction func q3stepper(sender: UIStepper) {
displayQ3.text = Int(sender.value).description
}
//button to actually check answers
@IBAction func checkAns(sender: AnyObject) {
let Q1 = atof(displayQ1.text!)
let Q2 = atof(displayQ2.text!)
let Q3 = atof(displayQ3.text!)
if (Q1 == 1 &amp;&amp; Q2 == 0 &amp;&amp; Q3 == 2)
{
correct.text = "Correct!"
}

else
{
correct.text = "Incorrect. Try Again."
}
}
override func viewDidLoad() {
super.viewDidLoad()
//required for each stepper
q1Step.wraps = true
q1Step.autorepeat = true
q1Step.maximumValue = 2 //self explanatory -- max. value and min. below
q1Step.minimumValue = 0
q2Step.wraps = true
q2Step.autorepeat = true
q2Step.maximumValue = 2
q2Step.minimumValue = 0
q3Step.wraps = true
q3Step.autorepeat = true
q3Step.maximumValue = 2
q3Step.minimumValue = 0

// Do any additional setup after loading the view.
}
override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}

// Sixth View Controller
import UIKit
class quizSolve: UIViewController {
//each equation has two solutions, there are three problems to solve
@IBOutlet weak var q1Ans1: UITextField!
@IBOutlet weak var q1Ans2: UITextField!
@IBOutlet weak var q2Ans1: UITextField!
@IBOutlet weak var q2Ans2: UITextField!

@IBOutlet weak var q3Ans1: UITextField!
@IBOutlet weak var q3Ans2: UITextField!
//tells user if their answers were correct
@IBOutlet weak var correct: UILabel!
//check answer procedure
@IBAction func checkAns(sender: AnyObject) {
let a1 = atof(q1Ans1.text)
let a2 = atof(q1Ans2.text)
let b1 = atof(q2Ans1.text)
let b2 = atof(q2Ans2.text)
let c1 = atof(q3Ans1.text)
let c2 = atof(q3Ans2.text)
//must be completely correct
if ((a1 == 7 &amp;&amp; a2 == -2)||(a1 == -2 &amp;&amp; a2 == 7)) &amp;&amp; ((b1 == 2 &amp;&amp; b2 == -3) || (b2 == 2 &amp;&amp;
b1 == -3)) &amp;&amp; ((c1 == -1 &amp;&amp; c2 == -3) || (c1 == -3 &amp;&amp; c2 == -1))
{
correct.text = "Correct!" //display
}
else
{
correct.text = "Incorrect. Try Again."
}
q3Ans2.resignFirstResponder();
}

override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view.
}
override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}

/*
// MARK: - Navigation
// In a storyboard-based application, you will often want to do a little preparation before
navigation

override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/
}
// Seventh View Controller
import UIKit
class final: UIViewController {
//no legitimate body needed, only includes a segue
override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view.
}
override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}

/*
// MARK: - Navigation
// In a storyboard-based application, you will often want to do a little preparation before
navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/
}

