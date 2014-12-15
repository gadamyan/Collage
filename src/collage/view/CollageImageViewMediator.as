/**
 * Created by Gev on 12/15/2014.
 */
package collage.view {
import collage.event.MessageEvent;
import collage.model.ImageLoaderModel;

import org.robotlegs.mvcs.Mediator;

public class CollageImageViewMediator extends Mediator {
    [Inject] public var _collageImageView:CollageImageView;
    [Inject] public var _imageLoaderModel:ImageLoaderModel;

    override public function onRegister():void {
//        eventMap.mapListener(eventDispatcher, MessageEvent.IMAGES_LOAD_FAILED, imageLoadFailedHandler);
        eventMap.mapListener(_collageImageView, MessageEvent.IMAGE_REMOVED, imageRemoved);
        eventMap.mapListener(eventDispatcher, MessageEvent.IMAGE_ADDED, imageRemoved);
//        dispatch(new MessageEvent(MessageEvent.LOAD_IMAGES));
    }

    private function imageRemoved(event:MessageEvent):void {
        _imageLoaderModel.loadOtherImage(event.image);
    }
}
}
