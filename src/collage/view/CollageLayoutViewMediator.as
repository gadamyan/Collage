/**
 * Created by Gev on 12/15/2014.
 */
package collage.view {

import collage.event.ImageEvent;

import org.robotlegs.mvcs.Mediator;

public class CollageLayoutViewMediator extends Mediator {
    [Inject] public var collageLayoutView:CollageLayoutView;

    override public function onRegister():void {
        eventMap.mapListener(eventDispatcher, ImageEvent.IMAGE_LOAD_FAILED, imageLoadFailedHandler);
        eventMap.mapListener(eventDispatcher, ImageEvent.IMAGES_LOADED, imageLoadedHandler);
        dispatch(new ImageEvent(ImageEvent.LOAD_IMAGES));
    }

    private function imageLoadedHandler(event:ImageEvent):void {
        collageLayoutView.createImages(event.imageMap);
    }

    private function imageLoadFailedHandler(event:ImageEvent):void {
        collageLayoutView.showFailureMessage();
    }
}
}
