/**
 * Created by Gev on 12/15/2014.
 */
package collage.controller {
import collage.model.SimpleModel;

import org.robotlegs.mvcs.Command;

public class RequestGreetCommand extends Command {
    [Inject]
    public var _simpleModel:SimpleModel;
    override public function execute():void {
        _simpleModel.messageRequest();
    }
}
}
