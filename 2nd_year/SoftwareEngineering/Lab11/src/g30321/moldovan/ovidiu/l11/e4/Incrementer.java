package g30321.moldovan.ovidiu.l11.e4;

import javax.swing.*;

public class Incrementer extends Thread {
    JLabel timerLabel;
    public int timerValue;

    Incrementer() {
        timerValue = 0;
        timerLabel = new JLabel("0");
        timerLabel.setHorizontalAlignment(SwingConstants.RIGHT);
    }
    @Override
    public void run() {
        try {
            while (true) {
                timerValue++;
                timerLabel.setText(timerValue + "");
                Thread.sleep(1000);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}