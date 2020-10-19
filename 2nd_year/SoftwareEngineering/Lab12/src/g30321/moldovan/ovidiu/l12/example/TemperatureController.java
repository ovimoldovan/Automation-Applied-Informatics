package g30321.moldovan.ovidiu.l12.example;

import java.awt.event.*;

public class TemperatureController {
    Thermometer t;
    TemperatureTextView tview;
    public TemperatureController(Thermometer t, TemperatureTextView tview, TemperatureCanvasView tcanvasView){
        t.addObserver(tview);
        t.addObserver(tcanvasView);
        this.t = t;
        this.tview = tview;
        tview.addEnableDisableListener(new EnableDisableListener());
    }
    class EnableDisableListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            t.setPause(!t.isPaused());
        }
    }
}
