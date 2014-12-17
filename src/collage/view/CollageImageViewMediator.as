/**
 * Created by Gev on 12/15/2014.
 */
package collage.view {
import collage.event.ImageEvent;
import collage.service.ImageLoaderService;

import org.robotlegs.mvcs.Mediator;

public class CollageImageViewMediator extends Mediator {
    [Inject] public var _collageImageView:CollageImageView;

    override public function onRegister():void {
        eventMap.mapListener(_collageImageView, ImageEvent.IMAGE_REMOVED, imageRemoved);
        eventMap.mapListener(eventDispatcher, ImageEvent.IMAGE_LOADED, imageLoaded);
    }

    private function imageRemoved(event:ImageEvent):void {
        var imageEvent:ImageEvent = new ImageEvent(ImageEvent.LOAD_IMAGE);
        imageEvent.image = event.image;
        dispatch(imageEvent);
    }

    private function imageLoaded(event:ImageEvent):void {
        _collageImageView.updateImage(event.image, event.newImage, event.imageMap[event.newImage]);
    }
}
}
