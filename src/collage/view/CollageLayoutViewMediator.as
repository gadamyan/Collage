/**
 * Created by Gev on 12/15/2014.
 */
package collage.view {

import collage.event.MessageEvent;

import org.robotlegs.mvcs.Mediator;

public class CollageLayoutViewMediator extends Mediator {
    [Inject]
    public var _simpleView:CollageLayoutView;

    override public function onRegister():void {
        eventMap.mapListener(eventDispatcher, MessageEvent.GREET, onGreet);
        eventMap.mapListener(eventDispatcher, MessageEvent.IMAGES_LOAD_FAILED, imageLoadFailedHandler);
        eventMap.mapListener(eventDispatcher, MessageEvent.IMAGES_LOADED, imageLoadedHandler);
        dispatch(new MessageEvent(MessageEvent.REQUEST_GREETING));
        dispatch(new MessageEvent(MessageEvent.LOAD_IMAGES));
    }

    private function imageLoadedHandler(event:MessageEvent):void {
        _simpleView.updateImages(event.imageMap);
    }

    private function imageLoadFailedHandler(e:MessageEvent):void {
        _simpleView.updateMessage("Failed to Load Images");
    }

    private function onGreet(event:MessageEvent):void {
        _simpleView.updateMessage(event.message);
    }
}
}
