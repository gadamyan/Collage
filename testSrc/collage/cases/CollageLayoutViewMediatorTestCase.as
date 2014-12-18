/**
 * Created by Gev on 12/19/2014.
 */
package collage.cases {
import collage.view.CollageLayoutView;
import collage.view.CollageLayoutViewMediator;

import flash.events.EventDispatcher;

import org.flexunit.Assert;

public class CollageLayoutViewMediatorTestCase {
    private var _collageLayoutView:CollageLayoutView;
    private var _collageLayoutViewMediator:CollageLayoutViewMediator;

    [Before]
    public function setUp():void {
        _collageLayoutView = new CollageLayoutView();
        _collageLayoutViewMediator = new CollageLayoutViewMediator();
        _collageLayoutViewMediator.collageLayoutView = _collageLayoutView;
        _collageLayoutViewMediator.setViewComponent(_collageLayoutView);
        _collageLayoutViewMediator.eventDispatcher = new EventDispatcher();
        _collageLayoutViewMediator.onRegister();
    }

    [After]
    public function tearDown():void {
        _collageLayoutViewMediator.onRemove();
        _collageLayoutViewMediator.eventDispatcher = null;
        _collageLayoutView = null;
        _collageLayoutViewMediator.collageLayoutView = null;
    }

    [Test]
    public function testViewExists():void {
        Assert.assertNotNull(_collageLayoutViewMediator.collageLayoutView);
        Assert.assertNotNull(_collageLayoutViewMediator.getViewComponent());
    }
}
}
