/**
 * Created by Gev on 12/15/2014.
 */
package collage.view {
import collage.event.MessageEvent;

import org.robotlegs.mvcs.Mediator;

public class CollageImageViewMediator extends Mediator {
    [Inject]
    public var _simpleView:CollageLayoutView;

    override public function onRegister():void {
//        eventMap.mapListener(eventDispatcher, MessageEvent.IMAGES_LOAD_FAILED, imageLoadFailedHandler);
//        eventMap.mapListener(eventDispatcher, MessageEvent.IMAGES_LOADED, imageLoadedHandler);
        dispatch(new MessageEvent(MessageEvent.LOAD_IMAGES));
    }
}
}
