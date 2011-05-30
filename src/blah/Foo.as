
package blah {
	import flash.utils.getTimer;

	public class Foo {
		private function getPrivateBar():String {
			return "private bar";
		}

		public function getBar():String {
			for (var i:int = 0; i < 1000000; i++){

			}
			return "a bar";
		}

		public function getSecondBar():String {
			for (var i:int = 0; i < 1000000; i++){

			}
			return "a second bar";
		}

		public function fibonacci(n:uint):uint {
			if (n < 2){
				return n;
			} else {
				return fibonacci(n - 1) + fibonacci(n - 2);
			}
		}

		private function _fibonacci(n:uint):uint {
			if (n < 2){
				return n;
			} else {
				return _fibonacci(n - 1) + _fibonacci(n - 2);
			}
		}

		// return the time it take to compute fibonacci
		public function wrappedFibonacci(n:uint): Number {
			var time:Number = getTimer();
			var result:uint = _fibonacci(n);
			return getTimer() - time;
		}

		public function nonRecursiveFibonacci(n:uint):uint {
			var prev : int = -1;
			var result : uint = 1;
			var sum : uint;
			
			for(var i : int = 0; i <= n; i++)
			{
				sum = result + prev;
				prev = result;
				result = sum;
			}
			
			return result;

		}
		
		private function _nonRecursiveFibonacci(n:uint):uint {
			var prev : int = -1;
			var result : uint = 1;
			var sum : uint;
			
			for(var i : int = 0; i <= n; i++)
			{
				sum = result + prev;
				prev = result;
				result = sum;
			}
			
			return result;

		}
		
		// return the time it take to compute fibonacci
		public function wrappedNonRecursiveFibonacci(n:uint): Number {
			var time:Number = getTimer();
			var result:uint = _nonRecursiveFibonacci(n);
			return getTimer() - time
		}
	}
}