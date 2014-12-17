/**
 * Created by Gev on 12/15/2014.
 */
package collage.view {

import collage.event.ImageEvent;

import org.robotlegs.mvcs.Mediator;

public class CollageLayoutViewMediator extends Mediator {
    [Inject] public var _collageLayoutView:CollageLayoutView;

    override public function onRegister():void {
        eventMap.mapListener(eventDispatcher, ImageEvent.GREET, onGreet);
        eventMap.mapListener(eventDispatcher, ImageEvent.IMAGE_LOAD_FAILED, imageLoadFailedHandler);
        eventMap.mapListener(eventDispatcher, ImageEvent.IMAGES_LOADED, imageLoadedHandler);
        dispatch(new ImageEvent(ImageEvent.REQUEST_GREETING));
        dispatch(new ImageEvent(ImageEvent.LOAD_IMAGES));
    }

    private function imageLoadedHandler(event:ImageEvent):void {
        _collageLayoutView.updateImages(event.imageMap);
    }

    private function imageLoadFailedHandler(event:ImageEvent):void {
        _collageLayoutView.updateMessage("Failed to Load Images");
    }

    private function onGreet(event:ImageEvent):void {
        _collageLayoutView.updateMessage(event.message);
    }
}
}
