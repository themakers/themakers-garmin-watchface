using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Application;

class DateTimeLayer extends WatchUi.Layer {
    function initialize(init) {
        Layer.initialize({
        	:locX => 200,
        	:locY => 200,
        	:width => 128,
        	:height => 128,
        });
        
        getDc().drawText(0, 0, Graphics.FONT_MEDIUM, "TheMakers", Graphics.TEXT_JUSTIFY_LEFT);
		
//		getDc().drawBitmap(0, 0, logoBitmap);
    }
}
