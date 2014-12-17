/**
 * Created by Gev on 12/15/2014.
 */
package collage.model {
import collage.event.ImageEvent;

import org.robotlegs.mvcs.Actor;

public class SimpleModel extends Actor {
    private var _message:String;
    public function SimpleModel() {
        _message = "Hello World";
    }

    public function messageRequest():void {
        var messageEvent:ImageEvent = new ImageEvent(ImageEvent.GREET);
        messageEvent.message = _message;
        dispatch(messageEvent);
    }
}
}
