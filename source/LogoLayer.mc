using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Application;

class LogoLayer extends WatchUi.Layer {
    function initialize(init) {
        Layer.initialize(init);
        
	    var logoBitmap = loadResource(Rez.Drawables.TheMakersLogo);
		
		getDc().drawBitmap(0, 0, logoBitmap);
    }
}
