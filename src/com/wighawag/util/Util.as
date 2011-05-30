package com.wighawag.util {

	public class Util {

		// Kind of hack to get the unique identifier for objects used in the flash debugger (for example: @12bee511)
		// got from http://stackoverflow.com/questions/1343282/how-can-i-get-an-instances-memory-location-in-actionscript
		// the extra internal FakeClass is neccesary to force the exception to arise
		// From the exception string representation the function then get the ID through regular expression
		public static function memoryId(o:Object):String {
			try {
				FakeClass(o);
			} catch (e:Error){
				return String(e).replace(/.*([@|\$].*?) to .*$/gi, '$1');
			}
			return "";
		}
		
	}
}

internal final class FakeClass{}