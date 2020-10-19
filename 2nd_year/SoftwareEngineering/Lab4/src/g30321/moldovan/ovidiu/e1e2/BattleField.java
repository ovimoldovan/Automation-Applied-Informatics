package g30321.moldovan.ovidiu.e1e2;

import g30321.moldovan.ovidiu.e1e2.Robot;

public class BattleField {
            Robot r1;
            Robot r2;
BattleField(){
            r1 = new Robot();
            r2 = new Robot();
}
public void play(){
            r1.moveRobot(15, 10);
            r2.moveRobot(-10, -2);
            r1.moveRobot(-2,  -2);
            r1.getPosition();
            r1.moveRobotWithObject(3, 3);
            r1.getPosition();
}
public static void main(String[] args){
BattleField game = new BattleField();
game.play();
}
}