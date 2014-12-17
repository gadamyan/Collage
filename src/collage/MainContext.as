/**
 * Created by Gev on 12/15/2014.
 */
package collage {
import collage.controller.LoadImageCommand;
import collage.controller.LoadImagesCommand;
import collage.controller.RequestGreetCommand;
import collage.event.ImageEvent;
import collage.model.ImagesModel;
import collage.model.SimpleModel;
import collage.service.ImageLoaderService;
import collage.view.CollageImageView;
import collage.view.CollageImageViewMediator;
import collage.view.CollageLayoutView;
import collage.view.CollageLayoutViewMediator;

import flash.display.DisplayObjectContainer;

import org.robotlegs.mvcs.Context;

public class MainContext extends Context {
    public function MainContext(contextView:DisplayObjectContainer = null,autoStartup:Boolean = true) {
        super(contextView, autoStartup);
    }

    override public function startup():void {
        mediatorMap.mapView(CollageLayoutView, CollageLayoutViewMediator);
        mediatorMap.mapView(CollageImageView, CollageImageViewMediator);
        injector.mapSingleton(SimpleModel);
        injector.mapSingleton(ImagesModel);
        injector.mapSingleton(ImageLoaderService);
        commandMap.mapEvent(ImageEvent.REQUEST_GREETING, RequestGreetCommand);
        commandMap.mapEvent(ImageEvent.LOAD_IMAGES, LoadImagesCommand);
        commandMap.mapEvent(ImageEvent.LOAD_IMAGE, LoadImageCommand);
        contextView.addChild(new CollageLayoutView());
    }
}
}
