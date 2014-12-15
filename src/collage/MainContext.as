/**
 * Created by Gev on 12/15/2014.
 */
package collage {
import collage.controller.LoadImagesCommand;
import collage.controller.RequestGreetCommand;
import collage.event.MessageEvent;
import collage.model.ImageLoaderModel;
import collage.model.SimpleModel;
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
        injector.mapSingleton(SimpleModel);
        injector.mapSingleton(ImageLoaderModel);
        commandMap.mapEvent(MessageEvent.REQUEST_GREETING, RequestGreetCommand);
        commandMap.mapEvent(MessageEvent.LOAD_IMAGES, LoadImagesCommand);
        contextView.addChild(new CollageLayoutView());
    }
}
}
