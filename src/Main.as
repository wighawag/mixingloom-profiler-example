package {
	import blah.Foo;
	import com.bit101.components.HBox;
	import com.bit101.components.HSlider;
	import com.bit101.components.Label;
	import com.bit101.components.NumericStepper;
	import com.bit101.components.PushButton;
	import com.bit101.components.VBox;
	import com.wighawag.util.Util;
	import flash.display.Sprite;
	import flash.events.Event;


	public class Main extends Sprite {

		public var foo:Foo;
		
		private var mainVBox : VBox;
		
		private var fibonacciHBox : HBox;
		private var fibonacciButton : PushButton;
		private var fibonacciNumericStepper : NumericStepper;
		
		private var nonRecursiveFibonacciHBox : HBox;
		private var nonRecursiveFibonacciButton : PushButton;
		private var nonRecursiveFibonacciNumericStepper : NumericStepper;
		
		private var wrappedFibonacciHBox:HBox;
		private var wrappedFibonacciButton:PushButton;
		private var wrappedFibonacciNumericStepper:NumericStepper;
		private var wrappedFibonacciResult : Label;
		
		private var wrappedNonRecursiveFibonacciHBox:HBox;
		private var wrappedNonRecursiveFibonacciButton:PushButton;
		private var wrappedNonRecursiveFibonacciNumericStepper:NumericStepper;
		private var wrappedNonRecursiveFibonacciResult : Label;
		
		public function Main():void {
			foo = new Foo();
			
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(Event.REMOVED_FROM_STAGE, dispose);
			
			var title : Label = new Label(this, 0, 0, "Fibonacci");
			title.scaleX = title.scaleY = 5;
			title.x = stage.stageWidth / 2 - 100; 
			
			mainVBox = new VBox(this, 0, 150);
			
			fibonacciHBox = new HBox(mainVBox);
			fibonacciButton = new PushButton(fibonacciHBox, 0, 0, "fibonacci", onFibonacciPressed);
			fibonacciNumericStepper = new NumericStepper(fibonacciHBox);
			fibonacciNumericStepper.minimum = 0;
			fibonacciNumericStepper.value = 27;
			
			nonRecursiveFibonacciHBox = new HBox(mainVBox);
			nonRecursiveFibonacciButton = new PushButton(nonRecursiveFibonacciHBox, 0, 0, "non recusrive fibonacci", onNonRecursiveFibonacciPressed);
			nonRecursiveFibonacciNumericStepper = new NumericStepper(nonRecursiveFibonacciHBox);
			nonRecursiveFibonacciNumericStepper.minimum = 0;
			nonRecursiveFibonacciNumericStepper.value = 999999;
			
			wrappedFibonacciHBox = new HBox(mainVBox);
			wrappedFibonacciButton = new PushButton(wrappedFibonacciHBox, 0, 0, "wrapped fibonacci", onWrappedFibonacciPressed);
			wrappedFibonacciNumericStepper = new NumericStepper(wrappedFibonacciHBox);
			wrappedFibonacciNumericStepper.minimum = 0;
			wrappedFibonacciResult = new Label(wrappedFibonacciHBox, 0, 0 , "timing");
			wrappedFibonacciNumericStepper.value = 27;
			
			wrappedNonRecursiveFibonacciHBox = new HBox(mainVBox);
			wrappedNonRecursiveFibonacciButton = new PushButton(wrappedNonRecursiveFibonacciHBox, 0, 0, "wrapped non recusrive fibonacci", onWrappedNonRecursiveFibonacciPressed);
			wrappedNonRecursiveFibonacciNumericStepper = new NumericStepper(wrappedNonRecursiveFibonacciHBox);
			wrappedNonRecursiveFibonacciNumericStepper.minimum = 0;
			wrappedNonRecursiveFibonacciResult = new Label(wrappedNonRecursiveFibonacciHBox, 0, 0 , "timing");
			wrappedNonRecursiveFibonacciNumericStepper.value = 999999;
		}
		
		private function onWrappedNonRecursiveFibonacciPressed(event : Event):void 
		{
			wrappedNonRecursiveFibonacciResult.text = "time taken : " + foo.wrappedNonRecursiveFibonacci(wrappedNonRecursiveFibonacciNumericStepper.value) + " miliseconds";
		}
		
		private function onWrappedFibonacciPressed(event : Event):void 
		{
			wrappedFibonacciResult.text = "time taken : " + foo.wrappedFibonacci(wrappedFibonacciNumericStepper.value) + " miliseconds";
		}
		
		private function onNonRecursiveFibonacciPressed(event : Event):void 
		{
			foo.nonRecursiveFibonacci(nonRecursiveFibonacciNumericStepper.value);
		}
		
		private function onFibonacciPressed(event : Event):void 
		{
			foo.fibonacci(fibonacciNumericStepper.value);
		}

		private function onEnterFrame(e:Event):void {
			trace(Util.memoryId(this)); // output its Id, usefull to see if two instance of Main are running
		}
		
		// esnure it is removed from execution when removed from stage 
		public function dispose(event:Event = null):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, dispose);
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
	}
}